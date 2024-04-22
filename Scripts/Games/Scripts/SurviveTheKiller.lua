local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local Win = Lib:NewWindow("Survive The Killer v0.1")
local Sec = Win:NewSection("General")
local Ki = Win:NewSection("Killer")
local Su = Win:NewSection("Survivor")
local Sec2 = Win:NewSection("Credits: OneCreatorX")
local Players = game:GetService("Players")
local Humanoid = Players.LocalPlayer.Character
local Player = Players.LocalPlayer
local Humanoid = Player.Character:WaitForChild("Humanoid")

local b = false

local function createNameTag()
    local nameTags = {}

    for _, player in ipairs(game.Players:GetPlayers()) do
        if player.Character then
            local hasKnife = false
            for _, model in ipairs(player.Character:GetChildren()) do
                if model.Name == "Knife" then
                    hasKnife = true
                    break
                end
            end

            local existingNameTag = player.Character:FindFirstChild("NameTag")
            if not existingNameTag then
                local playerPart = player.Character:WaitForChild("HumanoidRootPart")
                local nameColor = Color3.new()

                local billboardGui = Instance.new("BillboardGui")
                billboardGui.Adornee = playerPart
                billboardGui.Size = UDim2.new(0, 200, 0, 40)
                billboardGui.StudsOffset = Vector3.new(0, 3, 0)
                billboardGui.AlwaysOnTop = true
                billboardGui.Name = "NameTag"

                local nameLabel = Instance.new("TextLabel")
                nameLabel.Size = UDim2.new(1, 0, 1, 0)
                nameLabel.BackgroundTransparency = 1
                nameLabel.TextColor3 = nameColor

                local killer = nil
                local playerHumanoid = player.Character:FindFirstChildOfClass("Humanoid")
                for _, otherPlayer in ipairs(game.Players:GetPlayers()) do
                    if otherPlayer ~= player then
                        local otherCharacter = otherPlayer.Character
                        if otherCharacter then
                            local otherHasKnife = false
                            for _, model in ipairs(otherCharacter:GetChildren()) do
                                if model.Name == "Knife" then
                                    otherHasKnife = true
                                    break
                                end
                            end
                            if otherHasKnife then
                                killer = otherCharacter:FindFirstChild("HumanoidRootPart")
                                break
                            end
                        end
                    end
                end

                if hasKnife then
                    nameLabel.Text = "K"
                    nameLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
                else
                    nameLabel.Text = "S"
                    nameLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
                end

                nameLabel.FontSize = Enum.FontSize.Size10
                nameLabel.TextScaled = true
                nameLabel.Parent = billboardGui

                if killer then
                    nameLabel.Text = "K"
                    nameLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
                end

                billboardGui.Parent = playerPart.Parent

                table.insert(nameTags, billboardGui)
            elseif hasKnife then
                if existingNameTag.TextLabel.Text ~= "K" then
                    existingNameTag.TextLabel.Text = "K"
                    existingNameTag.TextLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
                end
            else
                if existingNameTag.TextLabel.Text ~= "S" then
                    existingNameTag.TextLabel.Text = "S"
                    existingNameTag.TextLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
                end
            end
        end
    end

    return nameTags
end

function esp()
    b = not b
    while b do
        createNameTag()
        wait(1)
    end
end

local c = false
function killAura()
    c = not c
    while c do
        if c and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") and Player.Character:FindFirstChild("Knife") then
            local rootPos = Player.Character.HumanoidRootPart.Position
task.wait(0.5)
            for _, player in ipairs(game.Players:GetPlayers()) do
                if player ~= Player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    local targetPos = player.Character.HumanoidRootPart.Position
                    local distance = (rootPos - targetPos).magnitude
                    if distance <= 30 then
                        player.Character.HumanoidRootPart.CFrame = CFrame.new(rootPos)
                    end
                end
            end
        end
        task.wait(0.5)
    end
end

local u = false
function kill()
    u = not u
    while u do
task.wait(0.5)
        if u and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") and Player.Character:FindFirstChild("Knife") then
            local rootPos = Player.Character.HumanoidRootPart.Position
task.wait(0.3)
            for _, player in ipairs(game.Players:GetPlayers()) do
                if player ~= Player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    local targetPos = player.Character.HumanoidRootPart.Position
                    local distance = (rootPos - targetPos).magnitude
                    if distance <= 900 then
                        player.Character.HumanoidRootPart.CFrame = CFrame.new(rootPos)
                    end
                end
            end
        end
end
        task.wait()
end

local j = false 
function curar()
    j = not j
    while j do
        task.wait()
        if j and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") and not Player.Character:FindFirstChild("Knife") and Player.Character.HumanoidRootPart:FindFirstChild("BleedOutHealth") and Player.Character.HumanoidRootPart:FindFirstChild("BleedOutHealth").Enabled == false then
            local rootPos = Player.Character.HumanoidRootPart.Position
            local targetPlayer = nil
            local minDistance = 900
            for _, players in ipairs(game.Players:GetPlayers()) do
                if players ~= Player and players.Character and players.Character:FindFirstChild("HumanoidRootPart") and not players.Character:FindFirstChild("Knife") and players.Character.HumanoidRootPart:FindFirstChild("BleedOutHealth") and players.Character.HumanoidRootPart:FindFirstChild("BleedOutHealth").Enabled then
                    local targetPos = players.Character.HumanoidRootPart.Position
                    local distance = (rootPos - targetPos).magnitude
                    if distance > 5 and distance <= 40 and distance < minDistance then
                        targetPlayer = players
                        minDistance = distance
