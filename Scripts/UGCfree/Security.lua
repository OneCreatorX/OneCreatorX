local player = game.Players.LocalPlayer
local npcFolder = workspace:WaitForChild("NPCs")
local teleportPosition = Vector3.new(178, 4, -190)
local waitTime = 1.3
local walkSpeed = 50
local maxRange = 60

local function activateProximityPromptsInFolder(folder)
    for _, object in ipairs(folder:GetDescendants()) do
        if object:IsA("ProximityPrompt") then
            fireproximityprompt(object)
        end
    end
end

local function equipItem(player, itemName)
    local success, err = pcall(function()
        local item = player.Backpack:FindFirstChild(itemName)
        if item then
            item.Parent = player.Character
            item:SetPrimaryPartCFrame(player.Character.RightHand.CFrame)
        end
    end)
    if not success then
        warn("Error equipping item: " .. err)
    end
end

local function prioritizeNPCs()
    local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
    local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")

    if humanoid and humanoidRootPart then
        for _, npc in ipairs(npcFolder:GetChildren()) do
            if npc:IsA("Model") and not (npc.Name == "ArmedRobber" or npc.Name == "BatRobber" or npc.Name == "Robber") then
                local npcRootPart = npc:FindFirstChild("HumanoidRootPart")
                if npcRootPart then
                    local distance = (npcRootPart.Position - humanoidRootPart.Position).Magnitude
                    if distance <= maxRange then
                        activateProximityPromptsInFolder(workspace)
                        humanoidRootPart.CFrame = CFrame.new(npcRootPart.Position)
                        task.wait(waitTime)
                        equipItem(player, "Detain")
                        game.Players.LocalPlayer.Character.Detain.RemoteEvent:FireServer("Cuff", npcRootPart)
                        task.wait(waitTime)
                        player.Character:SetPrimaryPartCFrame(CFrame.new(teleportPosition))
                        task.wait(waitTime)
                        humanoid.WalkSpeed = walkSpeed
                        humanoidRootPart.CollisionGroupId = 2
                        task.wait(waitTime)
                        activateProximityPromptsInFolder(npc)
                    end
                end
            end
        end
    end
end


while true do
    prioritizeNPCs()
    task.wait(waitTime)
end
