local p = game.Players.LocalPlayer
local m = p.Character:WaitForChild("HumanoidRootPart")

local function sendPurchaseRequest(productId)
    game:GetService("ReplicatedStorage")
        :WaitForChild("UGCOwnershipComms")
        :WaitForChild("RE")
        :WaitForChild("UGCPurchaseRequested")
        :FireServer(productId)
end

local function activateProximityPromptsInPart(part)
    for _, object in ipairs(part:GetDescendants()) do
        if object:IsA("ProximityPrompt") then
            fireproximityprompt(object)
            wait(0.3)
        end
    end
end

local function activateProximityPromptsInFolder()
    while true do
        for _, part in ipairs(workspace:WaitForChild("SpawnedPoints"):GetDescendants()) do
            if part:IsA("Part") then
                activateProximityPromptsInPart(part)
            end
        end
        wait(0.5)
    end
end

spawn(activateProximityPromptsInFolder)

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "OneCreatorXGui"
screenGui.Parent = p:WaitForChild("PlayerGui")

local textLabel = Instance.new("TextLabel")
textLabel.Name = "StatusTextLabel"
textLabel.Text = "OneCreatorX Working for you, wait"
textLabel.Size = UDim2.new(1, 0, 0, 30)
textLabel.Position = UDim2.new(0, 0, 0.9, 0)
textLabel.BackgroundColor3 = Color3.new(0, 0, 0)
textLabel.BackgroundTransparency = 1
textLabel.TextColor3 = Color3.new(1, 1, 1)
textLabel.Font = Enum.Font.SourceSansBold
textLabel.TextSize = 40
textLabel.Parent = screenGui

local textBox = Instance.new("TextBox")
textBox.Name = "UGCIdTextBox"
textBox.PlaceholderText = "Enter UGC ID"
textBox.Text = "ID UGC"
textBox.Size = UDim2.new(0, 200, 0, 40)
textBox.Position = UDim2.new(0.5, 0, 0, 0)
textBox.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
textBox.TextColor3 = Color3.new(1, 1, 1)
textBox.Font = Enum.Font.SourceSansBold
textBox.TextSize = 18
textBox.Parent = screenGui

spawn(function()
    for _, object in ipairs(workspace:WaitForChild("VisiblePointObjects"):GetDescendants()) do
        if object:IsA("MeshPart") then
            m.CFrame = CFrame.new(object.Position)
            sendPurchaseRequest(textBox.Text)
            wait(2)
        end
    end
end)
