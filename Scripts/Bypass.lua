local fileName = "Password.txt"
local scriptPassword = "test"
local storedPassword = ""

local userListScript = game:HttpGet("https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/Users.txt")
local userList = string.lower(userListScript):gsub("%s+", ""):split(",")
local playerName = string.lower(game.Players.LocalPlayer.Name):gsub("%s+", "")
local playerInList = false

for _, name in ipairs(userList) do
    if playerName == name then
        playerInList = true
        break
    end
end

if playerInList then
    if isfile(fileName) then
        local success, data = pcall(readfile, fileName)
        if success then
            storedPassword = data
        end
    else
        storedPassword = scriptPassword  -- Utiliza la contraseña del script si no hay archivo
        writefile(fileName, storedPassword)  -- Escribe la contraseña en el archivo
    end

    -- Verificar la contraseña del usuario
    local userInputPassword = -- Código para que el usuario ingrese la contraseña manualmente

    -- Comparar la contraseña del usuario con las contraseñas almacenadas
    if userInputPassword == storedPassword or userInputPassword == scriptPassword then
        -- La contraseña del usuario es correcta, continuar con el flujo del script

        -- Verificar si hay una nueva contraseña
        if userInputPassword ~= storedPassword then
            -- Si hay una nueva contraseña, el usuario la ingresa manualmente
            userInputPassword = -- Código para que el usuario ingrese la nueva contraseña manualmente

            -- Actualizar la contraseña almacenada en el archivo
            storedPassword = userInputPassword
            writefile(fileName, storedPassword)  -- Actualizar el archivo con la nueva contraseña
        end

        -- Continuar con el flujo del script aquí
    else
        -- La contraseña del usuario es incorrecta, tomar medidas apropiadas (por ejemplo, mostrar un mensaje de error)
    end
else
    -- El jugador no está en la lista, manejar de acuerdo
end
