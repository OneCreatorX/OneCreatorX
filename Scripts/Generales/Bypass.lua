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

local fileName = "LocalPassword.txt"
local scriptPassword = "bypass"

function Welcome()
    local StarterGui = game:GetService("StarterGui")
    StarterGui:SetCore("SendNotification", {
        Title = "Correcto",
        Text = "",
        Duration = 10,
    })
    wait(0.3)
    archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer.KeyBox.Text = "Try Bypass key."
    for i = 1, 3 do
        wait(0.2)
        archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer.KeyBox.Text = ("Try Bypass key%s"):format(string.rep(".", i))
    end
    for i = 1, 3 do
        wait(0.2)
        archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer.KeyBox.Text = ("Try Bypass key%s"):format(string.rep(".", i))
    end
    for i = 1, 3 do
        wait(0.2)
        archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer.KeyBox.Text = ("Try Bypass key%s"):format(string.rep(".", i))
    end
    wait(1)
    archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer.KeyBox.Text = "Ready By:OneCreatorX"
    wait(2)
    archivoMasCorto.Enabled = false

    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "ControlGui"
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    local screenHeight = game:GetService("GuiService"):GetScreenResolution().Y
    local offset = screenHeight * 0.05

    if archivoMasLargo then
        for _, h in pairs(archivoMasLargo.MainFrame.homeFrame.localscriptsFrame:GetDescendants()) do
            if h.Name == "scriptTitle" then
                if h.Text == "Bypassed" then
                    h.Parent.Visible = false
                end
            end
        end

        local imageButton = Instance.new("ImageButton")
        imageButton.Image = "rbxassetid://15844306310"
        imageButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
        imageButton.Parent = screenGui
        imageButton.Position = UDim2.new(0, 0, 0, offset)
        imageButton.Size = UDim2.new(0, 30, 0, 30)

        imageButton.MouseButton1Click:Connect(function()
            archivoMasLargo.Enabled = not archivoMasLargo.Enabled
        end)
    end
end

local storedPassword = ""

if isfile(fileName) then
    local success, data = pcall(readfile, fileName)
    if success then
        storedPassword = data
    end
else
    writefile(fileName, "")
end

if storedPassword == storedPassword then
    local StarterGui = game:GetService("StarterGui")
    StarterGui:SetCore("SendNotification", {
        Title = "Local Éxito",
        Text = "",
        Duration = 10,
    })
    Welcome()
else
    local StarterGui = game:GetService("StarterGui")
    StarterGui:SetCore("SendNotification", {
        Title = "Escribe Manual",
        Text = "",
        Duration = 10,
    })

    local propertyName = "Text"
    local event = archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer.KeyBox:GetPropertyChangedSignal(propertyName)
    event:Connect(function()
        local userInputPassword = archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer.KeyBox.Text
        if userInputPassword == scriptPassword then
            writefile(fileName, userInputPassword)
            Welcome()
        else
            -- Este es el lugar donde deberías mostrar un mensaje de error
        end
    end)
end
