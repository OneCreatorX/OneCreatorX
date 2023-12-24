local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AutoGiftsGui"
screenGui.Parent = game.Players.LocalPlayer.PlayerGui

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 200, 0, 160)
mainFrame.Position = UDim2.new(0.5, -100, 0.5, -75)
mainFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Size = UDim2.new(1, 0, 0, 30)
titleLabel.Text = "YT:@OneCreatorX"
titleLabel.TextSize = 20
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
titleLabel.Parent = mainFrame

local autoGiftsBool = Instance.new("BoolValue")
autoGiftsBool.Name = "AutoGifts"
autoGiftsBool.Parent = mainFrame

local autoCollectBool = Instance.new("BoolValue")
autoCollectBool.Name = "AutoCollect"
autoCollectBool.Parent = mainFrame

local function createToggle(parent, name, text, positionY, actionFunction)
    local toggle = Instance.new("TextButton")
    toggle.Name = name
    toggle.Text = text
    toggle.Position = UDim2.new(0, 10, 0, positionY)
    toggle.Size = UDim2.new(0, 180, 0, 30)
    toggle.BackgroundColor3 = Color3.fromRGB(60, 120, 216)
    toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggle.Parent = parent

    local indicator = Instance.new("Frame")
    indicator.Name = name .. "Indicator"
    indicator.Size = UDim2.new(0, 20, 0, 20)
    indicator.Position = UDim2.new(1, -30, 0, 5)
    indicator.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    indicator.Parent = toggle

    toggle.MouseButton1Click:Connect(function()
        actionFunction()
        if name == "AutoGiftsToggle" then
            autoGiftsBool.Value = not autoGiftsBool.Value
            indicator.BackgroundColor3 = autoGiftsBool.Value and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
        elseif name == "AutoCollectToggle" then
            autoCollectBool.Value = not autoCollectBool.Value
            indicator.BackgroundColor3 = autoCollectBool.Value and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
        end
    end)
end

createToggle(mainFrame, "AutoGiftsToggle", "Auto Botones", 40, function()
end)

createToggle(mainFrame, "AutoCollectToggle", "Collect Snowball", 80, function()
end)

local function teleportarAButton(objeto)
    if (objeto:IsA("Part") or objeto:IsA("MeshPart")) and (objeto.Name == "Button" or objeto.Name == "button") then
        local parent = objeto.Parent
        if parent and parent:IsA("Model") and parent.Name ~= "gamepass" then
            for _, jugador in pairs(game.Players:GetPlayers()) do
                jugador.Character:MoveTo(objeto.Position)
            end
        end
    end
end

local function verificarObjeto(objeto)
    teleportarAButton(objeto)
end

local function verificarTodosLosObjetos()
    for _, objeto in pairs(workspace:GetDescendants()) do
        verificarObjeto(objeto)
    end
end

local function autoGifts()
    while autoGiftsBool.Value do
        verificarTodosLosObjetos()
        task.wait(1)
    end
end

local function autoCollect()
    while autoCollectBool.Value do
        local args = {
            [1] = "MegaSnowball"
        }

        game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.4.7"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("CollectiblesService"):WaitForChild("RE"):WaitForChild("collectedCollectible"):FireServer(unpack(args))
        task.wait(0.1)
    end
end

autoGiftsBool.Changed:Connect(function()
    if autoGiftsBool.Value then
        autoGifts()
    end
end)

autoCollectBool.Changed:Connect(function()
    if autoCollectBool.Value then
        autoCollect()
    end
end)

