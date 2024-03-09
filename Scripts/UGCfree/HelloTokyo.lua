local sg = Instance.new("ScreenGui")
sg.Name = "OCX"
sg.ResetOnSpawn = false

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 250, 0, 130)
frame.Position = UDim2.new(0.5, -125, 0.5, -65)
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
frame.BorderSizePixel = 5
frame.BorderColor3 = Color3.fromRGB(255, 255, 255)
frame.Active = true
frame.Draggable = true
frame.Parent = sg

local title = Instance.new("TextLabel")
title.Text = "YT:OneCreatorX"
title.TextSize = 18
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
title.BorderSizePixel = 3
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Parent = frame

local antiAFK = Instance.new("TextButton")
antiAFK.Text = "Collect Treasure"
antiAFK.TextSize = 14
antiAFK.Size = UDim2.new(1, 0, 0, 30)
antiAFK.Position = UDim2.new(0, 0, 0, 60)
antiAFK.BackgroundColor3 = Color3.fromRGB(120, 20, 71) 
antiAFK.BorderSizePixel = 0
antiAFK.TextColor3 = Color3.fromRGB(255, 255, 255)  
antiAFK.Parent = frame

local rejoin = Instance.new("TextButton")
rejoin.Text = "Auto Complet Picture"
rejoin.Size = UDim2.new(1, 0, 0, 30)
rejoin.Position = UDim2.new(0, 0, 0, 95)
rejoin.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
rejoin.BorderSizePixel = 2
rejoin.TextColor3 = Color3.fromRGB(255, 255, 255)
rejoin.Parent = frame
rejoin.MouseButton1Click:Connect(function()
    for _, b in pairs(workspace.Tokyo_Edo.Interact_Buildings:GetChildren()) do
        for _, f in pairs(b:GetChildren()) do
            game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UgcService"):WaitForChild("RF"):WaitForChild("InteractEdoBuild"):InvokeServer(f.Name)
            wait(0.1)
        end
        wait(0.1)
    end
end)

sg.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local player = game.Players.LocalPlayer
local coinsFolder = workspace:WaitForChild("Coins(Edo)")
local waitTime = 0.1
local transitionTime = 0.15
local speed = 1 / transitionTime

local autoCollect = Instance.new("TextButton")
autoCollect.Text = "Auto Collect Coins: OFF"
autoCollect.TextSize = 14
autoCollect.Size = UDim2.new(1, 0, 0, 30)
autoCollect.Position = UDim2.new(0, 0, 0, 30)
autoCollect.BackgroundColor3 = Color3.fromRGB(120, 20, 71) 
autoCollect.BorderSizePixel = 3
autoCollect.TextColor3 = Color3.fromRGB(255, 255, 255) 
autoCollect.Parent = frame

local isAuto = false

autoCollect.MouseButton1Click:Connect(function()
    isAuto = not isAuto
    autoCollect.Text = "Auto Collect Coins: " .. (isAuto and "ON" or "OFF")
    print("isAuto:", isAuto)
end)

local function getDistanceToPlayer(coin)
    return coin and coin.Transparency < 0.75 and (player.Character:FindFirstChild("HumanoidRootPart") and player.Character:WaitForChild("HumanoidRootPart").Position - coin.Position).Magnitude or math.huge
end

local function move()
    local coinsList = {}

    for _, coin in ipairs(coinsFolder:GetChildren()) do
        if coin:IsA("MeshPart") and coin.Transparency < 0.75 then
            table.insert(coinsList, {coin = coin, distance = getDistanceToPlayer(coin)})
        end
    end

    table.sort(coinsList, function(a, b)
        return a.distance < b.distance
    end)

    if #coinsList > 0 then
        local currentCoin = coinsList[1].coin
        local rootPart = player.Character:WaitForChild("HumanoidRootPart")
        local targetPosition = currentCoin.Position

        local startTime = tick()

        while (tick() - startTime) < transitionTime do
            rootPart.CFrame = rootPart.CFrame:Lerp(CFrame.new(targetPosition), (tick() - startTime) / transitionTime)
            wait()
        end

        pcall(function()
            currentCoin.Transparency = 0.75
        end)

        wait(waitTime)
    else
        isAuto = false
        autoCollect.Text = "Auto Collect: OFF"
        wait(1)
        autoCollect.Text = "Restoring Coins"
        wait(2)
        autoCollect.Text = "Starting Automatically in 3"
        wait(2)
        for _, coin in ipairs(coinsFolder:GetChildren()) do
            if coin:IsA("MeshPart") and coin.Transparency < 0.75 then
                pcall(function()
                    coin.Transparency = 0
                end)
            end
        end
        isAuto = true
        autoCollect.Text = "Auto Collect: ON"
    end
end

-- Crear un Folder para almacenar las etiquetas de nombre
local nameTagsFolder = Instance.new("Folder")
nameTagsFolder.Name = "NameTagsFolder"
nameTagsFolder.Parent = workspace

-- Función para crear BillboardGui con TextLabel
local function createNameTag(parent, text, color)
    local billboardGui = Instance.new("BillboardGui")
    billboardGui.Adornee = parent
    billboardGui.Size = UDim2.new(0, 100, 0, 20)
    billboardGui.StudsOffset = Vector3.new(0, 2, 0)
    billboardGui.AlwaysOnTop = true
    billboardGui.Parent = parent

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.BackgroundTransparency = 1
    textLabel.TextColor3 = color
    textLabel.Text = text
    textLabel.Parent = billboardGui

    return billboardGui
end
antiAFK.MouseButton1Click:Connect(function()
    for _, npcName in ipairs({"Horseguy", "Busho", "Kabuki Actor", "Samurai"}) do
        game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("TreasureService"):WaitForChild("RF"):WaitForChild("Accept_NpcTask"):InvokeServer(npcName)
    end

    for _, model in pairs(workspace.Treasures_Edo:GetChildren()) do
        if model:IsA("Model") and model.PrimaryPart:IsA("MeshPart") then
            model.PrimaryPart.Transparency = 1
            game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = model.PrimaryPart.CFrame
            wait(5)
        end
    end

    for _, npcName in ipairs({"Horseguy", "Busho", "Kabuki Actor", "Samurai"}) do
        game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("TreasureService"):WaitForChild("RF"):WaitForChild("Check_NpcTask"):InvokeServer(npcName)
            wait(0.2)
        game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("TreasureService"):WaitForChild("RF"):WaitForChild("Claim_TaskTreasure"):InvokeServer(npcName)
    wait(0.2)
        end
        local args = {
    [1] = "Sakura Miko Hat"
}

game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("UgcService"):WaitForChild("RF"):WaitForChild("ClaimFreeUGC"):InvokeServer(unpack(args))
        
end)


for _, model in pairs(workspace.Treasures_Edo:GetChildren()) do
    if model:IsA("Model") and model.PrimaryPart then
        local hitbox = Instance.new("Part", model)
        hitbox.Size = Vector3.new(1, 1, 1)
        hitbox.Anchored = true
        hitbox.Transparency = 0.5
        hitbox.Name = "Hitbox"
        hitbox.CFrame = model.PrimaryPart.CFrame

        createNameTag(hitbox, model.Name, Color3.new(1, 1, 1)).Parent = nameTagsFolder
    end
end

while true do
    if isAuto then
        move()
    else
        wait(1)
    end
end

game:GetService('Players').LocalPlayer.Idled:Connect(function()
    game:GetService('VirtualUser'):CaptureController()
    game:GetService('VirtualUser'):ClickButton2(Vector2.new())
end)
