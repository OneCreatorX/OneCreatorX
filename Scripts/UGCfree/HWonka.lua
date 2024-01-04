local p = game.Players.LocalPlayer
local hrp = p.Character and p.Character:WaitForChild("HumanoidRootPart")
local btnActivated = false

function proximityInteract(model)
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

function onBtnClicked()
    btnActivated = not btnActivated

    if btnActivated and hrp then
        local npc = findNearestNPC()
        if npc then
            local head = npc:FindFirstChild("Head")
            if head then
                hrp.CFrame = CFrame.new(head.Position + Vector3.new(0, 2, 0))
            end
        else
            -- Si no hay NPC cerca o el directorio NPC no existe, simplemente ancla al personaje en su posición actual
            toggleAnchored(hrp)
            return
        end
    end

    toggleAnchored(hrp)
end

function findNearestNPC()
    local npcDistThresh = 50
    local closestNPC, closestDist = nil, npcDistThresh

    local npcFolder = workspace:FindFirstChild("NPC")
    if not npcFolder or not npcFolder:IsA("Folder") then
        -- Si el directorio NPC no existe, devuelve nil
        return nil
    end

    for _, npc in ipairs(npcFolder:GetChildren()) do
        if npc:IsA("Model") and npc:FindFirstChild("Head") then
            local dist = (npc.Head.Position - hrp.Position).Magnitude
            if dist < closestDist then
                closestNPC, closestDist = npc, dist
            end
        end
    end

    return closestNPC
end


function toggleAnchored(hrp)
    hrp.Anchored = not hrp.Anchored

    if hrp.Anchored then
        if btnActivated then
            hrp.CFrame = CFrame.new(hrp.Position, hrp.Position - Vector3.new(0, 1, 0))
        end
    else
        hrp.CFrame = CFrame.new(hrp.Position, hrp.Position - Vector3.new(0, 1, 0))
    end
end

function teleportToPart(hrp, part)
    hrp.CFrame = CFrame.new(part.Position + Vector3.new(0, 5, 0))
end

function createBtn()
    local gui = Instance.new("ScreenGui")
    gui.Name = "ButtonGui"
    gui.Parent = p.PlayerGui

    local btn = Instance.new("TextButton")
    btn.Name = "ToggleButton"
    btn.Text = "Anclar / Teleport"
    btn.Size = UDim2.new(0, 150, 0, 30)
    btn.Position = UDim2.new(0.2, 10, 0, 10)
    btn.Parent = gui

    btn.MouseButton1Click:Connect(onBtnClicked)
end

local function onModelAdded(model)
    if model.Name == "Wonka_Bars_M" then
        proximityInteract(model)
        local part = -- TODO: Define the appropriate part here
        teleportToPart(hrp, part)
    end
end

createBtn()
workspace.ChildAdded:Connect(onModelAdded)

hrp:GetPropertyChangedSignal("Position"):Connect(function()
    if btnActivated then
        local npc = findNearestNPC()
        if npc then
            local head = npc:FindFirstChild("Head")
            if head then
                local newCFrame = CFrame.new(head.Position + Vector3.new(0, 4, 0))
                hrp.CFrame = newCFrame * CFrame.Angles(math.rad(180), 0, 0)
            end
        end
    end
end)
