local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local Win = Lib:NewWindow("Netflix NextWorld v1")
local Sec = Win:NewSection("Options")
local Sec2 = Win:NewSection("Credits: OneCreatorX")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local autoKillMobs = false
local autoCollect = false
local autoTalkNPCs = false
local autoFarmPos = false

function po()
    while autoFarmPos do
        local Po = workspace:WaitForChild("ScriptableObjects"):WaitForChild("Resources"):GetDescendants()
        local nearestPo = nil
        local nearestDistance = math.huge

        for _, po in ipairs(Po) do
            if po:IsA("Part") then
                local distance = (Player.Character.HumanoidRootPart.Position - po.Position).magnitude
                if distance < nearestDistance and autoFarmPos then
                    nearestPo = po
                    nearestDistance = distance
                end
            end
        end

        if nearestPo and autoFarmPos then
            fireproximityprompt(nearestPo.ProximityPrompt)
            repeat
                wait(0.1)
autoFarmPos = false
            until not nearestPo or not nearestPo:FindFirstChild("ProximityPromt")
autoFarmPos = true
        end
    end
end

function h()
    autoFarmPos = not autoFarmPos
if autoFarmPos then
po()
end
end

function hhh()
    autoKillMobs = not autoKillMobs
end

function Tk()
    if autoKillMobs then
        
        local enemies = workspace:WaitForChild("ScriptableObjects"):WaitForChild("Enemies"):GetDescendants()
        
        for _, enemy in ipairs(enemies) do
            if enemy:IsA("Model") and enemy.PrimaryPart then
                game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("FireSlingshot"):FireServer(enemy, 1)
            end
        end
    end
end

function hh()
    autoCollect = not autoCollect
end

function collect()
    if autoCollect then
        
        local player = game.Players.LocalPlayer
        local targetPosition = player.Character.HumanoidRootPart.Position

        for _, drop in ipairs(workspace._DROPS:GetChildren()) do
            if drop:IsA("Model") and drop.PrimaryPart then
                local proximityPrompt = drop.PrimaryPart:FindFirstChildOfClass("ProximityPrompt")
                if proximityPrompt then
                    fireproximityprompt(proximityPrompt)
                end
            end
        end
    end
end

function npcs()
    autoTalkNPCs = not autoTalkNPCs
    local cerca = true
    
    while autoTalkNPCs do
        task.wait()
        local player = game.Players.LocalPlayer

        for _, npc in ipairs(workspace.ScriptableObjects.NPCs:GetChildren()) do
            if npc:IsA("Model") and (npc:FindFirstChild("HumanoidRootPart") or npc:FindFirstChild("RootPart")) then
                local proximityPrompt = npc.PrimaryPart:FindFirstChildOfClass("ProximityPrompt")
                if proximityPrompt then
                    local distance = (player.Character.HumanoidRootPart.Position - npc.PrimaryPart.Position).magnitude
                    if distance < 4 and cerca then
                        fireproximityprompt(proximityPrompt)
                        cerca = false
                    elseif distance > 4 and distance < 5 and not cerca then
                        cerca = true
                    end
                end
            end
        end
    end
end

function copyd()
    copyToClipboard("https://discord.com/invite/23kFrRBSfD")
end

function copyy()
    copyToClipboard("https://youtube.com/@OneCreatorX")
end

function page()
    for i = 1, 100 do
        local args = {
            [1] = "Page",
            [2] = i
        }

        game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("PickUpCollectable"):FireServer(unpack(args))
    end
end

Sec:CreateToggle("Auto Kill Mobs", hhh)
Sec:CreateToggle("Auto Farm Pos", h)
Sec:CreateToggle("Auto Collect Items", hh)
Sec:CreateToggle("Auto Talk to NPCs", npcs)
Sec:CreateButton("Instant Page", page)
Sec2:CreateButton("Copy YouTube Link", copyy)
Sec2:CreateButton("Copy Discord Link", copyd)

game:GetService('Players').LocalPlayer.Idled:Connect(function()
    game:GetService('VirtualUser'):CaptureController()
    game:GetService('VirtualUser'):ClickButton2(Vector2.new())
end)

local args = {
    [1] = "Dustin"
}

game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("FinishTalking"):FireServer(unpack(args))

local args = {[1] = "Quest006"
}

game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("AcceptQuest"):FireServer(unpack(args))


while true do
    wait(0.1)
    pcall(Tk)
    pcall(collect)
end
