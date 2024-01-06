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

SearchAllPlots()

local function MoveMeshPart(meshPart)
    if meshPart:IsA("MeshPart") then
        meshPart.CFrame = CFrame.new(Plr.Character.HumanoidRootPart.Position)
    end
end

local function MoveSmallFrogs()
    if PlotPlr then
        local spawnedFrogs = PlotPlr:FindFirstChild("SpawnedFrogs")
        
        if spawnedFrogs and spawnedFrogs:IsA("Folder") then
            for _, child in pairs(spawnedFrogs:GetChildren()) do
                if child:IsA("MeshPart") then
                    MoveMeshPart(child)
                end
            end
            
            spawnedFrogs.ChildAdded:Connect(function(newChild)
                if newChild:IsA("MeshPart") then
                    MoveMeshPart(newChild)
                end
            end)
        end
    end
end

MoveSmallFrogs()
