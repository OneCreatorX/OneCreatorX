task.wait(5)

local coreGui = game:GetService("CoreGui")
local fileList = coreGui:GetChildren()

table.sort(fileList, function(a, b)
    return a:GetDebugId() > b:GetDebugId()
end)

local ultimoArchivo1 = fileList[#fileList]
local ultimoArchivo2 = fileList[#fileList - 1]

local archivoMasLargo
local archivoMasCorto

repeat
    if ultimoArchivo1 and ultimoArchivo2 then
        if #ultimoArchivo1.Name > #ultimoArchivo2.Name then
            archivoMasLargo = ultimoArchivo1
            archivoMasCorto = ultimoArchivo2
        else
            archivoMasLargo = ultimoArchivo2
            archivoMasCorto = ultimoArchivo1
        end
    end

    if not (archivoMasCorto.MainFrame and archivoMasCorto.MainFrame.KeySection and archivoMasCorto.MainFrame.KeySection.Buttons and archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer and archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer.KeyBox) then
        task.wait(1)
        ultimoArchivo1 = fileList[#fileList]
        ultimoArchivo2 = fileList[#fileList - 1]
    end
until archivoMasCorto.MainFrame and archivoMasCorto.MainFrame.KeySection and archivoMasCorto.MainFrame.KeySection.Buttons and archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer and archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer.KeyBox

local propertyName = "Text"
local event = archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer.KeyBox:GetPropertyChangedSignal(propertyName)
event:Connect(function()
    local newText = archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer.KeyBox.Text
    if newText:lower() == "bypass" then
        wait(1)
        archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer.KeyBox.Text = "Try Bypass key."
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
end)
