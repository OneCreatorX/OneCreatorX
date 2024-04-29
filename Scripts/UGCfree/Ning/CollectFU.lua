local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local Win = Lib:NewWindow("Collect For UGC v2")
local Sec = Win:NewSection("Options")
local Sec2 = Win:NewSection("Credits: OneCreatorX")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local walking = false
local b = false
local speed = 120

local RS = game:GetService("RunService")
local WS = game:GetService("Workspace")

local RunService = game:GetService("RunService")

local pts = {
    Vector3.new(-131, 13, 215),
    Vector3.new(40, 13, 210),
    Vector3.new(112, 13, 212),
    Vector3.new(123, 13, 126),
    Vector3.new(115, 13, -149),
    Vector3.new(-10, 13, -218),
    Vector3.new(-112, 13, -190),
    Vector3.new(-198, 13, -76)
}

local function caminarPosiciones()
    local player = game.Players.LocalPlayer 
    walking = not walking
    
    while walking do
        for i = 1, #pts do
            if not walking then
                break
            end
            
            local targetPosition = pts[i]
            local direction = (targetPosition - player.Character.HumanoidRootPart.Position).unit
            
            repeat
local velocity = direction * speed

                player.Character.HumanoidRootPart.Velocity = velocity
                wait(0.1)
            until (targetPosition - player.Character.HumanoidRootPart.Position).magnitude < 9 or not walking

            player.Character.HumanoidRootPart.Velocity = Vector3.new() 
            
            wait(0.1)
        end
    end
end


local function moveHearts()
    if b then
        local PPos = Player.Character.HumanoidRootPart.Position
        local Hearts = WS.Map.Interactable.Hearts:GetChildren()
        
        for _, H in ipairs(Hearts) do
            local dist = (H.Position - PPos).Magnitude
            if dist < 75 then
                H.Transparency = 1
                H.Position = PPos
            end
        end
    end
    
    if b then
        local PPos = Player.Character.HumanoidRootPart.Position
        local Heart = WS.Map.Interactable.rareHearts:GetChildren()
        
        for _, H in ipairs(Heart) do
            if H:IsA("Model") then
      local player = game.Players.LocalPlayer 
                walking = false
                local heartPart = H.Heart
                local targetPosition = heartPart.Position
                player.Character.Humanoid:MoveTo(targetPosition) 
                
                repeat
                    wait()
                    local dist = (heartPart.Position - PPos).Magnitude
                    if dist < 75 then
                        heartPart.Transparency = 1
                        heartPart.Position = PPos
                    end
                until player:DistanceFromCharacter(targetPosition) < 50 or not H.Parent
                
                caminarPosiciones()
                wait() 
            end
        end
    end
end

local AC = Instance.new("Part")
AC.Size = Vector3.new(145, 0.1, 145)
AC.Anchored = true
AC.CanCollide = false
AC.Shape = Enum.PartType.Cylinder
AC.Transparency = 0.3
AC.Color = Color3.new(0, 0, 0)
AC.Parent = WS

local CircleMesh = Instance.new("SpecialMesh")
CircleMesh.MeshType = Enum.MeshType.Cylinder 
CircleMesh.Scale = Vector3.new(135, 0.1, 135)
CircleMesh.Parent = AC
CircleMesh.TextureId = "rbxassetid://15189831814"

local function updateAuraCircle()
    if Player.Character and b then
        local PPos = Player.Character.HumanoidRootPart.Position
        AC.Position = Vector3.new(PPos.X, PPos.Y - Player.Character.HumanoidRootPart.Size.Y / 1, PPos.Z)
    end
end

local function toggleAuraHearts()
    b = not b
end

Sec:CreateToggle("Auto Walk", caminarPosiciones)

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

Sec:CreateToggle("Aura Hearts", toggleAuraHearts)
Sec2:CreateButton("Copy Link YouTube", copyy)
Sec2:CreateButton("Copy Link Discord", copyd)

game:GetService('Players').LocalPlayer.Idled:Connect(function()
game:GetService('VirtualUser'):CaptureController()   game:GetService('VirtualUser'):ClickButton2(Vector2.new())
end)

Sec:CreateTextbox("Speed", function(value)
        speed = value
        
end)
