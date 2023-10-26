-- Obtén al jugador local
local jugador = game.Players.LocalPlayer

-- Verifica si el jugador existe
if jugador then
    -- Obtén la mochila del jugador
    local mochila = jugador:FindFirstChild("Backpack")

    -- Verifica si la mochila existe
    if mochila then
        -- Recorre todos los objetos en la mochila
        for _, objeto in pairs(mochila:GetChildren()) do
            -- Verifica si el objeto es un modelo (puedes ajustar esto según la estructura de tus objetos)
            if objeto:IsA("Model") then
                -- Conecta el objeto al personaje del jugador
                objeto.Parent = jugador.Character

                -- Coloca el objeto en la mano del personaje (ajusta esto según la posición deseada)
                objeto:SetPrimaryPartCFrame(jugador.Character:WaitForChild("RightHand").CFrame)
            end
        end
    else
        print("La mochila del jugador no se encontró.")
    end
else
    print("El jugador no se encontró.")
end
