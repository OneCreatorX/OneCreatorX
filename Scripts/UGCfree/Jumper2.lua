local gui = Instance.new("ScreenGui")
gui.ResetOnSpawn = false
gui.Parent = game.Players.LocalPlayer.PlayerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 150)
frame.Position = UDim2.new(0.5, -100, 0.5, -75)
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
frame.BorderColor3 = Color3.fromRGB(100, 100, 100)
frame.Active = true
frame.Draggable = true
frame.Parent = gui

local title = Instance.new("TextLabel")
title.Text = "INSTANT UGC"
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 18
title.Parent = frame

local gameLink = Instance.new("TextButton")
gameLink.Text = "Jump-Clicker-2"
gameLink.Size = UDim2.new(1, 0, 0, 20)
gameLink.Position = UDim2.new(0, 0, 0.3, 0)
gameLink.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
gameLink.TextColor3 = Color3.fromRGB(0, 162, 255)
gameLink.Parent = frame

local groupLink = Instance.new("TextButton")
groupLink.Text = "Jumping Juniors Group"
groupLink.Size = UDim2.new(1, 0, 0, 20)
groupLink.Position = UDim2.new(0, 0, 0.45, 0)
groupLink.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
groupLink.TextColor3 = Color3.fromRGB(0, 162, 255)
groupLink.Parent = frame

local teleportScript = Instance.new("TextButton")
teleportScript.Text = "Teleport Script"
teleportScript.Size = UDim2.new(1, 0, 0, 20)
teleportScript.Position = UDim2.new(0, 0, 0.6, 0)
teleportScript.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
teleportScript.TextColor3 = Color3.fromRGB(255, 255, 255)
teleportScript.Parent = frame

local hatchScript = Instance.new("TextButton")
hatchScript.Text = "Hatch 3 Pets Script"
hatchScript.Size = UDim2.new(1, 0, 0, 20)
hatchScript.Position = UDim2.new(0, 0, 0.75, 0)
hatchScript.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
hatchScript.TextColor3 = Color3.fromRGB(255, 255, 255)
hatchScript.Parent = frame

gameLink.MouseButton1Click:Connect(function()
    game.Players.LocalPlayer:Kick("Must join group and like the game.")
    game:GetService("Players").LocalPlayer:Kick("Must join group and like the game.")
    game.Launcher.GameLoaded:Connect(function()
        game.Launcher:LoadById(15848078540)
    end)
end)

groupLink.MouseButton1Click:Connect(function()
    game:GetService("Players").LocalPlayer:Kick("Must join group and like the game.")
    game.Launcher:LoadGroupId(15717051)
end)

teleportScript.MouseButton1Click:Connect(function()
    local destination = Vector3.new(54891.6484, 1356776.88, -5229.27588)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(destination)
end)

hatchScript.MouseButton1Click:Connect(function()
    local args = {
        [1] = workspace.ScriptableObjects.Eggs.SunEgg.Component
    }
    game:GetService("ReplicatedStorage").Packages._Index:FindFirstChild("sleitnick_knit@1.4.7").knit.Services.PetService.RF.UnboxEgg:InvokeServer(unpack(args))
end)
