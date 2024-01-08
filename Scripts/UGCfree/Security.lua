local player = game.Players.LocalPlayer
local npcFolder = workspace:WaitForChild("NPCs")
local teleportPosition = Vector3.new(178, 4, -190)
local waitTime = 1.3
local walkSpeed = 50
local maxRange = 70

local currentProximityPrompt = nil

local function activateProximityPromptsInFolder(folder)
    for _, object in ipairs(folder:GetDescendants()) do
        if object:IsA("ProximityPrompt") then
            pcall(function()
                fireproximityprompt(object)
                currentProximityPrompt = object
            end)
        end
    end
end

local function activateProximityPromptsExcludingStores()
    while true do
        for _, object in ipairs(workspace:GetDescendants()) do
            if object:IsA("ProximityPrompt") and not object:IsDescendantOf(workspace:WaitForChild("Stores")) then
                pcall(function()
                    fireproximityprompt(object)
                    currentProximityPrompt = object
                end)
            end
        end

        task.wait(0.3)
    end
end

spawn(activateProximityPromptsExcludingStores)

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
    local success, err = pcall(function()
        local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
        local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")

        if humanoid and humanoidRootPart then
            for _, npc in ipairs(npcFolder:GetChildren()) do
                if npc:IsA("Model") and not (npc.Name == "ArmedRobber" or npc.Name == "BatRobber" or npc.Name == "Robber") then
                    local npcRootPart = npc:FindFirstChild("HumanoidRootPart")
                    if npcRootPart then
                        local distance = (npcRootPart.Position - humanoidRootPart.Position).Magnitude
                        if distance <= maxRange then
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
    end)
    if not success then
        warn("Error prioritizing NPCs: " .. err)
    end
end

while true do
    prioritizeNPCs()
    task.wait(waitTime)
end
