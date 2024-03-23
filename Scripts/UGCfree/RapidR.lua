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
    game.Players.LocalPlayer.Character.Humanoid.WalkToPoint = Vector3.new(7, 0, -124)
end

local function teleportToTitles(folder)
    local titleParts = folder:GetDescendants()
    local player = game.Players.LocalPlayer

    while folder.Parent do
        for _, part in ipairs(titleParts) do
            if part:IsA("MeshPart") and part.Name == "Tile" then
                player.Character:SetPrimaryPartCFrame(part.CFrame)
                wait(0.3)
            end
        end
    end
end

local function onFolderAdded(folder)
    if folder.Name == "ColorTakeover" then
        wait(8)
        coroutine.wrap(teleportToTitles)(folder)
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
        local grassParts = folder:GetDescendants()
        for _, grass in ipairs(grassParts) do
            if grass:IsA("MeshPart") and grass.Name == "Grass" then
                movePlayerToGrass(grass)
            end
        end
    end
end

workspace.MinigamesRoot.ChildAdded:Connect(onFolderAdded)
workspace.MinigamesRoot.ChildAdded:Connect(onPartAdded)
workspace.MinigamesRoot.ChildRemoved:Connect(onPartRemoved)
game.Players.LocalPlayer.CharacterRemoving:Connect(onCharacterRemoved)
