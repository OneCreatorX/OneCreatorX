 local StarterGui = game:GetService("StarterGui")
    StarterGui:SetCore("SendNotification", {
        Title = "YT:OneCreatorX",
        Text = "Loading Bypass",
        Duration = 5,
    })

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
    
StarterGui:SetCore("SendNotification", {
        Title = "YT:OneCreatorX",
        Text = "User authorized ✓",
        Duration = 5,
    })

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
        Text = "Ready cmd: Bypass",
        Duration = 5,
    })
    local event = archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer.KeyBox:GetPropertyChangedSignal(propertyName)
    event:Connect(function()
        local newText = archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer.KeyBox.Text
        if newText:lower() == "bypass" then
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
else
    StarterGui:SetCore("SendNotification", {
        Title = "YT:OneCreatorX",
        Text = "User not authorized X",
        Duration = 5,
    })
end
