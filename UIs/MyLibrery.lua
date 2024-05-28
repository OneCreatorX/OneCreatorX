local UILibrary = {}

UILibrary.Colors = {
    Background = Color3.fromRGB(25, 25, 25),
    Text = Color3.fromRGB(255, 255, 255),
    Button = Color3.fromRGB(50, 50, 50),
    ButtonHover = Color3.fromRGB(75, 75, 75),
    Input = Color3.fromRGB(35, 35, 35),
    Border = Color3.fromRGB(150, 150, 150),
    Button3D = Color3.fromRGB(55, 55, 55)
}

UILibrary.Fonts = {
    Main = Enum.Font.SourceSans,
    Button = Enum.Font.SourceSansBold
}

UILibrary.Sizes = {
    Window = UDim2.new(0.2, 0, 0.4, 0),
    Button = UDim2.new(0.8, 0, 0.1, 0),  -- Ajuste del tamaño del botón para mantenerlo constante
    TextBox = UDim2.new(0.8, 0, 0.1, 0)  -- Ajuste del tamaño del TextBox para mantenerlo constante
}

UILibrary.Transparency = {
    Background = 0.9,
    Button = 0.8
}

UILibrary.TextSizes = {
    Button = 14,
    TextBox = 14
}

UILibrary.Padding = {
    Element = 10,
    Frame = 30
}

function UILibrary:ScreenGui(name)
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

function UILibrary:Window(parent, title)
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
    titleLabel.Size = UDim2.new(1, 0, 0, UILibrary.Padding.Frame)
    titleLabel.BackgroundColor3 = UILibrary.Colors.Background
    titleLabel.TextColor3 = UILibrary.Colors.Text
    titleLabel.Font = UILibrary.Fonts.Main
    titleLabel.TextScaled = true
    titleLabel.BackgroundTransparency = UILibrary.Transparency.Background

    return frame
end

local function adjustFrameSize(frame)
    local totalHeight = UILibrary.Padding.Frame
    for _, child in ipairs(frame:GetChildren()) do
        if child:IsA("GuiObject") and child ~= frame then
            totalHeight = totalHeight + child.Size.Y.Offset + UILibrary.Padding.Element
        end
    end
    frame.Size = UDim2.new(frame.Size.X.Scale, frame.Size.X.Offset, 0, totalHeight)
end

local function positionElement(parent, element)
    local elementCount = 0
    for _, child in ipairs(parent:GetChildren()) do
        if child:IsA("GuiObject") and child ~= parent then
            elementCount = elementCount + 1
        end
    end
    local yPos = UILibrary.Padding.Frame + (elementCount - 1) * (element.Size.Y.Offset + UILibrary.Padding.Element)
    element.Position = UDim2.new(0.1, 0, 0, yPos)
    adjustFrameSize(parent)
end

function UILibrary:Button(parent, text, onClick)
    local button = Instance.new("TextButton")
    button.Parent = parent
    button.Text = text
    button.Size = UILibrary.Sizes.Button
    button.BackgroundColor3 = UILibrary.Colors.Button
    button.TextColor3 = UILibrary.Colors.Text
    button.Font = UILibrary.Fonts.Button
    button.TextSize = UILibrary.TextSizes.Button
    button.AutoButtonColor = false

    button.BorderSizePixel = 1
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

    positionElement(parent, button)

    return button
end

function UILibrary:TextBox(parent, placeholderText, onEnter)
    local textBox = Instance.new("TextBox")
    textBox.Parent = parent
    textBox.PlaceholderText = placeholderText
    textBox.Size = UILibrary.Sizes.TextBox
    textBox.BackgroundColor3 = UILibrary.Colors.Input
    textBox.TextColor3 = UILibrary.Colors.Text
    textBox.Font = UILibrary.Fonts.Main
    textBox.TextSize = UILibrary.TextSizes.TextBox
    textBox.BackgroundTransparency = UILibrary.Transparency.Button

    textBox.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            onEnter(textBox.Text)
        end
    end)

    positionElement(parent, textBox)

    return textBox
end

function UILibrary:Toggle(parent, text, onToggle)
    local buttonToggle = Instance.new("TextButton")
    buttonToggle.Parent = parent
    buttonToggle.Text = text
    buttonToggle.Size = UILibrary.Sizes.Button
    buttonToggle.BackgroundColor3 = UILibrary.Colors.Button
    buttonToggle.TextColor3 = UILibrary.Colors.Text
    buttonToggle.Font = UILibrary.Fonts.Button
    buttonToggle.TextSize = UILibrary.TextSizes.Button
    buttonToggle.AutoButtonColor = false

    buttonToggle.BorderSizePixel = 1
    buttonToggle.BorderColor3 = UILibrary.Colors.Border

    local toggled = false

    buttonToggle.MouseButton1Click:Connect(function()
        toggled = not toggled
        if toggled then
            buttonToggle.BackgroundColor3 = UILibrary.Colors.ButtonHover
        else
            buttonToggle.BackgroundColor3 = UILibrary.Colors.Button
        end
        onToggle(toggled)
    end)

    positionElement(parent, buttonToggle)

    return buttonToggle
end

return UILibrary
