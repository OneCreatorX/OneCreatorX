local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local Win = Lib:NewWindow("Testing")
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
task.wait(2)
            for _, player in ipairs(game.Players:GetPlayers()) do
                if player ~= Player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    local targetPos = player.Character.HumanoidRootPart.Position
                    local distance = (rootPos - targetPos).magnitude
                    if distance <= 20 then
                        player.Character.HumanoidRootPart.CFrame = CFrame.new(rootPos)
                    end
                end
            end
        end
        task.wait(2)
    end
end

local u = false
function kill()
    u = not u
    while u do
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
    isRunning = not isRunning
    while isRunning and Player.Character and Player.Character:FindFirstChild("HumanoidRootPart") and not Player.Character:FindFirstChild("Knife") do
task.wait(2)
        for _, model in pairs(workspace:GetChildren()) do
            if model:IsA("Model") and model:FindFirstChild("Exits") then
                exitFound = true
                 isRunning = false
                while exitFound and model.Exits do
               task.wait(1)
                    for _, part in ipairs(model.Exits:GetDescendants()) do
task.wait(0.5)
                        if part:IsA("BasePart") and part.Name == "EffectPart" then
                            if part.Transparency == 0 then
                                local triggerPos = part.Parent.Parent.Trigger.Position
                                local distance = (Player.Character.HumanoidRootPart.Position - triggerPos).magnitude
                                if distance < 1000 then
                                    Player.Character.HumanoidRootPart.Position = triggerPos
                                end
                                exitFound = false
                               control()
                                break
                            end
                        end
                    end
                end
            end
        end
        task.wait(1)
    end
end

function Escap()
d = not d
isRunning = not isRunning
end

Sec:CreateToggle("Esp ALL", esp)
Ki:CreateToggle("Kill Aura", killAura)
Ki:CreateToggle("Instant Kill", kill)
Su:CreateToggle("Rescatar (Beta)", curar)
Su:CreateToggle("No Trap Killer", Trap)
Su:CreateToggle("Auto Escape", Escap)
