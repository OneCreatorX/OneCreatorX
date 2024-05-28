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
    frame.Size = UDim2.new(0.3, 0, 0.4, 0)  -- Tamaño básico del frame
    frame.Position = UDim2.new(0.35, 0, 0.3, 0)  -- Posición centrada
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

    return frame
end

return UILibrary
