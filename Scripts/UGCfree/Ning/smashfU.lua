local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local Win = Lib:NewWindow("Smash Bugs For UGC")
local Sec = Win:NewSection("Options")
local Sec3 = Win:NewSection("Info Script")
local Sec2 = Win:NewSection("Credits: OneCreatorX")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local speed
local b = false

function hh()
b = not b
end

local function copyToClipboard(text)
    if syn then
        syn.write_clipboard(text)
    else
        setclipboard(text)
    end
end

function speede()
Players.LocalPlayer.Character.Humanoid.WalkSpeed = speed
end

local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Knit = ReplicatedStorage:WaitForChild("Packages"):WaitForChild("Knit")
local SwatterService = Knit:WaitForChild("Services"):WaitForChild("SwatterService")
local RF = SwatterService:WaitForChild("RF")
local Players = game:GetService("Players")

local function hitRandomBugs()
    local localPlayer = Players.LocalPlayer
    if b and not localPlayer or not localPlayer.Character then return end
    
    local bugsFolder = workspace:WaitForChild("Bugs")
    local allBugs = bugsFolder:GetChildren()

    local nearbyBugs = {}
    local playerPosition = localPlayer.Character.PrimaryPart.Position
    
    for _, bug in ipairs(allBugs) do
        if bug.PrimaryPart then
            local bugPosition = bug.PrimaryPart.Position
            local distance = (bugPosition - playerPosition).magnitude
            if distance <= 100 and b then
                table.insert(nearbyBugs, bug)
            end
        end
    end

    RF:WaitForChild("Swing"):InvokeServer()

    RF:WaitForChild("Hit"):InvokeServer(unpack({nearbyBugs}))
end

function copyd()
    copyToClipboard("https://discord.com/invite/23kFrRBSfD")
end

function copyy()
    copyToClipboard("https://youtube.com/@OneCreatorX")
end

function sa()
end


local function movePlayerToBugPosition()
    local bugsFolder = workspace:FindFirstChild("Bugs")
    if not bugsFolder then return end 

    local allBugs = bugsFolder:GetChildren()

    local player = game.Players.LocalPlayer
    local humanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then return end 

    local playerPosition = humanoidRootPart.Position

    for _, bug in ipairs(allBugs) do
        if bug.PrimaryPart then
            local bugPosition = bug.PrimaryPart.Position
            local newPosition = Vector3.new(bugPosition.X, playerPosition.Y, bugPosition.Z) 
            humanoidRootPart.CFrame = CFrame.new(newPosition)
            break
        end
    end
end

local taa = false

function tpp()
taa = not taa
while taa do
wait(0.1)
movePlayerToBugPosition()
end
end

Sec3:CreateButton("Update 05/05/24", sa)
Sec3:CreateButton("Version 1.7", sa)
Sec2:CreateButton("Copy Link YouTube", copyy)
Sec2:CreateButton("Copy Link Discord", copyd)
Sec:CreateToggle("Kill Aura", hh)
-- Sec:CreateToggle("Tp Farm", tpp)


local StarterGui = game:GetService("StarterGui")
    StarterGui:SetCore("SendNotification", {
        Title = "Version 1.7 Here",
        Text = "Much improvements",
        Duration = 5,
    })

local StarterGui = game:GetService("StarterGui")
    StarterGui:SetCore("SendNotification", {
        Title = "Aura kill efficiency",
        Text = "Depends on Ping",
        Duration = 5,
    })


for _, y in ipairs(Workspace.Effects:GetDescendants()) do
       if y:IsA("BasePart") then
y.Transparency = 1
end
end

Workspace.Effects.ChildAdded:Connect(function(child)
task.wait(0.3)
    if child:IsA("BasePart") and child.Name == "BasePart" then
        child:Destroy()
    end
end)


local Workspace = game:GetService("Workspace")

Workspace.ChildAdded:Connect(function(child)
    if child:IsA("Part") and child.Name == "Part" then
        child:Destroy()
    end
end)


local wa = false

function waa()
    wa = not wa
end

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local function moveTo(position)
    local localPlayer = Players.LocalPlayer
    if not localPlayer or not localPlayer.Character or not localPlayer.Character:FindFirstChild("Humanoid") then
        return
    end
    
    local humanoid = localPlayer.Character:FindFirstChild("Humanoid")
    humanoid:MoveTo(position)
end

local positions = {
    Vector3.new(82, -1, 71),
    Vector3.new(-75, -1, 77),
    Vector3.new(-74, -1, -70),
    Vector3.new(72, -1, -64)
}

local currentTarget = 1

RunService.Heartbeat:Connect(function()
    if not wa then return end
    
    local localPlayer = Players.LocalPlayer
    if not localPlayer or not localPlayer.Character or not localPlayer.Character.PrimaryPart then
        return
    end
    
    local playerPosition = localPlayer.Character.PrimaryPart.Position
    local targetPosition = positions[currentTarget]

    -- Crear vectores que ignoren la componente Y (altura)
    local flatPlayerPosition = Vector3.new(playerPosition.X, 0, playerPosition.Z)
    local flatTargetPosition = Vector3.new(targetPosition.X, 0, targetPosition.Z)

    -- Calcular la distancia ignorando la altura
    local distance = (flatTargetPosition - flatPlayerPosition).magnitude
    
    if distance < 6 then  -- Ajusta este valor según sea necesario para la sensibilidad de proximidad
        currentTarget = currentTarget + 1 
        if currentTarget > #positions then
            currentTarget = 1 
        end
    else
        moveTo(targetPosition)  
    end
end)


Sec:CreateToggle("Auto Walk Farm", waa)

-- Sec:CreateTextbox("Speed 0 - 500", function(value)
           --  speed = value
   -- speede()
-- end)

local gg = false

function ocultarse()
gg = not gg
local e 
if gg then
local part = workspace.Map.Dirt
workspace.Map.Grass.Transparency = 1
part.Size = Vector3.new(275, 0.001, 275)
part.Position = Vector3.new(0, -17, 0)
local player = game.Players.LocalPlayer
local humanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
if humanoidRootPart then
 e = humanoidRootPart.Position
    local newPosition = humanoidRootPart.Position - Vector3.new(0, 6, 0)
    humanoidRootPart.CFrame = CFrame.new(newPosition)
else
humanoidRootPart.CFrame = CFrame.new(e)
end
end
end

Sec:CreateButton("Hide/Ocultar", ocultarse)


game:GetService('Players').LocalPlayer.Idled:Connect(function()
game:GetService('VirtualUser'):CaptureController()   game:GetService('VirtualUser'):ClickButton2(Vector2.new())
end)

while true do wait()
hitRandomBugs()
end
