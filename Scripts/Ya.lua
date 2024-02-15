local Players = game:GetService("Players")
local p = Players.LocalPlayer
local sg = Instance.new("ScreenGui")
sg.ResetOnSpawn = false
sg.Name = "CustomGui"
sg.Parent = p.PlayerGui

local frame = Instance.new("Frame")
frame.Name = "CustomFrame"
frame.Size = UDim2.new(0, 200, 0, 150)
frame.Position = UDim2.new(0.5, -100, 0.5, -75)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 2
frame.BorderColor3 = Color3.fromRGB(50, 50, 50)
frame.Active = true
frame.Draggable = true
frame.Parent = sg

local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Text = "YT:OneCreatorX"
titleLabel.Size = UDim2.new(0, 200, 0, 30)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.TextSize = 18
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
titleLabel.BorderSizePixel = 55
titleLabel.Parent = frame

local startButton = Instance.new("TextButton")
startButton.Name = "StartButton"
startButton.Text = "Start Game"
startButton.Size = UDim2.new(0, 180, 0, 40)
startButton.Position = UDim2.new(0, 10, 0.35, 0)
startButton.BackgroundColor3 = Color3.fromRGB(50, 50, 255)
startButton.Parent = frame

startButton.MouseButton1Click:Connect(function()
local newPosition = Vector3.new(854, 187, 3168)
    local c = p.Character.HumanoidRootPart.Position
    p.Character:SetPrimaryPartCFrame(CFrame.new(newPosition))
end)

local moveUpButton = Instance.new("TextButton")
moveUpButton.Name = "AutoAttackButton"
moveUpButton.Text = "Auto Attack"
moveUpButton.Size = UDim2.new(0, 180, 0, 40)
moveUpButton.Position = UDim2.new(0, 10, 0.7, 0)
moveUpButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
moveUpButton.Parent = frame

moveUpButton.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/T.lua"))()
end)

local moveButton = Instance.new("TextButton")
moveButton.Name = "MoveUpButton"
moveButton.Text = "Mode Safe"
moveButton.Size = UDim2.new(0, 130, 0, 40)
moveButton.Position = UDim2.new(0, 10, 0.55, 10)
moveButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
moveButton.Parent = frame

moveButton.MouseButton1Click:Connect(function()
    local c = p.Character.HumanoidRootPart.Position
    p.Character:SetPrimaryPartCFrame(CFrame.new(c.X, c.Y + 80, c.Z))
end)