else
                    end
else
                end
            end
            if targetPlayer then
                targetPlayer.Character:SetPrimaryPartCFrame(CFrame.new(Player.Character.HumanoidRootPart.Position))
            
            end
        end
        task.wait()
    end
end

local x = false 
function Trap()
    x = not x
    while x do
task.wait(1)
for _, item in pairs(workspace:GetChildren()) do
     if  item:IsA("Model") and item.Name == "Trap" then
 item:Destroy()
end
end
        end
end

local d = false 
local isRunning = false
local exitFound = false

function control()
task.wait(30)
if d then
isRunning = true 
else
isRunning = false 
end
end

function Escape()
    while isRunning and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") and not Player.Character:FindFirstChild("Knife") do
        task.wait(1)
        local success, result = pcall(function()
            for _, model in pairs(workspace:GetChildren()) do
                if model:IsA("Model") and model:FindFirstChild("Exits") then
                    exitFound = true
                    isRunning = false
                    while exitFound and d and model.Exits do
                        task.wait(1)
                        local success, result = pcall(function()
                            for _, part in ipairs(model.Exits:GetChildren()) do
                                task.wait(1)
                                if part:IsA("Model") then
                                    local success, result = pcall(function()
                                        for _, partt in ipairs(part.Trigger:GetChildren()) do
                                            if partt.Name == "ExitIcon" then
                                                local triggerPos = partt.Parent.Position
                                                if Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") then
                                                    local distance = (Player.Character.HumanoidRootPart.Position - triggerPos).magnitude
                                                    if distance < 1500 then
                                                        Player.Character:SetPrimaryPartCFrame(CFrame.new(partt.Parent.Parent.Doorway.Door1.Position))
                                                        task.wait(0.3)
                                                        Player.Character:SetPrimaryPartCFrame(CFrame.new(partt.Parent.Parent.Doorway.Door2.Position))
                                                        task.wait(0.3)
                                                        Player.Character:SetPrimaryPartCFrame(CFrame.new(triggerPos))
                                                        exitFound = false
                                                        control()
                                                        break
                                                    else
                                                        exitFound = false
                                                        isRunning = true
                                                    end
                                                else
                                                    exitFound = false
                                                    isRunning = true
                                                end
                                            else
                                                exitFound = false
                                                isRunning = true
                                            end
                                        end
                                    end)
                                    if not success then
                                        exitFound = false
                                                isRunning = true
                                    end
                                else
                                    exitFound = false
                                    isRunning = true
                                end
                            end
                        end)
                        if not success then
                           exitFound = false
                                                isRunning = true 
                        end
                    end
                else
                    exitFound = false
                    isRunning = true
                end
            end
        end)
        if not success then
           exitFound = false
                                                isRunning = true 
        end
        wait(0.5)
    end
end

function Escap()
d = not d
isRunning = not isRunning
Escape()
end

local dd = false 
local isRunningg = false
local exitFoundd = false


function items()
    while isRunningg and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") and not Player.Character:FindFirstChild("Knife") do
        task.wait(1)
        local success, result = pcall(function()
            for _, model in pairs(workspace:GetChildren()) do
                if model:IsA("Model") and model:FindFirstChild("LootSpawns") then
                    exitFoundd = true
                    isRunningg = false
                    while exitFoundd and dd and model:FindFirstChild("LootSpawns") do
                        for _, part in ipairs(model.LootSpawns:GetChildren()) do
                            task.wait()
                            local success, result = pcall(function()
                                if part:IsA("BasePart") then
                                    for _, partt in pairs(part:GetChildren()) do
                                        local success, result = pcall(function()
                                            if partt.Name == "Model" then 
                                                for _, parttt in pairs(partt:GetChildren()) do
                                                    local success, result = pcall(function()
                                                        if parttt:IsA("MeshPart") and parttt.Transparency == 0 then
                                                            local triggerPos = part.Position
                                                            local distance = (Player.Character.HumanoidRootPart.Position - triggerPos).magnitude
                                                            if distance < 100 then
                                                                fireproximityprompt(part.LootProxBlock.LootProximityPrompt)
                                                                exitFoundd = false
                                                                
                                                            else
                                                                exitFoundd = false
                                                                isRunningg = true
                                                            end
                                                        else
                                                            exitFoundd = false
                                                            isRunningg = true
                                                        end
                                                    end)
                                                    if not success then
                                                        exitFoundd = false
                    isRunningg = true
                                                    end
                                                end
                                            else
                                                exitFoundd = false
                                                isRunningg = true
                                            end
                                        end)
                                        if not success then
                                            exitFoundd = false
                    isRunningg = true
                                        end
                                    end
                                else
                                    exitFoundd = false
                                    isRunningg = true
                                end
                            end)
                            if not success then
                                exitFoundd = false
                    isRunningg = true
                            end
                        end
                    end
                else
                    exitFoundd = false
                    isRunningg = true
                end
            end
        end)
        if not success then
            exitFoundd = false
                    isRunningg = true
        end
    end
