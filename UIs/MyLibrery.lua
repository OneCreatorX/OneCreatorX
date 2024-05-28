local MyLibrary = {}

-- Colores predefinidos
MyLibrary.Colors = {
    Background = Color3.fromRGB(25, 25, 25),
    Text = Color3.fromRGB(255, 255, 255),
    Button = Color3.fromRGB(50, 50, 50),
    ButtonHover = Color3.fromRGB(75, 75, 75),
    Input = Color3.fromRGB(35, 35, 35),
    Border = Color3.fromRGB(150, 150, 150),
    Button3D = Color3.fromRGB(55, 55, 55)
}

-- Tipos de fuente predefinidos
MyLibrary.Fonts = {
    Main = Enum.Font.SourceSans,
    Button = Enum.Font.SourceSansBold
}

-- Tamaños predefinidos
MyLibrary.Sizes = {
    Button = UDim2.new(0.8, 0, 0.1, 0),
    TextBox = UDim2.new(0.8, 0, 0.1, 0)
}

-- Crear una nueva pantalla GUI
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

-- Crear un marco con título
function MyLibrary:CreateWindow(parent, title)
    local frame = Instance.new("Frame")
    frame.Parent = parent
    frame.Size = UDim2.new(1, 0, 1, 0) -- Ocupa todo el espacio del padre
    frame.BackgroundColor3 = MyLibrary.Colors.Background

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Parent = frame
    titleLabel.Text = title
    titleLabel.Size = UDim2.new(1, 0, 0, 30) -- Altura fija para el título
    titleLabel.BackgroundColor3 = MyLibrary.Colors.Background
    titleLabel.TextColor3 = MyLibrary.Colors.Text
    titleLabel.Font = MyLibrary.Fonts.Main
    titleLabel.TextSize = 18 -- Tamaño de texto arbitrario
    titleLabel.TextWrapped = true
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left -- Alineación izquierda

    return frame
end

-- Crear un botón normal
function MyLibrary:CreateButton(parent, text, onClick)
    local button = Instance.new("TextButton")
    button.Parent = parent
    button.Text = text
    button.Size = MyLibrary.Sizes.Button
    button.BackgroundColor3 = MyLibrary.Colors.Button
    button.TextColor3 = MyLibrary.Colors.Text
    button.Font = MyLibrary.Fonts.Button
    button.TextSize = 14 -- Tamaño de texto arbitrario
    button.AutoButtonColor = false

    button.MouseButton1Click:Connect(onClick)

    return button
end

-- Crear un botón toggle
function MyLibrary:CreateToggleButton(parent, text, onToggle)
    local toggleButton = Instance.new("TextButton")
    toggleButton.Parent = parent
    toggleButton.Text = text
    toggleButton.Size = MyLibrary.Sizes.Button
    toggleButton.BackgroundColor3 = MyLibrary.Colors.Button
    toggleButton.TextColor3 = MyLibrary.Colors.Text
    toggleButton.Font = MyLibrary.Fonts.Button
    toggleButton.TextSize = 14
    toggleButton.AutoButtonColor = false

    local toggled = false

    toggleButton.MouseButton1Click:Connect(function()
        toggled = not toggled
        if toggled then
            toggleButton.BackgroundColor3 = MyLibrary.Colors.ButtonHover
        else
            toggleButton.BackgroundColor3 = MyLibrary.Colors.Button
        end
        onToggle(toggled)
    end)

    return toggleButton
end

-- Crear un cuadro de texto
function MyLibrary:CreateTextBox(parent, placeholderText, onSubmit)
    local textBox = Instance.new("TextBox")
    textBox.Parent = parent
    textBox.PlaceholderText = placeholderText
    textBox.Size = MyLibrary.Sizes.TextBox
    textBox.BackgroundColor3 = MyLibrary.Colors.Input
    textBox.TextColor3 = MyLibrary.Colors.Text
    textBox.Font = MyLibrary.Fonts.Main
    textBox.TextSize = 14
    textBox.ClearTextOnFocus = false

    textBox.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            onSubmit(textBox.Text)
        end
    end)

    return textBox
end

return MyLibrary
