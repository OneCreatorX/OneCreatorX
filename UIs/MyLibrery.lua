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
    frame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)  -- Color de fondo más claro
    frame.BackgroundTransparency = 0.1  -- Un poco de transparencia
    frame.BorderSizePixel = 0  -- Sin borde
    frame.Active = true
    frame.Draggable = true

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Parent = frame
    titleLabel.Text = title
    titleLabel.Size = UDim2.new(1, 0, 0, 30)  -- Tamaño del título
    titleLabel.Position = UDim2.new(0, 0, 0, 0)  -- Posición del título
    titleLabel.BackgroundColor3 = Color3.fromRGB(65, 65, 65)  -- Color de fondo del título
    titleLabel.BackgroundTransparency = 0.2  -- Un poco de transparencia
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)  -- Color del texto del título
    titleLabel.Font = Enum.Font.SourceSans
    titleLabel.TextSize = 18

    -- Botón de minimizar/maximizar
    local toggleButton = Instance.new("TextButton")
    toggleButton.Parent = frame
    toggleButton.Text = "-"
    toggleButton.Size = UDim2.new(0, 30, 0, 30)
    toggleButton.Position = UDim2.new(1, -30, 0, 0)
    toggleButton.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    toggleButton.BackgroundTransparency = 0.2
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
    creditsButton.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    creditsButton.BackgroundTransparency = 0.2
    creditsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    creditsButton.Font = Enum.Font.SourceSans
    creditsButton.TextSize = 18


    local creditsFrame = Instance.new("Frame")
    creditsFrame.Parent = parent
    creditsFrame.Size = UDim2.new(0.2, 0, 0.4, 0)  -- Un poco más delgado que el frame principal
    creditsFrame.Position = UDim2.new(0.635, 0, 0.3, 0)  -- Posición al lado del frame principal
    creditsFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    creditsFrame.BackgroundTransparency = 0.1
    creditsFrame.BorderSizePixel = 0
    creditsFrame.Visible = false  -- Inicialmente oculto

    -- Título del frame de créditos
    local creditsTitleLabel = Instance.new("TextLabel")
    creditsTitleLabel.Parent = creditsFrame
    creditsTitleLabel.Text = "Créditos"
    creditsTitleLabel.Size = UDim2.new(1, 0, 0, 30)  -- Tamaño del título
    creditsTitleLabel.Position = UDim2.new(0, 0, 0, 0)  -- Posición del título
    creditsTitleLabel.BackgroundColor3 = Color3.fromRGB(65, 65, 65)  -- Color de fondo del título
    creditsTitleLabel.BackgroundTransparency = 0.2  -- Un poco de transparencia
    creditsTitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)  -- Color del texto del título
    creditsTitleLabel.Font = Enum.Font.SourceSans
    creditsTitleLabel.TextSize = 18

    -- Funcionalidad de minimizar/maximizar
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

    -- Funcionalidad del botón de créditos
    creditsButton.MouseButton1Click:Connect(function()
        if creditsFrame then
            creditsFrame.Visible = not creditsFrame.Visible
        end
    end)

    -- Hacer que los frames se muevan juntos
    local function syncFrames()
        creditsFrame.Position = UDim2.new(frame.Position.X.Scale + frame.Size.X.Scale, frame.Position.X.Offset, frame.Position.Y.Scale, frame.Position.Y.Offset)
    end

    frame:GetPropertyChangedSignal("Position"):Connect(syncFrames)
    frame:GetPropertyChangedSignal("Size"):Connect(syncFrames)

    return frame, contentFrame
end

function UILibrary:AddToggleButton(parent, toggleName)
    local toggleButton = Instance.new("TextButton")
    toggleButton.Parent = parent
    toggleButton.Text = toggleName
    toggleButton.Size = UDim2.new(1, 0, 0, 30)
    toggleButton.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    toggleButton.BackgroundTransparency = 0.2
    toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleButton.Font = Enum.Font.SourceSans
    toggleButton.TextSize = 18

local toggleFrame = Instance.new("Frame")
    toggleFrame.Parent = parent.Parent  -- Asegurarse de que el frame se agregue al mismo nivel que el frame principal
    toggleFrame.Size = UDim2.new(0.2, 0, 0.4, 0)  -- Un poco más delgado que el frame principal
    toggleFrame.Position = UDim2.new(0.635, 0, 0.3, 0)  -- Posición al lado del frame principal
    toggleFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    toggleFrame.BackgroundTransparency = 0.1
    toggleFrame.BorderSizePixel = 0
    toggleFrame.Visible = false  -- Inicialmente oculto

    -- Título del frame del toggle
    local toggleTitleLabel = Instance.new("TextLabel")
    toggleTitleLabel.Parent = toggleFrame
    toggleTitleLabel.Text = toggleName
    toggleTitleLabel.Size = UDim2.new(1, 0, 0, 30)  -- Tamaño del título
    toggleTitleLabel.Position = UDim2.new(0, 0, 0, 0)  -- Posición del título
    toggleTitleLabel.BackgroundColor3 = Color3.fromRGB(65, 65, 65)  -- Color de fondo del título
    toggleTitleLabel.BackgroundTransparency = 0.2  -- Un poco de transparencia
    toggleTitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)  -- Color del texto del título
    toggleTitleLabel.Font = Enum.Font.SourceSans
    toggleTitleLabel.TextSize = 18

    -- Funcionalidad del botón de toggle
    toggleButton.MouseButton1Click:Connect(function()
        toggleFrame.Visible = not toggleFrame.Visible
    end)

    -- Hacer que los frames se muevan juntos
    local function syncFrames()
        toggleFrame.Position = UDim2.new(parent.Position.X.Scale + parent.Size.X.Scale, parent.Position.X.Offset, parent.Position.Y.Scale, parent.Position.Y.Offset)
    end

    parent:GetPropertyChangedSignal("Position"):Connect(syncFrames)
    parent:GetPropertyChangedSignal("Size"):Connect(syncFrames)

    return toggleButton, toggleFrame
end

return UILibrary
    
