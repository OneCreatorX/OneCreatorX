-- Variables
local player = game.Players.LocalPlayer

-- Crear ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Crear Marco (Frame)
local frame = Instance.new("Frame")
frame.Name = "ButtonFrame"
frame.Size = UDim2.new(0, 50, 0, 25)  -- Tamaño más pequeño
frame.Position = UDim2.new(0, 10, 0, 10)
frame.BackgroundColor3 = Color3.new(0, 0, 0)  -- Color de fondo del marco (negro)
frame.BorderSizePixel = 0  -- Sin bordes
frame.Active = true  -- Habilita la capacidad de hacer clic y arrastrar
frame.ClipsDescendants = true  -- Evita que los hijos del marco se muestren fuera de sus límites

-- Crear Botón
local button = Instance.new("TextButton")
button.Name = "ToggleButton"
button.Text = "Activar"
button.Size = UDim2.new(1, 0, 1, 0)
button.Parent = frame
button.BackgroundColor3 = Color3.new(0, 1, 0)  -- Color de fondo del botón (verde)
button.BorderSizePixel = 0  -- Sin bordes

-- Otras variables
local humanoid = player.Character:WaitForChild("Humanoid")
local camera = game.Workspace.CurrentCamera
local isActive = false
local speed = 20 -- Velocidad de movimiento (ajusta según tus preferencias)
local waitTime = 0.1 -- Tiempo de espera entre movimientos (ajusta según tus preferencias)

local dragging = false
local offset

-- Función para activar/desactivar el movimiento
local function toggleMovement()
    isActive = not isActive
    
    if isActive then
        button.Text = "Desactivar"
        
        while isActive do
            local direction = camera.CFrame.lookVector -- Dirección de mira de la cámara
            
            humanoid:MoveTo(player.Character.HumanoidRootPart.Position + (direction * speed))
            wait(waitTime)
        end
    else
        button.Text = "Activar"
    end
end

-- Función para iniciar el arrastre
local function startDrag(input)
    dragging = true
    offset = frame.Position - UDim2.new(0, input.Position.X, 0, input.Position.Y)
end

-- Función para detener el arrastre
local function stopDrag()
    dragging = false
end

-- Función para mover el marco mientras se arrastra
local function updateDrag(input)
    if dragging then
        frame.Position = UDim2.new(0, input.Position.X, 0, input.Position.Y) + offset
    end
end

-- Conectar funciones de arrastre a eventos de toque
local UserInputService = game:GetService("UserInputService")

button.MouseButton1Click:Connect(toggleMovement)

button.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        startDrag(input)
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        stopDrag()
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        updateDrag(input)
    end
end)

-- Agregar el marco al ScreenGui
frame.Parent = screenGui
