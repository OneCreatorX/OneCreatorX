local RunService = game:GetService("RunService")

local s = Instance.new("ScreenGui")
s.Parent = game.Players.LocalPlayer.PlayerGui
s.ResetOnSpawn = false

local f = Instance.new("Frame")
f.Parent = s
f.Size = UDim2.new(0, 200, 0, 100)
f.Position = UDim2.new(0.5, -100, 0.5, -50)
f.BackgroundColor3 = Color3.new(0, 0, 0)
f.Active = true
f.Draggable = true

local title = Instance.new("TextLabel")
title.Parent = f
title.Size = UDim2.new(1, 0, 0, 20)
title.Position = UDim2.new(0, 0, 0.2, -20)
title.Text = "YT: OneCreatorX"
title.TextSize = 14
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1

local b1 = Instance.new("TextButton")
b1.Parent = f
b1.Size = UDim2.new(0, 80, 0, 40)
b1.Position = UDim2.new(0.25, -40, 0.5, -20)
b1.Text = "Click"

local b2 = Instance.new("TextButton")
b2.Parent = f
b2.Size = UDim2.new(0, 80, 0, 40)
b2.Position = UDim2.new(0.75, -40, 0.5, -20)
b2.Text = "Rebirth"

local isActiveB1 = false
local isActiveB2 = false

b1.MouseButton1Click:Connect(function()
    isActiveB1 = not isActiveB1
end)

b2.MouseButton1Click:Connect(function()
    isActiveB2 = not isActiveB2
end)

RunService.Heartbeat:Connect(function()
    if isActiveB1 then
            local args = {
    [1] = 15984689733
}

game:GetService("ReplicatedStorage"):WaitForChild("RemoteFunctions"):WaitForChild("UGC"):InvokeServer(unpack(args))
            
        game:GetService("ReplicatedStorage").RemoteEvents.Click:FireServer()
    end
    if isActiveB2 then
        game:GetService("ReplicatedStorage").RemoteEvents.Rebirth:FireServer(true)
    end
end)
