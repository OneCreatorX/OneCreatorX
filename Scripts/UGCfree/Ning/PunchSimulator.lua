local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local Win = Lib:NewWindow(gameName)
local Sec = Win:NewSection("Options")
local Sec2 = Win:NewSection("Credits: OneCreatorX")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")

local function copyToClipboard(text)
    if syn then
        syn.write_clipboard(text)
    else
        setclipboard(text)
    end
end

local function sendNotification(title, text, duration)
    game.StarterGui:SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = duration
    })
end

local running = false
local world = ""

local function startOpeningEggs(world)
    running = true
    
    while running do
        local args = {
            [1] = tostring(world)
        }

        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("PlayerPressedKeyOnEgg"):FireServer(unpack(args))

        wait(0.5)
    end
end

Sec:CreateTextbox("Egg-number world or 'stop'", function(value)
    if value == "" or value:lower() == "stop" then
        running = false
        sendNotification("Stop Open Egg", "Egg opening stopped", 5)
        return
    end

    local newWorld = tonumber(value)
    if newWorld then
        world = newWorld
        running = false
        sendNotification("Open Egg", "Starting to open eggs in world: " .. world, 5)
        wait(0.1)
        startOpeningEggs(world)
    else
        -- handle invalid input
    end
end)

Sec:CreateButton("Disabled/Enabled Animation", function()
    local handler = game.Players.LocalPlayer.PlayerScripts:FindFirstChild("PlayerPetHandler")
    if handler then
        handler.Disabled = not handler.Disabled
        
        local status = handler.Disabled and "Disabled" or "Enabled"
        sendNotification("Animation Egg", "State changed to: " .. status, 5)
    end
end)

local ah = false
Sec:CreateToggle("Auto Fast Train", function()
    ah = not ah
    while ah do
        wait()
        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("DamageIncreaseOnClickEvent"):FireServer()
    end
end)

local function copyd()
    copyToClipboard("https://discord.com/invite/23kFrRBSfD")
end

local function copyy()
    copyToClipboard("https://youtube.com/@OneCreatorX")
end

game.Players.LocalPlayer.PlayerScripts.DeathEffectsHandler.Disabled = true
         game.Players.LocalPlayer.PlayerScripts.CameraHandler.Disabled = true

Sec2:CreateButton("Copy Link YouTube", copyy)
Sec2:CreateButton("Copy Link Discord", copyd)

local arg2, arg3 = 1, 1
local ja = false
local function ah()
    wait(0.1)
if ja then
       
    local args = {[1] = true}
    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("PushEvent"):FireServer(unpack(args))
    wait(0.8)
   Player.Character.HumanoidRootPart.CFrame = workspace.BreakableParts["Stage" .. arg2][arg3].PrimaryPart.CFrame
end
end

Sec:CreateToggle("Fast Auto Fight", function()
    ja = not ja
if not ja then
local args = {
    [1] = "StopFight"
}

game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("AutoFight"):FireServer(unpack(args))
else
sendNotification("Use Auto Fight", "Button Game for farm", 5)
end
end)


local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Events = ReplicatedStorage:WaitForChild("Events")
local AutoFight = Events:WaitForChild("AutoFight")
local originalFireServer = AutoFight.FireServer

local function newFireServer(self, ...)
    local args = {...}
    arg2 = args[2]
    arg3 = args[3]
    
    if args[1] == "StopFight" then
        return originalFireServer(self, unpack(args))
    else
        spawn(ah)
        return originalFireServer(self, unpack(args))
    end
end

local mt = getrawmetatable(game)
local oldNamecall = mt.__namecall
setreadonly(mt, false)

mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    if method == "FireServer" and self == AutoFight then
        return newFireServer(self, ...)
    end
    return oldNamecall(self, ...)
end)

setreadonly(mt, true)




local walkSpeed = 40
local safeDistance = 9
local attackDistance = 9
local remoteEvent = game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("PunchEvent")

local function findClosestNPC()
local character = Player.Character or Player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    local closestNPC = nil
    local closestDistance = math.huge

    for _, NPC in pairs(workspace.BreakableParts.Dungeon:GetChildren()) do
        if NPC:IsA("Model") and NPC.PrimaryPart then
            local distance = (NPC.PrimaryPart.Position - humanoidRootPart.Position).Magnitude
            if distance < closestDistance then
                closestDistance = distance
                closestNPC = NPC
            end
        end
    end

    return closestNPC
end

local function attackAndMove()
    local success, err = pcall(function()
 local character = Player.Character or Player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
        local closestNPC = findClosestNPC()
        if closestNPC then
            local direction = (closestNPC.PrimaryPart.Position - humanoidRootPart.Position).unit
            local newPosition = humanoidRootPart.Position + direction * math.min((closestNPC.PrimaryPart.Position - humanoidRootPart.Position).Magnitude - attackDistance, safeDistance - 1)

            character:MoveTo(newPosition)
            

            remoteEvent:FireServer(closestNPC)
        else
            
        end
    end)
    if not success then
        
    end
end

local a = false

local limite = 1000


Sec:CreateTextbox("Number Limite Wave", function(userInput)
    limite = tonumber(userInput)
    if limite then
        sendNotification("Wave limit appl", "Max limit waves: " .. limite, 5)
    else
        sendNotification("Error", "Invalid input for wave limit", 5)
    end
end)

local function startNewDungeon()
    if a then
        wait(2)
        local args = {
            [1] = "StartDungeon"
        }

        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("DungeonEvent"):FireServer(unpack(args))
    end
end

function Start()
    a = not a
    if a then
        local args = {
            [1] = "StartDungeon"
        }

        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("DungeonEvent"):FireServer(unpack(args))
    
    else
        local args = {
            [1] = "Exit"
        }

        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("DungeonEvent"):FireServer(unpack(args))
wait(1)
Player.PlayerGui.DungeonFinishUI.Enabled = true
    end
end

Sec:CreateToggle("Start - Auto: Dungeon", function()
    Start()
end)

local targetRemoteEventName = "PartyEvent"
local PartyEvent = ReplicatedStorage:WaitForChild("Events"):WaitForChild(targetRemoteEventName)

local mt = getrawmetatable(game)
local oldNamecall = mt.__namecall
setreadonly(mt, false)

mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    if method == "FireServer" and self.Name == targetRemoteEventName then
        spawn(startNewDungeon)
        return oldNamecall(self, ...)
    end
    return oldNamecall(self, ...)
end)

setreadonly(mt, true)

while true do
    local maxText = Player.PlayerGui.DungeonMain.Frame.Wave.WaveNumber.Text
    
    local max = tonumber(maxText:match("%d+"))
    if a then
        if a and max and max <= limite then
            attackAndMove()
       wait()
        elseif a and max and max >= limite and workspace:FindFirstChild("Dungeon") then
            local args = {
                [1] = "Exit"
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("DungeonEvent"):FireServer(unpack(args))
wait(2)
        elseif a and not workspace:FindFirstChild("Dungeon") then
wait(0.8)
            local args = {
    [1] = "LeaveParty"
}

game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("PartyEvent"):FireServer(unpack(args))
Player.PlayerGui.DungeonFinishUI.Enabled = false
wait(1)
        else
        end
    else
wait(0.1)
        -- nada
    end
end
