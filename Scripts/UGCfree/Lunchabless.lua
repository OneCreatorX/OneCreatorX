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
        task.wait(0.1)
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

local function createButton(name, text, position, callback)
    local button = Instance.new("TextButton")
    button.Name = name
    button.Text = text
    button.Size = UDim2.new(0, 100, 0, 30)
    button.Position = position
    button.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    button.TextColor3 = Color3.new(1, 1, 1)
    button.Font = Enum.Font.SourceSansBold
    button.TextSize = 18
    button.Parent = screenGui
    button.MouseButton1Click:Connect(callback)
    return button
end

createButton("ShopButton", "Shop UGC", UDim2.new(0.7, -50, 0.45, -15), shop)
createButton("RejoinButton", "Rejoin", UDim2.new(0.7, -50, 0.3, -15), Rejoin)

spawn(activateProximityPromptsInFolder)
