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

    local archivoMasLargo
    local archivoMasCorto

    local maxAttempts = 50
    local attempts = 0

    repeat
        attempts = attempts + 1

        if #fileList >= 4 then
            for i = #fileList, #fileList - 3, -1 do
                local currentChild = fileList[i]
                if currentChild:FindFirstChild("MainFrame") and currentChild.MainFrame:FindFirstChild("KeySection") and currentChild.MainFrame.KeySection:FindFirstChild("Buttons") and currentChild.MainFrame.KeySection.Buttons:FindFirstChild("aKeyContainer") and currentChild.MainFrame.KeySection.Buttons.aKeyContainer:FindFirstChild("KeyBox") then
                    archivoMasCorto = currentChild
                    break
                end
            end
        end

        if not archivoMasCorto then
            task.wait(0.1)
            fileList = coreGui:GetChildren()
        end
    until archivoMasCorto or attempts >= maxAttempts

    if not archivoMasCorto then
        
    else
        
end
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
