local UL = loadstring(game:HttpGet("https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/UIs/MyLibrery.lua"))()

local gameName = ""
if gameName == "" then
    gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
end

local function cleanGameName(name)
    name = name:gsub("%b[]", "")
    name = name:match("^[^:]*")
    return name:match("^%s*(.-)%s*$")
end

gameName = cleanGameName(gameName)

local p = game.Players.LocalPlayer
local sg = UL:CrSG("Defauld")
local frm, cfrm, crFrm = UL:CrFrm(sg, gameName)

local function copy(text)
    if syn then
        syn.write_clipboard(text)
    else
        setclipboard(text)
    end
end

local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local StarterGui = game:GetService("StarterGui")
local RunService = game:GetService("RunService")

local function sendNotification(title, text, duration)
    game.StarterGui:SetCore("SendNotification", {
        Title = title,
        Text = text,
        Duration = duration
    })
end
local OP, OF = UL:AddOBtn(cfrm, "Options Items >")

local sendCount = nil

UL:AddTBox(OF, "Item Purchase Multiplier: 1", function(text)
    local input = tonumber(text)
    if input and input > 0 then
        sendCount = input
        
    else
        sendCount = nil
        
    end
end)

local enviarAlServidor = false

local function getFullName(instance)
    return instance:GetFullName()
end

local function tableToString(t, indent)
    indent = indent or 0
    local result = "{\n"
    local padding = string.rep(" ", indent + 2)
    for k, v in pairs(t) do
        if typeof(v) == "Instance" then
            result = result .. padding .. tostring(k) .. " = " .. getFullName(v) .. ",\n"
        elseif type(v) == "table" then
            result = result .. padding .. tostring(k) .. " = " .. tableToString(v, indent + 2) .. ",\n"
        else
            result = result .. padding .. tostring(k) .. " = " .. tostring(v) .. ",\n"
        end
    end
    return result .. string.rep(" ", indent) .. "}"
end

