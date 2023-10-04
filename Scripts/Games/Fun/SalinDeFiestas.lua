-- Variables
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GameRemotes = ReplicatedStorage:WaitForChild("GameRemotes")
local GlowstickColor = GameRemotes:WaitForChild("GlowstickColor")

local colors = {
    "Red",
    "Orange",
    "Green",
    "Yellow",
    "Cyan",
    "Blue",
    "Purple",
    "Pink",
    "White",
    "Black"
}

local lastColor = nil
local colorChangeSpeed = 0.4  -- Velocidad de cambio de colores inicial

-- Crear un ScreenGui
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui
screenGui.IgnoreGuiInset = true  -- Ignorar el espacio del GUI en dispositivos móviles

-- Crear un Frame para mover
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.1, 0, 0.06, 0)
frame.Position = UDim2.new(0.8, 0, 0.1, 0)
frame.BackgroundColor3 = Color3.new(0, 0, 0)
frame.BackgroundTransparency = 0.5
frame.Parent = screenGui

-- Evento para cambiar la velocidad de forma inmediata
local colorChangeEvent = Instance.new("BindableEvent")
colorChangeEvent.Event:Connect(function(newSpeed)
    colorChangeSpeed = newSpeed
end)

-- Función para cambiar la velocidad
local function changeSpeed(speedChange)
    local newSpeed = math.max(0, colorChangeSpeed + speedChange)
    colorChangeEvent:Fire(newSpeed)  -- Disparar el evento para cambiar la velocidad
end

-- Crear botones y símbolos
local minusButton = Instance.new("TextButton")
minusButton.Text = "-"
minusButton.Position = UDim2.new(0, 0, 0, 0)
minusButton.Size = UDim2.new(0.2, 0, 1, 0)
minusButton.Parent = frame

local plusButton = Instance.new("TextButton")
plusButton.Text = "+"
plusButton.Position = UDim2.new(0.2, 0, 0, 0)
plusButton.Size = UDim2.new(0.2, 0, 1, 0)
plusButton.Parent = frame

local shuffleButton = Instance.new("TextButton")
shuffleButton.Text = "∆"
shuffleButton.Position = UDim2.new(0.4, 0, 0, 0)
shuffleButton.Size = UDim2.new(0.2, 0, 1, 0)
shuffleButton.Parent = frame

-- Conectar eventos táctiles
local function onTouch(button)
    if button == "minus" then
        changeSpeed(-0.1)  -- Reducir la velocidad de cambio
    elseif button == "plus" then
        changeSpeed(0.1)  -- Aumentar la velocidad de cambio
    elseif button == "shuffle" then
        table.sort(colors, function(a, b) return math.random() < 0.5 end)
    end
end

minusButton.TouchLongPress:Connect(function()
    onTouch("minus")
end)

plusButton.TouchLongPress:Connect(function()
    onTouch("plus")
end)

shuffleButton.TouchLongPress:Connect(function()
    onTouch("shuffle")
end)

-- Permitir arrastrar el GUI
local isDragging = false
local offset = nil

frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        isDragging = true
        offset = frame.Position - UDim2.new(input.Position.X, 0, input.Position.Y, 0)
    end
end)

frame.InputChanged:Connect(function(input)
    if isDragging and input.UserInputType == Enum.UserInputType.Touch then
        frame.Position = UDim2.new(0, input.Position.X, 0, input.Position.Y) + offset
    end
end)

frame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        isDragging = false
    end
end)

-- Bucle de cambio de colores
while true do
    local newColor = nil
    repeat
        newColor = colors[math.random(1, #colors)]
    until newColor ~= lastColor

    GlowstickColor:FireServer(newColor)
    lastColor = newColor
    wait(colorChangeSpeed)  -- Esperar según la velocidad de cambio
end
