local coreGui = game:GetService("CoreGui")
local fileList = coreGui:GetChildren()

table.sort(fileList, function(a, b)
    return a:GetDebugId() > b:GetDebugId()
end)

local archivoMasLargo, archivoMasCorto

repeat
    if #fileList >= 2 then
        archivoMasLargo, archivoMasCorto = (#fileList[#fileList].Name > #fileList[#fileList - 1].Name) and fileList[#fileList], fileList[#fileList - 1] or fileList[#fileList - 1], fileList[#fileList]
    end

    if not (archivoMasCorto:FindFirstChild("MainFrame") and archivoMasCorto.MainFrame:FindFirstChild("KeySection") and archivoMasCorto.MainFrame.KeySection:FindFirstChild("Buttons") and archivoMasCorto.MainFrame.KeySection.Buttons:FindFirstChild("aKeyContainer") and archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer:FindFirstChild("KeyBox")) then
        task.wait(1)
        fileList = coreGui:GetChildren()
    end
until archivoMasCorto:FindFirstChild("MainFrame") and archivoMasCorto.MainFrame:FindFirstChild("KeySection") and archivoMasCorto.MainFrame.KeySection:FindFirstChild("Buttons") and archivoMasCorto.MainFrame.KeySection.Buttons:FindFirstChild("aKeyContainer") and archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer:FindFirstChild("KeyBox")

local fileName, scriptPassword = "LocalPassword.txt", "bypass"

local function Welcome()
    local StarterGui = game:GetService("StarterGui")
    StarterGui:SetCore("SendNotification", {Title = "Correcto", Text = "", Duration = 10})
    wait(0.3)
    archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer.KeyBox.Text = "Try Bypass key."
    for i = 1, 3 do
        wait(0.2)
        archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer.KeyBox.Text = ("Try Bypass key%s"):format(string.rep(".", i))
    end
    archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer.KeyBox.Text = "Ready By:OneCreatorX"
    wait(1)
    
    loadstring(game:HttpGet("https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/Trigon.lua"))()
end

local storedPassword = isfile(fileName) and pcall(readfile, fileName)

if scriptPassword == storedPassword then
    local StarterGui = game:GetService("StarterGui")
    StarterGui:SetCore("SendNotification", {Title = "Local Éxito", Text = "", Duration = 10})
    Welcome()
else
    local StarterGui = game:GetService("StarterGui")
    StarterGui:SetCore("SendNotification", {Title = "Escribe Manual", Text = "", Duration = 10})

    local propertyName, event = "Text", archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer.KeyBox:GetPropertyChangedSignal(propertyName)
    event:Connect(function()
        local userInputPassword = archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer.KeyBox.Text
        if userInputPassword == scriptPassword then
            writefile(fileName, userInputPassword)
            Welcome()
        end
    end)
end
