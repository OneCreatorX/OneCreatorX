local UILibrary = {}

-- Colores predefinidos
UILibrary.Colors = {
    Background = Color3.new(0.2, 0.2, 0.2),
    Text = Color3.new(1, 1, 1),
    Button = Color3.new(0.3, 0.3, 0.3),
    Section = Color3.new(0.1, 0.1, 0.1),
    Title = Color3.new(0.4, 0.4, 0.4)
}

-- Función para crear un ScreenGui
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

-- Función para crear una ventana con título
function UILibrary:CreateWindow(parent, title)
    local frame = Instance.new("Frame")
    frame.Parent = parent
    frame.Size = UDim2.new(0.4, 0, 0.4, 0)
    frame.Position = UDim2.new(0.3, 0, 0.3, 0)
    frame.BackgroundColor3 = UILibrary.Colors.Background

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Parent = frame
    titleLabel.Text = title
    titleLabel.Size = UDim2.new(1, 0, 0, 30)
    titleLabel.BackgroundColor3 = UILibrary.Colors.Title
    titleLabel.TextColor3 = UILibrary.Colors.Text

    return frame
end

-- Función para crear un botón
function UILibrary:CreateButton(parent, text, onClick)
    local button = Instance.new("TextButton")
    button.Parent = parent
    button.Text = text
    button.Size = UDim2.new(0.8, 0, 0.1, 0)
    button.Position = UDim2.new(0.1, 0, 0.1, 0)
    button.BackgroundColor3 = UILibrary.Colors.Button
    button.TextColor3 = UILibrary.Colors.Text
    button.MouseButton1Click:Connect(onClick)
    return button
end

-- Función para crear una etiqueta
function UILibrary:CreateLabel(parent, text)
    local label = Instance.new("TextLabel")
    label.Parent = parent
    label.Text = text
    label.Size = UDim2.new(0.8, 0, 0.1, 0)
    label.Position = UDim2.new(0.1, 0, 0.2, 0)
    label.BackgroundColor3 = UILibrary.Colors.Section
    label.TextColor3 = UILibrary.Colors.Text
    return label
end

-- Función para crear un cuadro de texto
function UILibrary:CreateTextBox(parent, placeholderText)
    local textBox = Instance.new("TextBox")
    textBox.Parent = parent
    textBox.PlaceholderText = placeholderText
    textBox.Size = UDim2.new(0.8, 0, 0.1, 0)
    textBox.Position = UDim2.new(0.1, 0, 0.3, 0)
    textBox.BackgroundColor3 = UILibrary.Colors.Background
    textBox.TextColor3 = UILibrary.Colors.Text
    return textBox
end

function UILibrary:CreateSection(parent, name)
    local sectionButton = Instance.new("TextButton")
    sectionButton.Parent = parent
    sectionButton.Text = name
    sectionButton.Size = UDim2.new(0.8, 0, 0.1, 0)
    sectionButton.Position = UDim2.new(0.1, 0, 0.4, 0)
    sectionButton.BackgroundColor3 = UILibrary.Colors.Section
    sectionButton.TextColor3 = UILibrary.Colors.Text

    local sectionFrame = Instance.new("Frame")
    sectionFrame.Parent = parent
    sectionFrame.Size = UDim2.new(0.8, 0, 0.4, 0)
    sectionFrame.Position = UDim2.new(0.1, 0, 0.5, 0)
    sectionFrame.BackgroundColor3 = UILibrary.Colors.Background
    sectionFrame.Visible = false

    sectionButton.MouseButton1Click:Connect(function()
        sectionFrame.Visible = not sectionFrame.Visible
    end)

    return sectionFrame
end

return UILibrary
