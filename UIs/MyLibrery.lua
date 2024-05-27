local UILibrary = {}

function UILibrary:CreateScreenGui(name)
    local existingGui = game.Players.LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild(name)
    if existingGui then
        existingGui:Destroy()
    end

    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = name
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    return screenGui
end

function UILibrary:CreateButton(parent, text, position, size, onClick, bgColor, textColor)
    local button = Instance.new("TextButton")
    button.Parent = parent
    button.Text = text
    button.Position = UDim2.new(position.X.Scale, position.X.Offset, position.Y.Scale, position.Y.Offset)
    button.Size = UDim2.new(size.X.Scale, size.X.Offset, size.Y.Scale, size.Y.Offset)
    button.BackgroundColor3 = bgColor or Color3.new(0.2, 0.2, 0.2)
    button.TextColor3 = textColor or Color3.new(1, 1, 1)
    button.MouseButton1Click:Connect(onClick)
    return button
end

function UILibrary:CreateLabel(parent, text, position, size, bgColor, textColor)
    local label = Instance.new("TextLabel")
    label.Parent = parent
    label.Text = text
    label.Position = UDim2.new(position.X.Scale, position.X.Offset, position.Y.Scale, position.Y.Offset)
    label.Size = UDim2.new(size.X.Scale, size.X.Offset, size.Y.Scale, size.Y.Offset)
    label.BackgroundColor3 = bgColor or Color3.new(0.1, 0.1, 0.1)
    label.TextColor3 = textColor or Color3.new(1, 1, 1)
    return label
end

function UILibrary:CreateTextBox(parent, placeholderText, position, size, bgColor, textColor)
    local textBox = Instance.new("TextBox")
    textBox.Parent = parent
    textBox.PlaceholderText = placeholderText
    textBox.Position = UDim2.new(position.X.Scale, position.X.Offset, position.Y.Scale, position.Y.Offset)
    textBox.Size = UDim2.new(size.X.Scale, size.X.Offset, size.Y.Scale, size.Y.Offset)
    textBox.BackgroundColor3 = bgColor or Color3.new(0.2, 0.2, 0.2)
    textBox.TextColor3 = textColor or Color3.new(1, 1, 1)
    return textBox
end

return UILibrary
