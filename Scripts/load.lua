local fileName = "LocalPassword.txt"
local scriptPassword = "bypass"

function Welcome()
    -- Inserta aquí el código que se ejecuta si la contraseña es correcta
            local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("SendNotification", {
            Title = "Correcto",
            Text = "",
            Duration = 10,
        })
end

local storedPassword = ""

if isfile(fileName) then
    local success, data = pcall(readfile, fileName)
    if success then
        storedPassword = data
    end
else
    storedPassword = scriptPassword  -- Utiliza la contraseña del script si no hay archivo
    writefile(fileName, "")  -- Crea un archivo en blanco si no existe
end

if userInputPassword == storedPassword then
            local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("SendNotification", {
            Title = "Local Exito",
            Text = "",
            Duration = 10,
        })
    -- La contraseña almacenada coincide con la del script
    -- Ejecutar la función de bienvenida
    Welcome()
else
            local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("SendNotification", {
            Title = "Escribe Mnaul",
            Text = "",
            Duration = 10,
        })
    -- La contraseña almacenada no coincide con la del script, el usuario debe ingresar manualmente
    -- Este es el lugar donde deberías solicitar la contraseña al usuario y guardarla localmente
    local propertyName = "Text"
    local event = archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer.KeyBox:GetPropertyChangedSignal(propertyName)
    event:Connect(function()
        local userInputPassword = archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer.KeyBox.Text
        if userInputPassword == scriptPassword then
            -- La contraseña ingresada por el usuario coincide con la del script
            -- El flujo continúa como se describe en el script

            -- Guardar la contraseña ingresada por el usuario en el archivo local
            writefile(fileName, userInputPassword)

            -- Ejecutar la función de bienvenida
            Welcome()
        else
            -- La contraseña ingresada por el usuario no coincide con ninguna contraseña válida
            -- Este es el lugar donde deberías mostrar un mensaje de error y solicitar al usuario que ingrese la contraseña nuevamente
        end
    end)
end
