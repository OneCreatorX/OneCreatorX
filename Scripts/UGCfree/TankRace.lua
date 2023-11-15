local player = game.Players.LocalPlayer
local velocityValue = 900000
local updateInterval = 1
local playerName = player.Name
local racePower

local replicatedStorage = game:GetService("ReplicatedStorage")
local remoteEvent = replicatedStorage:WaitForChild("GameClient"):WaitForChild("Events"):WaitForChild("RemoteEvent")

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

        local velocityTextBox = Instance.new("TextBox")
        velocityTextBox.Size = UDim2.new(0, 150, 0, 30)
        velocityTextBox.Position = UDim2.new(0, 25, 0, 20)
        velocityTextBox.PlaceholderText = "Velocidad"
        velocityTextBox.Parent = frame

        local intervalTextBox = Instance.new("TextBox")
        intervalTextBox.Size = UDim2.new(0, 150, 0, 30)
        intervalTextBox.Position = UDim2.new(0, 25, 0, 60)
        intervalTextBox.PlaceholderText = "Intervalo"
        intervalTextBox.Parent = frame

        velocityTextBox.FocusLost:Connect(function(enterPressed)
            if enterPressed then
                local newVelocity = tonumber(velocityTextBox.Text)
                if newVelocity then
                    adjustVelocity(newVelocity)
                end
            end
        end)

        intervalTextBox.FocusLost:Connect(function(enterPressed)
            if enterPressed then
                local newInterval = tonumber(intervalTextBox.Text)
                if newInterval then
                    updateInterval = newInterval
                end
            end
        end)
    end

    while true do
        wait(updateInterval)
        local textBox = frame:FindFirstChild("VelocityFrame")
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

spawn(findRacePower)

game.Workspace.ChildRemoved:Connect(function(child)
    if child.Name == playerName then
        racePowerChanged:Fire()
    end
end)

createOrFindGUI()
