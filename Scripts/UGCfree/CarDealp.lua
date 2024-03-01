local player = game.Players.LocalPlayer
local remotes = game:GetService("ReplicatedStorage").Remotes.Collectibles.TryToCollect

local function destroyModels()
    while true do
        for _, model in ipairs(workspace:GetChildren()) do
            if model.Name == "Model" then
                local fireExt = model:FindFirstChild("FireExt", true)
                local otherPart = model:FindFirstChild("Part")

                if fireExt and fireExt:IsA("MeshPart") and otherPart and otherPart:IsA("Part") then
                    player.Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(otherPart.Position)
                    task.wait(0.4)
                    remotes:FireServer(otherPart)
                    task.wait(2)
                    remotes:FireServer(otherPart)
                    task.wait(0.3)
                    otherPart:Destroy()
                end
            end
        end
    end
end

local function noDestroyModels()
    while true do
        for _, model in ipairs(workspace:GetChildren()) do
            if model.Name == "Model" then
                local fireExt = model:FindFirstChild("FireExt", true)
                local otherPart = model:FindFirstChild("Part")

                if fireExt and fireExt:IsA("MeshPart") and otherPart and otherPart:IsA("Part") then
                    player.Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(otherPart.Position)
                    task.wait(0.3)
                    remotes:FireServer(otherPart)
                    task.wait(0.3)
                    remotes:FireServer(otherPart)
                end
            end
        end
        wait(1.5)
    end
end

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player.PlayerGui

local frame = Instance.new("Frame")
frame.Name = "MainFrame"
frame.Size = UDim2.new(0, 200, 0, 150)
frame.Position = UDim2.new(0.5, -100, 0.15, 0)
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
frame.BorderSizePixel = 0
frame.Parent = screenGui

local title = Instance.new("TextLabel")
title.Name = "Title"
title.Text = "YT:@OneCreatorX"
title.Size = UDim2.new(0, 200, 0, 30)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.Font = Enum.Font.SourceSansBold
title.TextSize = 18
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Parent = frame

local destroyModelsButton = Instance.new("TextButton")
destroyModelsButton.Name = "DestroyModelsButton"
destroyModelsButton.Text = "Manual Collect"
destroyModelsButton.Size = UDim2.new(0, 150, 0, 50)
destroyModelsButton.Position = UDim2.new(0.5, -75, 0.2, 0)
destroyModelsButton.BackgroundColor3 = Color3.fromRGB(75, 125, 75)
destroyModelsButton.BorderSizePixel = 0
destroyModelsButton.Parent = frame

local noDestroyModelsButton = Instance.new("TextButton")
noDestroyModelsButton.Name = "NoDestroyModelsButton"
noDestroyModelsButton.Text = "Auto Collect (Slow)"
noDestroyModelsButton.Size = UDim2.new(0, 150, 0, 50)
noDestroyModelsButton.Position = UDim2.new(0.5, -75, 0.6, 0)
noDestroyModelsButton.BackgroundColor3 = Color3.fromRGB(125, 75, 75)
noDestroyModelsButton.BorderSizePixel = 0
noDestroyModelsButton.Parent = frame

destroyModelsButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
    destroyModels()
end)

noDestroyModelsButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
    noDestroyModels()
end)
