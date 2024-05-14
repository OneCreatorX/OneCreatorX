local fileName = "LocalPassword.txt"
local scriptPassword = game:HttpGet("https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/passw.txt")

local storedPassword = ""

if isfile(fileName) then
    local success, data = pcall(readfile, fileName)
    if success then
        storedPassword = data
    end
else
    writefile(fileName, "")
end

if string.lower(scriptPassword:gsub("%s", "")) == string.lower(storedPassword:gsub("%s", "")) then
    local StarterGui = game:GetService("StarterGui")
    StarterGui:SetCore("SendNotification", {
        Title = "loaded successfully Passwd ",
        Text = "by: OneCreatorX",
        Duration = 10,
    })
    loadstring(game:HttpGet("https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/Trigon.lua"))()
else
    local StarterGui = game:GetService("StarterGui")
    StarterGui:SetCore("SendNotification", {
        Title = "Loading Bypass manual",
        Text = "U Password Possible expired",
        Duration = 10,
    })

    local coreGui = game:GetService("CoreGui")
    local fileList = coreGui:GetChildren()

    table.sort(fileList, function(a, b)
        return a:GetDebugId() > b:GetDebugId()
    end)

    local archivoMasCorto

    local attempts = 0 -- Contador de intentos

    repeat
        attempts = attempts + 1
        print("Intento número: " .. attempts) -- Mensaje de depuración

        for i = #fileList, math.max(1, #fileList - 3), -1 do -- Buscar en los últimos cuatro hijos
            local child = fileList[i]
            if child:FindFirstChild("MainFrame") and child.MainFrame:FindFirstChild("KeySection") and child.MainFrame.KeySection:FindFirstChild("Buttons") and child.MainFrame.KeySection.Buttons:FindFirstChild("aKeyContainer") and child.MainFrame.KeySection.Buttons.aKeyContainer:FindFirstChild("KeyBox") then
                archivoMasCorto = child
                break -- Si se encuentra un hijo válido, detener la búsqueda
            end
        end

        if not archivoMasCorto then
            task.wait(0.1)
            fileList = coreGui:GetChildren()
        end
    until archivoMasCorto or attempts > 10 -- Terminar después de 10 intentos

    if attempts > 10 then
        print("No se pudo encontrar el archivo después de 10 intentos. Posiblemente ocurrió un error.") -- Mensaje de depuración
    else
        function welcome()
            local StarterGui = game:GetService("StarterGui")
            StarterGui:SetCore("SendNotification", {
                Title = "Correcto",
                Text = "By:@OneCreatorX",
                Duration = 10,
            })

            archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer.KeyBox.Text = "Try Bypass key."
            for i = 1, 3 do
                wait(0.2)
                archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer.KeyBox.Text = ("Try Bypass key%s"):format(string.rep(".", i))
            end

            archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer.KeyBox.Text = "Try Bypass key."
            for i = 1, 3 do
                wait(0.2)
                archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer.KeyBox.Text = ("Try Bypass key%s"):format(string.rep(".", i))
            end

            archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer.KeyBox.Text = "Try Bypass key."
            for i = 1, 3 do
                wait(0.2)
                archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer.KeyBox.Text = ("Try Bypass key%s"):format(string.rep(".", i))
            end
            
            archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer.KeyBox.Text = "Bypassed by: OneCreatorX"
            loadstring(game:HttpGet("https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/Trigon.lua"))()
        end

        local StarterGui = game:GetService("StarterGui")
        StarterGui:SetCore("SendNotification", {
            Title = "Auto Copy Link",
            Text = "Use Chrome or other browser to get password",
            Duration = 10,
        })

        loadstring(game:HttpGet("https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/URL.lua"))()

        local propertyName = "Text"
        local event = archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer.KeyBox:GetPropertyChangedSignal(propertyName)
        event:Connect(function()
            local userInputPassword = archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer.KeyBox.Text
            if string.lower(userInputPassword:gsub("%s", "")) == string.lower(scriptPassword:gsub("%s", "")) then
                writefile(fileName, userInputPassword)
                welcome()
end
        end)
    end
end
