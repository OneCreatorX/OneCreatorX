local UL = {}
print("Version UI 0.1")
print("Loading OneLib")

local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui", player.PlayerGui)
screenGui.Name = "LoadingScreen"

local loadingFrame = Instance.new("Frame", screenGui)
loadingFrame.Size = UDim2.new(0.3, 0, 0.1, 0)
loadingFrame.Position = UDim2.new(0.35, 0, 0.45, 0)
loadingFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
loadingFrame.BorderSizePixel = 0

local loadingLabel = Instance.new("TextLabel", loadingFrame)
loadingLabel.Size = UDim2.new(1, 0, 0.5, 0)
loadingLabel.Position = UDim2.new(0, 0, 0, 0)
loadingLabel.Text = "Loading OneLib..."
loadingLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
loadingLabel.Font = Enum.Font.GothamBold
loadingLabel.TextSize = 24
loadingLabel.BackgroundTransparency = 1

local loadingBar = Instance.new("Frame", loadingFrame)
loadingBar.Size = UDim2.new(0, 0, 0.5, 0)
loadingBar.Position = UDim2.new(0, 0, 0.5, 0)
loadingBar.BackgroundColor3 = Color3.fromRGB(0, 255, 0)

local tweenService = game:GetService("TweenService")

local function createTween(instance, size, duration)
    return tweenService:Create(instance, TweenInfo.new(duration, Enum.EasingStyle.Linear), {Size = size})
end

local loadingTween = createTween(loadingBar, UDim2.new(1, 0, 0.5, 0), 2)
loadingTween:Play()
loadingTween.Completed:Connect(function()
    loadingLabel.Text = "OneLib v0.1"
    wait(1)
    screenGui:Destroy()
end)

wait(3)

function UL:CreateScreenGui(name)
    for _, gui in ipairs(game.Players.LocalPlayer:WaitForChild("PlayerGui"):GetChildren()) do
        if gui:IsA("ScreenGui") and gui:FindFirstChild("ULId") then
            gui:Destroy()
        end
    end

    local sg = Instance.new("ScreenGui")
    sg.Name = name
    sg.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    sg.ResetOnSpawn = false

    local id = Instance.new("BoolValue")
    id.Name = "ULId"
    id.Value = true
    id.Parent = sg

    return sg
end

