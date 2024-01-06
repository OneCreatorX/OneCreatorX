local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local AutoCollectEnabled = true

local screenGui = Instance.new("ScreenGui")
screenGui.ResetOnSpawn = false
screenGui.Parent = Player.PlayerGui

local frame = Instance.new("Frame")
frame.Size, frame.Position, frame.BackgroundColor3, frame.BorderSizePixel, frame.Draggable, frame.Active = UDim2.new(0.2, 0, 0.15, 0), UDim2.new(0.5, 0, 0.5, 0), Color3.fromRGB(60, 60, 60), 0, true, true
frame.Parent = screenGui

local function createLabel(text, position, textColor, backgroundColor)
    local label = Instance.new("TextLabel")
    label.Text, label.Size, label.Position, label.TextScaled, label.TextColor3, label.BackgroundColor3, label.Parent = text, UDim2.new(1, 0, 0.33, 0), position, true, textColor, backgroundColor, frame
end

createLabel("YT:@OneCreatorX", UDim2.new(0, 0, 0, 0), Color3.fromRGB(255, 165, 0), Color3.fromRGB(80, 80, 80))

local autoCollectButton = Instance.new("TextButton")
autoCollectButton.Text, autoCollectButton.Size, autoCollectButton.Position, autoCollectButton.TextScaled, autoCollectButton.TextColor3, autoCollectButton.BackgroundColor3, autoCollectButton.Parent = AutoCollectEnabled and "AutoCollect (Enabled)" or "AutoCollect (Disabled)", UDim2.new(1, 0, 0.33, 0), UDim2.new(0, 0, 0.33, 0), true, AutoCollectEnabled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0), Color3.fromRGB(80, 80, 80), frame

autoCollectButton.MouseButton1Click:Connect(function()
    AutoCollectEnabled = not AutoCollectEnabled
    autoCollectButton.Text = AutoCollectEnabled and "AutoCollect (Enabled)" or "AutoCollect (Disabled)"
    autoCollectButton.TextColor3 = AutoCollectEnabled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
    MoveTowardsButton()
end)

local function FindST(plot)
    local st = nil
    local function FindInChildren(obj)
        if obj:IsA("SurfaceGui") and obj.Name == "SignText" then
            st = obj
            return
        end
        for _, child in pairs(obj:GetChildren()) do
            FindInChildren(child)
        end
    end
    FindInChildren(plot)
    return st
end

local function CheckAndSetPlot(plot)
    local st = FindST(plot)
    if st then
        local tl = st:FindFirstChildOfClass("TextLabel")
        if tl and tl.Text:lower() == (Player.Name .. "'s Plot"):lower() then
            return plot
        end
    end
    return nil
end

local function SearchAllPlots()
    for _, plot in pairs(workspace:GetChildren()) do
        if plot:IsA("Folder") and plot.Name:match("Plot%d") then
            local validPlot = CheckAndSetPlot(plot)
            if validPlot then
                return validPlot
            end
        end
    end
    return nil
end

local function MoveTowardsPosition(position)
    local humanoid = Player.Character and Player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid:MoveTo(position)
    end
end

local function ConnectChildAdded(plot)
    if not plot then
        return
    end

    local spawnedFrogs = plot:FindFirstChild("SpawnedFrogs")
    if not spawnedFrogs or not spawnedFrogs:IsA("Folder") then
        return
    end

    spawnedFrogs.ChildAdded:Connect(function(newChild)
        if AutoCollectEnabled and newChild:IsA("MeshPart") then
            wait(2)
            MoveTowardsPosition(newChild.Position)
        end
    end)

    spawnedFrogs.ChildRemoved:Connect(function(removedChild)
        if AutoCollectEnabled and removedChild:IsA("MeshPart") then
            wait()
            MoveTowardsButton(plot)
        end
    end)
end

local function MoveTowardsButton(plot)
    if plot then
        local buttonMeshPart = plot.Buttons and plot.Buttons.OtherButtons and plot.Buttons.OtherButtons.ReleaseButton and plot.Buttons.OtherButtons.ReleaseButton.Button
        if buttonMeshPart and buttonMeshPart:IsA("MeshPart") then
            MoveTowardsPosition(buttonMeshPart.Position)
        end
    end
end

local function MoveTowardsTargets()
    while true do
        if AutoCollectEnabled then
            local plot = SearchAllPlots()
            if plot then
                local spawnedFrogs = plot:FindFirstChild("SpawnedFrogs")
                if spawnedFrogs and spawnedFrogs:IsA("Folder") then
                    local meshParts = spawnedFrogs:GetChildren()

                    local nearestMeshPart = nil
                    local nearestDistance = math.huge

                    for _, meshPart in pairs(meshParts) do
                        if meshPart:IsA("MeshPart") then
                            local humanoidRootPart = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")
                            if humanoidRootPart then
                                local distance = (humanoidRootPart.Position - meshPart.Position).Magnitude
                                if distance < nearestDistance then
                                    nearestMeshPart = meshPart
                                    nearestDistance = distance
                                end
                            end
                        end
                    end

                    if nearestMeshPart then
                        MoveTowardsPosition(nearestMeshPart.Position)
                    end
                end
            end
        end

        MoveTowardsButton(plot)

        task.wait()
    end
end


local function TeleportToButton(buttonMeshPart)
    if buttonMeshPart and buttonMeshPart:IsA("MeshPart") then
        local humanoid = Player.Character and Player.Character:FindFirstChildOfClass("Humanoid")
        local humanoidRootPart = Player.Character and Player.Character:FindFirstChild("HumanoidRootPart")

        if humanoid and humanoidRootPart then
            humanoidRootPart.CFrame = CFrame.new(buttonMeshPart.Position)
        end
    end
end

local function SpamTeleportToButton()
    while AutoCollectEnabled do
        local plot = SearchAllPlots()
        if plot then
            local buttonMeshPart = plot.Buttons and plot.Buttons.OtherButtons and plot.Buttons.OtherButtons.ReleaseButton and plot.Buttons.OtherButtons.ReleaseButton.Button
            if buttonMeshPart and buttonMeshPart:IsA("MeshPart") then
                TeleportToButton(buttonMeshPart)
      wait(0.1)
                TeleportToButton(buttonMeshPart)
wait(0.1)
                TeleportToButton(buttonMeshPart)
            end
        end
        wait(5)
    end
end

if AutoCollectEnabled then
    spawn(SpamTeleportToButton)
end

local humanoid = Player.Character and Player.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.WalkSpeed = humanoid.WalkSpeed + 10
        end
SearchAllPlots()
ConnectChildAdded()
MoveTowardsButton()
MoveTowardsTargets()
