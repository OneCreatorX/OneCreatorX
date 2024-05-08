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

local textbox = Instance.new("TextBox")
textbox.Name = "ScriptTextBox"
textbox.Size = UDim2.new(0.9, 0, 0, 30)
textbox.Position = UDim2.new(0.05, 0, 0.4, 0)
textbox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
textbox.TextColor3 = Color3.fromRGB(255, 255, 255)
textbox.Font = Enum.Font.SourceSans
textbox.TextSize = 14
textbox.Text = "Script Here Execute"
textbox.Parent = frame

textbox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        local success, errorMessage = pcall(loadstring(textbox.Text))
             textbox.Text = "Execute Ready"
            wait(1)
              textbox.Text = "Script Here Execute"
        if not success then
            
        end
    end
end)
