local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Camera = game.Workspace.CurrentCamera

local currentPlayerIndex = 1

local textbox

local function teleportToSelectedPlayer()
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

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Position = UDim2.new(0, 10, 0, 10)
frame.Size = UDim2.new(0, 280, 0, 40)
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

textbox = Instance.new("TextBox")
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

resetCamera()
