local screenGui = Instance.new("ScreenGui")
screenGui.Name = "AutoGiftsGui"
screenGui.Parent = game.Players.LocalPlayer.PlayerGui

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 200, 0, 150)
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
autoGiftsToggle.Text = "Auto Sell"
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
autoCollectToggle.Text = "Auto Buy"
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

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SellRemote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("SellRemote")
local ObjectHolder = workspace:WaitForChild("Games"):WaitForChild("Game"):WaitForChild("InnerShop"):WaitForChild("Base"):WaitForChild("ObjectHolder")

local function autoGifts()
    while autoGiftsBool.Value do
        for _, mesaNombre in ipairs(ObjectHolder:GetChildren()) do
            local isClient = game:GetService("RunService"):IsClient()

            if isClient then
                local ZapatillasDirectory = game.Players.LocalPlayer.PlayerGui.InventoryGui.Holder.MainFrame.ScrollingFrame

                if ZapatillasDirectory then
                    for _, zapatillaFrame in ipairs(ZapatillasDirectory:GetChildren()) do
                        if zapatillaFrame:IsA("Frame") then
                            local args = {
                                [1] = zapatillaFrame.Name,
                                [2] = ObjectHolder:WaitForChild(mesaNombre.Name):WaitForChild("Positions"):WaitForChild("1")
                            }

                            SellRemote:FireServer(unpack(args))
                        end
                    end
                end
            end
        end

        task.wait(0.3)
    end
end

local function autoCollect()
    while autoCollectBool.Value do
        task.wait(1)
        local remotes = game:GetService("ReplicatedStorage"):WaitForChild("Remotes")

        remotes:WaitForChild("SellerRemote"):InvokeServer()

        local offerArgs = {true, 0.8}
        remotes:WaitForChild("OfferRemote"):FireServer(unpack(offerArgs))

        local upgradeArgs = {6}
        remotes:WaitForChild("UpgradeRemote"):InvokeServer(unpack(upgradeArgs))

        for i = 1, 12 do
            local giftArgs = i
            remotes:WaitForChild("GiftHandler"):FireServer(unpack(giftArgs))
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

local player = game.Players.LocalPlayer
local inventoryGui = player.PlayerGui.InventoryGui

local visibleChangeEvent = Instance.new("BindableEvent")

visibleChangeEvent.Event:Connect(function()
    inventoryGui.Holder.Visible = false
end)

inventoryGui.Holder:GetPropertyChangedSignal("Visible"):Connect(function()
    if inventoryGui.Holder.Visible then
        visibleChangeEvent:Fire()
    end
end)
