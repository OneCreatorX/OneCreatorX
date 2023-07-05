-- Obtener el personaje y su Humanoid
local player = game:GetService("Players").LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")

-- Función para mover al personaje a una posición
local function walkToPosition(position)
    humanoid:MoveTo(position)
end

-- Bucle infinito para mover al personaje
while true do
    humanoid.Jump = true
    walkToPosition(Vector3.new(790.044, 9.12075, -277.538))
    wait(1)
end
