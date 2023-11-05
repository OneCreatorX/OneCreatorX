-- Obtén el jugador local y su personaje
local p = game.Players.LocalPlayer
local h = p.Character:FindFirstChild("Humanoid")
local i = p.Character.HumanoidRootPart.Position
local y = i.Y
local pos = {}
local maxClicks = 3
local currentClicks = 0
local isIncreasing = true

-- Variable para rastrear el arrastre de la interfaz
local isDragging = false
local dragStart = nil

-- Función para actualizar la posición de los botones
local function actualizarPos()
    pos = {}
    local c = game.Workspace.Coins:GetChildren()
    for _, part in pairs(c) do
        local p = part.Position
        p = Vector3.new(p.X, y, p.Z)
        table.insert(pos, p)
    end
end

-- Función para encontrar la posición más cercana
local function encontrarPosCercana()
    local i = p.Character.HumanoidRootPart.Position
    local d = math.huge
    local posCercana = nil
    for _, posObj in ipairs(pos) do
        local distancia = (posObj - i).Magnitude
        if distancia < d then
            d = distancia
            posCercana = posObj
        end
    end
    return posCercana
end

-- Función para caminar hacia una posición
local function caminarA(posObj)
    h.WalkToPoint = posObj
end

-- Función para aumentar la velocidad
local function aumentarVelocidad()
    if currentClicks < maxClicks or not isIncreasing then
        h.WalkSpeed = h.WalkSpeed + 2
        currentClicks = currentClicks + 1
        isIncreasing = true
    end
end

-- Función para disminuir la velocidad
local function disminuirVelocidad()
    if currentClicks < maxClicks or isIncreasing then
        h.WalkSpeed = math.max(0, h.WalkSpeed - 2)
        currentClicks = currentClicks + 1
        isIncreasing = false
    end
end

-- Crear una nueva ScreenGui
local playerGui = p:WaitForChild("PlayerGui")
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui

-- Crear un Frame para la interfaz
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 100, 0, 100)
frame.Position = UDim2.new(0, 100, 0, 100)
frame.BackgroundColor3 = Color3.new(0, 0, 0)
frame.BorderSizePixel = 0

-- Conectar funciones para permitir el arrastre de la interfaz
frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        isDragging = true
        dragStart = input.Position
    end
end)

frame.InputChanged:Connect(function(input)
    if isDragging then
        local delta = input.Position - dragStart
        frame.Position = UDim2.new(0, frame.Position.X.Offset + delta.X, 0, frame.Position.Y.Offset + delta.Y)
        dragStart = input.Position
    end
end)

frame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        isDragging = false
    end
end)

frame.Parent = screenGui

-- Crear botones dentro del Frame
local buttonUp = Instance.new("TextButton")
buttonUp.Text = "↑"
buttonUp.Size = UDim2.new(0, 50, 0, 50)
buttonUp.Position = UDim2.new(0.25, 0, 0.2, 0)
buttonUp.BackgroundColor3 = Color3.new(0, 1, 0)  -- Color verde
buttonUp.TextColor3 = Color3.new(1, 1, 1)  -- Texto blanco
buttonUp.FontSize = Enum.FontSize.Size24
buttonUp.Parent = frame
buttonUp.MouseButton1Click:Connect(aumentarVelocidad)

-- Texto "OneCreatorX" encima de los botones
local labelText = Instance.new("TextLabel")
labelText.Text = "OneCreatorX"
labelText.Size = UDim2.new(0, 100, 0, 20)
labelText.Position = UDim2.new(0, 0, 0, -25)
labelText.TextColor3 = Color3.new(1, 1, 1)  -- Texto blanco
labelText.FontSize = Enum.FontSize.Size14
labelText.Parent = frame

-- Función para seguir caminando
local function seguirCaminando()
    while true do
        if #pos > 0 then
            local posObj = encontrarPosCercana()
            caminarA(posObj)
            repeat
                wait(0.1)
            until (h.WalkToPoint - posObj).Magnitude < 1
            actualizarPos()
        else
            wait(1)
            actualizarPos()
        end
    end
end

-- Inicia la función de seguir caminando
actualizarPos()
coroutine.wrap(seguirCaminando)()