end

function ite()
    while isRunningg and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") and not Player.Character:FindFirstChild("Knife") do
        task.wait(1)
        local success, result = pcall(function()
            for _, model in pairs(workspace:GetChildren()) do
                if model:IsA("Model") and model:FindFirstChild("LootSpawns") then
                    exitFoundd = true
                    isRunningg = false
                    while exitFoundd and dd and model:FindFirstChild("LootSpawns") do
                        for _, part in ipairs(model.LootSpawns:GetChildren()) do
                            task.wait()
                            local success, result = pcall(function()
                                if part:IsA("BasePart") then
                                    for _, partt in pairs(part:GetChildren()) do
                                        local success, result = pcall(function()
                                            if partt.Name == "Model" then 
                                                for _, parttt in pairs(partt:GetChildren()) do
                                                    local success, result = pcall(function()
                                                        if parttt:IsA("Part") then
                                                            local triggerPos = part.Position
                                                            local distance = (Player.Character.HumanoidRootPart.Position - triggerPos).magnitude
                                                            if distance < 100 then
                                                                fireproximityprompt(part.LootProxBlock.LootProximityPrompt)
                                                                exitFoundd = false
                                                                
                                                            else
                                                                exitFoundd = false
                                                                isRunningg = true
                                                            end
                                                        else
                                                            exitFoundd = false
                                                            isRunningg = true
                                                        end
                                                    end)
                                                    if not success then
                                                        exitFoundd = false
                    isRunningg = true
                                                    end
                                                end
                                            else
                                                exitFoundd = false
                                                isRunningg = true
                                            end
                                        end)
                                        if not success then
                                            exitFoundd = false
                    isRunningg = true
                                        end
                                    end
                                else
                                    exitFoundd = false
                                    isRunningg = true
                                end
                            end)
                            if not success then
                                exitFoundd = false
                    isRunningg = true
                            end
                        end
                    end
                else
                    exitFoundd = false
                    isRunningg = true
                end
            end
        end)
        if not success then
            exitFoundd = false
                    isRunningg = true
        end
    end
end


function item()
dd = not dd
isRunningg = not isRunningg
items()
ite()
end

local aa = false
local aaa = false

function Trapp()
    while aa do
        task.wait(1)
        for _, model in pairs(workspace:GetChildren()) do
            if model:IsA("Model") then
                for _, modell in pairs(model:GetChildren()) do
    task.wait()
                    if modell.Name == "RatTraps" and aaa then
                        modell:Destroy()
                        aaa = false
                        task.wait(1)
                    else
                        if aa then
                           task.wait()
                            aaa = true
                        else
                  task.wait()
                            aaa = false
                        end
                    end
                end
            else
            end
        end
    end
end

function Trappp()
    aa = not aa
    aaa = not aaa
    Trapp()
end

local o = false

function curarse()
    o = not o
    while o do
        task.wait()
        local success, result = pcall(function()
            if o and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") and not Player.Character:FindFirstChild("Knife") and Player.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("BleedOutHealth") and Player.Character.HumanoidRootPart:FindFirstChild("BleedOutHealth").Enabled then
                local rootPos = Player.Character.HumanoidRootPart.Position
                local targetPlayer = nil
                local minDistance = 900
                for _, players in ipairs(game.Players:GetPlayers()) do
                    if players ~= Player and players.Character and players.Character:FindFirstChild("HumanoidRootPart") and not players.Character:FindFirstChild("Knife") and players.Character:FindFirstChild("HumanoidRootPart"):FindFirstChild("BleedOutHealth") and players.Character.HumanoidRootPart:FindFirstChild("BleedOutHealth").Enabled == false then
                        local targetPos = players.Character.HumanoidRootPart.Position
                        local distance = (rootPos - targetPos).magnitude
                        if distance > 3 and distance <= 900 and distance < minDistance then
                            targetPlayer = players
                            minDistance = distance
                        end
                    else
                        targetPlayer = nil
                    end
                end
                if targetPlayer then
                    Player.Character:SetPrimaryPartCFrame(CFrame.new(targetPlayer.Character.HumanoidRootPart.Position))
                else

                end
            else

            end
        end)
        if not success then
            
        end
        task.wait()
    end
end


Sec:CreateToggle("Esp ALL", esp)
Ki:CreateToggle("Kill Aura", killAura)
Ki:CreateToggle("Instant Kill", kill)
Su:CreateToggle("Aura Rescatar (Beta 0.4)", curar)
Su:CreateToggle("No Trap Killer", Trap)
Su:CreateToggle("Auto Escape", Escap)
Su:CreateToggle("Aura Items", item)
Su:CreateToggle("No Trap Map", Trappp)
Su:CreateToggle("Auto Curarse", curarse)
