local Plr = game.Players.LocalPlayer
local PlotPlr

local function FindST(plot)
    local st = nil
    local function FindInChildren(obj)
        if obj:IsA("SurfaceGui") and obj.Name == "SignText" then st = obj return end
        for _, child in pairs(obj:GetChildren()) do FindInChildren(child) end
    end
    FindInChildren(plot)
    return st
end

local function CheckAndSetPlot(plot)
    local st = FindST(plot)
    if st then
        local tl = st:FindFirstChildOfClass("TextLabel")
        if tl and tl.Text:lower() == (Plr.Name .. "'s Plot"):lower() then PlotPlr = plot end
    end
end

local function SearchAllPlots()
    for _, plot in pairs(workspace:GetChildren()) do
        if plot:IsA("Folder") and plot.Name:match("Plot%d") then CheckAndSetPlot(plot) end
    end
end

local function MoveMeshPart(meshPart)
    if meshPart:IsA("MeshPart") then
        local currentPos = Plr.Character.HumanoidRootPart.Position
        Plr.Character:SetPrimaryPartCFrame(CFrame.new(Vector3.new(meshPart.Position.X, currentPos.Y, meshPart.Position.Z)))
    end
end

local function MoveTowardsMeshParts(meshParts)
    for _, meshPart in pairs(meshParts) do
        MoveMeshPart(meshPart)
        wait(1) -- Espera antes de moverse al siguiente MeshPart
    end
end

local function MoveTowardsCollectionPool()
    if PlotPlr then
        local collectionArea = PlotPlr:FindFirstChild("CollectionArea")

        if collectionArea and collectionArea:IsA("Folder") then
            local collectionPool = collectionArea:FindFirstChild("CollectionPool")

            if collectionPool and collectionPool:IsA("MeshPart") then
                MoveMeshPart(collectionPool)
            end
        end
    end
end

local function MoveTowardsButton()
    if PlotPlr then
        local buttonMeshPart = PlotPlr.Buttons.OtherButtons.ReleaseButton.Button

        if buttonMeshPart and buttonMeshPart:IsA("MeshPart") then
            MoveMeshPart(buttonMeshPart)
        end
    end
end

local function ConnectChildAdded()
    if PlotPlr then
        local spawnedFrogs = PlotPlr:FindFirstChild("SpawnedFrogs")

        if spawnedFrogs and spawnedFrogs:IsA("Folder") then
            spawnedFrogs.ChildAdded:Connect(function(newChild)
                if newChild:IsA("MeshPart") then
                    MoveMeshPart(newChild)
                end
            end)

            spawnedFrogs.ChildRemoved:Connect(function(removedChild)
                if removedChild:IsA("MeshPart") then
                    -- Si se elimina un MeshPart, mueve al jugador hacia el botón
                    MoveTowardsButton()
                end
            end)
        end
    end
end

local function MoveTowardsTargets()
    while true do
        if PlotPlr then
            local spawnedFrogs = PlotPlr:FindFirstChild("SpawnedFrogs")

            if spawnedFrogs and spawnedFrogs:IsA("Folder") then
                MoveTowardsMeshParts(spawnedFrogs:GetChildren())
            end

            MoveTowardsCollectionPool()
            wait(1) -- Espera antes de volver a verificar los MeshPart
        end
        wait()
    end
end

SearchAllPlots()
ConnectChildAdded()
MoveTowardsTargets()
