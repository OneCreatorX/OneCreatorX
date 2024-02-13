local gui = Instance.new("ScreenGui")
gui.Parent = game.Players.LocalPlayer.PlayerGui

local isLooping1, isLooping2 = false, false

local function movePlayerToPosition(position)
    game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(position))
end

local function hasPlayersNearby(position)
    for _, player in ipairs(game.Players:GetPlayers()) do
        local character = player.Character
        if character and (position - character.PrimaryPart.Position).magnitude <= 10 then
            return true
        end
    end
    return false
end

local frame = Instance.new("Frame")
frame.Size, frame.Position = UDim2.new(0, 200, 0, 100), UDim2.new(0.3, 10, 0, 10)
frame.BackgroundTransparency = 0.5
frame.Parent = gui

local function createButton(name, position, clickFunction)
    local button = Instance.new("TextButton")
    button.Size, button.Position = UDim2.new(0, 80, 0, 25), position
    button.Text, button.Parent = name, frame
    button.MouseButton1Click:Connect(clickFunction)
end

createButton("Para Puntos", UDim2.new(0, 10, 0, 10), function()
    isLooping1 = not isLooping1  
    while isLooping1 do
        game:GetService("ReplicatedStorage").Orion.node_modules["@supersocial"].netwire.NetWire.Remotes.TimerService.RE.StartRace:FireServer()
        wait(1.5)
        movePlayerToPosition(game.Workspace.DropAOE.Ring.Position)
        wait(1.5)
        local luggagePosition = game.Workspace.Luggage1.Collision.Position
        if not hasPlayersNearby(luggagePosition) then
            movePlayerToPosition(luggagePosition)
            wait(2)
        end
    end
end)

createButton("Para Coins", UDim2.new(0, 100, 0, 10), function()
    isLooping2 = not isLooping2
    while isLooping2 do
        for _, coin in pairs(game.Workspace.PowerUps:GetDescendants()) do
            if coin:IsA("Part") and coin.Name == "Coin" then
                movePlayerToPosition(coin.Position)
                wait()
            end
        end
    end
end)
