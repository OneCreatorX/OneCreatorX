local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local dropsFolder = workspace:WaitForChild("Drops"):WaitForChild("Local")

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui
screenGui.ResetOnSpawn = false

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 150)
frame.Position = UDim2.new(0.5, -100, 0.5, -75)
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
frame.BorderSizePixel = 5
frame.BorderColor3 = Color3.fromRGB(255, 255, 255)
frame.Active = true
frame.Draggable = true
frame.Parent = screenGui

local title = Instance.new("TextLabel")
title.Text = "OneCreatorX"
title.TextSize = 18
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
title.BorderSizePixel = 3
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Parent = frame

local function createButton(text, position, callback)
    local button = Instance.new("TextButton")
    button.Text = text
    button.Size = UDim2.new(0, 150, 0, 50)
    button.Position = UDim2.new(0.1, 0, position, 0)
    button.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
    button.BorderSizePixel = 2
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Parent = frame
    button.MouseButton1Click:Connect(callback)
    return button
end

local function executeRemote()
    local args = { [1] = "Magicmissile" }

    for _ = 1, 10 do
        wait(0.3)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("StartingWeapon"):FireServer(unpack(args))
    end
end

local function moveToDrops()
    while true do
        for _, model in ipairs(dropsFolder:GetChildren()) do
            if model:IsA("Model") then
                local coinPart = model:FindFirstChild("Coin", true)
                local xpPart = model:FindFirstChild("XP", true)
                local targetPart = coinPart or xpPart

                if targetPart and player and player.Character then
                    local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
                    if humanoid and humanoid.Health > 0 then
                        humanoid.Parent:SetPrimaryPartCFrame(CFrame.new(targetPart.Position))
                    end
                end
            end
        end
        wait(0.4)
    end
end

createButton("Milti Atack", 0.3, executeRemote)
local moveButton = createButton("Auto Collect", 0.6, function()
    moveToDrops()
end)
