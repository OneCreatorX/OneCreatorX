local p = game.Players.LocalPlayer
local g = Instance.new("ScreenGui")
g.ResetOnSpawn = false
g.Parent = p.PlayerGui

local f = Instance.new("Frame", g)
f.Size, f.Position, f.BackgroundColor3, f.BorderSizePixel, f.BorderColor3, f.Draggable, f.Active = UDim2.new(0, 150, 0, 60), UDim2.new(0.3, -100, 0.9, -80), Color3.fromRGB(32, 32, 32), 2, Color3.new(1, 1, 1), true, true

local t = Instance.new("TextLabel", f)
t.Size, t.Position, t.Text, t.TextSize, t.TextColor3, t.BackgroundColor3 = UDim2.new(1, 0, 0, 30), UDim2.new(0, 0, 0, 0), "YT:OneCreatorX", 12, Color3.fromRGB(255, 255, 255), Color3.fromRGB(46, 46, 46)

local ti = Instance.new("TextLabel", f)
ti.Size, ti.Position, ti.Text, ti.TextSize, ti.TextColor3, ti.BackgroundColor3 = UDim2.new(1, 0, 0, 30), UDim2.new(0, 0, 0.53, 0), "New V.3", 10, Color3.fromRGB(255, 255, 255), Color3.fromRGB(46, 46, 46)

game:GetService('Players').LocalPlayer.Idled:Connect(function()
    game:GetService('VirtualUser'):CaptureController()
    game:GetService('VirtualUser'):ClickButton2(Vector2.new())
end)

game.Players.LocalPlayer.Character.Humanoid.WalkToPoint = Vector3.new(3, 1, -114)


local function movePlayerToGrass(grass)
    local player = game.Players.LocalPlayer
    player.Character.Humanoid.WalkToPoint = grass.Position
end


local function onPartAdded(part)
    if part.Name == "Wipeout" or part.Name == "FloodEscape" or part.Name == "BombDrop" or part.Name == "Spleef" or part.Name == "SwordFight" then
        task.wait(6)
        part:Destroy()
    elseif part.Name == "GrassMowing" then
        task.wait(8)
        local grassParts = part:GetDescendants()
        for _, grass in ipairs(grassParts) do
            if grass:IsA("MeshPart") and grass.Name == "Grass" then
                movePlayerToGrass(grass)
            end
        end
    end
end

local function onPartRemoved(part)
    task.wait(4)
    game.Players.LocalPlayer.Character.Humanoid.WalkToPoint = Vector3.new(7, 0, -124)
end

local function onCharacterRemoved(character)
    task.wait(4)
    game.Players.LocalPlayer.Character.Humanoid.WalkToPoint = Vector3.new(7, 0, -124)
end

local function movePlayerToParts(folder, partName)
    local parts = folder:GetDescendants()
    local player = game.Players.LocalPlayer
    local humanoid = player.Character:WaitForChild("Humanoid")

    for _, part in ipairs(parts) do
        if part:IsA("MeshPart") and part.Name == partName then
            humanoid.WalkToPoint = part.Position
            repeat
                task.wait(0.2)
            until (player.Character.HumanoidRootPart.Position - part.Position).Magnitude < 7
            humanoid.WalkToPoint = player.Character.HumanoidRootPart.Position 
            task.wait(0.2)
        end
    end
end

local function onFolderAdded(folder)
    if folder.Name == "ColorTakeover" then
        task.wait(8)
        movePlayerToParts(folder, "Tile")
    elseif folder.Name == "Lumberjack" then
        
    elseif folder.Name == "MindlessMining" then
       task.wait(8)

    elseif folder.Name == "GrassMowing" then
        task.wait(8)
        movePlayerToParts(folder, "Grass")
    end
end

local function movePlayerSideways()
    local player = game.Players.LocalPlayer
    local humanoid = player.Character.Humanoid
    
    local sideOffset = 2
    
    local soccerFolder = workspace.MinigamesRoot:FindFirstChild("Soccer")
    if not soccerFolder then
        
        return
    end
    
    
    
    while soccerFolder do
        local soccerBall = soccerFolder:FindFirstChild("SoccerBall")
        if not soccerBall then
            
            break
        end
        
        
        
        local ballPosition = soccerBall.Position

        humanoid.WalkToPoint = Vector3.new(player.Character.HumanoidRootPart.Position.X, 
                                           player.Character.HumanoidRootPart.Position.Y,
                                           ballPosition.Z + sideOffset)
        
        
        
        task.wait(0.1)
    end
end


workspace.MinigamesRoot.ChildAdded:Connect(onFolderAdded)
workspace.MinigamesRoot.ChildAdded:Connect(onPartAdded)
game.Players.LocalPlayer.CharacterRemoving:Connect(onCharacterRemoved)
workspace.MinigamesRoot.ChildAdded:Connect(function(child)
task.wait(8)
    if child.Name == "Soccer" then

        coroutine.wrap(movePlayerSideways)()
    end
end)

local function moveMeshPartsToPlayer()
while true do
task.wait(4)
    local player = game.Players.LocalPlayer
    local playerPosition = player.Character.HumanoidRootPart.Position
    
    local floatingTixFolder = workspace:FindFirstChild("FloatingTix")
    if not floatingTixFolder then
        
        return
    end
    
    
    
    local meshParts = floatingTixFolder:GetDescendants()
    for _, part in ipairs(meshParts) do
        if part:IsA("MeshPart") and part.Name == "FreshTix" then
            part.Position = playerPosition
            end
        end
    end
end
moveMeshPartsToPlayer()
