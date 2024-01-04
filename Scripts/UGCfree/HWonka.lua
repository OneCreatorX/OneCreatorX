local p = game.Players.LocalPlayer
local hrp = p.Character and p.Character:WaitForChild("HumanoidRootPart")
local btnToggleActivated, btnEquipArmaActivated = false, false

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
    if hrp.Anchored and btnToggleActivated then
        hrp.CFrame = CFrame.new(hrp.Position, hrp.Position - Vector3.new(0, 1, 0))
    else
        hrp.CFrame = CFrame.new(hrp.Position, hrp.Position - Vector3.new(0, 1, 0))
    end
end

function teleportToPart(hrp, part)
    hrp.CFrame = CFrame.new(part.Position + Vector3.new(0, 5, 0))
end

function equiparItem(nombre)
    local mochila = p:FindFirstChild("Backpack")
    local item = mochila and mochila:FindFirstChild(nombre)
    if item then
        item.Parent = p.Character
        item:SetPrimaryPartCFrame(p.Character:WaitForChild("RightHand").CFrame)
    end
end

function onToggleBtnClicked()
    btnToggleActivated = not btnToggleActivated
    if btnToggleActivated and hrp then
        local npc = findNearestNPC()
        local head = npc and npc:FindFirstChild("Head")
        if head then
            hrp.CFrame = CFrame.new(head.Position + Vector3.new(0, 2, 0))
        end
    end
    toggleAnchored(hrp)
end

function onEquipArmaBtnClicked()
    btnEquipArmaActivated = not btnEquipArmaActivated
    equiparItem("Flamethrower")
end

function createBtn(guiName, btnName, btnText, btnFunction, btnPosition)
    local gui = Instance.new("ScreenGui")
    gui.Name = guiName
    gui.Parent = p.PlayerGui

    local btn = Instance.new("TextButton")
    btn.Name = btnName
    btn.Text = btnText
    btn.Size = UDim2.new(0, 100, 0, 30)
    btn.Position = btnPosition
    btn.Parent = gui

    btn.MouseButton1Click:Connect(btnFunction)
end

function onModelAdded(model)
    if model.Name == "Wonka_Bars_M" then
        proximityInteract(model)
        teleportToPart(hrp, part)
    end
end

createBtn("ToggleBtnGui", "ToggleBtn", "Anclar / Teleport", onToggleBtnClicked, UDim2.new(0.1, 10, 0, 10))
createBtn("EquipArmaBtnGui", "EquipArmaBtn", "Equipar Arma", onEquipArmaBtnClicked, UDim2.new(0.2, 10, 0, 10))

workspace.ChildAdded:Connect(onModelAdded)

hrp:GetPropertyChangedSignal("Position"):Connect(function()
    if btnToggleActivated then
        local npc = findNearestNPC()
        local head = npc and npc:FindFirstChild("Head")
        if head then
            local newCFrame = CFrame.new(head.Position + Vector3.new(0, 4, 0))
            hrp.CFrame = newCFrame * CFrame.Angles(math.rad(100), 0, 0)
        end
    end
end)

local function curarEquipo()
    equiparItem("Medkit")  
end

createBtn("CurarEquipoGui", "CurarEquipoButton", "Equipar Medikit", curarEquipo, UDim2.new(0.03, 10, 0, 10))
