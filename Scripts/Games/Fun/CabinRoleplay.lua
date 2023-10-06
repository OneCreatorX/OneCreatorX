local touchPart = game.Workspace:WaitForChild("Outside"):WaitForChild("Campfire"):WaitForChild("TouchPart")

function ActualizarTouchPart()
    local jugadorLocal = game.Players.LocalPlayer
    if jugadorLocal then
        local cabeza = jugadorLocal.Character:FindFirstChild("Head")
        local torso = jugadorLocal.Character:FindFirstChild("Torso") or jugadorLocal.Character:FindFirstChild("UpperTorso")

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
