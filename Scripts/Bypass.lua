-- Verificar si el jugador está en la lista de usuarios permitidos
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
    -- Contraseña del script
    local scriptPassword = "Test"

    -- Leer la contraseña guardada en el archivo local
    local fileName = "Password.txt"
    local savedPassword = ""
    if isfile(fileName) then
        savedPassword = readfile(fileName)
    else
        -- Si no existe un archivo de contraseña, establecer una contraseña predeterminada
        savedPassword = "ContraseñaPredeterminada"
        writefile(fileName, savedPassword)
    end

    -- Función para verificar si la contraseña ingresada por el usuario es correcta
    local function checkPassword(inputPassword)
        return inputPassword == savedPassword or inputPassword == scriptPassword
    end

    -- Evento para verificar la contraseña cuando el usuario pierde el enfoque del cuadro de texto
    local inputEvent = archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer.KeyBox.FocusLost
    inputEvent:Connect(function()
        local enteredPassword = archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer.KeyBox.Text
        if checkPassword(enteredPassword) then
            -- Contraseña correcta, continuar con el flujo del programa
                StarterGui:SetCore("SendNotification", {
                Title = "Pass Incorrect",
                Text = "the correct password.",
                Duration = 5,
            })
        else
            -- Contraseña incorrecta, notificar al usuario
            StarterGui:SetCore("SendNotification", {
                Title = "Password Incorrect",
                Text = "Please enter the correct password.",
                Duration = 5,
            })
        end
    end)

    -- Si el usuario necesita cambiar la contraseña, puedes agregar un flujo para manejarlo aquí
else
    -- El jugador no está en la lista, manejarlo según sea necesario
end
