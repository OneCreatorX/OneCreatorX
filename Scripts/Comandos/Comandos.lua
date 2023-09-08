local ReplicatedStorage = game:GetService("ReplicatedStorage")

local executedCommands = {}

local function isCommandExecuted(command)
    return executedCommands[command] == true
end

local baseDirectory = "https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/Comandos/"

local commandURLs = {
    ["musica"] = true,  -- Agrega más comandos según sea necesario
}

game.Players.PlayerAdded:Connect(function(player)
    player.Chatted:Connect(function(message)
        if message:sub(1, 1) == "!" then
            local command, args = message:match("!(%S+)%s*(.*)")
            
            local url = baseDirectory .. command .. ".lua"

            if commandURLs[command] and not isCommandExecuted(command) then
                local script = game:HttpGet(url)
                if script then
                    executedCommands[command] = true
                    return loadstring(script)()
                end
            elseif command == "help" then
                local availableCommands = "Comandos disponibles:"
                for cmd, _ in pairs(commandURLs) do
                    availableCommands = availableCommands .. " " .. cmd
                end
                player:Chat(availableCommands)
            end
        end
    end)
    
    -- Mostrar un mensaje de notificación al usuario al unirse
    player:Chat("¡Hola! Soy OneCreatorX. Para ver la lista de comandos disponibles, escribe '!help'")
end)
