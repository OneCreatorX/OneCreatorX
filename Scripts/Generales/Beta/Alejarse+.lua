-- Inserta este script en un objeto en el juego de Roblox

-- Configuración
local player = game.Players.LocalPlayer -- Jugador local
local distanceFromPlayer = 10 -- Distancia del Part respecto al jugador (ajusta según tus necesidades)

-- Crear el Part y el SurfaceGUI
local part = Instance.new("Part")
part.Name = "ButtonPart"
part.Size = Vector3.new(8, 5, 1)
part.CFrame = player.Character.HumanoidRootPart.CFrame + (player.Character.HumanoidRootPart.CFrame.LookVector * distanceFromPlayer)
part.Anchored = true
part.CanCollide = false
part.TopSurface = Enum.SurfaceType.Smooth
part.BottomSurface = Enum.SurfaceType.Smooth
part.Parent = workspace

local surfaceGui = Instance.new("SurfaceGui")
surfaceGui.Face = Enum.NormalId.Front
surfaceGui.Parent = part

local activateButton = Instance.new("TextButton")
activateButton.Name = "ActivateButton"
activateButton.Size = UDim2.new(1, 0, 0.5, 0) -- Ajustar tamaño del botón
activateButton.Position = UDim2.new(0, 0, 0, 0) -- Ajustar posición del botón
activateButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Color verde para el botón de activar
activateButton.Text = "Activar"
activateButton.FontSize = Enum.FontSize.Size48 -- Ajustar tamaño de fuente
activateButton.TextColor3 = Color3.fromRGB(255, 255, 255)
activateButton.TextScaled = true -- Escalar el texto para que ocupe el espacio
activateButton.Parent = surfaceGui

local deactivateButton = Instance.new("TextButton")
deactivateButton.Name = "DeactivateButton"
deactivateButton.Size = UDim2.new(1, 0, 0.5, 0) -- Ajustar tamaño del botón
deactivateButton.Position = UDim2.new(0, 0, 0.5, 0) -- Ajustar posición del botón
deactivateButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Color rojo para el botón de desactivar
deactivateButton.Text = "Desactivar"
deactivateButton.FontSize = Enum.FontSize.Size48 -- Ajustar tamaño de fuente
deactivateButton.TextColor3 = Color3.fromRGB(255, 255, 255)
deactivateButton.TextScaled = true -- Escalar el texto para que ocupe el espacio
deactivateButton.Parent = surfaceGui

-- Variables
local active = false -- Estado de movimiento activado/desactivado

-- Función para alejar al jugador local de otros jugadores
local function moveAwayFromPlayers()
    local character = player.Character
    local rootPart = character and character:FindFirstChild("HumanoidRootPart")
    
    if rootPart then
        local currentPosition = rootPart.Position
        
        -- Buscar jugadores cercanos
        for _, otherPlayer in ipairs(game.Players:GetPlayers()) do
            if otherPlayer ~= player then
                local otherCharacter = otherPlayer.Character
                local otherRootPart = otherCharacter and otherCharacter:FindFirstChild("HumanoidRootPart")
                
                if otherRootPart then
                    local distance = (currentPosition - otherRootPart.Position).Magnitude
                    
                    -- Alejar al jugador local si se encuentra dentro del rango
                    if distance < 10 then
                        local direction = (currentPosition - otherRootPart.Position).Unit
                        local newPosition = currentPosition + (direction * 5)
                        
                        -- Comprobar si hay obstáculos en el camino
                        local raycastParams = RaycastParams.new()
                        raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
                        raycastParams.FilterDescendantsInstances = {character, otherCharacter}
                        local raycastResult = workspace:Raycast(currentPosition, direction, raycastParams)
                        
                        if raycastResult then
                            newPosition = rootPart.Position
                        end
                        
                        -- Mover al jugador local
                        rootPart.CFrame = CFrame.new(newPosition)
                    end
                end
            end
        end
    end
end

-- Función para activar el movimiento
local function activateMovement()
    active = true
end

-- Función para desactivar el movimiento
local function deactivateMovement()
    active = false
end

-- Función para verificar la distancia y regresar al jugador si está lejos
local function checkDistance()
    local character = player.Character
    if character then
        local rootPart = character:FindFirstChild("HumanoidRootPart")
        if rootPart then
            local distance = (part.Position - rootPart.Position).Magnitude
            if distance > 50 then
                character:SetPrimaryPartCFrame(part.CFrame)
            end
        end
    end
end

-- Conexiones de eventos
activateButton.MouseButton1Click:Connect(activateMovement)
deactivateButton.MouseButton1Click:Connect(deactivateMovement)

game:GetService("RunService").Heartbeat:Connect(function()
    if active then
        moveAwayFromPlayers()
    end
    checkDistance()
end)

