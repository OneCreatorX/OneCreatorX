local p = game.Players.LocalPlayer
local m = p.Character:WaitForChild("HumanoidRootPart")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "OneCreatorXGui"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Crear TextLabel
local textLabel = Instance.new("TextLabel")
textLabel.Name = "StatusTextLabel"
textLabel.Text = "OneCreatorX Working for you, wait"
textLabel.Size = UDim2.new(1, 0, 0, 30)
textLabel.Position = UDim2.new(0, 0, 0.9, 0)
textLabel.BackgroundColor3 = Color3.new(0, 0, 0)  -- Fondo negro
textLabel.BackgroundTransparency = 1  -- Sin fondo
textLabel.TextColor3 = Color3.new(1, 1, 1)  -- Texto blanco
textLabel.Font = Enum.Font.SourceSansBold
textLabel.TextSize = 40
textLabel.Parent = screenGui


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

for _, object in ipairs(workspace:WaitForChild("VisiblePointObjects"):GetDescendants()) do
    if object:IsA("MeshPart") then
        m.CFrame = CFrame.new(object.Position)
        sendPurchaseRequest("14751842192")
        wait(2)
    end
end
