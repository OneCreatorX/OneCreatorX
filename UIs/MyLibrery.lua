local UILibrary = {}

function UILibrary:CreateScreenGui(name)
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = name
    screenGui.Parent = game.CoreGui
    return screenGui
end

function UILibrary:CreateFrame(screenGui, title)
    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 200, 0, 400)
    mainFrame.Position = UDim2.new(0, 100, 0, 100)
    mainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    mainFrame.Parent = screenGui

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Text = title
    titleLabel.Size = UDim2.new(1, 0, 0, 30)
    titleLabel.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.Parent = mainFrame

    local mainContentFrame = Instance.new("Frame")
    mainContentFrame.Size = UDim2.new(1, 0, 1, -30)
    mainContentFrame.Position = UDim2.new(0, 0, 0, 30)
    mainContentFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    mainContentFrame.Parent = mainFrame

    local creditsFrame = Instance.new("Frame")
    creditsFrame.Size = UDim2.new(1, 0, 0, 30)
    creditsFrame.Position = UDim2.new(0, 0, 1, -30)
    creditsFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    creditsFrame.Parent = mainFrame

    return mainFrame, mainContentFrame, creditsFrame
end

function UILibrary:AddButton(parent, text, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 0, 30)
    button.Text = text
    button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Parent = parent

    button.MouseButton1Click:Connect(callback)
    return button
end

function UILibrary:AddToggleButton(parent, text, initialState, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 0, 30)
    button.Text = text .. " (" .. (initialState and "On" or "Off") .. ")"
    button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Parent = parent

    local state = initialState

    button.MouseButton1Click:Connect(function()
        state = not state
        button.Text = text .. " (" .. (state and "On" or "Off") .. ")"
        callback(state)
    end)

    return button
end

function UILibrary:AddOptionsButton(parent, text)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 0, 30)
    button.Text = text
    button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Parent = parent

    local optionsFrame = Instance.new("Frame")
    optionsFrame.Size = UDim2.new(1, 0, 0, 0)
    optionsFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    optionsFrame.ClipsDescendants = true
    optionsFrame.Parent = parent

    local isExpanded = false

    button.MouseButton1Click:Connect(function()
        isExpanded = not isExpanded
        optionsFrame:TweenSize(UDim2.new(1, 0, 0, isExpanded and 90 or 0), "Out", "Quad", 0.2, true)
    end)

    return button, optionsFrame
end

function UILibrary:AddTextbox(parent, placeholderText, defaultText, callback)
    local textbox = Instance.new("TextBox")
    textbox.Size = UDim2.new(1, 0, 0, 30)
    textbox.PlaceholderText = placeholderText
    textbox.Text = defaultText
    textbox.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    textbox.TextColor3 = Color3.fromRGB(255, 255, 255)
    textbox.Parent = parent

    textbox.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            callback(textbox.Text)
        end
    end)

    return textbox
end

return UILibrary
