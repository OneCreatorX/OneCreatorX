local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")

local localPlayer = Players.LocalPlayer
local playerGui = localPlayer.PlayerGui
local workspace = game.Workspace

local screenGui = Instance.new("ScreenGui")
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

local frame = Instance.new("Frame")
frame.Size, frame.Position, frame.BackgroundColor3, frame.BackgroundTransparency, frame.Active, frame.Draggable, frame.Parent =
    UDim2.new(0, 200, 0, 100),
    UDim2.new(0, 10, 0, 10),
    Color3.fromRGB(50, 50, 50),
    0.5,
    true,
    true,
    screenGui

local titleLabel = Instance.new("TextLabel")
titleLabel.Size, titleLabel.Position, titleLabel.Text, titleLabel.TextColor3, titleLabel.Font, titleLabel.TextSize, titleLabel.Parent =
    UDim2.new(1, 0, 0, 20),
    UDim2.new(0, 0, 0, 5),
    "Run Simulator Beta",
    Color3.fromRGB(255, 255, 255),
    Enum.Font.SourceSansBold,
    14,
    frame

local button = Instance.new("TextButton")
button.Size, button.Position, button.Text, button.BackgroundColor3, button.TextColor3, button.Parent =
    UDim2.new(0, 180, 0, 30),
    UDim2.new(0, 10, 0, 40),
    "Win/Egg OFF",
    Color3.fromRGB(0, 150, 255),
    Color3.fromRGB(255, 255, 255),
    frame

local ytLabel = Instance.new("TextLabel")
ytLabel.Size, ytLabel.Position, ytLabel.Text, ytLabel.TextColor3, ytLabel.Parent =
    UDim2.new(1, 0, 0, 20),
    UDim2.new(0, 0, 1, -20),
    "YT:@OneCreatorX",
    Color3.fromRGB(255, 255, 255),
    frame

local caea = false
local originalPositions = {}

for _, part in pairs(workspace.Race["1"].Rewards:GetChildren()) do
    if part:IsA("BasePart") then
        originalPositions[part] = part.Position
    end
end

local function moveAllTowardsPosition(destinationPosition)
    for _, part in ipairs(workspace.Race["1"].Rewards:GetChildren()) do
        if part:IsA("BasePart") then
            local tweenInfo = TweenInfo.new(1)
            local goal = {Position = destinationPosition, Transparency = 1}

            local tween = TweenService:Create(part, tweenInfo, goal)
            tween:Play()
        end
    end

    local humanoidRootPart = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")

    if humanoidRootPart then
        humanoidRootPart.CFrame = CFrame.new(destinationPosition)
    end
end

local function resetAllPositions()
    for part, originalPosition in pairs(originalPositions) do
        part.Position = originalPosition
        part.Transparency = 0.5
    end
end

local function egg()
    while caea do
        local humanoidRootPart = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")

        if humanoidRootPart then
            humanoidRootPart.CFrame = CFrame.new(Vector3.new(-25, 326, 43))
        end

        wait(0.1)

        local eggOpened = ReplicatedStorage:FindFirstChild("RemoteEvents") and
                          ReplicatedStorage.RemoteEvents:FindFirstChild("EggOpened")

        if eggOpened then
            eggOpened:InvokeServer("Basic", "Single", {Dog = true, Kitty = true, Deer = true})
        end

        wait(0.2)
        moveAllTowardsPosition(Vector3.new(-25, 326, 43))
        wait(0.2)
        resetAllPositions()
        wait(0.4)
    end
end

button.MouseButton1Click:Connect(function()
    caea = not caea
    button.Text = caea and "Win/Egg ON" or "Win/Egg OFF"

    if not caea then
        return
    end

    egg()
end)
