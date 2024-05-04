local p = game.Players.LocalPlayer
local g = Instance.new("ScreenGui", p.PlayerGui)
g.ResetOnSpawn = false

local f = Instance.new("Frame", g)
f.Size = UDim2.new(0, 150, 0, 60)
f.Position = UDim2.new(0.3, -100, 0.9, -80)
f.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
f.BorderSizePixel = 2
f.BorderColor3 = Color3.new(1, 1, 1)
f.Draggable = true
f.Active = true

local t = Instance.new("TextLabel", f)
t.Size = UDim2.new(1, 0, 0, 30)
t.Position = UDim2.new(0, 0, 0, 0)
t.Text = "YT:OneCreatorX"
t.TextSize = 12
t.TextColor3 = Color3.fromRGB(255, 255, 255)
t.BackgroundColor3 = Color3.fromRGB(46, 46, 46)

local ti = Instance.new("TextLabel", f)
ti.Size = UDim2.new(1, 0, 0, 30)
ti.Position = UDim2.new(0, 0, 0.53, 0)
ti.Text = "New V.6.2"
ti.TextSize = 10
ti.TextColor3 = Color3.fromRGB(255, 255, 255)
ti.BackgroundColor3 = Color3.fromRGB(46, 46, 46)

game:GetService('Players').LocalPlayer.Idled:Connect(function()
    game:GetService('VirtualUser'):CaptureController()
    game:GetService('VirtualUser'):ClickButton2(Vector2.new())
end)

game.Players.LocalPlayer.Character.Humanoid.WalkToPoint = Vector3.new(3, 1, -114)

function handleWipeout(part)
wait(7)
part.Wiper:Destroy()
while part and part.Parent do
wait(0.5)
local player = game.Players.LocalPlayer
    if player and player.Character then
        local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.Jump = true
        else
           
        end
    else
        
    end
end
end

function handleMapOne(part)
wait(7)
    local cloneDirectory = Instance.new("Folder", part)
    cloneDirectory.Name = "ClonedTiles"

    for _, item in ipairs(part:GetDescendants()) do
        if item:IsA("BasePart") then
            local clone = item:Clone()
            clone.Parent = cloneDirectory
        end
    end
end

function handleMapTwo(part)
wait(7)
    local cloneDirectory = Instance.new("Folder", part)
    cloneDirectory.Name = "ClonedTiles"

    for _, item in ipairs(part:GetDescendants()) do
        if item:IsA("BasePart") then
            local clone = item:Clone()
            clone.Parent = cloneDirectory
        end
    end
end

function handleBombDrop(part)
task.wait(7)
    part.ChildAdded:Connect(function(explosionPart)      
            explosionPart:Destroy()
    end)
end

function handleMapThree(part)
wait(7)
    local cloneDirectory = Instance.new("Folder", part)
    cloneDirectory.Name = "ClonedTiles"

    for _, item in ipairs(part:GetDescendants()) do
        if item:IsA("BasePart") then
            local clone = item:Clone()
            clone.Parent = cloneDirectory
        end
    end
end

function h(part)
while part and part.Parent do
task.wait(0.6)
game.Players.LocalPlayer.Character.Humanoid.Jump = true
end
end


function handleSpleef(part)
h(part)
    wait(7)
    local cloneDirectory = Instance.new("Folder", part)
    cloneDirectory.Name = "ClonedTiles"

    for _, item in ipairs(part.DropParts:GetDescendants()) do
        if item:IsA("BasePart") then
            local clone = item:Clone()
            clone.Parent = cloneDirectory
item.CanCollide = false
      item.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
        end
    end
end


function handleSwordFight(part)
wait(8)
    local localPlayer = game.Players.LocalPlayer
    local players = game.Players:GetPlayers()

    for _, player in ipairs(players) do
        if player ~= localPlayer then
            local character = player.Character
            if character then
                for _, item in ipairs(character:GetChildren()) do
                    if item:IsA("Tool") then
                        item:Destroy() 
                    end
                end
            end
        end
    end
end

function handleSoccer(part)
wait(8)
    local player = game.Players.LocalPlayer
    local humanoid = player.Character:WaitForChild("Humanoid")

    while part and part.Parent do
        local soccerBall = part:FindFirstChild("SoccerBall")
        if soccerBall then
            local playerPosition = player.Character.HumanoidRootPart.Position
            soccerBall.Position = playerPosition
        else
            break
        end
        task.wait(1)
    end
end

function handleAppleCatching(part)
    task.wait(30)
    part.Parent.ChildAdded:Connect(function(applePart)
        task.wait(0.1)
        if applePart:IsA("Part") and applePart.Name == "Apple" then
            applePart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        end
    end)
end

