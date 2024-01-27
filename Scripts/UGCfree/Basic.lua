local Tractor = Instance.new("ScreenGui")
Tractor.Name = "Tractor"
Tractor.Parent = game.Players.LocalPlayer.PlayerGui

local menuFrame = Instance.new("Frame")
menuFrame.Name = "MenuFrame"
menuFrame.Size = UDim2.new(0, 100, 0, 150)
menuFrame.Position = UDim2.new(0.5, -50, 0, 10)
menuFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
menuFrame.BorderSizePixel = 0
menuFrame.Parent = Tractor
menuFrame.Draggable = true
menuFrame.Active = true

local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Text = "Básico"
titleLabel.Size = UDim2.new(1, 0, 0, 20)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Font = Enum.Font.SourceSans
titleLabel.TextSize = 14
titleLabel.Parent = menuFrame

local function createMenuButton(buttonText, callback, waitTime)
    local button = Instance.new("TextButton")
    button.Text = buttonText
    button.Size = UDim2.new(1, 0, 0, 30)
    button.Position = UDim2.new(0, 0, 0, 0 + #menuFrame:GetChildren() * 30)
    button.Parent = menuFrame
    button.Font = Enum.Font.SourceSans
    button.TextSize = 14
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    button.BorderSizePixel = 0

    local isRunning = false

    local function toggleButtonColor()
        isRunning = not isRunning
        button.BackgroundColor3 = isRunning and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(50, 50, 50)
    end

    button.MouseButton1Click:Connect(function()
        toggleButtonColor()
        while isRunning do
            callback()
            task.wait(waitTime or 1)
        end
    end)

    return button, toggleButtonColor
end

local damageButton, toggleDamageButtonColor = createMenuButton("Click Damage", function() game:GetService("ReplicatedStorage").Events.DamageIncreaseOnClickEvent:FireServer()
end, 0.1)

local sellButton, toggleSellButtonColor = createMenuButton("Sell BackP", function() game:GetService("ReplicatedStorage").Events.SellBlocks:FireServer()
end, 4)

local ascendButton, toggleAscendButtonColor = createMenuButton("Ascend", function() game:GetService("ReplicatedStorage").Events.AscendEvent:FireServer(true)
end, 10)

local autoBuyButton, toggleAutoBuyButtonColor = createMenuButton("Upgrade Tractor", function() game:GetService("ReplicatedStorage").Events.PlayerUpgradeTank:FireServer("HarvestRange") game:GetService("ReplicatedStorage").Events.PlayerUpgradeTank:FireServer("TractorSpeed") game:GetService("ReplicatedStorage").Events.PlayerUpgradeTank:FireServer("TractorPower") game:GetService("ReplicatedStorage").Events.PlayerUpgradeTank:FireServer("TractorEvolution")
end, 15)
