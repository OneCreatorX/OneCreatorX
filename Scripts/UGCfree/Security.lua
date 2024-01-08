local player = game.Players.LocalPlayer
local npcFolder = workspace:WaitForChild("NPCs")
local teleportPosition = Vector3.new(178, 4, -190)
local waitTime = 1.3
local walkSpeed = 50
local maxRange = 60

local function activateProximityPromptsExcludingStores()
    while true do
        for _, object in ipairs(workspace:GetDescendants()) do
            if object:IsA("ProximityPrompt") and not object:IsDescendantOf(workspace:WaitForChild("Stores")) then
                fireproximityprompt(object)
            end
        end
        task.wait(0.5)
    end
end

local function equipItem(player, itemName)
    local success, err = pcall(function()
        local backpack = player:FindFirstChild("Backpack")
        if backpack then
            local item = backpack:FindFirstChild(itemName)
            if item then
                item.Parent = player.Character
                local rightHand = player.Character:FindFirstChild("RightHand")
                if rightHand then
                    item:SetPrimaryPartCFrame(rightHand.CFrame)
                end
            end
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

        if not humanoid or not humanoidRootPart then return end

        for _, npc in ipairs(npcFolder:GetChildren()) do
            pcall(function()
                if npc:IsA("Model") and npc.Name ~= "ArmedRobber" and npc.Name ~= "BatRobber" and npc.Name ~= "Robber" then
                    local npcRootPart = npc:FindFirstChild("HumanoidRootPart")
                    if npcRootPart then
                        local distance = (npcRootPart.Position - humanoidRootPart.Position).Magnitude
                        if distance <= maxRange then
                            humanoidRootPart.CFrame = CFrame.new(npcRootPart.Position)
                            task.wait(waitTime)
                            local args = { [1] = "Cuff", [2] = npcRootPart }
                            equipItem(player, "Detain")
                            game.Players.LocalPlayer.Character.Detain.RemoteEvent:FireServer(unpack(args))
                            task.wait(waitTime)
                            player.Character:SetPrimaryPartCFrame(CFrame.new(teleportPosition))
                            task.wait(waitTime)
                            humanoid.WalkSpeed = walkSpeed
                            humanoidRootPart.CollisionGroupId = 2
                            task.wait(waitTime)
                        end
                    end
                end
            end)
        end
    end)
    if not success then
        warn("Error prioritizing NPCs: " .. err)
    end
end

local currentProximityPrompt = nil

local function activateProximityPromptsInFolder(folder)
    for _, object in ipairs(folder:GetDescendants()) do
        if object:IsA("ProximityPrompt") then
            fireproximityprompt(object)
            currentProximityPrompt = object
        end
    end
end

while true do
    prioritizeNPCs()
    task.wait(waitTime)
end
