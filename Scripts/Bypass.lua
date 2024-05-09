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
    local scriptPassword = "Test"
    local fileName = "Password.txt"
    local savedPassword = ""
    if isfile(fileName) then
        savedPassword = readfile(fileName)
    else
        savedPassword = "ContraseñaPredeterminada"
        writefile(fileName, savedPassword)
    end

    local function checkPassword(inputPassword)
        return inputPassword == savedPassword or inputPassword == scriptPassword
    end

    local inputEvent = archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer.KeyBox.FocusLost
    inputEvent:Connect(function()
        local enteredPassword = archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer.KeyBox.Text
        if checkPassword(enteredPassword) then
            -- Contraseña correcta, continuar con el flujo del program
                StarterGui:SetCore("SendNotification", {
                Title = "Password correct",
                Text = "correct password.",
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
else
    -- El jugador no está en la lista, manejarlo según sea necesario
end
