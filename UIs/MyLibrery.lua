local UILibrary = {}

function UILibrary:CreateScreenGui(name)
    -- Buscar y destruir cualquier ScreenGui creado por esta librería
    for _, gui in ipairs(game.Players.LocalPlayer:WaitForChild("PlayerGui"):GetChildren()) do
        if gui:IsA("ScreenGui") and gui:FindFirstChild("UILibraryIdentifier") then
            gui:Destroy()
        end
    end

    -- Crear un nuevo ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = name
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    screenGui.ResetOnSpawn = false

    -- Agregar un identificador único
    local identifier = Instance.new("BoolValue")
    identifier.Name = "UILibraryIdentifier"
    identifier.Value = true
    identifier.Parent = screenGui

    return screenGui
end

function UILibrary:CreateFrame(parent, title)
    local frame = Instance.new("Frame")
    frame.Parent = parent
    frame.Size = UDim2.new(0.27, 0, 0.4, 0)  -- Tamaño del frame reducido en un 10%
    frame.Position = UDim2.new(0.365, 0, 0.3, 0)  -- Posición centrada
    frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)  -- Color de fondo básico
    frame.BorderSizePixel = 0  -- Sin borde

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Parent = frame
    titleLabel.Text = title
    titleLabel.Size = UDim2.new(1, 0, 0, 30)  -- Tamaño del título
    titleLabel.Position = UDim2.new(0, 0, 0, 0)  -- Posición del título
    titleLabel.BackgroundColor3 = Color3.fromRGB(35, 35, 35)  -- Color de fondo del título
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)  -- Color del texto del título
    titleLabel.Font = Enum.Font.SourceSans
    titleLabel.TextSize = 18

    -- Botón de minimizar/maximizar
    local toggleButton = Instance.new("TextButton")
    toggleButton.Parent = frame
    toggleButton.Text = "-"
    toggleButton.Size = UDim2.new(0, 30, 0, 30)
    toggleButton.Position = UDim2.new(1, -30, 0, 0)
    toggleButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleButton.Font = Enum.Font.SourceSans
    toggleButton.TextSize = 18

    -- Contenedor para el contenido del frame
    local contentFrame = Instance.new("Frame")
    contentFrame.Parent = frame
    contentFrame.Size = UDim2.new(1, 0, 1, -60)  -- Ajustar para dejar espacio para el título y el botón de créditos
    contentFrame.Position = UDim2.new(0, 0, 0, 30)
    contentFrame.BackgroundTransparency = 1

    -- Sección de créditos
    local creditsButton = Instance.new("TextButton")
    creditsButton.Parent = frame
    creditsButton.Text = "Créditos"
    creditsButton.Size = UDim2.new(1, 0, 0, 30)
    creditsButton.Position = UDim2.new(0, 0, 1, -30)
    creditsButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    creditsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    creditsButton.Font = Enum.Font.SourceSans
    creditsButton.TextSize = 18

    local isMinimized = false
    toggleButton.MouseButton1Click:Connect(function()
        isMinimized = not isMinimized
        if isMinimized then
            contentFrame.Visible = false
            toggleButton.Text = "+"
            frame.Size = UDim2.new(0.27, 0, 0, 60)  -- Ajustar el tamaño del frame para mostrar solo el título y el botón de créditos
        else
            contentFrame.Visible = true
            toggleButton.Text = "-"
            frame.Size = UDim2.new(0.27, 0, 0.4, 0)  -- Restaurar el tamaño original del frame
        end
    end)

    return frame
end

return UILibrary
