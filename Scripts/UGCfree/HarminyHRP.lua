local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AutoGiftsGui"
screenGui.Parent = game.Players.LocalPlayer.PlayerGui

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 200, 0, 200)
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

local autoGiftsToggle = Instance.new("TextButton")
autoGiftsToggle.Name = "AutoGiftsToggle"
autoGiftsToggle.Text = "AutoRegalos"
autoGiftsToggle.Position = UDim2.new(0, 10, 0, 40)
autoGiftsToggle.Size = UDim2.new(0, 180, 0, 30)
autoGiftsToggle.BackgroundColor3 = Color3.fromRGB(60, 120, 216)
autoGiftsToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
autoGiftsToggle.Parent = mainFrame

local autoGiftsIndicator = Instance.new("Frame")
autoGiftsIndicator.Name = "AutoGiftsIndicator"
autoGiftsIndicator.Size = UDim2.new(0, 20, 0, 20)
autoGiftsIndicator.Position = UDim2.new(1, -30, 0, 5)
autoGiftsIndicator.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
autoGiftsIndicator.Parent = autoGiftsToggle

autoGiftsToggle.MouseButton1Click:Connect(function()
    autoGiftsBool.Value = not autoGiftsBool.Value
    autoGiftsIndicator.BackgroundColor3 = autoGiftsBool.Value and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
end)

local autoCollectToggle = Instance.new("TextButton")
autoCollectToggle.Name = "AutoCollectToggle"
autoCollectToggle.Text = "AutoCollect"
autoCollectToggle.Position = UDim2.new(0, 10, 0, 80)
autoCollectToggle.Size = UDim2.new(0, 180, 0, 30)
autoCollectToggle.BackgroundColor3 = Color3.fromRGB(60, 120, 216)
autoCollectToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
autoCollectToggle.Parent = mainFrame

local autoCollectIndicator = Instance.new("Frame")
autoCollectIndicator.Name = "AutoCollectIndicator"
autoCollectIndicator.Size = UDim2.new(0, 20, 0, 20)
autoCollectIndicator.Position = UDim2.new(1, -30, 0, 5)
autoCollectIndicator.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
autoCollectIndicator.Parent = autoCollectToggle

autoCollectToggle.MouseButton1Click:Connect(function()
    autoCollectBool.Value = not autoCollectBool.Value
    autoCollectIndicator.BackgroundColor3 = autoCollectBool.Value and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
end)

local runCodeButton = Instance.new("TextButton")
runCodeButton.Name = "RunCodeButton"
runCodeButton.Text = "Hit Plyrs"
runCodeButton.Position = UDim2.new(0, 10, 0, 160)
runCodeButton.Size = UDim2.new(0, 180, 0, 30)
runCodeButton.BackgroundColor3 = Color3.fromRGB(60, 120, 216)
runCodeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
runCodeButton.Parent = mainFrame

runCodeButton.MouseButton1Click:Connect(function()
    local Players = game:GetService("Players")

    local function getRandomPlayer()
        local players = Players:GetPlayers()
        return players[math.random(1, #players)]
    end

    for i = 1, 9000 do
        local randomPlayer = getRandomPlayer()
        local args = {
            [1] = randomPlayer
        }

        game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.5.3"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("CherEventService"):WaitForChild("RF"):WaitForChild("OnSnowballHit"):InvokeServer(unpack(args))

        task.wait()  -- Asegúrate de completar esta línea con la duración de espera deseada
    end
end)

local extraButton = Instance.new("TextButton")
extraButton.Name = "ExtraButton"
extraButton.Text = "3 task: Instant"
extraButton.Position = UDim2.new(0, 10, 0, 120)
extraButton.Size = UDim2.new(0, 180, 0, 30)
extraButton.BackgroundColor3 = Color3.fromRGB(60, 120, 216)
extraButton.TextColor3 = Color3.fromRGB(255, 255, 255)
extraButton.Parent = mainFrame

local function invokeServer(service, method, args)
    game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.5.3"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("CherEventService"):WaitForChild("RF")[method]:InvokeServer(unpack(args))
end

extraButton.MouseButton1Click:Connect(function()
    local args = {[1] = 3}

    invokeServer("CherEventService", "StartTask", args)
    invokeServer("CherEventService", "GetProgress", args)
    invokeServer("CherEventService", "GetProgress", args)
    invokeServer("CherEventService", "CompleteParkour", {})
    wait(2)
    invokeServer("CherEventService", "ClaimReward", args)
end)

local function invokeDelivery(service, location)
    local args = {
        [1] = location
    }

    local deliveryService = game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.5.3"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("CherEventService"):WaitForChild("RF"):WaitForChild(service)

    deliveryService:InvokeServer(unpack(args))
    task.wait(1.3)
end

local function autoGifts()
    while autoGiftsBool.Value do
        local locations = {
    "Boutique",
    "BeautySalon",
    "GroceriesShop",
    "Bakery",
    "Cafe",
    "Arcade",
    "RollerSkateOasis",
    "IceRink",
    "TownHall",
    "PoliceStation",
    "FireDepartment",
    "Hospital",
    "HarmonyPark",
    "CampRock",
    "AdoptDaycare",
    "School",
    "MusicStudio",
    "RecordingStudio",
    "NightClub",
    "Boardwalk",
    "Sandcastle",
    "SushiRestaurant",
    "PizzaRestaurant",
    "GasStation",
    "Bank",
    "CandyShop"
}

for _, location in ipairs(locations) do
            if not autoGiftsBool.Value then
                break
            end

            invokeDelivery("DeliverGift", location)
            invokeDelivery("GiveGiftTool", location)
        end
    end
end

local function autoCollect()
    while autoCollectBool.Value do
        local workspace = game:GetService("Workspace")
        local replicatedStorage = game:GetService("ReplicatedStorage")
        local cherEventService = replicatedStorage:WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.5.3"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("CherEventService"):WaitForChild("RF"):WaitForChild("CollectOrnament")

        for _, elemento in ipairs(workspace.Ornaments:GetChildren()) do
            if not autoCollectBool.Value then
                break
            end

            if elemento:IsA("Part") or elemento:IsA("MeshPart") then
                cherEventService:InvokeServer(elemento.Name)
                task.wait(0.1)
            end
        end
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

