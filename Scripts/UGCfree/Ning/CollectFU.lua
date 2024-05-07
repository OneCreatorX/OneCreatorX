local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local Win = Lib:NewWindow("Collect For UGC")
local Sec = Win:NewSection("Options")
local Sec3 = Win:NewSection("Info Script")
local Sec2 = Win:NewSection("Credits: OneCreatorX")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local b = false
local speed = 68
local ya = false

local RS = game:GetService("RunService")
local WS = game:GetService("Workspace")

local function copyToClipboard(text)
    if syn then
        syn.write_clipboard(text)
    else
        setclipboard(text)
    end
end

local function moveHearts()
    local player = game.Players.LocalPlayer
    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and b then
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
            until not closestHeart.Parent or player:DistanceFromCharacter(targetPosition) < 5
            
            if not closestHeart.Parent then
            end
        else
            wait()
        end
    end
end

game:GetService("RunService").RenderStepped:Connect(function()
    pcall(moveHearts)
end)

function has()
    b = not b
  ya = not ya
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

local da = false
function save()
da = not da
while da do
if game.ReplicatedStorage.Events:FindFirstChild("saveHearts") and da then
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("saveHearts"):FireServer()
wait(10)
elseif da then
local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("SendNotification", {
            Title = "Server No Support",
            Text = "Server Desactualizado",
            Duration = 10,
        })
break
else
end
end
end


function sa()
end

Sec:CreateToggle("Auto Hearts", has)
Sec:CreateToggle("Auto Save Heart", save)
Sec3:CreateButton("Versión 14", sa)
Sec3:CreateButton("Update: 07-05-24", sa)
Sec3:CreateButton("System 95% + Safe", sa)
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
            Duration = 5,
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
            Title = "New System Better",
            Text = "Anti Delete Hearts(95% safe)",
            Duration = 10,
        })

local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("SendNotification", {
            Title = "Testing New system ",
            Text = "Reset Character Teste",
            Duration = 10,
        })

local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("SendNotification", {
            Title = "much Time AFK +4 hs",
            Text = "maybe 55 - 60 avoid (baibai)",
            Duration = 5,
        })

local player = game.Players.LocalPlayer

local function onLongFall()
    local StarterGui = game:GetService("StarterGui")
    StarterGui:SetCore("SendNotification", {
        Title = "WARN WARN WARN",
        Text = "Auto Stop ACTIVE",
        Duration = 3,
    })
    b = false
    player.Character.Humanoid.Health = 0
end


local function onCharacterAdded()
if ya then
local StarterGui = game:GetService("StarterGui")
    StarterGui:SetCore("SendNotification", {
        Title = "Auto Start ",
        Text = "u are safe, by OneCreatorX",
        Duration = 5,
    })
    b = true
else

local StarterGui = game:GetService("StarterGui")
    StarterGui:SetCore("SendNotification", {
        Title = "Anti dectect Ready",
        Text = "u are safe, by OneCreatorX",
        Duration = 5,
    })
end
end

local function checkFreefall()
    if player.Character.Humanoid:GetState() == Enum.HumanoidStateType.Freefall then
        wait(3)
        if player.Character.Humanoid:GetState() == Enum.HumanoidStateType.Freefall then
            onLongFall()
        end
    end
end

player.Character.Humanoid.StateChanged:Connect(function(oldState, newState)
    if newState == Enum.HumanoidStateType.Freefall then
        checkFreefall()
    else

    end
end)

player.ChildAdded:Connect(function(child)
    task.wait(1)
    onCharacterAdded()
player.Character.Humanoid.StateChanged:Connect(function(oldState, newState)
    if newState == Enum.HumanoidStateType.Freefall then
        checkFreefall()
    else

    end
end)

end)
