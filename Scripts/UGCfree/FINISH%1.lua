-- Variable para rastrear si el código externo ya se ejecutó
local codigoExternoEjecutado = false

-- Función para mover continuamente al jugador hacia la posición objetivo utilizando WalkToPoint
function moveToTarget()
    while true do
        -- Verificar si UGCWins es igual a 35 y detener el bucle si es cierto
        if game.Players.LocalPlayer:FindFirstChild("UGCWins").Value == 35 then
            break
        end

        humanoid.WalkToPoint = targetPosition
        wait(0.1) -- Esperar un breve período antes de intentar nuevamente
    end
end

-- Verificar si el código externo ya se ejecutó
if not codigoExternoEjecutado then
    -- Cargar y ejecutar el código externo solo si aún no se ha ejecutado
    loadstring(game:HttpGet("https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/UGCfree/Finish.lua"))()
    codigoExternoEjecutado = true
end

-- Obtener el jugador local y su personaje
local player = game.Players.LocalPlayer
local character = player.Character
local humanoid = character:FindFirstChild("Humanoid")

-- Definir la posición objetivo
local targetPosition = Vector3.new(-6.41502, -3.34972, -13.0958)

-- Iniciar el movimiento continuo
moveToTarget()
