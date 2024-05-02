local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local Win = Lib:NewWindow("Collect For UGC v9")
local Sec = Win:NewSection("Options")
local Sec2 = Win:NewSection("Credits: OneCreatorX")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local b = false
local speed = 68

local RS = game:GetService("RunService")
local WS = game:GetService("Workspace")

local function moveHearts()
    local player = game.Players.LocalPlayer
    local PPos = player.Character.HumanoidRootPart.Position
    local Hearts = WS.Map.Interactable:GetDescendants()
    local function calculateVelocity(targetPosition, speed)
        local direction = (targetPosition - PPos).unit
        return direction * speed
    end

    local function collectHeart(heartPart)
        local HPos = Vector3.new(heartPart.Position.X, PPos.Y, heartPart.Position.Z)
        local dist = (HPos - PPos).magnitude
        if dist < 5 then
            heartPart.Transparency = 1
            heartPart.Position = PPos
        end
    end

    if b then
        local minDist = math.huge
        local closestHeart = nil

        for _, H in ipairs(Hearts) do

            if H:IsA("MeshPart") and H.Transparency ~= 1 then
                local HPos = Vector3.new(H.Position.X, PPos.Y, H.Position.Z)
                local dist = (HPos - PPos).magnitude
                if dist < 5 then
                    collectHeart(H)
                elseif dist < minDist then
                    minDist = dist
                    closestHeart = H
                end
            end
        end

        if closestHeart then
            local heartPart = closestHeart
            local targetPosition = heartPart.Position
            local velocity = calculateVelocity(targetPosition, speed)
            
player.Character.HumanoidRootPart.Velocity = velocity
            repeat
wait()
                collectHeart(heartPart)
            until not closestHeart.Parent or player:DistanceFromCharacter(targetPosition) < 3
            if not closestHeart.Parent then
else
            end
        else
            wait()
        end
    end
end

function has()
    b = not b
end


function copyd()
    copyToClipboard("https://discord.com/invite/23kFrRBSfD")
end

function copyy()
    copyToClipboard("https://youtube.com/@OneCreatorX")
end

workspace.Camera.FieldOfView = 100

for _, f in ipairs(workspace.Map.Terrain:GetDescendants()) do
    if f.Name ~= "Main" and f.Name ~= "islandTop" then
        f:Destroy()
    end
end

local parent = workspace.Map.Terrain.Main
workspace.Map.Terrain.Main.islandTop.Transparency = 1
local AC = Instance.new("Part")
AC.Size = Vector3.new(522.132, 34.9476, 611.233)
AC.Anchored = true
AC.CanCollide = false
AC.Shape = Enum.PartType.Cylinder
AC.Transparency = 0
AC.Color = Color3.new(0, 0, 0)
AC.Parent = parent
AC.Position = Vector3.new(-14.8902, -7.86472, 13.5819)

local skyID = "rbxassetid://15189831814"

game.Lighting.Sky.SkyboxBk = skyID
game.Lighting.Sky.SkyboxDn = skyID
game.Lighting.Sky.SkyboxFt = skyID
game.Lighting.Sky.SkyboxLf = skyID
game.Lighting.Sky.SkyboxRt = skyID
game.Lighting.Sky.SkyboxUp = skyID
local CircleMesh = Instance.new("SpecialMesh")
CircleMesh.MeshType = Enum.MeshType.Cylinder 
CircleMesh.Scale = Vector3.new(522.132, 34.9476, 611.233)
CircleMesh.Parent = AC
CircleMesh.TextureId = skyID

game:GetService("RunService").RenderStepped:Connect(moveHearts)

local da = false
function save()
da = not da
while da do
if game.ReplicatedStorage.Events:FindFirstChild("saveHearts") then
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("saveHearts"):FireServer()
wait(10)
else
local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("SendNotification", {
            Title = "Server No Support",
            Text = "Server Desactualizado",
            Duration = 10,
        })
da = false
break
end
end
end

Sec:CreateToggle("Auto Hearts", has)
Sec:CreateToggle("Auto Save Heart", save)
Sec2:CreateButton("Copy Link YouTube", copyy)
Sec2:CreateButton("Copy Link Discord", copyd)

game:GetService('Players').LocalPlayer.Idled:Connect(function()
game:GetService('VirtualUser'):CaptureController()   game:GetService('VirtualUser'):ClickButton2(Vector2.new())
end)

Sec:CreateTextbox("Speed Auto Hears 70", function(value)
             speed = value
end)

Sec:CreateTextbox("ID Texture", function(value)
        local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("SendNotification", {
            Title = "UseID Image: 12345",
            Text = "Is Roblox Image - No URL",
            Duration = 10,
        })
        
    skyID = "rbxassetid://" .. value
    game.Lighting.Sky.SkyboxBk = skyID
    game.Lighting.Sky.SkyboxDn = skyID
    game.Lighting.Sky.SkyboxFt = skyID
    game.Lighting.Sky.SkyboxLf = skyID
    game.Lighting.Sky.SkyboxRt = skyID
    game.Lighting.Sky.SkyboxUp = skyID
    CircleMesh.TextureId = skyID
end)
 
local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("SendNotification", {
            Title = "No Use Character low",
            Text = "No uses personaje bajito",
            Duration = 10,
        })

local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("SendNotification", {
            Title = "better more high",
            Text = "Mejor si es alto",
            Duration = 10,
    })
