-- Librería para crear interfaces de usuario en Roblox
local UI = {}

-- Función para crear una nueva pantalla GUI
function UI:ScreenGui(name)
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = name
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    screenGui.ResetOnSpawn = false
    return screenGui
end

-- Función para crear un marco con título
function UI:Window(parent, title)
    local frame = Instance.new("Frame")
    frame.Parent = parent
    frame.Active = true
    frame.Draggable = true
    frame.Size = UDim2.new(0.5, 0, 0.5, 0)  -- Tamaño predeterminado
    frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    frame.BackgroundTransparency = 0.5

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Parent = frame
    titleLabel.Text = title
    titleLabel.Size = UDim2.new(1, 0, 0, 30)  -- Altura predeterminada
    titleLabel.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.Font = Enum.Font.SourceSansBold
    titleLabel.TextScaled = true
    titleLabel.BackgroundTransparency = 0.5

    return frame
end

-- Función para crear un botón
function UI:Button(parent, text, onClick)
    local button = Instance.new("TextButton")
    button.Parent = parent
    button.Text = text
    button.Size = UDim2.new(0, 200, 0, 50)  -- Tamaño predeterminado
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.SourceSansBold
    button.TextSize = 20
    button.AutoButtonColor = false

    button.MouseButton1Click:Connect(onClick)

    return button
end

-- Función para crear un botón de alternancia (toggle)
function UI:ToggleButton(parent, text, onToggle)
    local toggled = false

    local button = self:Button(parent, text, function()
        toggled = not toggled
        onToggle(toggled)
    end)

    return button
end

-- Función para crear un cuadro de texto
function UI:TextBox(parent, placeholder, onEnter)
    local textBox = Instance.new("TextBox")
    textBox.Parent = parent
    textBox.PlaceholderText = placeholder
    textBox.Size = UDim2.new(0, 200, 0, 50)  -- Tamaño predeterminado
    textBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    textBox.Font = Enum.Font.SourceSans
    textBox.TextSize = 20

    textBox.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            onEnter(textBox.Text)
        end
    end)

    return textBox
end

return UI
