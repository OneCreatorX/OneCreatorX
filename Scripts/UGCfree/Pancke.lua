
local jugadorPlot

local jugadorLocal = game.Players.LocalPlayer.Name:lower()

local function identificarJugador(ownerPlayer)
    local playerName = tostring(ownerPlayer.Value):lower()
    return playerName == jugadorLocal
end

local function detectarNuevosArchivos(nomnom)
    nomnom.ChildAdded:Connect(function(child)
        wait(0.1) -- Esperar 0.1 segundos
        local clientComponent = child:FindFirstChild("ClientComponent_NomNom")
        if clientComponent then
            local nomNomValue = clientComponent:FindFirstChild("NomNomValue")
            if nomNomValue then
                local args = {
                    [1] = child.Name,
                    [2] = nomNomValue.Value
                }
                game:GetService("ReplicatedStorage"):WaitForChild("NomnomHandler_CollectNomnom"):FireServer(unpack(args))
                child:Destroy()
            end
        end
    end)
end

for _, d in ipairs(workspace.Plots:GetDescendants()) do
    if d.Name == "OwnerPlayer" and d:IsA("ObjectValue") then
        if identificarJugador(d) then
            jugadorPlot = d.Parent
            local islandBase = jugadorPlot:IsA("Model") and jugadorPlot:FindFirstChild("IslandBase")
            if islandBase then
                local tower = islandBase:FindFirstChild("Tower")
                local collection = tower and tower:FindFirstChild("Collection")
                local nomnom = collection and collection:FindFirstChild("Nomnom")
                if nomnom then
                    detectarNuevosArchivos(nomnom)
                end
            end
        end
    end
end
local jugadorPlot
local jugadorLocal = game.Players.LocalPlayer.Name:lower()
local isAutoSellEnabled = false
local isAutoCollectEnabled = false

local function identifyPlayer(ownerPlayer)
    local playerName = tostring(ownerPlayer.Value):lower()
    if playerName == jugadorLocal then
        jugadorPlot = ownerPlayer.Parent
    end
end

for _, d in ipairs(workspace.Plots:GetDescendants()) do
    if d.Name == "OwnerPlayer" and d:IsA("ObjectValue") then
        identifyPlayer(d)
    end
end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "OneCreatorXGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 150)
frame.Position = UDim2.new(0.5, -100, 0.5, -75)
frame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
frame.BorderSizePixel = 2
frame.BorderColor3 = Color3.new(1, 1, 1)
frame.Parent = screenGui
frame.Draggable = true
frame.Active = true

local title = Instance.new("TextLabel")
title.Text = "OneCreatorX"
title.Size = UDim2.new(1, 0, 0.2, 0)
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
title.BorderSizePixel = 0
title.Parent = frame

local autoSellButton = Instance.new("TextButton")
autoSellButton.Text = "Auto Sell (OFF)"
autoSellButton.Size = UDim2.new(0.5, 0, 0.2, 0)
autoSellButton.Position = UDim2.new(0, 0, 0.25, 0)
autoSellButton.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
autoSellButton.TextColor3 = Color3.new(1, 1, 1)
autoSellButton.Parent = frame

local autoCollectButton = Instance.new("TextLabel")
autoCollectButton.Text = "Auto Collect ON"
autoCollectButton.Size = UDim2.new(0.5, 0, 0.2, 0)
autoCollectButton.Position = UDim2.new(0.5, 0, 0.25, 0)
autoCollectButton.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
autoCollectButton.TextColor3 = Color3.new(1, 1, 1)
autoCollectButton.Parent = frame

local textBox = Instance.new("TextBox")
textBox.Text = "Type (1, 2 o 3)"
textBox.Size = UDim2.new(1, 0, 0.2, 0)
textBox.Position = UDim2.new(0, 0, 0.5, 0)
textBox.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
textBox.TextColor3 = Color3.new(1, 1, 1)
textBox.Parent = frame