function UL:CreateFrame(parent, title)
    local frame = Instance.new("Frame")
    frame.Parent = parent
    frame.Size = UDim2.new(0.25, 0, 0, 60)
    frame.Position = UDim2.new(0.2, 0, 0.2, 0)
    frame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    frame.BackgroundTransparency = 0.4
    frame.BorderSizePixel = 1
    frame.Active = true
    frame.Draggable = true

    local label = Instance.new("TextLabel")
    label.Parent = frame
    label.Text = title
    label.Size = UDim2.new(1, 0, 0, 33)
    label.Position = UDim2.new(0, 0, -0.02, 0)
    label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    label.BackgroundTransparency = 0.2
    label.TextColor3 = Color3.fromRGB(350, 250, 23)
    label.Font = Enum.Font.GothamBold 
    label.TextSize = 18
    label.TextWrapped = true
    label.TextXAlignment = Enum.TextXAlignment.Center
    label.TextYAlignment = Enum.TextYAlignment.Center

    local corner = Instance.new("UICorner")
    corner.Parent = label
    corner.CornerRadius = UDim.new(0, 4)

    local padding = Instance.new("UIPadding")
    padding.Parent = label
    padding.PaddingLeft = UDim.new(0, 5)
    padding.PaddingRight = UDim.new(0, 5)
    padding.PaddingTop = UDim.new(0, 5)
    padding.PaddingBottom = UDim.new(0, 5)

    local toggleButton = Instance.new("TextButton")
    toggleButton.Parent = frame
    toggleButton.Text = "+"
    toggleButton.Size = UDim2.new(0, 30, 0, 30)
    toggleButton.Position = UDim2.new(1, -30, 0, 0)
    for prop, value in pairs(uiProperties) do
        toggleButton[prop] = value
    end

    local contentFrame = Instance.new("Frame")
    contentFrame.Parent = frame
    contentFrame.Size = UDim2.new(1, 0, 1, -30)
    contentFrame.Position = UDim2.new(0, 0, 0, 30)
    contentFrame.BackgroundTransparency = 0.6
    contentFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    contentFrame.Visible = false

    local infoButton = Instance.new("TextButton")
    infoButton.Parent = frame
    infoButton.Text = "Info Script"
    infoButton.Size = UDim2.new(1, 0, 0, 30)
    infoButton.Position = UDim2.new(0, 0, 1, -30)
    for prop, value in pairs(uiProperties) do
        infoButton[prop] = value
    end

    local infoFrame = Instance.new("Frame")
    infoFrame.Parent = parent
    infoFrame.Size = UDim2.new(0.25, 0, 0.4, 60)
    infoFrame.Position = UDim2.new(0.685, 0, 0.3, 0)
    infoFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    infoFrame.BackgroundTransparency = 1
    infoFrame.BorderSizePixel = 1
    infoFrame.Visible = false

    local infoLabel = Instance.new("TextLabel")
    infoLabel.Parent = infoFrame
    infoLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    infoLabel.BackgroundTransparency = 0.2
    infoLabel.TextColor3 = Color3.fromRGB(350, 250, 23)
    infoLabel.Text = "Info/Updats/Credits"
    infoLabel.Size = UDim2.new(1, 0, 0, 30)
    infoLabel.Position = UDim2.new(0, 0, 0, 0)
    infoLabel.Font = Enum.Font.GothamBold 
    infoLabel.TextSize = 18
    infoLabel.TextWrapped = true
    infoLabel.TextXAlignment = Enum.TextXAlignment.Center
    infoLabel.TextYAlignment = Enum.TextYAlignment.Center

    local corner = Instance.new("UICorner")
    corner.Parent = infoLabel
    corner.CornerRadius = UDim.new(0, 4)

    local padding = Instance.new("UIPadding")
    padding.Parent = infoLabel
    padding.PaddingLeft = UDim.new(0, 5)
    padding.PaddingRight = UDim.new(0, 5)
    padding.PaddingTop = UDim.new(0, 5)
    padding.PaddingBottom = UDim.new(0, 5)

    infoFrame.Size = UDim2.new(0.25, 0, 0, 60 + #infoFrame:GetChildren() * 60) 

    local minimized = true
    toggleButton.MouseButton1Click:Connect(function()
        minimized = not minimized
        if minimized then
            contentFrame.Visible = false
            toggleButton.Text = "+"
            frame.Size = UDim2.new(0.25, 0, 0, 60)
        else
            contentFrame.Visible = true
            toggleButton.Text = "-"
            frame.Size = UDim2.new(0.25, 0, 0, 60 + #contentFrame:GetChildren() * 30)
        end
    end)

    function adjustInfoFrameColor()
        infoFrame.BackgroundColor3 = infoFrame.Visible and Color3.fromRGB(120, 0, 120) or Color3.fromRGB(65, 65, 65)
    end
    
    infoButton.MouseButton1Click:Connect(function()
        infoFrame.Visible = not infoFrame.Visible
        infoButton.BackgroundColor3 = infoFrame.Visible and Color3.fromRGB(150, 0, 150) or Color3.fromRGB(65, 65, 65)
        adjustInfoFrameColor()
    end)

    local function syncFrames()
        infoFrame.Position = UDim2.new(frame.Position.X.Scale + frame.Size.X.Scale, frame.Position.X.Offset, frame.Position.Y.Scale, frame.Position.Y.Offset)
    end

    frame:GetPropertyChangedSignal("Position"):Connect(syncFrames)
    frame:GetPropertyChangedSignal("Size"):Connect(syncFrames)

    frame.Size = UDim2.new(0.25, 0, 0, 60 + #contentFrame:GetChildren() * 30)
    infoFrame.Size = UDim2.new(0.25, 0, 0, 60 + #infoFrame:GetChildren() * 30) 

    return frame, contentFrame, infoFrame
end

function UL:AddButton(parent, text, callback)
    local button = Instance.new("TextButton")
    button.Parent = parent
    button.Text = text
    button.Size = UDim2.new(1, 0, 0, 30)
    button.Position = UDim2.new(0, 0, 0, #parent:GetChildren() * 30 - 30)
    for prop, value in pairs(uiProperties) do
        button[prop] = value
    end

    button.MouseButton1Click:Connect(callback)
    
    return button
end

function UL:AddToggleButton(parent, text, state, callback)
    local button = Instance.new("TextButton")
    button.Parent = parent
    button.Text = text .. " [" .. (state and "ON" or "OFF") .. "]"
    button.Size = UDim2.new(1, 0, 0, 30)
    button.Position = UDim2.new(0, 0, 0, #parent:GetChildren() * 30 - 30)
    for prop, value in pairs(uiProperties) do
        button[prop] = value
    end

    button.MouseButton1Click:Connect(function()
        state = not state
        button.Text = text .. " [" .. (state and "ON" or "OFF") .. "]"
        button.BackgroundColor3 = state and Color3.fromRGB(85, 170, 85) or Color3.fromRGB(65, 65, 65)
        callback(state)
    end)

    return button
end

function UL:AddTextBox(parent, placeholder, callback)
    local textBox = Instance.new("TextBox")
    textBox.Parent = parent
    textBox.PlaceholderText = placeholder
    textBox.Text = ""
    textBox.BorderSizePixel = 1
    textBox.Size = UDim2.new(1, 0, 0, 30)
    textBox.Position = UDim2.new(0, 0, 0, #parent:GetChildren() * 30 - 30)

    textBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    textBox.TextColor3 = Color3.fromRGB(250, 250, 250)
    textBox.BorderColor3 = Color3.fromRGB(0, 0, 0) 
    textBox.Font = Enum.Font.SourceSans
    textBox.TextSize = 18
    textBox.ClearTextOnFocus = false
    textBox.TextXAlignment = Enum.TextXAlignment.Left
    
    local padding = Instance.new("UIPadding")
    padding.Parent = textBox
    padding.PaddingLeft = UDim.new(0, 5)
    local corner = Instance.new("UICorner")
    corner.Parent = textBox
    corner.CornerRadius = UDim.new(0, 6)
    
    local shadow = Instance.new("ImageLabel")
    shadow.Parent = textBox
    shadow.BackgroundTransparency = 0.95
    shadow.Image = "rbxassetid://1316045217"
    shadow.Size = UDim2.new(1, 6, 1, 6)
    shadow.Position = UDim2.new(0, -3, 0, -3)
    shadow.ImageTransparency = 0.5
    shadow.ScaleType = Enum.ScaleType.Slice
    shadow.SliceCenter = Rect.new(10, 10, 118, 118)

    textBox.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            callback(textBox.Text)
        end
    end)

    return textBox
end

function UL:AddOptionButton(parent, name)
    local optionFrame = Instance.new("Frame")
    optionFrame.Parent = parent.Parent
    optionFrame.Size = UDim2.new(0.9, 0, 1, 0) 
    optionFrame.Position = UDim2.new(parent.Position.X.Scale + 1, 0, parent.Position.Y.Scale - 0.184, parent.Position.Y.Offset)
    optionFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    optionFrame.BackgroundTransparency = 0.4
    optionFrame.BorderSizePixel = 1
    optionFrame.Visible = false

    local nameLabel = Instance.new("TextLabel")
    nameLabel.Parent = optionFrame
    nameLabel.Text = name
    nameLabel.Size = UDim2.new(1, 0, 0, 30)
    nameLabel.Position = UDim2.new(0, 0, 0, 0)
    for prop, value in pairs(uiProperties) do
        nameLabel[prop] = value
        
    end

    local button = Instance.new("TextButton")
    button.Parent = parent
    button.Text = name
    button.Size = UDim2.new(1, 0, 0, 30)
    button.Position = UDim2.new(0, 0, 0, #parent:GetChildren() * 30 - 30)
    for prop, value in pairs(uiProperties) do
        button[prop] = value
    end

    function adjustOptionFrameColor()
        optionFrame.BackgroundColor3 = optionFrame.Visible and Color3.fromRGB(100, 0, 0) or Color3.fromRGB(65, 65, 65)
    end
    
    button.MouseButton1Click:Connect(function()
        optionFrame.Visible = not optionFrame.Visible
        button.BackgroundColor3 = optionFrame.Visible and Color3.fromRGB(130, 0, 0) or Color3.fromRGB(65, 65, 65)
        adjustOptionFrameColor()
    end)

    return button, optionFrame
end

function UL:AddText(parent, text, color)
    local label = Instance.new("TextLabel")
    label.Parent = parent
    label.Text = text
    label.Size = UDim2.new(1, 0, 0, 30)
    label.Position = UDim2.new(0, 0, 0, #parent:GetChildren() * 30 - 30)
    label.BackgroundColor3 = Color3.fromRGB(250, 250, 250)
    label.BackgroundTransparency = 0.6
    label.TextColor3 = Color3.fromRGB(0, 0, 0)
    label.Font = Enum.Font.ArimoBold 
    
    label.TextSize = 13
    label.TextWrapped = true

    return label
end

game:GetService('Players').LocalPlayer.Idled:Connect(function()
    game:GetService('VirtualUser'):CaptureController()
    game:GetService('VirtualUser'):ClickButton2(Vector2.new())
end)
print("Loading Finish")
print("by: OneCreatorX")

return UL
