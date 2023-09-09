local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Camera = game.Workspace.CurrentCamera

local playerCameras = {}
local visiblePlayers = {}
local currentPlayerIndex = 0
local dragging = false
local dragStartX, dragStartY

local textbox -- Declaración de la variable textbox

local function getPlayerCameras()
    playerCameras = {}
    for _, player in ipairs(Players:GetPlayers()) do
        local playerCamera = player.Character and player.Character:FindFirstChildOfClass("Camera")
        if playerCamera then
            table.insert(playerCameras, playerCamera)
        end
    end
end

local function updateVisiblePlayers()
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            player.Character.Humanoid.Visible = table.find(visiblePlayers, player) ~= nil
        end
    end
end

local function teleportToSelectedPlayer()
    if currentPlayerIndex > 0 and currentPlayerIndex <= #visiblePlayers then
        local seconds = tonumber(textbox.Text) -- Obtener los segundos ingresados como número
        if seconds then
            local originalPosition = LocalPlayer.Character.HumanoidRootPart.CFrame
            LocalPlayer.Character:SetPrimaryPartCFrame(visiblePlayers[currentPlayerIndex].Character.HumanoidRootPart.CFrame)
            wait(seconds) -- Esperar durante los segundos especificados
            LocalPlayer.Character:SetPrimaryPartCFrame(originalPosition) -- Volver a la posición original
        else
            -- Si el TextBox está vacío o contiene texto no válido, simplemente teleportarse sin regreso
            LocalPlayer.Character:SetPrimaryPartCFrame(visiblePlayers[currentPlayerIndex].Character.HumanoidRootPart.CFrame)
        end
    end
end

local function selectPlayer(index)
    if #visiblePlayers > 0 then
        currentPlayerIndex = index
        if currentPlayerIndex < 1 then
            currentPlayerIndex = #visiblePlayers
        elseif currentPlayerIndex > #visiblePlayers then
            currentPlayerIndex = 1
        end
        Camera.CameraSubject = visiblePlayers[currentPlayerIndex].Character.Humanoid
    end
end

local function resetCamera()
    Camera.CameraSubject = LocalPlayer.Character.Humanoid
end

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Position = UDim2.new(0, 10, 0, 10)
frame.Size = UDim2.new(0, 280, 0, 40) -- Aumenté el ancho para acomodar el TextBox
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Parent = screenGui

local buttonSizeX = 50
local buttonSizeY = 30
local distanceX = 10

local buttonNames = {"<", ">", "[∆]", "TP"}
local buttonFunctions = {
    function()
        selectPlayer(currentPlayerIndex - 1)
    end,
    function()
        selectPlayer(currentPlayerIndex + 1)
    end,
    function()
        resetCamera()
    end,
    function()
        teleportToSelectedPlayer()
    end
}

local function createButton(name, position, func)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, buttonSizeX, 0, buttonSizeY)
    button.Position = UDim2.new(0, position, 0, 5)
    button.BackgroundTransparency = 0.8
    button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    button.BorderSizePixel = 0
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.SourceSans
    button.TextSize = 14
    button.Text = name
    button.Parent = frame
    button.MouseButton1Click:Connect(func)
    return button
end

createButton("<", 0, buttonFunctions[1])
createButton(">", buttonSizeX + distanceX, buttonFunctions[2])
createButton("[∆]", (buttonSizeX + distanceX) * 2, buttonFunctions[3])
local teleportButton = createButton("TP", (buttonSizeX + distanceX) * 3, buttonFunctions[4])

teleportButton.MouseButton1Down:Connect(function(input)
    dragging = true
    dragStartX = input.Position.X.Scale - teleportButton.Position.X.Scale
    dragStartY = input.Position.Y.Scale - teleportButton.Position.Y.Scale
end)

textbox = Instance.new("TextBox") -- Creación de textbox
textbox.Size = UDim2.new(0, 50, 0, buttonSizeY)
textbox.Position = UDim2.new(0, (buttonSizeX + distanceX) * 4, 0, 5)
textbox.BackgroundTransparency = 0.8
textbox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
textbox.BorderSizePixel = 0
textbox.TextColor3 = Color3.fromRGB(255, 255, 255)
textbox.Font = Enum.Font.SourceSans
textbox.TextSize = 14
textbox.Text = "Seconds"
textbox.Parent = frame

local function onButtonMouseDrag(input)
    if dragging then
        local delta = input.Position - UDim2.new(dragStartX, dragStartY)
        teleportButton.Position = teleportButton.Position + delta
    end
end

teleportButton.MouseButton1Down:Connect(function(input)
    dragging = true
    dragStartX = input.Position.X.Scale - teleportButton.Position.X.Scale
    dragStartY = input.Position.Y.Scale - teleportButton.Position.Y.Scale
end)

Players.PlayerAdded:Connect(getPlayerCameras)
Players.PlayerRemoving:Connect(getPlayerCameras)
Players.PlayerAdded:Connect(updateVisiblePlayersOnPlayerAdded)
Players.PlayerRemoving:Connect(updateVisiblePlayersOnPlayerRemoving)

getPlayerCameras()
visiblePlayers = Players:GetPlayers()

selectPlayer(1)
