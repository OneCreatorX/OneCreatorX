local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Parent = player.PlayerGui
local playerGui = player:WaitForChild("PlayerGui")
local onScreenButtons = playerGui:WaitForChild("OnScreenButtons")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 330)
frame.Position = UDim2.new(0.85, -200, 0.1, 0)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Parent = gui
frame.Active = true
frame.Draggable = true

local minimizeButton = Instance.new("TextButton")
minimizeButton.Text = "-"
minimizeButton.Size = UDim2.new(0, 20, 0, 20)
minimizeButton.Position = UDim2.new(1, -20, 0, 0)
minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
minimizeButton.BorderSizePixel = 0
minimizeButton.Parent = frame

local isMinimized = false

minimizeButton.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    frame.Size = isMinimized and UDim2.new(0, 20, 0, 20) or UDim2.new(0, 200, 0, 350)
    minimizeButton.Text = isMinimized and "+" or "-"

    for _, element in ipairs(frame:GetChildren()) do
        if element:IsA("TextButton") or element:IsA("TextBox") then
            if element ~= minimizeButton then
                element.Visible = not isMinimized
            end
        end
    end
end)

local buttonText = "Auto Farming Dungeons OFF"
local toggleButton = Instance.new("TextButton")
toggleButton.Text = buttonText
toggleButton.Size = UDim2.new(0, 180, 0, 20)
toggleButton.Position = UDim2.new(0.5, -90, 0, 300)
toggleButton.Parent = frame

toggleButton.MouseButton1Click:Connect(function()
    buttonText = buttonText == "Auto Farming Dungeons OFF" and "Applied-AutoFarm ON" or "Auto Farming Dungeons OFF"
    toggleButton.Text = buttonText
end)

local function executeCode(code)
    loadstring(code)()
end

local buttons = {
    {"Auto Click", 'game:GetService("ReplicatedStorage").Events.DamageIncreaseOnClickEvent:FireServer()', 0.1},
    {"Auto Sell", 'game:GetService("ReplicatedStorage").Events.SellBlocks:FireServer()', 2},
    {"Auto Egg Anim(off)", 'game:GetService("ReplicatedStorage").Events.PlayerPressedKeyOnEgg:FireServer("{userInput}")', 2.05},
    {"Auto Ascender", 'game:GetService("ReplicatedStorage").Events.AscendEvent:FireServer(true)', 2},
    {
        "Auto Mejoras Trac",
        'game:GetService("ReplicatedStorage").Events.PlayerUpgradeTank:FireServer("HarvestRange")\nwait(1)\ngame:GetService("ReplicatedStorage").Events.PlayerUpgradeTank:FireServer("TractorSpeed")\nwait(1)\ngame:GetService("ReplicatedStorage").Events.PlayerUpgradeTank:FireServer("TractorPower")\nwait(1)\ngame:GetService("ReplicatedStorage").Events.PlayerUpgradeTank:FireServer("TractorEvolution")',
        1.5
    },
}

local function createButton(buttonData, index)
    local button = Instance.new("TextButton")
    button.Text = buttonData[1] .. " - OFF"
    button.Size = UDim2.new(0, 180, 0, 20)
    button.Position = UDim2.new(0.5, -90, 0, 40 * (index - 1) + 20)
    button.Parent = frame

    local userInputField

    if buttonData[1] == "Auto Egg Anim(off)" then
        userInputField = Instance.new("TextBox")
        userInputField.PlaceholderText = "1"
        userInputField.Size = UDim2.new(0, 20, 0, 20)
        userInputField.Position = UDim2.new(1.12, -40, 0, 0)
        userInputField.Parent = button
    end

    local executionCountTextBox = Instance.new("TextBox")
    executionCountTextBox.PlaceholderText = "Cantidad de ejecuciones"
    executionCountTextBox.Size = UDim2.new(0, 20, 0, 20)
    executionCountTextBox.Position = UDim2.new(0.2, -40, 0, 0)
    executionCountTextBox.Parent = button

    button.MouseButton1Click:Connect(function()
        local userInput = userInputField and userInputField.Text or nil
        local executionCount = tonumber(executionCountTextBox.Text) or math.huge

        buttonData.isLooping = not buttonData.isLooping
        button.Text = buttonData[1] .. (buttonData.isLooping and " - ON" or " - OFF")

        for _ = 1, executionCount do
            executeCode(userInput and buttonData[2]:gsub('"{userInput}"', '"' .. userInput .. '"') or buttonData[2])
            task.wait(buttonData[3])

            if not buttonData.isLooping then
                break
            end
        end

        buttonData.isLooping = false
        button.Text = buttonData[1] .. " - OFF"
    end)
end

local changeWorldButton = Instance.new("TextButton")
changeWorldButton.Text = "TP World Desblock"
changeWorldButton.Size = UDim2.new(0, 180, 0, 20)
changeWorldButton.Position = UDim2.new(0.5, -90, 0, 40 * (#buttons + 0.7) + 30)
changeWorldButton.Parent = frame

local worldNumberInput = Instance.new("TextBox")
worldNumberInput.PlaceholderText = "1"
worldNumberInput.Size = UDim2.new(0, 20, 0, 20)
worldNumberInput.Position = UDim2.new(1.05, -40, 0, 40 * (#buttons + 1.46))
worldNumberInput.Parent = frame

changeWorldButton.MouseButton1Click:Connect(function()
    local worldNumber = tonumber(worldNumberInput.Text)
    if worldNumber then
        executeCode('game:GetService("ReplicatedStorage").Events.TeleportEvent:InvokeServer("Teleport", ' .. worldNumber .. ')')
    end
end)

local startDungeonButton = Instance.new("TextButton")
startDungeonButton.Text = "Iniciar Mazmorra"
startDungeonButton.Size = UDim2.new(0, 180, 0, 20)
startDungeonButton.Position = UDim2.new(0.5, -90, 0, 40 * (#buttons - 0.3) + 30)
startDungeonButton.Parent = frame

startDungeonButton.MouseButton1Click:Connect(function()
    executeCode('game:GetService("ReplicatedStorage").Events.DungeonEvent:FireServer("StartDungeon")')
end)

for i, btnData in ipairs(buttons) do
    createButton(btnData, i)
end

local player = game.Players.LocalPlayer
local petHandler = player.PlayerScripts.PlayerPetHandler
local signal = Instance.new("BindableEvent")
local wasDisabled = petHandler.Disabled

petHandler.Disabled = true

local function checkDisabled()
    if petHandler.Disabled ~= wasDisabled then
        wasDisabled = petHandler.Disabled
        if not wasDisabled then
            signal:Fire()
            petHandler.Disabled = true
        end
    end
end

checkDisabled()

onScreenButtons:GetPropertyChangedSignal("Enabled"):Connect(function()
    if not onScreenButtons.Enabled then
        onScreenButtons.Enabled = true
    end
end)
