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

local function MoveMP(mp)
    if mp:IsA("MeshPart") then mp.CFrame = CFrame.new(Plr.Character.HumanoidRootPart.Position) end
end

local function MoveSmallFrogs()
    if PlotPlr then
        local sf = PlotPlr:FindFirstChild("SpawnedFrogs")
        if sf and sf:IsA("Folder") then
            for _, frog in pairs(sf:GetChildren()) do MoveMP(frog) end
            sf.ChildAdded:Connect(function(newChild) MoveMP(newChild) end)
        end
    end
end

MoveSmallFrogs()

-- Crear ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = Plr.PlayerGui

-- Crear Frame
local frame = Instance.new("Frame")
frame.Size, frame.Position, frame.BackgroundColor3, frame.BorderSizePixel, frame.Draggable, frame.Active = UDim2.new(0.2, 0, 0.15, 0), UDim2.new(0.5, 0, 0.5, 0), Color3.fromRGB(60, 60, 60), 0, true, true
frame.Parent = screenGui

local function createLabel(text, position, textColor, backgroundColor)
    local label = Instance.new("TextLabel")
    label.Text, label.Size, label.Position, label.TextScaled, label.TextColor3, label.BackgroundColor3, label.Parent = text, UDim2.new(1, 0, 0.33, 0), position, true, textColor, backgroundColor, frame
end

createLabel("YT:@OneCreatorX", UDim2.new(0, 0, 0, 0), Color3.fromRGB(255, 165, 0), Color3.fromRGB(80, 80, 80))
createLabel("AutoCollect", UDim2.new(0, 0, 0.33, 0), Color3.fromRGB(0, 255, 0), Color3.fromRGB(80, 80, 80))
createLabel("AntiAFK", UDim2.new(0, 0, 0.66, 0), Color3.fromRGB(0, 0, 255), Color3.fromRGB(80, 80, 80))
