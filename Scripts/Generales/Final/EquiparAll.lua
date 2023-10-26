-- Obtener al jugador local
local jugador = game.Players.LocalPlayer

-- Verificar si el jugador existe
if not jugador then
    warn("El jugador no se encontró.")
    return
end

-- Obtener la mochila del jugador
local mochila = jugador:FindFirstChild("Backpack")

-- Verificar si la mochila existe
if not mochila then
    warn("La mochila del jugador no se encontró.")
    return
end

-- Lista de objetos deseados
local objetosDeseados = {"PomPom", "Glowstick", "Sign"}

-- Iterar sobre los objetos en la mochila y agregar los objetos adicionales a la lista
for _, objeto in pairs(mochila:GetChildren()) do
    if objeto:IsA("Model") then
        local nombreObjeto = objeto.Name
        -- Verificar si el objeto no está ya en la lista y es deseado
        if not table.find(objetosDeseados, nombreObjeto) then
            table.insert(objetosDeseados, nombreObjeto)
        end
    end
end

-- Recorre la lista de objetos y los coloca en las manos del jugador
for _, nombreObjeto in pairs(objetosDeseados) do
    local objeto = mochila:FindFirstChild(nombreObjeto)
    if objeto then
        -- Conecta el objeto al personaje del jugador
        objeto.Parent = jugador.Character

        -- Coloca el objeto en las manos del personaje
        local manoDestino = jugador.Character:FindFirstChild("RightHand") or jugador.Character:FindFirstChild("LeftHand")
        if manoDestino then
            objeto.Handle.CFrame = manoDestino.CFrame
        else
            warn("No se encontraron las manos del personaje para colocar el objeto " .. nombreObjeto)
        end
    else
        warn("El objeto " .. nombreObjeto .. " no se encontró en la mochila del jugador.")
    end
end

-- Puedes realizar acciones adicionales aquí si es necesario
-- Por ejemplo, cambiar el color de uno o varios objetos, o activar funcionalidades específicas

-- Ahora, los objetos en la lista y los objetos adicionales de la mochila están en las manos del jugador y pueden utilizarse juntos
