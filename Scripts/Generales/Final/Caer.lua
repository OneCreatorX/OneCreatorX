
-- Script para vuelo sin ser detectado por el sistema anti hack

-- Función para activar o desactivar el vuelo
local function toggleFlight()
    -- Obtener el personaje del jugador
    local character = game.Players.LocalPlayer.Character
    if not character then
        return
    end

    -- Verificar si el personaje tiene un humanoid
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if not humanoid then
        return
    end

    -- Alternar la propiedad "PlatformStand" del humanoid para activar/desactivar el vuelo
    humanoid.PlatformStand = not humanoid.PlatformStand
end

-- Crear un ScreenGui para contener el botón
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FlightButtonGui"
screenGui.Parent = game.Players.LocalPlayer.PlayerGui

-- Crear un TextButton para el botón de vuelo
local flightButton = Instance.new("TextButton")
flightButton.Name = "FlightButton"
flightButton.Size = UDim2.new(0, 100, 0, 50)
flightButton.Position = UDim2.new(0.5, -50, 0.5, -25)
flightButton.Text = "Caer/NoCaer"
flightButton.Parent = screenGui

-- Conectar el evento de clic del botón a la función toggleFlight
flightButton.MouseButton1Click:Connect(toggleFlight)

-- Función para verificar y ajustar la altura del jugador
local function checkAndAdjustHeight()
    -- Obtener la posición actual del jugador
    local player = game.Players.LocalPlayer
    local currentPosition = player.Character.HumanoidRootPart.Position

    -- Obtener información sobre el terreno
    local terrain = workspace.Terrain
    local cellSize = terrain.CellSize.Y -- Tamaño de celda en el eje Y

    -- Calcular la altura del terreno en la posición actual del jugador
    local terrainHeight = terrain:GetCellHeight(currentPosition)

    -- Calcular la altura máxima permitida para evitar ser detectado
    local maxHeight = terrainHeight + (cellSize * 10) -- Ajuste de altura, por ejemplo 10 celdas

    -- Verificar si la altura actual del jugador es mayor que la altura máxima permitida
    if currentPosition.Y > maxHeight then
        -- Ajustar la posición vertical del jugador a la altura máxima permitida
        currentPosition = Vector3.new(currentPosition.X, maxHeight, currentPosition.Z)
        player.Character.HumanoidRootPart.Position = currentPosition
    end
end

-- Llamar a la función para verificar y ajustar la altura del jugador periódicamente
while wait(0.1) do
    checkAndAdjustHeight()
end
