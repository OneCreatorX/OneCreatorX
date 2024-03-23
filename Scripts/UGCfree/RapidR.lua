local p = game.Players.LocalPlayer
local g = Instance.new("ScreenGui")
g.ResetOnSpawn = false
g.Parent = p.PlayerGui

local f = Instance.new("Frame", g)
f.Size, f.Position, f.BackgroundColor3, f.BorderSizePixel, f.BorderColor3, f.Draggable, f.Active = UDim2.new(0, 150, 0, 60), UDim2.new(0.3, -100, 0.9, -80), Color3.fromRGB(32, 32, 32), 2, Color3.new(1, 1, 1), true, true

local t = Instance.new("TextLabel", f)
t.Size, t.Position, t.Text, t.TextSize, t.TextColor3, t.BackgroundColor3 = UDim2.new(1, 0, 0, 30), UDim2.new(0, 0, 0, 0), "YT:OneCreatorX", 12, Color3.fromRGB(255, 255, 255), Color3.fromRGB(46, 46, 46)

local ti = Instance.new("TextLabel", f)
ti.Size, ti.Position, ti.Text, ti.TextSize, ti.TextColor3, ti.BackgroundColor3 = UDim2.new(1, 0, 0, 30), UDim2.new(0, 0, 0.53, 0), "New V.2", 10, Color3.fromRGB(255, 255, 255), Color3.fromRGB(46, 46, 46)

game:GetService('Players').LocalPlayer.Idled:Connect(function()
    game:GetService('VirtualUser'):CaptureController()
    game:GetService('VirtualUser'):ClickButton2(Vector2.new())
end)

local function onPartAdded(part)
    if part.Name == "Wipeout" or part.Name == "FloodEscape" or part.Name == "BombDrop" or part.Name == "Spleef" then
        wait(6)
        part:Destroy()
    elseif part.Name == "GrassMowing" then
        wait(8)
        local grassParts = part:GetDescendants()
        for _, grass in ipairs(grassParts) do
            if grass:IsA("MeshPart") and grass.Name == "Grass" then
                movePlayerToGrass(grass)
            end
        end
    end
end

local function onPartRemoved(part)
    wait(4)
    game.Players.LocalPlayer.Character.Humanoid.WalkToPoint = Vector3.new(7, 0, -124)
end

local function onCharacterRemoved(character)
    wait(4)
    game.Players.LocalPlayer.Character.Humanoid.WalkToPoint = Vector3.new(3, 1, -114)
end

local function teleportToParts(folder, partName)
    local parts = folder:GetDescendants()
    local player = game.Players.LocalPlayer
    local humanoid = player.Character:WaitForChild("Humanoid")

    while folder.Parent do
        for _, part in ipairs(parts) do
            if part:IsA("MeshPart") and part.Name == partName then
                humanoid.WalkToPoint = part.Position
                repeat
                    wait(0.2)
                until (player.Character.HumanoidRootPart.Position - part.Position).Magnitude < 2
                wait(0.2) 
            end
        end
    end
end

local function onFolderAdded(folder)
    if folder.Name == "ColorTakeover" then
        wait(8)
        coroutine.wrap(function() teleportToParts(folder, "Tile") end)()
    elseif folder.Name == "Lumberjack" then
        wait(8)
        local trucks = folder:GetDescendants()
        for _, truck in ipairs(trucks) do
            if truck:IsA("MeshPart") and truck.Name == "Truck" then
                movePlayerToTree(truck)
                sendRemoteToTree(truck)
            end
        end
    elseif folder.Name == "MindlessMining" then
        wait(8)
        local ores = folder:GetDescendants()
        for _, ore in ipairs(ores) do
            if ore:IsA("MeshPart") and ore.Name == "Rock" then
                movePlayerToOre(ore)
                sendRemoteToOre(ore)
                wait(0.5) 
            end
        end
    elseif folder.Name == "GrassMowing" then
        wait(8)
        coroutine.wrap(function() teleportToParts(folder, "Grass") end)()
    end
end

workspace.MinigamesRoot.ChildAdded:Connect(onFolderAdded)
workspace.MinigamesRoot.ChildAdded:Connect(onPartAdded)
game.Players.LocalPlayer.CharacterRemoving:Connect(onCharacterRemoved)
