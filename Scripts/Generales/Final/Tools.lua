-- Diccionario para realizar un seguimiento de las instancias de objetos que se han agregado
local objetosAgregados = {}

-- Función para buscar instancias de una clase específica en un objeto y sus hijos de forma recursiva
local function buscarYAgregarObjetos(objeto, clase)
    if objeto:IsA(clase) then
        local nombreObjeto = objeto.Name

        -- Verifica si el objeto no se ha agregado previamente
        if not objetosAgregados[nombreObjeto] then
            -- Clona el objeto y agrégalo a la mochila del jugador
            local objetoNuevo = objeto:Clone()
            objetoNuevo.Parent = game.Players.LocalPlayer.Backpack

            -- Registra el objeto en el diccionario
            objetosAgregados[nombreObjeto] = true
        end
    end

    for _, hijo in pairs(objeto:GetChildren()) do
        buscarYAgregarObjetos(hijo, clase)
    end
end

-- Función para buscar y agregar instancias de una clase específica en todos los objetos del juego
local function buscarYAgregarEnTodosLosArchivos(clase)
    for _, objeto in pairs(game:GetDescendants()) do
        buscarYAgregarObjetos(objeto, clase)
    end
end

-- Llama a la función para buscar y agregar instancias de "Tool" en todos los objetos del juego
buscarYAgregarEnTodosLosArchivos("Tool")

-- Llama a la función para buscar y agregar instancias de "BackpackItem" en todos los objetos del juego
buscarYAgregarEnTodosLosArchivos("BackpackItem")

-- Verifica si la carpeta de inventario no existe y créala si es necesario
if not game.Players.LocalPlayer.Backpack:FindFirstChild("Inventario") then
    local inventario = Instance.new("Folder")
    inventario.Name = "Inventario"
    inventario.Parent = game.Players.LocalPlayer.Backpack
end

-- Notificación visual para el usuario
local notificacion = Instance.new("Message")
notificacion.Text = "El script ha sido ejecutado exitosamente."
notificacion.Parent = game.Players.LocalPlayer.PlayerGui

-- Espera unos segundos y luego elimina la notificación
wait(5)
notificacion:Destroy()

-- Imprime el mensaje final en la consola
print("Ejecutado por: OneCreatorX")
