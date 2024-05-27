local UILibrary = {}

UILibrary.Colors = {
    Background = Color3.new(0.2, 0.2, 0.2),
    Text = Color3.new(1, 1, 1),
    Button = Color3.new(0.3, 0.3, 0.3),
    Section = Color3.new(0.1, 0.1, 0.1),
    Title = Color3.new(0.4, 0.4, 0.4),
    Input = Color3.new(0.25, 0.25, 0.25),
    Hover = Color3.new(0.35, 0.35, 0.35)
}

UILibrary.Fonts = {
    Main = Enum.Font.SourceSans,
    Title = Enum.Font.SourceSansBold,
    Button = Enum.Font.SourceSansBold
}

UILibrary.Sizes = {
    Window = UDim2.new(0.4, 0, 0.4, 0),
    Button = UDim2.new(0.8, 0, 0.1, 0),
    Label = UDim2.new(0.8, 0, 0.1, 0),
    TextBox = UDim2.new(0.8, 0, 0.1, 0),
    Section = UDim2.new(0.8, 0, 0.4, 0)
}

function UILibrary:CreateScreenGui(name)
    local existingGui = game.Players.LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild(name)
    if existingGui then
        existingGui:Destroy()
    end

    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = name
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    screenGui.ResetOnSpawn = false
    return screenGui
end

function UILibrary:CreateWindow(parent, title)
    local frame = Instance.new("Frame")
    frame.Parent = parent
    frame.Active = true
    frame.Draggable = true
    frame.Size = UILibrary.Sizes.Window
    frame.Position = UDim2.new(0.3, 0, 0.3, 0)
    frame.BackgroundColor3 = UILibrary.Colors.Background

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Parent = frame
    titleLabel.Text = title
    titleLabel.Size = UDim2.new(1, 0, 0, 30)
    titleLabel.BackgroundColor3 = UILibrary.Colors.Title
    titleLabel.TextColor3 = UILibrary.Colors.Text
    titleLabel.Font = UILibrary.Fonts.Title
    titleLabel.TextScaled = true

    return frame
end

function UILibrary:CreateButton(parent, text, onClick)
    local button = Instance.new("TextButton")
    button.Parent = parent
    button.Text = text
    button.Size = UILibrary.Sizes.Button
    button.Position = UDim2.new(0.1, 0, 0.1, 0)
    button.BackgroundColor3 = UILibrary.Colors.Button
    button.TextColor3 = UILibrary.Colors.Text
    button.Font = UILibrary.Fonts.Button
    button.TextScaled = true
    button.MouseButton1Click:Connect(onClick)

    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = UILibrary.Colors.Hover
    end)

    button.MouseLeave:Connect(function()
        button.BackgroundColor3 = UILibrary.Colors.Button
    end)

    return button
end

function UILibrary:CreateLabel(parent, text)
    local label = Instance.new("TextLabel")
    label.Parent = parent
    label.Text = text
    label.Size = UILibrary.Sizes.Label
    label.Position = UDim2.new(0.1, 0, 0.2, 0)
    label.BackgroundColor3 = UILibrary.Colors.Section
    label.TextColor3 = UILibrary.Colors.Text
    label.Font = UILibrary.Fonts.Main
    label.TextScaled = true
    return label
end

function UILibrary:CreateTextBox(parent, placeholderText)
    local textBox = Instance.new("TextBox")
    textBox.Parent = parent
    textBox.PlaceholderText = placeholderText
    textBox.Size = UILibrary.Sizes.TextBox
    textBox.Position = UDim2.new(0.1, 0, 0.3, 0)
    textBox.BackgroundColor3 = UILibrary.Colors.Input
    textBox.TextColor3 = UILibrary.Colors.Text
    textBox.Font = UILibrary.Fonts.Main
    textBox.TextScaled = true
    return textBox
end

function UILibrary:CreateSection(parent, name)
    local sectionButton = Instance.new("TextButton")
    sectionButton.Parent = parent
    sectionButton.Text = name
    sectionButton.Size = UILibrary.Sizes.Button
    sectionButton.Position = UDim2.new(0.1, 0, 0.4, 0)
    sectionButton.BackgroundColor3 = UILibrary.Colors.Section
    sectionButton.TextColor3 = UILibrary.Colors.Text
    sectionButton.Font = UILibrary.Fonts.Button
    sectionButton.TextScaled = true

    local sectionFrame = Instance.new("Frame")
    sectionFrame.Parent = parent
    sectionFrame.Size = UILibrary.Sizes.Section
    sectionFrame.Position = UDim2.new(1, 10, 0, 0)
    sectionFrame.BackgroundColor3 = UILibrary.Colors.Background
    sectionFrame.Visible = false

    sectionButton.MouseButton1Click:Connect(function()
        sectionFrame.Visible = not sectionFrame.Visible
    end)

    return sectionFrame
end

return UILibrary
