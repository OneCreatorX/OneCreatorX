local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Camera = game.Workspace.CurrentCamera

local currentPlayerIndex = 1
local teleportCooldown = false

local textbox

-- Definir frame antes de configurar sus propiedades
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
screenGui.ResetOnSpawn = false

local frame = Instance.new("Frame")
frame.Position = UDim2.new(0, 10, 0, 10)
frame.Size = UDim2.new(0, 330, 0, 40)
frame.BackgroundColor3 = Color3.fromRGB(44, 62, 80)
frame.BorderSizePixel = 0
frame.Draggable = true
frame.Parent = screenGui
frame.Active = true

local buttonSizeX = 50
local buttonSizeY = 30

local function createButton(name, position, func)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, buttonSizeX, 0, buttonSizeY)
    button.Position = UDim2.new(0, position, 0, 5)
    button.BackgroundTransparency = 0.5
    button.BackgroundColor3 = Color3.fromRGB(52, 152, 219)
    button.BorderSizePixel = 0
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.SourceSans
    button.TextSize = 14
    button.Text = name
    button.Parent = frame
    button.MouseButton1Click:Connect(func)
    return button
end

local function teleportToSelectedPlayer()
    if teleportCooldown then
        return
    end

    local selectedPlayer = Players:GetPlayers()[currentPlayerIndex]
    if selectedPlayer then
        local seconds = tonumber(textbox.Text)
        if seconds then
            local originalPosition = LocalPlayer.Character.HumanoidRootPart.CFrame
            LocalPlayer.Character:SetPrimaryPartCFrame(selectedPlayer.Character.HumanoidRootPart.CFrame)
            wait(seconds)
            LocalPlayer.Character:SetPrimaryPartCFrame(originalPosition)
        else
            LocalPlayer.Character:SetPrimaryPartCFrame(selectedPlayer.Character.HumanoidRootPart.CFrame)
        end

        teleportCooldown = true
        wait(5)
        teleportCooldown = false
    end
end

local function selectPlayer(index)
    local playerCount = #Players:GetPlayers()
    if playerCount > 0 then
        currentPlayerIndex = (index - 1) % playerCount + 1
        Camera.CameraSubject = Players:GetPlayers()[currentPlayerIndex].Character.Humanoid
    end
end

local function resetCamera()
    Camera.CameraSubject = LocalPlayer.Character.Humanoid
end

createButton("<", 0, function()
    selectPlayer(currentPlayerIndex - 1)
end)

createButton(">", 60, function()
    selectPlayer(currentPlayerIndex + 1)
end)

createButton("[∆]", 120, function()
    resetCamera()
end)

local teleportButton = createButton("TP", 180, teleportToSelectedPlayer)

textbox = Instance.new("TextBox")
textbox.Size = UDim2.new(0, 59, 0, 30)
textbox.Position = UDim2.new(0, 260, 0, 5)
textbox.BackgroundTransparency = 0.8
textbox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
textbox.BorderSizePixel = 0
textbox.TextColor3 = Color3.fromRGB(255, 255, 255)
textbox.Font = Enum.Font.SourceSans
textbox.TextSize = 14
textbox.Text = "Seg tp"
textbox.Parent = frame

resetCamera()
