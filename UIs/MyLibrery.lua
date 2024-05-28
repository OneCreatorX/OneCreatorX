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
    Button = UDim2.new(0.8, 0, 0.1, 0),  -- Tamaño fijo para los botones
    TextBox = UDim2.new(0.8, 0, 0.1, 0)  -- Tamaño fijo para los TextBox
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
    Frame = 5
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
    -- Inicializamos el alto total con el valor de padding del frame
    local totalHeight = UILibrary.Padding.Frame
    -- Contador para llevar la cuenta de los elementos
    local elementCount = 0
    -- Referencia al último elemento agregado
    local lastElement = nil
    -- Iteramos sobre los hijos del frame
    for _, child in ipairs(frame:GetChildren()) do
        -- Verificamos si el hijo es un objeto gráfico y no es el frame mismo
        if child:IsA("GuiObject") and child ~= frame then
            -- Incrementamos el contador de elementos
            elementCount = elementCount + 1
            -- Sumamos el alto del elemento y el padding al alto total
            totalHeight = totalHeight + child.Size.Y.Offset + UILibrary.Padding.Element
            -- Actualizamos la referencia al último elemento
            lastElement = child
        end
    end
    -- Ajustamos el tamaño del frame con el nuevo alto total
    frame.Size = UDim2.new(frame.Size.X.Scale, frame.Size.X.Offset, 0, totalHeight)
    -- Si hay un último elemento
    if lastElement then
        -- Ajustamos la posición del frame para centrarlo verticalmente con respecto al último elemento
        frame.Position = UDim2.new(frame.Position.X.Scale, frame.Position.X.Offset, 0, -totalHeight / 2 + lastElement.Position.Y.Offset + lastElement.Size.Y.Offset / 2)
    else
        -- Si no hay elementos, el frame se posiciona desde arriba
        frame.Position = UDim2.new(frame.Position.X.Scale, frame.Position.X.Offset, 0, 0)
    end
end

local function positionElement(parent, element)
    local elementCount = 0
    local yPos = UILibrary.Padding.Frame -- Establecer yPos en el padding inicial
    for _, child in ipairs(parent:GetChildren()) do
        if child:IsA("GuiObject") and child ~= parent then
            elementCount = elementCount + 1
            yPos = yPos + child.Size.Y.Offset + UILibrary.Padding.Element -- Ajustar yPos para el siguiente elemento
        end
    end
    element.Position = UDim2.new(0.1, 0, yPos, yPos)
    adjustFrameSize(parent)
end


function UILibrary:CreateButton(parent, text, onClick)
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

function UILibrary:CreateTextBox(parent, placeholderText, onEnter)
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

function UILibrary:CreateButtonToggle(parent, text, onToggle)
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
