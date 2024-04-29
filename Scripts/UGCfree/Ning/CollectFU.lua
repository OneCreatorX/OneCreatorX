local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local Win = Lib:NewWindow("Collect For UGC v5")
local Sec = Win:NewSection("Options")
local Sec2 = Win:NewSection("Credits: OneCreatorX")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local walking = false
local b = false
local speed = 75

local RS = game:GetService("RunService")
local WS = game:GetService("Workspace")

local function moveHearts()
    local player = game.Players.LocalPlayer
    local PPos = player.Character.HumanoidRootPart.Position
    local Hearts = WS.Map.Interactable: GetDescendants()
    local function calculateVelocity(targetPosition, speed)
        local direction = (targetPosition - PPos).unit
        return direction * speed
    end

    local function collectHeart(heartPart)
        local HPos = Vector3.new(heartPart.Position.X, PPos.Y, heartPart.Position.Z)
        local dist = (HPos - PPos).magnitude
        if dist < 14 then
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
                if dist < 14 then
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
                wait(0.1)
                collectHeart(heartPart)
            until not closestHeart.Parent or player:DistanceFromCharacter(targetPosition) < 5

            if not closestHeart.Parent then
                moveHearts() 
            end
        else
            wait(0.1)
        end
    end
end

function has()
b = not b
if b then 
moveHearts()
end
end

local AC = Instance.new("Part")
AC.Size = Vector3.new(0, 0.1, 0)
AC.Anchored = true
AC.CanCollide = false
AC.Shape = Enum.PartType.Cylinder
AC.Transparency = 0.5
AC.Color = Color3.new(0, 0, 0)
AC.Parent = WS

local CircleMesh = Instance.new("SpecialMesh")
CircleMesh.MeshType = Enum.MeshType.Cylinder 
CircleMesh.Scale = Vector3.new(25, 0.1, 25)
CircleMesh.Parent = AC
CircleMesh.TextureId = "rbxassetid://15189831814"

local function updateAuraCircle()
    if Player.Character and b then
        local PPos = Player.Character.HumanoidRootPart.Position
        AC.Position = Vector3.new(PPos.X, PPos.Y - Player.Character.HumanoidRootPart.Size.Y / 1, PPos.Z)
    end
end

function copyd()
    copyToClipboard("https://discord.com/invite/23kFrRBSfD")
end

function copyy()
    copyToClipboard("https://youtube.com/@OneCreatorX")
end

workspace.Camera.FieldOfView = 100

for _, f in ipairs(workspace.Map.Terrain:GetChildren()) do
    if f.Name ~= "Main" then
        f:Destroy()
    end
end

RS.Heartbeat:Connect(updateAuraCircle)
RS.Heartbeat:Connect(moveHearts)

Sec:CreateToggle("Auto Hears", has)
Sec2:CreateButton("Copy Link YouTube", copyy)
Sec2:CreateButton("Copy Link Discord", copyd)

game:GetService('Players').LocalPlayer.Idled:Connect(function()
game:GetService('VirtualUser'):CaptureController()   game:GetService('VirtualUser'):ClickButton2(Vector2.new())
end)

Sec:CreateTextbox("Speed Auto Hears 75", function(value)
        speed = value
        
end)
