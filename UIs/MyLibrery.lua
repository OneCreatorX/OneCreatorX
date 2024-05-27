local UILibrary = {}

UILibrary.Colors = {
    Background = Color3.fromRGB(25, 25, 25),
    Text = Color3.fromRGB(255, 255, 255),
    Button = Color3.fromRGB(50, 50, 50),
    ButtonHover = Color3.fromRGB(75, 75, 75),
    Section = Color3.fromRGB(15, 15, 15),
    Title = Color3.fromRGB(100, 100, 100),
    Input = Color3.fromRGB(35, 35, 35),
    Border = Color3.fromRGB(150, 150, 150),
    Button3D = Color3.fromRGB(55, 55, 55)
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

UILibrary.Transparency = {
    Background = 0.9,
    Button = 0.8,
    Section = 0.85,
    Title = 0.75
}

function UILibrary:CreateScreenGui(name)
    local existingGui = game.Players.LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild(name)
    if (existingGui) then
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
    frame.BackgroundColor3 = UILibrary.Colors.Background
    frame.BackgroundTransparency = UILibrary.Transparency.Background

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Parent = frame
    titleLabel.Text = title
    titleLabel.Size = UDim2.new(1, 0, 0, 30)
    titleLabel.BackgroundColor3 = UILibrary.Colors.Title
    titleLabel.TextColor3 = UILibrary.Colors.Text
    titleLabel.Font = UILibrary.Fonts.Title
    titleLabel.TextScaled = true
    titleLabel.BackgroundTransparency = UILibrary.Transparency.Title

    return frame
end

function UILibrary:CreateButton(parent, text, onClick)
    local button = Instance.new("TextButton")
    button.Parent = parent
    button.Text = text
    button.Size = UILibrary.Sizes.Button
    button.BackgroundColor3 = UILibrary.Colors.Button
    button.TextColor3 = UILibrary.Colors.Text
    button.Font = UILibrary.Fonts.Button
    button.TextScaled = true
    button.AutoButtonColor = false

    button.BorderSizePixel = 2
    button.BorderColor3 = UILibrary.Colors.Border

    button.MouseButton1Click:Connect(onClick)

    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = UILibrary.Colors.ButtonHover
    end)

    button.MouseLeave:Connect(function()
        button.BackgroundColor3 = UILibrary.Colors.Button
    end)

    button.MouseButton1Down:Connect(function()
        button.BorderColor3 = UILibrary.Colors.Button3D
    end)

    button.MouseButton1Up:Connect(function()
        button.BorderColor3 = UILibrary.Colors.Border
    end)

    local buttonCount = 0
    for _, child in ipairs(parent:GetChildren()) do
        if child:IsA("TextButton") and child ~= parent then
            buttonCount = buttonCount + 2
        end
    end
    local yPos = (buttonCount * UILibrary.Sizes.Button.Y.Scale) + 0.1
    button.Position = UDim2.new(0.1, 0, yPos, 0)

    return button
end

function UILibrary:CreateLabel(parent, text)
    local label = Instance.new("TextLabel")
    label.Parent = parent
    label.Text = text
    label.Size = UILibrary.Sizes.Label
    label.BackgroundColor3 = UILibrary.Colors.Section
    label.TextColor3 = UILibrary.Colors.Text
    label.Font = UILibrary.Fonts.Main
    label.TextScaled = true
    label.BackgroundTransparency = UILibrary.Transparency.Section

    local labelCount = 0
    for _, child in ipairs(parent:GetChildren()) do
        if child:IsA("TextLabel") and child ~= parent then
            labelCount = labelCount + 2
        end
    end
    local yPos = (labelCount * UILibrary.Sizes.Label.Y.Scale) + 0.1
    label.Position = UDim2.new(0.1, 0, yPos, 0)

    return label
end

function UILibrary:CreateTextBox(parent, placeholderText, onEnter)
    local textBox = Instance.new("TextBox")
    textBox.Parent = parent
    textBox.PlaceholderText = placeholderText
    textBox.Size = UILibrary.Sizes.TextBox
    textBox.BackgroundColor3 = UILibrary.Colors.Input
    textBox.TextColor3 = UILibrary.Colors.Text
    textBox.Font = UILibrary.Fonts.Main
    textBox.TextScaled = true
    textBox.BackgroundTransparency = UILibrary.Transparency.Section

    textBox.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            onEnter(textBox.Text)
        end
    end)

    local textBoxCount = 0
    for _, child in ipairs(parent:GetChildren()) do
        if child:IsA("TextBox") and child ~= parent then
            textBoxCount = textBoxCount + 2
        end
    end
    local yPos = (textBoxCount * UILibrary.Sizes.TextBox.Y.Scale) + 0.1
    textBox.Position = UDim2.new(0.1, 0, yPos, 0)

    return textBox
end

function UILibrary:CreateSection(parent, name)
    local sectionButton = Instance.new("TextButton")
    sectionButton.Parent = parent
    sectionButton.Text = name
    sectionButton.Size = UILibrary.Sizes.Button
    sectionButton.BackgroundColor3 = UILibrary.Colors.Section
    sectionButton.TextColor3 = UILibrary.Colors.Text
    sectionButton.Font = UILibrary.Fonts.Button
    sectionButton.TextScaled = true
    sectionButton.AutoButtonColor = false

    sectionButton.MouseEnter:Connect(function()
        sectionButton.BackgroundColor3 = UILibrary.Colors.ButtonHover
    end)

    sectionButton.MouseLeave:Connect(function()
        sectionButton.BackgroundColor3 = UILibrary.Colors.Section
    end)

    local sectionFrame = Instance.new("Frame")
    sectionFrame.Parent = parent
    sectionFrame.Size = UILibrary.Sizes.Section
    sectionFrame.Position = UDim2.new(1, 10, 0, 0)
    sectionFrame.BackgroundColor3 = UILibrary.Colors.Background
    sectionFrame.BackgroundTransparency = UILibrary.Transparency.Section
    sectionFrame.Visible = false

    sectionButton.MouseButton1Click:Connect(function()
        sectionFrame.Visible = not sectionFrame.Visible
    end)

    local sectionCount = 0
    for _, child in ipairs(parent:GetChildren()) do
        if child:IsA("TextButton") and child ~= sectionButton then
            sectionCount = sectionCount + 2
        end
    end
    local yPos = (sectionCount * UILibrary.Sizes.Button.Y.Scale) + 0.1
    sectionButton.Position = UDim2.new(0.1, 0, yPos, 0)

    return sectionFrame
end

return UILibrary
