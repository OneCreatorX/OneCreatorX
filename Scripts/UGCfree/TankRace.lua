local player = game.Players.LocalPlayer
local velocityValue = 900000
local updateInterval = 1
local rewardInterval = 180 -- 3 minutos en segundos
local playerName = player.Name
local racePower

local replicatedStorage = game:GetService("ReplicatedStorage")
local remoteEvent = replicatedStorage.GameClient.Events.RemoteEvent
local claimGiftRemote = replicatedStorage.GameClient.Events.RemoteEvent:WaitForChild("ClaimGift")

local function adjustVelocity(newVelocity)
    if racePower and racePower:IsA("BodyVelocity") then
        racePower.Velocity = Vector3.new(0, 0, newVelocity)
        velocityValue = newVelocity
    end
end

local function findRacePower()
    while true do
        wait(updateInterval)
        local character = game.Workspace:FindFirstChild(playerName)
        if character then
            local collidePart = character:FindFirstChild("CollidePart")
            racePower = collidePart and collidePart:FindFirstChild("RacePower")
        else
            racePower = nil
            remoteEvent:FireServer("AFKmodeEvent")
        end
    end
end

local function trueno()
local player = game.Players.LocalPlayer

local function setBoolValuesToTrue(obj)
    if obj:IsA("BoolValue") then
        obj.Value = true
    end
    for _, child in ipairs(obj:GetChildren()) do
        setBoolValuesToTrue(child)
    end
end

for _, child in ipairs(player:GetChildren()) do
    setBoolValuesToTrue(child)
end
end

local function claimRewards()
    while true do
        wait(rewardInterval)
        for _, rewardNumber in ipairs({1, 3, 5, 6, 8, 9, 10, 11, 12}) do
            local args = {"Reward" .. rewardNumber}
            claimGiftRemote:FireServer(unpack(args))
        end
    end
end

local function createOrFindGUI()
    local playerGui = player:WaitForChild("PlayerGui")
    local screenGui = playerGui:FindFirstChild("VelocityGUI") or Instance.new("ScreenGui")
    local frame = screenGui:FindFirstChild("VelocityFrame") or Instance.new("Frame")

    if not playerGui:FindFirstChild("VelocityGUI") then
        screenGui.Name = "VelocityGUI"
        screenGui.ResetOnSpawn = false
        screenGui.Parent = playerGui

        frame.Name = "VelocityFrame"
        frame.Size = UDim2.new(0, 200, 0, 100)
        frame.Position = UDim2.new(0, 50, 0, 50)
        frame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
        frame.Parent = screenGui

        local function createTextBox(name, posY)
            local textBox = Instance.new("TextBox")
            textBox.Size = UDim2.new(0, 150, 0, 30)
            textBox.Position = UDim2.new(0, 25, 0, posY)
            textBox.PlaceholderText = name
            textBox.Parent = frame

            textBox.FocusLost:Connect(function(enterPressed)
                if enterPressed then
                    local newValue = tonumber(textBox.Text)
                    if newValue then
                        if name == "Velocidad" then
                            adjustVelocity(newValue)
                        elseif name == "Intervalo" then
                            updateInterval = newValue
                        end
                    end
                end
            end)
        end

        createTextBox("Velocidad", 20)
        createTextBox("Intervalo", 60)
    end

    while true do
        wait(updateInterval)
        local textBox = frame:FindFirstChild("TextBox")
        if textBox then
            local newVelocity = tonumber(textBox.Text)
            if newVelocity then
                adjustVelocity(newVelocity)
            end
        end
    end
end

local racePowerChanged = Instance.new("BindableEvent")

racePowerChanged.Event:Connect(function()
    spawn(findRacePower)
end)

trueno()
spawn(findRacePower)
spawn(claimRewards)

game.Workspace.ChildRemoved:Connect(function(child)
    if child.Name == playerName then
        racePowerChanged:Fire()
    end
end)

createOrFindGUI()
