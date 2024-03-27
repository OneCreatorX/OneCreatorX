local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local sg = Instance.new("ScreenGui")
sg.ResetOnSpawn = false
sg.Enabled = true
sg.Parent = playerGui

local frame = Instance.new("Frame")
frame.Name = "ControlFrame"
frame.Size = UDim2.new(0, 250, 0, 130)
frame.Position = UDim2.new(0.5, -125, 0.3, -60)
frame.BackgroundColor3 = Color3.fromRGB(40, 20, 10)
frame.BorderSizePixel = 1
frame.Style = Enum.FrameStyle.DropShadow
frame.Parent = sg
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel")
title.Name = "Title"
title.Text = "YT:@OneCreatorX"
title.Size = UDim2.new(1, 0, 0, 30)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.Parent = frame

local button = Instance.new("TextButton")
button.Name = "ControlButton"
button.Text = "Instant UGC" 
button.Style = Enum.ButtonStyle.RobloxButtonDefault
button.Size = UDim2.new(0, 220, 0, 20)
button.BackgroundColor3 = Color3.fromRGB(150, 30, 30)
button.Position = UDim2.new(0.46, -100, 0.5, -20)
button.Font = Enum.Font.ArialBold
button.TextSize = 16
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Parent = frame



button.MouseButton1Click:Connect(function()
    
   game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.7.0"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("ChurchPathToGodService"):WaitForChild("RF"):WaitForChild("LightUpResurrectionAreaCandle"):InvokeServer()

end)

