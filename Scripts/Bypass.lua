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
    local coreGui = game:GetService("CoreGui")
    local fileList = coreGui:GetChildren()

    table.sort(fileList, function(a, b)
        return a:GetDebugId() > b:GetDebugId()
    end)

    local archivoMasLargo
    local archivoMasCorto

    repeat
        if #fileList >= 2 then
            if #fileList[#fileList].Name > #fileList[#fileList - 1].Name then
                archivoMasLargo = fileList[#fileList]
                archivoMasCorto = fileList[#fileList - 1]
            else
                archivoMasLargo = fileList[#fileList - 1]
                archivoMasCorto = fileList[#fileList]
            end
        end

        if not (archivoMasCorto:FindFirstChild("MainFrame") and archivoMasCorto.MainFrame:FindFirstChild("KeySection") and archivoMasCorto.MainFrame.KeySection:FindFirstChild("Buttons") and archivoMasCorto.MainFrame.KeySection.Buttons:FindFirstChild("aKeyContainer") and archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer:FindFirstChild("KeyBox")) then
            task.wait(1)
            fileList = coreGui:GetChildren()
        end
    until archivoMasCorto:FindFirstChild("MainFrame") and archivoMasCorto.MainFrame:FindFirstChild("KeySection") and archivoMasCorto.MainFrame.KeySection:FindFirstChild("Buttons") and archivoMasCorto.MainFrame.KeySection.Buttons:FindFirstChild("aKeyContainer") and archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer:FindFirstChild("KeyBox")

    local propertyName = "Text"
    local StarterGui = game:GetService("StarterGui")
    StarterGui:SetCore("SendNotification", {
        Title = "YT:OneCreatorX",
        Text = "Ready Checking Pass",
        Duration = 5,
    })

    local fileName = "Password.txt"
    local password
    if isfile(fileName) then
        local success, data = pcall(readfile, fileName)
        if success then
            password = data
        end
    else
        password = ""
        writefile(fileName, password)
    end

    local inputEvent = archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer.KeyBox.FocusLost
    inputEvent:Connect(function()
        local enteredPassword = string.lower(archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer.KeyBox.Text)
        writefile(fileName, enteredPassword)

        local cloudPassword = game:HttpGet("https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/passw.txt")
        local cloudPasswordLower = string.lower(cloudPassword)

        if enteredPassword == password or enteredPassword == cloudPasswordLower then
            StarterGui:SetCore("SendNotification", {
                Title = "YT:OneCreatorX",
                Text = "Correct Pass",
                Duration = 5,
            })

            wait(0.3)
            archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer.KeyBox.Text = "Try Bypass key."
            for i = 1, 3 do
                wait(0.2)
                archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer.KeyBox.Text = ("Try Bypass key%s"):format(string.rep(".", i))
            end
            wait(1)
            archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer.KeyBox.Text = "Ready By:OneCreatorX"
            wait(2)
            loadstring(game:HttpGet("https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/load.lua"))()
        else
            -- Incorrect password, notify the user
            StarterGui:SetCore("SendNotification", {
                Title = "Password Incorrect",
                Text = "Please enter the correct password.",
                Duration = 5,
            })
        end
    end)
else
    local StarterGui = game:GetService("StarterGui")
    StarterGui:SetCore("SendNotification", {
        Title = "YT:OneCreatorX",
        Text = "User not authorized",
        Duration = 5,
    })
end
