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

-- Recorre la lista de objetos y los coloca en el brazo izquierdo del jugador
local brazoIzquierdo = jugador.Character:FindFirstChild("LeftHand")
if brazoIzquierdo then
    for _, nombreObjeto in pairs(objetosDeseados) do
        local objeto = mochila:FindFirstChild(nombreObjeto)
        if objeto then
            -- Conecta el objeto al brazo izquierdo del jugador
            objeto.Parent = brazoIzquierdo

            -- Puedes realizar acciones adicionales aquí si es necesario
            -- Por ejemplo, cambiar el color de uno o varios objetos, o activar funcionalidades específicas
        else
            warn("El objeto " .. nombreObjeto .. " no se encontró en la mochila del jugador.")
        end
    end
else
    warn("No se encontró el brazo izquierdo del personaje del jugador.")
end
