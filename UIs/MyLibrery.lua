local MyLibrary = {}

MyLibrary.Colors = {
    Background = Color3.fromRGB(25, 25, 25),
    Text = Color3.fromRGB(255, 255, 255),
    Button = Color3.fromRGB(50, 50, 50),
    ButtonHover = Color3.fromRGB(75, 75, 75),
    Input = Color3.fromRGB(35, 35, 35),
    Border = Color3.fromRGB(150, 150, 150),
    Button3D = Color3.fromRGB(55, 55, 55)
}

MyLibrary.Fonts = {
    Main = Enum.Font.SourceSans,
    Button = Enum.Font.SourceSansBold
}

MyLibrary.Sizes = {
    Window = UDim2.new(0.2, 0, 0.3, 0),  -- Reducir el tamaño de la ventana
    Button = UDim2.new(0.8, 0, 0, 30),  -- Reducir la altura de los botones
    TextBox = UDim2.new(0.8, 0, 0, 30)  -- Reducir la altura de los cuadros de texto
}

MyLibrary.Transparency = {
    Background = 0.9,
    Button = 0.8
}

MyLibrary.TextSizes = {
    Button = 14,
    TextBox = 14
}

MyLibrary.Padding = {
    Element = 10,
    Frame = 5
}

function MyLibrary:CreateScreenGui(name)
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

function MyLibrary:CreateWindow(parent, title)
    local frame = Instance.new("Frame")
    frame.Parent = parent
    frame.Active = true
    frame.Draggable = true
    frame.Size = MyLibrary.Sizes.Window
    frame.BackgroundColor3 = MyLibrary.Colors.Background
    frame.BackgroundTransparency = MyLibrary.Transparency.Background

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Parent = frame
    titleLabel.Text = title
    titleLabel.Size = UDim2.new(1, 0, 0, MyLibrary.Padding.Frame)
    titleLabel.BackgroundColor3 = MyLibrary.Colors.Background
    titleLabel.TextColor3 = MyLibrary.Colors.Text
    titleLabel.Font = MyLibrary.Fonts.Main
    titleLabel.TextScaled = true
    titleLabel.BackgroundTransparency = MyLibrary.Transparency.Background

    return frame
end

local function adjustFrameSize(frame)
    local totalHeight = MyLibrary.Padding.Frame
    local elementCount = 0
    local lastElement = nil
    for _, child in ipairs(frame:GetChildren()) do
        if child:IsA("GuiObject") and child ~= frame then
            elementCount = elementCount + 1
            totalHeight = totalHeight + child.Size.Y.Offset + MyLibrary.Padding.Element
            lastElement = child
        end
    end
    frame.Size = UDim2.new(frame.Size.X.Scale, frame.Size.X.Offset, 0, totalHeight)
    if lastElement then
        frame.Position = UDim2.new(frame.Position.X.Scale, frame.Position.X.Offset, 0, -totalHeight / 2 + lastElement.Position.Y.Offset + lastElement.Size.Y.Offset / 2)
    else
        frame.Position = UDim2.new(frame.Position.X.Scale, frame.Position.X.Offset, 0, 0)
    end
end

local function positionElement(parent, element)
    local elementCount = 0
    local yPos = MyLibrary.Padding.Frame
    for _, child in ipairs(parent:GetChildren()) do
        if child:IsA("GuiObject") and child ~= parent then
            elementCount = elementCount + 1
            yPos = yPos + child.Size.Y.Offset + MyLibrary.Padding.Element
        end
    end
    element.Position = UDim2.new(0.1, 0, yPos, yPos)
    adjustFrameSize(parent)
end

function MyLibrary:CreateButton(parent, text, onClick)
    local button = Instance.new("TextButton")
    button.Parent = parent
    button.Text = text
    button.Size = MyLibrary.Sizes.Button
    button.BackgroundColor3 = MyLibrary.Colors.Button
    button.TextColor3 = MyLibrary.Colors.Text
    button.Font = MyLibrary.Fonts.Button
    button.TextSize = MyLibrary.TextSizes.Button
    button.AutoButtonColor = false

    button.BorderSizePixel = 1
    button.BorderColor3 = MyLibrary.Colors.Border

    button.MouseButton1Click:Connect(onClick)

    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = MyLibrary.Colors.ButtonHover
    end)

    button.MouseLeave:Connect(function()
        button.BackgroundColor3 = MyLibrary.Colors.Button
    end)

    button.MouseButton1Down:Connect(function()
        button.BorderColor3 = MyLibrary.Colors.Button3D
    end)

    button.MouseButton1Up:Connect(function()
        button.BorderColor3 = MyLibrary.Colors.Border
    end)

    positionElement(parent, button)

    return button
end

function MyLibrary:CreateTextBox(parent, placeholderText, onEnter)
    local textBox = Instance.new("TextBox")
    textBox.Parent = parent
    textBox.PlaceholderText = placeholderText
    textBox.Size = MyLibrary.Sizes.TextBox
    textBox.BackgroundColor3 = MyLibrary.Colors.Input
    textBox.TextColor3 = MyLibrary.Colors.Text
    textBox.Font = MyLibrary.Fonts.Main
    textBox.TextSize = MyLibrary.TextSizes.TextBox
    textBox.BackgroundTransparency = MyLibrary.Transparency.Button

    textBox.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            onEnter(textBox.Text)
        end
    end)

    positionElement(parent, textBox)

    return textBox
end

function MyLibrary:CreateToggleButton(parent, text, onToggle)
    local buttonToggle = Instance.new("TextButton")
    buttonToggle.Parent = parent
    buttonToggle.Text = text
    buttonToggle.Size = MyLibrary.Sizes.Button
    buttonToggle.BackgroundColor3 = MyLibrary.Colors.Button
    buttonToggle.TextColor3 = MyLibrary.Colors.Text
    buttonToggle.Font = MyLibrary.Fonts.Button
    buttonToggle.TextSize = MyLibrary.TextSizes.Button
    buttonToggle.AutoButtonColor = false

    buttonToggle.BorderSizePixel = 1
    buttonToggle.BorderColor3 = MyLibrary.Colors.Border

    local toggled = false

    buttonToggle.MouseButton1Click:Connect(function()
        toggled = not toggled
        if toggled then
            button
                 buttonToggle.BackgroundColor3 = MyLibrary.Colors.ButtonHover
        else
            buttonToggle.BackgroundColor3 = MyLibrary.Colors.Button
        end
        onToggle(toggled)
    end)

    positionElement(parent, buttonToggle)

    return buttonToggle
end

return MyLibrary
