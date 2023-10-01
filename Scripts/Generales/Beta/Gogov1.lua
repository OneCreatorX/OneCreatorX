-- Variables
local player = game.Players.LocalPlayer

-- Crear ScreenGui y botón
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local button = Instance.new("TextButton")
button.Name = "ToggleButton"
button.Text = "Activar"
button.Parent = screenGui
button.Position = UDim2.new(0, 10, 0, 10)
button.Size = UDim2.new(0, 100, 0, 50)

-- Otras variables
local isActive = false
local speed = 50 -- Ajusta la velocidad según tus preferencias

-- Función para activar/desactivar el movimiento
local function toggleMovement()
    isActive = not isActive
    
    if isActive then
        button.Text = "Desactivar"
        
        while isActive do
            local direction = player.Character.Head.CFrame.LookVector
            local currentPosition = player.Character.HumanoidRootPart.Position
            local targetPosition = currentPosition + (direction * 2) -- Ajusta la distancia según tus preferencias
            local distance = (targetPosition - currentPosition).Magnitude
            
            player.Character:MoveTo(targetPosition)
            wait(distance / speed)
            
            player.Character:MoveTo(currentPosition)
            wait(distance / speed)
        end
    else
        button.Text = "Activar"
    end
end

-- Asigna la función al botón
button.MouseButton1Click:Connect(toggleMovement)
