local dropperId = 1
local player = game.Players.LocalPlayer

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player.PlayerGui
screenGui.ResetOnSpawn = false

local centerX = 0.5
local centerY = 0.5

local dragFrameSize = UDim2.new(0, 140, 0, 60)

local dragFrame = Instance.new("Frame")
dragFrame.Name = "DragFrame"
dragFrame.Size = dragFrameSize
dragFrame.Position = UDim2.new(centerX, -dragFrameSize.X.Offset / 2, centerY, -dragFrameSize.Y.Offset / 2)
dragFrame.AnchorPoint = Vector2.new(0.5, 0.5)
dragFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
dragFrame.BorderSizePixel = 0
dragFrame.Active = true
dragFrame.Draggable = true
dragFrame.Parent = screenGui

local title = Instance.new("TextLabel")
title.Name = "Title"
title.Size = UDim2.new(1, 0, 0, 20)
title.Position = UDim2.new(0, 0, 0, 5)
title.BackgroundTransparency = 1
title.Text = "Pet Empire "
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 18
title.Parent = dragFrame

local textBox = Instance.new("TextBox")
textBox.Name = "DropperIdTextBox"
textBox.Size = UDim2.new(0, 0, 0, 20)
textBox.Position = UDim2.new(0.5, -textBox.Size.X.Offset / 2, 0, 30)
textBox.AnchorPoint = Vector2.new(0.5, 0)
textBox.BackgroundTransparency = 0.9
textBox.Text = tostring(dropperId)
textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
textBox.Font = Enum.Font.SourceSans
textBox.TextSize = 18
textBox.TextEditable = false
textBox.Parent = dragFrame

local function showMessage(message)
    local msgLabel = Instance.new("TextLabel")
    msgLabel.Name = "MessageLabel"
    msgLabel.Size = UDim2.new(0, 200, 0, 50)
    msgLabel.Position = UDim2.new(centerX, 0, centerY, -60)
    msgLabel.AnchorPoint = Vector2.new(0.5, 0.5)
    msgLabel.BackgroundTransparency = 0.5
    msgLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    msgLabel.Text = message
    msgLabel.TextSize = 24
    msgLabel.TextColor3 = Color3.new(1, 1, 1)
    msgLabel.Font = Enum.Font.SourceSansBold
    msgLabel.Parent = textBox.Parent

    wait(3)

    msgLabel:Destroy()
end

showMessage("YT:@OneCreatorX")

local function executeServerCode()
    local dropper = workspace.Tycoons["Tycoon_"..dropperId].Purchases.Dropper_0_0.ManualDropper
    dropper.FireInteractionEvent:FireServer()
end

local function updateDropperId(value)
    dropperId = value
    textBox.Text = tostring(dropperId)
end

local function changeDropperId(delta)
    dropperId = (dropperId - 1 + delta) % 8 + 1
    updateDropperId(dropperId)
end

local leftArrow = Instance.new("TextButton")
leftArrow.Name = "LeftArrow"
leftArrow.Size = UDim2.new(0, 20, 0, 20)
leftArrow.Position = UDim2.new(0, 10, 0, 40)
leftArrow.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
leftArrow.BorderSizePixel = 0
leftArrow.Text = "<"
leftArrow.Font = Enum.Font.SourceSansBold
leftArrow.TextSize = 18
leftArrow.TextColor3 = Color3.new(1, 1, 1)
leftArrow.Parent = dragFrame
leftArrow.MouseButton1Click:Connect(function()
    changeDropperId(-1)
end)

local rightArrow = Instance.new("TextButton")
rightArrow.Name = "RightArrow"
rightArrow.Size = UDim2.new(0, 20, 0, 20)
rightArrow.Position = UDim2.new(0, 110, 0, 55)
rightArrow.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
rightArrow.BorderSizePixel = 0
rightArrow.Text = ">"
rightArrow.Font = Enum.Font.SourceSansBold
rightArrow.TextSize = 18
rightArrow.TextColor3 = Color3.new(1, 1, 1)
rightArrow.Parent = dragFrame
rightArrow.MouseButton1Click:Connect(function()
    changeDropperId(1)
end)

local function executeLoop()
    while true do
        executeServerCode()
        wait(0.35)
    end
end

local function collectLoop()
    while true do
        game:GetService("ReplicatedStorage").RemoteFunctions.CollectCurrency:InvokeServer("Cash", workspace.Tycoons["Tycoon_"..dropperId].Environment.CashZone.CashCollector)
        wait(1)
    end
end

-- Iniciar los bucles de ejecución por separado
spawn(executeLoop)
spawn(collectLoop)
