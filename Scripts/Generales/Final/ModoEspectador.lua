local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Camera = game.Workspace.CurrentCamera

local playerCameras = {}
local visiblePlayers = {}
local currentPlayerIndex = 0

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
frame.Size = UDim2.new(0, 180, 0, 40)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Parent = screenGui

local buttonSizeX = 50
local buttonSizeY = 30
local distanceX = 10

local buttonNames = {"<", ">", "[∆]"}
local buttonFunctions = {
    function()
        selectPlayer(currentPlayerIndex - 1)
    end,
    function()
        selectPlayer(currentPlayerIndex + 1)
    end,
    function()
        resetCamera()
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
end

createButton("<", 0, buttonFunctions[1])
createButton(">", buttonSizeX + distanceX, buttonFunctions[2])
createButton("[∆]", (buttonSizeX + distanceX) * 2, buttonFunctions[3])

local function updateVisiblePlayersOnPlayerAdded(player)
    table.insert(visiblePlayers, player)
    updateVisiblePlayers()
end

local function updateVisiblePlayersOnPlayerRemoving(player)
    table.remove(visiblePlayers, table.find(visiblePlayers, player))
    updateVisiblePlayers()
end

Players.PlayerAdded:Connect(getPlayerCameras)
Players.PlayerRemoving:Connect(getPlayerCameras)
Players.PlayerAdded:Connect(updateVisiblePlayersOnPlayerAdded)
Players.PlayerRemoving:Connect(updateVisiblePlayersOnPlayerRemoving)

getPlayerCameras()
visiblePlayers = Players:GetPlayers()

selectPlayer(1)

