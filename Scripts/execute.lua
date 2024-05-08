local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local sg = Instance.new("ScreenGui")
sg.ResetOnSpawn = false
sg.Enabled = true
sg.Parent = playerGui

local frame = Instance.new("Frame")
frame.Name = "ControlFrame"
frame.Size = UDim2.new(0, 200, 0, 60)
frame.Position = UDim2.new(0.45, -100, 0.1, -50)
frame.BackgroundColor3 = Color3.fromRGB(40, 20, 10)
frame.BorderSizePixel = 1
frame.Style = Enum.FrameStyle.DropShadow
frame.Parent = sg
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel")
title.Name = "Title"
title.Text = "YT@OneCreatorX"
title.Size = UDim2.new(1, 0, 0, 30)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.Parent = frame

local textbox = Instance.new("TextBox")
textbox.Name = "ScriptTextBox"
textbox.Size = UDim2.new(1, 0, 0.6, 0)
textbox.Position = UDim2.new(0.28, 0, 0.7, 0) 
textbox.BackgroundTransparency = 1 
textbox.TextColor3 = Color3.fromRGB(255, 255, 255)
textbox.Font = Enum.Font.SourceSans
textbox.TextSize = 14
textbox.TextWrapped = true 
textbox.TextXAlignment = Enum.TextXAlignment.Left  
textbox.TextYAlignment = Enum.TextYAlignment.Top 
textbox.Text = "Script Here Execute"
textbox.Parent = frame

local function executeScript()
    local success, errorMessage = pcall(loadstring(textbox.Text))
    textbox.Text = "Ready Execute"
    wait(1)
      textbox.Text = "Script Here Execute"
    if not success then
        
    end
end

textbox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        executeScript()
    end
end)

textbox:GetPropertyChangedSignal("Text"):Connect(function()
    if textbox:IsFocused() and textbox.Text:find("\n") then
        executeScript()
    end
end)
