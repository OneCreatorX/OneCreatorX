local sg = Instance.new("ScreenGui")
sg.Name = "OneCreatorX"
sg.ResetOnSpawn = false

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 250, 0, 130)
frame.Position = UDim2.new(0.5, -125, 0.5, -65)
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
frame.BorderSizePixel = 5
frame.BorderColor3 = Color3.fromRGB(255, 255, 255)
frame.Active = true
frame.Draggable = true
frame.Parent = sg

local title = Instance.new("TextLabel")
title.Text = "YT:@OneCreatorX"
title.TextSize = 18
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
title.BorderSizePixel = 3
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Parent = frame

local antiAFKLabel = Instance.new("TextLabel")
antiAFKLabel.Text = "AimBot: ON"
antiAFKLabel.TextSize = 14
antiAFKLabel.Size = UDim2.new(1, 0, 0, 30)
antiAFKLabel.Position = UDim2.new(0, 0, 0, 80)
antiAFKLabel.BackgroundColor3 = Color3.fromRGB(120, 20, 71)
antiAFKLabel.BorderSizePixel = 0
antiAFKLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
antiAFKLabel.Parent = frame

local mode = "Easy"
local isOptionsVisible = false
local difficultyButtons = {}

local function changeDifficulty(newMode, clickedButton)
    mode = newMode
    for _, button in pairs(difficultyButtons) do
        button.BackgroundColor3 = button == clickedButton and Color3.fromRGB(0, 120, 215) or Color3.fromRGB(120, 20, 71)
    end
end

local function toggleOptions()
    isOptionsVisible = not isOptionsVisible
    for _, button in pairs(difficultyButtons) do
        button.Visible = isOptionsVisible
    end
end

local mainButton = Instance.new("TextLabel")
mainButton.Text = "Auto Aim - Collect all"
mainButton.Size = UDim2.new(1, 0, 0, 30)
mainButton.Position = UDim2.new(0, 0, 0, 40)
mainButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
mainButton.BorderSizePixel = 2
mainButton.TextColor3 = Color3.fromRGB(255, 255, 255)
mainButton.Parent = frame

sg.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local RunService = game:GetService("RunService")
local player = game.Players.LocalPlayer

RunService.Heartbeat:Connect(function()
    local missionFolder = workspace:FindFirstChild("Missions")
    if missionFolder then
        local closestSpawner = nil
        local closestDistance = math.huge

        for _, descendant in ipairs(missionFolder:GetDescendants()) do
            if descendant.Name == "HumanoidRootPart" then
                local distance = (player.Character.HumanoidRootPart.Position - descendant.Position).magnitude
                if distance < closestDistance then
                    closestSpawner = descendant
                    closestDistance = distance
                end
            end
        end

        if closestSpawner then
            local hierarchy = {closestSpawner}
            local currentParent = closestSpawner.Parent
            while currentParent ~= missionFolder and currentParent ~= nil do
                table.insert(hierarchy, 1, currentParent)
                currentParent = currentParent.Parent
            end

            local missile = workspace:FindFirstChild("Missile")
            if missile then
                local args = {
                    [1] = "ExplodeMissile",
                    [2] = closestSpawner.CFrame,
                    [3] = hierarchy[#hierarchy],
                    [4] = missile
                }

                local success, error = pcall(function()
                    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ArmMissileEvent"):FireServer(unpack(args))
                end)

                if not success then
                    warn("Error firing missile event:", error)
                end
            else
            end
        end
    end

    local playerPosition = player.Character.HumanoidRootPart.Position

    for _, object in ipairs(workspace.Entities:GetDescendants()) do
        local success, error = pcall(function()
            if object:IsA("Part") or object:IsA("MeshPart") or object:IsA("UnionOperation") then
                object.CFrame = CFrame.new(playerPosition)
            end
        end)

        if not success then
            warn("Error updating object:", error)
        end
    end
end)