local function decryptArguments(...)
    local decryptedArgs = {}
    for _, arg in ipairs({...}) do
        if type(arg) == "table" then
            decryptedArgs[#decryptedArgs + 1] = tableToString(arg)
        elseif typeof(arg) == "Instance" then
            decryptedArgs[#decryptedArgs + 1] = getFullName(arg)
        else
            decryptedArgs[#decryptedArgs + 1] = tostring(arg)
        end
    end
    return decryptedArgs
end

local remote = game.ReplicatedStorage:WaitForChild("Events"):WaitForChild("GenerateEquipment")
local mergeRemote = game.ReplicatedStorage:WaitForChild("Events"):WaitForChild("PlayerMergeEquipment")

remote.OnClientEvent:Connect(function(...)
    if enviarAlServidor then 
        local args = {...}
        local decryptedArgs = decryptArguments(...)

        local groupedItems = {}
        for _, arg in ipairs(args) do
            if type(arg) == "table" then
                for id, item in pairs(arg) do
                    if type(item) == "table" and item.equipped == false and item.rarity ~= "Demonic" then
                        local key = item.name .. "_" .. item.rarity
                        if not groupedItems[key] then
                            groupedItems[key] = {}
                        end
                        table.insert(groupedItems[key], {id = id, item = item})
                    end
                end
            end
        end

        for key, items in pairs(groupedItems) do
            if #items >= 3 then
                local idsToSend = {tostring(items[1].id), tostring(items[2].id), tostring(items[3].id)}
                local args = {[1] = idsToSend}
                
                mergeRemote:FireServer(unpack(args))
            end
        end
    end
end)

UL:AddTBtn(OF, "Auto Merge Items", false, function()
    enviarAlServidor = not enviarAlServidor
end)


local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Events = ReplicatedStorage:WaitForChild("Events")
local CraftingEvent = Events:WaitForChild("CraftingEvent")

local isCallingFireServer = false

local function nuevaFuncionFireServer(...)
    local args = {...}
    isCallingFireServer = true
    if sendCount and sendCount > 0 then
        for i = 1, sendCount do
            CraftingEvent:FireServer(unpack(args))
        end
    else
        CraftingEvent:FireServer(unpack(args))
    end
    isCallingFireServer = false
end

local mt = getrawmetatable(game)
local oldNamecall = mt.__namecall
setreadonly(mt, false)

mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    local args = {...}
    if method == "FireServer" and self == CraftingEvent and not isCallingFireServer then
        spawn(function()
            nuevaFuncionFireServer(unpack(args))
        end)
        return oldNamecall(self, unpack(args))
    end
    return oldNamecall(self, unpack(args))
end)

setreadonly(mt, true)

local running = false
local world = ""

local function startOpeningEggs(world)
    running = true
    
    while running do
        local args = {
            [1] = tostring(world)
        }

        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("PlayerPressedKeyOnEgg"):FireServer(unpack(args))

        wait(0.3)
    end
end

game.Players.LocalPlayer.PlayerScripts:FindFirstChild("PlayerPetHandler").Enabled = false
sendNotification("Animation Egg Oppen", "Desabled Default", 5)

UL:AddTBox(cfrm, "Auto Egg-number world or 'stop", function(value) 
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

local ah = false
UL:AddTBtn(cfrm, "Auto Fast Train", false, function(state)
    ah = not ah
    while ah do
        wait()
        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("DamageIncreaseOnClickEvent"):FireServer()
        end
    end)


game.Players.LocalPlayer.PlayerScripts.DeathEffectsHandler.Disabled = true
         game.Players.LocalPlayer.PlayerScripts.CameraHandler.Disabled = true

UL:AddText(crFrm, "By Script: OneCreatorX ")
UL:AddText(crFrm, "Create Script: 20/05/24 ")
UL:AddText(crFrm, "Update Script: 30/05/24")
UL:AddText(crFrm, "Script Version: 0.4")
UL:AddBtn(crFrm, "Copy link YouTube", function() copy("https://youtube.com/@onecreatorx") end)
UL:AddBtn(crFrm, "Copy link Discord", function() copy("https://discord.com/invite/UNJpdJx7c4") end)



local arg2, arg3 = 1, 1
local ja = false
local function ah()
    wait(0.1)
if ja then
       
    local args = {[1] = true}
    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("PushEvent"):FireServer(unpack(args))
    wait(0.8)
   game.Players.LocalPlayer.Character:MoveTo(workspace.BreakableParts["Stage" .. arg2][arg3]:GetModelCFrame().Position)
end
end


UL:AddTBtn(cfrm, "Fast Auto Fight", false, function() 
ja = not ja
if not ja then
local args = {
    [1] = "StopFight"
}

game:GetService("ReplicatedStorage"):WaitForChild("dEvents"):WaitForChild("AutoFight"):FireServer(unpack(args))
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

UL:AddTBox(cfrm, "Number Limite Wave", function(userInput) 
    if userInput == "" then
        limite = 1000
        sendNotification("Wave limit appl", "Max limit waves: " .. limite, 5)
    else
        limite = tonumber(userInput)
        if limite then
            sendNotification("Wave limit appl", "Max limit waves: " .. limite, 5)
        else
            sendNotification("Error", "Invalid input for wave limit", 5)
        end
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

UL:AddTBtn(cfrm, "Start - Auto: Dungeon", false, function(state) 
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


local function onPlayerDeath()
    wait(0.8)
    local args = { [1] = "LeaveParty" }
    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("PartyEvent"):FireServer(unpack(args))
    Player.PlayerGui.DungeonFinishUI.Enabled = false
    wait(1)
end

-- Función para monitorear la salud del Humanoid del jugador
local function monitorPlayerHealth(humanoid)
    humanoid.HealthChanged:Connect(function(health)
        if health <= 0 then
            onPlayerDeath()
        end
    end)
end

-- Función para configurar el monitoreo del personaje del jugador
local function setupCharacterMonitoring(player)
    player.CharacterAdded:Connect(function(character)
        local humanoid = character:WaitForChild("Humanoid")
        monitorPlayerHealth(humanoid)
    end)

    -- Si el personaje ya está cargado cuando se inicia el script
    if player.Character then
        local humanoid = player.Character:WaitForChild("Humanoid")
        monitorPlayerHealth(humanoid)
    end
end

-- Configurar el monitoreo del personaje del jugador
local player = game.Players.LocalPlayer
setupCharacterMonitoring(player)


while true do
    local maxText = Player.PlayerGui.DungeonMain.Frame.Wave.WaveNumber.Text
    local max = tonumber(maxText:match("%d+"))
    
    if a then
        if limite ~= nil and max and max <= limite then
            attackAndMove()
            wait()
        elseif limite ~= nil and max and max >= limite and workspace:FindFirstChild("Dungeon") then
            local args = { [1] = "Exit" }
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("DungeonEvent"):FireServer(unpack(args))
            wait(2)
        elseif limite ~= nil and not workspace:FindFirstChild("Dungeon") then
            wait(0.8)
            local args = { [1] = "LeaveParty" }
            game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("PartyEvent"):FireServer(unpack(args))
            Player.PlayerGui.DungeonFinishUI.Enabled = false
            wait(1)
        else
            wait(0.1)
            -- no hacer nada
        end
    else
        wait(0.1)
        -- no hacer nada
    end
end