local autoBuyPanckButton = Instance.new("TextButton") autoBuyPanckButton.Text = "Auto Pancke (OFF)" autoBuyPanckButton.Size = UDim2.new(0.5, 0, 0.2, 0) autoBuyPanckButton.Position = UDim2.new(0, 0, 0.74, 0) autoBuyPanckButton.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4) autoBuyPanckButton.TextColor3 = Color3.new(1, 1, 1) autoBuyPanckButton.Parent = frame

local autoBuySpeedButton = Instance.new("TextButton") autoBuySpeedButton.Text = "Speed sell(OFF)" autoBuySpeedButton.Size = UDim2.new(0.5, 0, 0.2, 0) autoBuySpeedButton.Position = UDim2.new(0.5, 0, 0.74, 0) autoBuySpeedButton.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4) autoBuySpeedButton.TextColor3 = Color3.new(1, 1, 1) autoBuySpeedButton.Parent = frame


autoBuyPanckButton.MouseButton1Click:Connect(function()
    isAutoBuyPanckEnabled = not isAutoBuyPanckEnabled
    autoBuyPanckButton.Text = isAutoBuyPanckEnabled and "Buy Pancke(ON)" or "Buy Pancke(OFF)"
    
    while isAutoBuyPanckEnabled do
        wait(1)
        local args = {[1] = 1}
        game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("PancakePurchaseEvent"):FireServer(unpack(args))
    end
end)

autoBuySpeedButton.MouseButton1Click:Connect(function()
    isAutoBuySpeedEnabled = not isAutoBuySpeedEnabled
    autoBuySpeedButton.Text = isAutoBuySpeedEnabled and "Sell Speed (ON)" or "Sell Speed (OFF)"
    
    while isAutoBuySpeedEnabled do
        wait(1)
        game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("SellRatePurchaseEvent"):FireServer()
    end
end)

autoSellButton.MouseButton1Click:Connect(function()
    isAutoSellEnabled = not isAutoSellEnabled
    autoSellButton.Text = isAutoSellEnabled and "Auto Sell (ON)" or "Auto Sell (OFF)"
    
    while isAutoSellEnabled do
        wait(2.3)
        local name = textBox.Text
        if name == "1" or name == "2" or name == "3" then
            local options = {
                ["1"] = "DepositNoRisk",
                ["2"] = "DepositMidRisk",
                ["3"] = "DepositHighRisk"
            }
            local args = {
                [1] = options[name],
                [2] = jugadorPlot:WaitForChild("IslandBase"):WaitForChild("DepositButton_Picnic"):WaitForChild("Collider"):WaitForChild("ClientComponent_OnPlayerEnter"):WaitForChild("TargetObject")
            }

            game:GetService("ReplicatedStorage"):WaitForChild("TGSButtonCallbacks_ServerInvoke"):FireServer(unpack(args))
        end
    end
end)

local function detectarNuevosArchivos(nomnom)
    nomnom.ChildAdded:Connect(function(child)
        wait(0.1) -- Esperar 0.1 segundos
        local clientComponent = child:FindFirstChild("ClientComponent_NomNom")
        if clientComponent then
            local nomNomValue = clientComponent:FindFirstChild("NomNomValue")
            if nomNomValue then
                local args = {
                    [1] = child.Name,
                    [2] = nomNomValue.Value
                }
                game:GetService("ReplicatedStorage"):WaitForChild("NomnomHandler_CollectNomnom"):FireServer(unpack(args))
                child:Destroy()
            end
        end
    end)
end

for _, d in ipairs(workspace.Plots:GetDescendants()) do
    if d.Name == "OwnerPlayer" and d:IsA("ObjectValue") then
        if identificarJugador(d) then
            local islandBase = d.Parent:IsA("Model") and d.Parent:FindFirstChild("IslandBase")
            if islandBase then
                local tower = islandBase:FindFirstChild("Tower")
                local collection = tower and tower:FindFirstChild("Collection")
                local nomnom = collection and collection:FindFirstChild("Nomnom")
                if nomnom then
                    detectarNuevosArchivos(nomnom)
                end
            end
        end
    end
end
