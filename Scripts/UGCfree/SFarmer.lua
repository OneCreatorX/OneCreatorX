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

local buttonText = "Auto Farming Dugeons OFF/ON"
local toggleButton = Instance.new("TextButton")
toggleButton.Text = buttonText
toggleButton.Size = UDim2.new(0, 180, 0, 20)
toggleButton.Position = UDim2.new(0.5, -90, 0, 300)
toggleButton.Parent = frame


local function executeCode(code)
    loadstring(code)()
end

local flying = false
local teleporting = false

local function Fly()
    local p = game.Players.LocalPlayer
    local tor = p.Character:WaitForChild("HumanoidRootPart")
    local bg = Instance.new("BodyGyro", tor)
    bg.P = 9e4
    bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)
    bg.cframe = tor.CFrame
    local bv = Instance.new("BodyVelocity", tor)
    bv.velocity = Vector3.new(0, 0.1, 0)
    bv.maxForce = Vector3.new(9e9, 9e9, 9e9)

    repeat
        wait()
        p.Character.Humanoid.PlatformStand = true
        bv.velocity = (p:GetMouse().Hit.p - tor.Position).unit * 50
        bg.cframe = CFrame.new(tor.Position, p:GetMouse().Hit.p)
        print("Flying...")
    until not flying

    bg:Destroy()
    bv:Destroy()
    p.Character.Humanoid.PlatformStand = false
    print("Stopped Flying.")
end

local function TpToRandomHitbox()
    while teleporting do
        local df = workspace.Crops.DungeonCrops
        local hb = {}

        for _, m in ipairs(df:GetChildren()) do
            if m:IsA("Model") then
                for _, p in ipairs(m:GetDescendants()) do
                    if p:IsA("Part") and p.Name == "Hitbox" then
                        table.insert(hb, p)
                    end
                end
            end
        end

        if #hb > 0 then
            local rh = hb[math.random(1, #hb)]
            game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(rh.Position))
            wait(1.5)
            print("Teleported to Hitbox.")
        end

        wait(1)
    end
end

local function ToggleFunctions()
    flying = not flying
    teleporting = not teleporting

    if flying then
        spawn(Fly)
    end

    if teleporting then
        spawn(TpToRandomHitbox)
    end

    print(flying and teleporting and "Both functions activated." or "Both functions deactivated.")
end

toggleButton.MouseButton1Click:Connect(ToggleFunctions)

local buttons = {
    {"Auto Click", 'game:GetService("ReplicatedStorage").Events.DamageIncreaseOnClickEvent:FireServer()', 0.1},
    {"Auto Sell", 'game:GetService("ReplicatedStorage").Events.SellBlocks:FireServer()', 0.5},
    {"Auto Open Egg", 'game:GetService("ReplicatedStorage").Events.PlayerPressedKeyOnEgg:FireServer("{userInput}")', 0.3},
    {"Auto Ascender", 'game:GetService("ReplicatedStorage").Events.AscendEvent:FireServer(true)', 2},
    {
        "Auto Mejoras Trac",
        'game:GetService("ReplicatedStorage").Events.PlayerUpgradeTank:FireServer("HarvestRange")\nwait(1)\ngame:GetService("ReplicatedStorage").Events.PlayerUpgradeTank:FireServer("TractorSpeed")\nwait(1)\ngame:GetService("ReplicatedStorage").Events.PlayerUpgradeTank:FireServer("TractorPower")\nwait(1)\ngame:GetService("ReplicatedStorage").Events.PlayerUpgradeTank:FireServer("TractorEvolution")',
        2
    },
}

local function createButton(buttonData, index)
    local button = Instance.new("TextButton")
    button.Text = buttonData[1] .. " - OFF"
    button.Size = UDim2.new(0, 180, 0, 20)
    button.Position = UDim2.new(0.5, -90, 0, 40 * (index - 1) + 20)
    button.Parent = frame

    local userInputField

    if buttonData[1] == "Auto Open Egg" then
        userInputField = Instance.new("TextBox")
        userInputField.PlaceholderText = "1"
        userInputField.Size = UDim2.new(0, 20, 0, 20)
        userInputField.Position = UDim2.new(1.12, -40, 0, 0)
        userInputField.Parent = button
    end

    button.MouseButton1Click:Connect(function()
        local userInput = userInputField and userInputField.Text or nil
        buttonData.isLooping = not buttonData.isLooping
        button.Text = buttonData[1] .. (buttonData.isLooping and " - ON" or " - OFF")

        while buttonData.isLooping do
            executeCode(userInput and buttonData[2]:gsub('"{userInput}"', '"' .. userInput .. '"') or buttonData[2])
            task.wait(buttonData[3])
        end
    end)
end

local changeWorldButton = Instance.new("TextButton")
changeWorldButton.Text = "TP World Desblock"
changeWorldButton.Size = UDim2.new(0, 180, 0, 20)
changeWorldButton.Position = UDim2.new(0.5, -90, 0, 40 * (#buttons - 0.3) + 30)
changeWorldButton.Parent = frame

local worldNumberInput = Instance.new("TextBox")
worldNumberInput.PlaceholderText = "1"
worldNumberInput.Size = UDim2.new(0, 20, 0, 20)
worldNumberInput.Position = UDim2.new(1.30, -90, 0, 40 * (#buttons - 0.3) + 30)
worldNumberInput.Parent = frame

changeWorldButton.MouseButton1Click:Connect(function()
    local worldNumber = tonumber(worldNumberInput.Text)
    if worldNumber then
        executeCode('game:GetService("ReplicatedStorage").Events.TeleportEvent:InvokeServer("Teleport", ' .. worldNumber .. ')')
    end
end)

local startDungeonButton = Instance.new("TextButton")
startDungeonButton.Text = "Iniciar Dungeons"
startDungeonButton.Size = UDim2.new(0, 180, 0, 20)
startDungeonButton.Position = UDim2.new(0.5, -90, 0, 40 * (#buttons + 0.7) + 30)
startDungeonButton.Parent = frame

startDungeonButton.MouseButton1Click:Connect(function()
    executeCode('game:GetService("ReplicatedStorage").Events.DungeonEvent:FireServer("StartDungeon")')
end)

for i, btnData in ipairs(buttons) do
    createButton(btnData, i)
end

onScreenButtons:GetPropertyChangedSignal("Enabled"):Connect(function()
    if not onScreenButtons.Enabled then
        onScreenButtons.Enabled = true
    end
end)
