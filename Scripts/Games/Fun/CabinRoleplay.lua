local touchPart = game.Workspace:WaitForChild("Outside"):WaitForChild("Campfire"):WaitForChild("TouchPart")
local nombreJugador = "NmmsRblx" -- Reemplaza con el nombre del jugador

function ActualizarTouchPart()
    local jugador = game.Workspace:FindFirstChild(nombreJugador)

    if jugador then
        local cabeza = jugador:FindFirstChild("Head")
        local torso = jugador:FindFirstChild("Torso") or jugador:FindFirstChild("UpperTorso")

        if cabeza and torso then
            local puntoMedio = (cabeza.Position + torso.Position) / 2
            touchPart.CFrame = CFrame.new(puntoMedio)
        end
    end
end

-- Llama a la función ActualizarTouchPart aproximadamente cada segundo
while true do
    ActualizarTouchPart()
    wait(1)
end
