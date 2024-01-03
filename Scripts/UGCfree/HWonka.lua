local p = game.Players.LocalPlayer
local hrp = p.Character and p.Character:WaitForChild("HumanoidRootPart")
local btnActivated = false

local function proximityInteract(model)
    if fireclickdetector then
        local character = p.Character or p.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")

        while true do
            for _, d in ipairs(model:GetDescendants()) do
                if d:IsA("ProximityPrompt") then
                    fireproximityprompt(d)
                    wait(0.3)
                end
            end
            wait(0.5)
        end
    end
end

local function onBtnClicked()
    btnActivated = not btnActivated

    if btnActivated and hrp then
        local npc = findNearestNPC()
        if npc then
            local head = npc:FindFirstChild("Head")
            if head then
                hrp.CFrame = CFrame.new(head.Position + Vector3.new(0, 2, 0))
            end
        end
    end

    toggleAnchored(hrp)
end

local function findNearestNPC()
    local npcDistThresh = 50
    local closestNPC, closestDist = nil, npcDistThresh

    for _, npc in ipairs(workspace.NPC:GetChildren()) do
        if npc:IsA("Model") and npc:FindFirstChild("Head") then
            local dist = (npc.Head.Position - hrp.Position).Magnitude
            if dist < closestDist then
                closestNPC, closestDist = npc, dist
            end
        end
    end

    return closestNPC
end

local function toggleAnchored(hrp)
    hrp.Anchored = not hrp.Anchored

    if hrp.Anchored then
        if btnActivated then
            -- Mira hacia abajo completamente
            hrp.CFrame = CFrame.new(hrp.Position, hrp.Position - Vector3.new(0, 1, 0))
        end
    else
        hrp.CFrame = CFrame.new(hrp.Position, hrp.Position - Vector3.new(0, 1, 0))
    end
end

local function teleportToPart(hrp, part)
    hrp.CFrame = CFrame.new(part.Position + Vector3.new(0, 5, 0))
end

local function createBtn()
    local gui = Instance.new("ScreenGui")
    gui.Name = "ButtonGui"
    gui.Parent = p.PlayerGui

    local btn = Instance.new("TextButton")
    btn.Name = "ToggleButton"
    btn.Text = "Anclar / Teleport"
    btn.Size = UDim2.new(0.4, 150, 0, 30)
    btn.Position = UDim2.new(0, 10, 0, 10)
    btn.Parent = gui

    btn.MouseButton1Click:Connect(onBtnClicked)
end

local function onModelAdded(model)
    if model.Name == "Wonka_Bars_M" then
        proximityInteract(model)
        teleportToPart(hrp, part)
    end
end

createBtn()
workspace.ChildAdded:Connect(onModelAdded)

-- Conectar eventos GetPropertyChangedSignal para seguir al personaje y a los NPC
p.CharacterAdded:Connect(function(character)
    hrp = character:WaitForChild("HumanoidRootPart")
    local positionChangedConnection

    positionChangedConnection = hrp:GetPropertyChangedSignal("Position"):Connect(function()
        if btnActivated then
            local npc = findNearestNPC()
            if npc then
                local head = npc:FindFirstChild("Head")
                if head then
                    hrp.CFrame = CFrame.new(head.Position + Vector3.new(0, 2, 0))
                end
            end
        end
    end)

    hrp.AncestryChanged:Connect(function()
        if not hrp.Parent then
            -- El personaje fue eliminado, desconectar la conexión
            positionChangedConnection:Disconnect()
        end
    end)
end)