function handleGrassMowing(part)
    wait(30)
    local player = game.Players.LocalPlayer
    local humanoid = player.Character:WaitForChild("Humanoid")
    
    local grassParts = part:GetDescendants()
    for _, grass in ipairs(grassParts) do
        if grass:IsA("MeshPart") and (grass.Name == "Grass" or grass.Name == "grass") then
            local tool = player.Character.Lawnmower
            if tool and tool:IsA("Tool") then
                local handle = tool.MowPart
                if handle then
                    grass.Position = handle.Position
                end
            end
        end
humanoid.Jump = true
    end
    humanoid.Jump = true
end


function handleHandOfGod(part)
wait(8)
part.Hand.Hand:Destroy()
end


function ColorTakeover(part)
    task.wait(35.5)
    local player = game.Players.LocalPlayer

    for _, tilePart in ipairs(part:GetDescendants()) do
        if tilePart:IsA("MeshPart") and tilePart.Name == "Tile" then
            tilePart.CanCollide = false
            tilePart.CFrame = player.Character.HumanoidRootPart.CFrame
        end
    end
end

function LaserTag(part)
    task.wait(8)
    while part and part.Parent do
        local localPlayer = game.Players.LocalPlayer
        local players = game.Players:GetPlayers()

        for _, player in ipairs(players) do
            if player ~= localPlayer then
                local character = player.Character
                if character then
                    local RightLowerArm = character:FindFirstChild("RightLowerArm")
                    if RightLowerArm then
                        local args = {
                            [1] = Vector3.new(RightLowerArm.Position.X, RightLowerArm.Position.Y, RightLowerArm.Position.Z),
                            [2] = Vector3.new(RightLowerArm.Position.X, RightLowerArm.Position.Y, RightLowerArm.Position.Z),
                            [3] = game:GetService("Players"):WaitForChild(character.Name).Character.RightLowerArm
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("Blasters"):WaitForChild("Shot"):FireServer(unpack(args))
                        task.wait(0.1)
                    end
                end
            end
        end
    end
end


function FourCorners(part)
wait(7)
    local cloneDirectory = Instance.new("Folder", part)
    cloneDirectory.Name = "ClonedTiles"

    for _, item in ipairs(part:GetDescendants()) do
        if item:IsA("BasePart") then
            local clone = item:Clone()
            clone.Parent = cloneDirectory
        end
    end
end

function SlapBattle(part)
wait(8)
local player = game.Players.LocalPlayer

    for _, tilePart in ipairs(part.Area:GetDescendants()) do
        if tilePart:IsA("BasePart") then
            tilePart.CanCollide = false
            tilePart.CFrame = player.Character.HumanoidRootPart.CFrame
        end
    end
end


function handleMinigameEvents(part)
    local gameHandlers = {
        Wipeout = handleWipeout,
        MapTwo = handleMapTwo,
        MapThree = handleMapThree,
        BombDrop = handleBombDrop,
        Spleef = handleSpleef,
        SwordFight = handleSwordFight,
        AppleCatching = handleAppleCatching,
        HandOfGod = handleHandOfGod,
        GrassMowing = handleGrassMowing,
        Soccer = handleSoccer,
        ColorTakeover = ColorTakeover,
        LaserTag = LaserTag,
        FourCorners = FourCorners,
        SlapBattle = SlapBattle,
        MapOne = handleMapOne
    }

    if gameHandlers[part.Name] then
        gameHandlers[part.Name](part)
    end

    if game.Workspace:FindFirstChild("WaterKillPart") then
        game.Workspace.WaterKillPart:Destroy()
    end
end

workspace.MinigamesRoot.ChildAdded:Connect(handleMinigameEvents)

local positions = {
    Vector3.new(9, -2, -121),
    Vector3.new(3, -2, -119),
    Vector3.new(-6, -2, -114),
    Vector3.new(18, -2, -119)
}

game.Players.LocalPlayer.CharacterRemoving:Connect(function()
    task.wait(2)

    local newCharacter = game.Players.LocalPlayer.CharacterAdded:Wait()
    local humanoid = newCharacter:WaitForChild("Humanoid")

    local randomIndex = math.random(1, #positions) 
    humanoid:MoveTo(positions[randomIndex])
end)

function handleMinigameRemoved(minigame)
    if minigame.Name == "Apple" or minigame.Name == "AppleShadow" then
        minigame.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
    else
task.wait(0.2)
        local player = game.Players.LocalPlayer
        if player and player.Character then
            end
        end
    end

workspace.MinigamesRoot.ChildRemoved:Connect(handleMinigameRemoved)

local StarterGui = game:GetService("StarterGui")
    StarterGui:SetCore("SendNotification", {
        Title = "Temporal Disabled Auto Tickes",
        Text = "Now Updating Script ",
        Duration = 10,
    })

-- AsteroidCatching Asteroid 
