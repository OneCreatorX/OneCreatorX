local p = game.Players.LocalPlayer
local m = p.Character:WaitForChild("HumanoidRootPart")
local currentProximityPrompt

local function activateProximityPromptsInPart(part)
    for _, object in ipairs(part:GetDescendants()) do
        if object:IsA("ProximityPrompt") then
            fireproximityprompt(object)
            currentProximityPrompt = object
        end
    end
end

local function activateProximityPromptsInFolder()
    while true do
        for _, part in ipairs(workspace:WaitForChild("SpawnedPoints"):GetDescendants()) do
            if part:IsA("Part") then
                m.CFrame = CFrame.new(part.Position)
                if currentProximityPrompt and currentProximityPrompt.Parent ~= part then
                    currentProximityPrompt = nil
                end
                activateProximityPromptsInPart(part)
            end
        end
        wait(0.1)
    end
end

local function shop()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/tienda.lua"))()
end

local function Rejoin()
    local Players, TeleportService = game:GetService("Players"), game:GetService("TeleportService")
    local placeId, JobId = game.PlaceId, game.JobId

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

local textLabel = Instance.new("TextLabel")
textLabel.Name = "StatusTextLabel"
textLabel.Text = "OneCreatorX Working for you, wait"
textLabel.Size = UDim2.new(1, 0, 0, 30)
textLabel.Position = UDim2.new(0, 0, 0.55, 0)
textLabel.BackgroundColor3 = Color3.new(0, 0, 0)
textLabel.BackgroundTransparency = 1
textLabel.TextColor3 = Color3.new(1, 1, 1)
textLabel.Font = Enum.Font.SourceSansBold
textLabel.TextSize = 40
textLabel.Parent = screenGui

local shopButton = Instance.new("TextButton")
shopButton.Name = "ShopButton"
shopButton.Text = "Shop UGC"
shopButton.Size = UDim2.new(0, 100, 0, 30)
shopButton.Position = UDim2.new(0.5, -50, 0.45, -15)
shopButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
shopButton.TextColor3 = Color3.new(1, 1, 1)
shopButton.Font = Enum.Font.SourceSansBold
shopButton.TextSize = 18
shopButton.Parent = screenGui

shopButton.MouseButton1Click:Connect(shop)

local noCoinsLabel
local rejoinButton

local function showElements()
    if not noCoinsLabel then
        noCoinsLabel = Instance.new("TextLabel")
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
    end

    if not rejoinButton then
        rejoinButton = Instance.new("TextButton")
        rejoinButton.Name = "RejoinButton"
        rejoinButton.Text = "Rejoin"
        rejoinButton.Size = UDim2.new(0, 100, 0, 30)
        rejoinButton.Position = UDim2.new(0.5, -50, 0.2, -15)
        rejoinButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
        rejoinButton.TextColor3 = Color3.new(1, 1, 1)
        rejoinButton.Font = Enum.Font.SourceSansBold
        rejoinButton.TextSize = 18
        rejoinButton.Parent = screenGui

        rejoinButton.MouseButton1Click:Connect(Rejoin)
    end
end

local function hideElements()
    if noCoinsLabel then
        noCoinsLabel:Destroy()
        noCoinsLabel = nil
    end

    if rejoinButton then
        rejoinButton:Destroy()
        rejoinButton = nil
    end
end

local function onVisiblePointObjectsChanged()
    local meshParts = workspace:WaitForChild("VisiblePointObjects"):GetDescendants()
    local hasMeshParts = #meshParts > 0

    if hasMeshParts then
        hideElements()
    else
        showElements()
    end
end

spawn(activateProximityPromptsInFolder)
spawn(onVisiblePointObjectsChanged)
