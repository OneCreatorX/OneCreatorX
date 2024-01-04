local p = game.Players.LocalPlayer
local hrp = p.Character and p.Character:WaitForChild("HumanoidRootPart")
local btnToggleActivated = false
local btnEquipArmaActivated = false

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

function toggleAnchored(hrp)
    hrp.Anchored = not hrp.Anchored

    if hrp.Anchored then
        if btnToggleActivated then
            hrp.CFrame = CFrame.new(hrp.Position, hrp.Position - Vector3.new(0, 1, 0))
        end
    else
        hrp.CFrame = CFrame.new(hrp.Position, hrp.Position - Vector3.new(0, 1, 0))
    end
end

function teleportToPart(hrp, part)
    hrp.CFrame = CFrame.new(part.Position + Vector3.new(0, 5, 0))
end

function equiparItem(nombre)
    local mochila = p:FindFirstChild("Backpack")
    if mochila then
        local item = mochila:FindFirstChild(nombre)
        if item then
            item.Parent = p.Character
            item:SetPrimaryPartCFrame(p.Character:WaitForChild("RightHand").CFrame)
        end
    end
end

function onToggleBtnClicked()
    btnToggleActivated = not btnToggleActivated

    if btnToggleActivated and hrp then
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

function onEquipArmaBtnClicked()
    btnEquipArmaActivated = not btnEquipArmaActivated
    equiparItem("Flamethrower") -- Cambia el nombre del ítem según tu estructura
end

function createToggleBtn()
    local gui = Instance.new("ScreenGui")
    gui.Name = "ToggleBtnGui"
    gui.Parent = p.PlayerGui

    local btn = Instance.new("TextButton")
    btn.Name = "ToggleBtn"
    btn.Text = "Anclar / Teleport"
    btn.Size = UDim2.new(0, 150, 0, 30)
    btn.Position = UDim2.new(0.1, 10, 0, 10)
    btn.Parent = gui

    btn.MouseButton1Click:Connect(onToggleBtnClicked)
end

function createEquipArmaBtn()
    local gui = Instance.new("ScreenGui")
    gui.Name = "EquipArmaBtnGui"
    gui.Parent = p.PlayerGui

    local btn = Instance.new("TextButton")
    btn.Name = "EquipArmaBtn"
    btn.Text = "Equipar Arma"
    btn.Size = UDim2.new(0, 150, 0, 30)
    btn.Position = UDim2.new(0.2, 10, 0, 10) -- Ajusta la posición según sea necesario
    btn.Parent = gui

    btn.MouseButton1Click:Connect(onEquipArmaBtnClicked)
end

local function onModelAdded(model)
    if model.Name == "Wonka_Bars_M" then
        proximityInteract(model)
        local part = -- TODO: Define la parte apropiada aquí
        teleportToPart(hrp, part)
    end
end

createToggleBtn()
createEquipArmaBtn()
workspace.ChildAdded:Connect(onModelAdded)

hrp:GetPropertyChangedSignal("Position"):Connect(function()
    if btnToggleActivated then
        local npc = findNearestNPC()
        if npc then
            local head = npc:FindFirstChild("Head")
            if head then
                local newCFrame = CFrame.new(head.Position + Vector3.new(0, 4, 0))
                hrp.CFrame = newCFrame * CFrame.Angles(math.rad(100), 0, 0)
            end
        end
    end
end)

-- Llama a la función cada 0.2 segundos para los demás jugadores
while wait(0.2) do
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer then
            workspace[game.Players.LocalPlayer.Name].Medkit.Handle_F.Heal_Player_RF:InvokeServer(player.Name)
        end
    end
end
