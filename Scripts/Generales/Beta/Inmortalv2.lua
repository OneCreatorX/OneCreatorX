
-- Este es un nuevo script en Roblox, el cual permite hacer que el jugador local sea inmortal.

-- Primero, creamos una variable para guardar al jugador local
local player = game.Players.LocalPlayer

-- Luego, necesitamos acceder a la instancia del personaje del jugador local
local character = player.Character or player.CharacterAdded:Wait()

-- A continuación, necesitamos acceder al objeto humanoid del personaje
local humanoid = character:WaitForChild("Humanoid")

-- Por último, establecemos la propiedad "Health" del objeto humanoid a un valor muy alto
humanoid.Health = math.huge

-- Retrieve the local player's character
local player = game.Players.LocalPlayer
local character = player.Character

-- Check if the character exists
if character then
    -- Retrieve the humanoid object
    local humanoid = character:WaitForChild("Humanoid")

    -- Set the MaxHealth property to a high value
    humanoid.MaxHealth = math.huge
end
