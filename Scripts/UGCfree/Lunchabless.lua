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
            wait()
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
        wait()
    end
end

spawn(activateProximityPromptsInFolder)

local function Rejoin()
    local Players = game:GetService("Players")
    local TeleportService = game:GetService("TeleportService")
    local placeId = game.PlaceId
    local JobId = game.JobId

    if #Players:GetPlayers() <= 1 then
        Players.LocalPlayer:Kick("\nOneCreator X Rejoining u...")
        task.wait()
        TeleportService:Teleport(placeId, Players.LocalPlayer)
    else
        TeleportService:TeleportToPlaceInstance(placeId, JobId, Players.LocalPlayer)
    end
end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "OneCreatorXGui"
screenGui.Parent = p:WaitForChild("PlayerGui")

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

local textLabel = Instance.new("TextLabel")
textLabel.Name = "StatusTextLabel"
textLabel.Text = "OneCreatorX Working for you, wait"
textLabel.Size = UDim2.new(1, 0, 0, 30)
textLabel.Position = UDim2.new(0, 0, 0.6, 0)
textLabel.BackgroundColor3 = Color3.new(0, 0, 0)
textLabel.BackgroundTransparency = 1
textLabel.TextColor3 = Color3.new(1, 1, 1)
textLabel.Font = Enum.Font.SourceSansBold
textLabel.TextSize = 40
textLabel.Parent = screenGui

local noCoinsLabel = Instance.new("TextLabel")
noCoinsLabel.Name = "NoCoinsTextLabel"
noCoinsLabel.Text = "No Coins"
noCoinsLabel.Size = UDim2.new(1, 0, 0, 30)
noCoinsLabel.Position = UDim2.new(0, 0, 0.9, 0)
noCoinsLabel.BackgroundColor3 = Color3.new(0, 0, 0)
noCoinsLabel.BackgroundTransparency = 0.5
noCoinsLabel.TextColor3 = Color3.new(1, 1, 1)
noCoinsLabel.Font = Enum.Font.SourceSansBold
noCoinsLabel.TextSize = 40
noCoinsLabel.Parent = screenGui

local rejoinButton = Instance.new("TextButton")
rejoinButton.Name = "RejoinButton"
rejoinButton.Text = "Rejoin"
rejoinButton.Size = UDim2.new(0, 100, 0, 30)
rejoinButton.Position = UDim2.new(0.5, -50, 0.3, -15)
rejoinButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
rejoinButton.TextColor3 = Color3.new(1, 1, 1)
rejoinButton.Font = Enum.Font.SourceSansBold
rejoinButton.TextSize = 18
rejoinButton.Parent = screenGui

rejoinButton.MouseButton1Click:Connect(Rejoin)

local function iterateMeshParts()
    while true do
        local meshParts = workspace:WaitForChild("VisiblePointObjects"):GetDescendants()

        if #meshParts == 0 and not noCoinsLabel.Parent then
            -- No MeshPart found, generate a central box saying "No Coins" and a Rejoin button
            noCoinsLabel.Parent = screenGui
            rejoinButton.Parent = screenGui
        elseif #meshParts > 0 and noCoinsLabel.Parent then
            -- MeshPart found, remove "No Coins" label and Rejoin button if they exist
            noCoinsLabel.Parent = nil
            rejoinButton.Parent = nil
        end

        -- Loop through MeshParts and perform actions
        for _, object in ipairs(meshParts) do
            if object:IsA("MeshPart") then
                m.CFrame = CFrame.new(object.Position)
                sendPurchaseRequest(textBox.Text)
                wait(2)
            end
        end

        wait(0.1)  -- Adjust the wait time as needed
    end
end

spawn(activateProximityPromptsInFolder)
spawn(iterateMeshParts)
