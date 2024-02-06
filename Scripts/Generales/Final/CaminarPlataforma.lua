local SG = Instance.new("ScreenGui")
SG.ResetOnSpawn = false
SG.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local AI = Instance.new("ImageButton")
AI.Size = UDim2.new(0, 100, 0, 50)
AI.Position = UDim2.new(0, 10, 0, 10)
AI.Image = "http://www.roblox.com/asset/?id=4953528537"
AI.Parent = SG

local DI = Instance.new("ImageButton")
DI.Size = UDim2.new(0, 100, 0, 50)
DI.Position = UDim2.new(0, 10, 0, 10)
DI.Image = "http://www.roblox.com/asset/?id=4953529287"
DI.Visible = false
DI.Parent = SG

local platform
local savedHeight

AI.MouseButton1Down:Connect(function()
    AI.Visible = false
    DI.Visible = true
    if not platform then
        if not savedHeight then savedHeight = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y end
        platform = Instance.new("Part")
        platform.Size = Vector3.new(5, 1, 5)
        platform.BrickColor = BrickColor.new("Sand blue")
        platform.Anchored = true
        platform.Position = Vector3.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.X, savedHeight - 3.5, game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z)
        platform.Parent = workspace

        local function updatePlatformPosition(speed)
            if speed > 0 then
                platform.Position = Vector3.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position.X, savedHeight - 3.5, game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z)
            end
        end

        local function destroyPlatform()
            if platform then
                platform:Destroy()
                platform = nil
                DI.Visible = false
                AI.Visible = true
                savedHeight = nil
            end
        end

        game.Players.LocalPlayer.Character.Humanoid.Running:Connect(updatePlatformPosition)
        game.Players.LocalPlayer.Character.Humanoid.Jumping:Connect(destroyPlatform)
    end
end)

DI.MouseButton1Down:Connect(function()
    AI.Visible = true
    DI.Visible = false
    if platform then
        platform:Destroy()
        platform = nil
    end
    savedHeight = nil
end)
