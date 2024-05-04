local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local Win = Lib:NewWindow("AFK FOR UGC")
local Sec = Win:NewSection("Options")
local Sec3 = Win:NewSection("Info Script")
local Sec2 = Win:NewSection("Credits: OneCreatorX")

local tF = workspace:WaitForChild("Tokens")
local pp = game.Players.LocalPlayer
local gates = workspace.Scriptables.Gates

local function movePartsToPlayerPosition(zone)
    for _, part in ipairs(zone:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CFrame = CFrame.new(pp.Character.HumanoidRootPart.Position)
        end
    end
end


local function tk()
    for i = 1, 5 do
        local zone = tF:FindFirstChild("Zone" .. i)
        local gate = gates:FindFirstChild("Gate" .. (i - 1))

        if zone and not gate then
            movePartsToPlayerPosition(zone)
        end
    end
end 

local p = game.Players.LocalPlayer
local c = workspace.Scriptables.Chests
local g = workspace.Scriptables.Gates
local n = { "Chest1", "Chest2", "Chest3", "Chest4", "Chest5" }


local player = game.Players.LocalPlayer
local chests = workspace.Scriptables.Chests
local gates = workspace.Scriptables.Gates
local autoChest = false

local destinationThreshold = 15
local PathfindingService = game:GetService("PathfindingService")

local function isStuck(character)
    local rayOrigin = character.HumanoidRootPart.Position
    local rayDirection = character.HumanoidRootPart.CFrame.LookVector * 2
    local ray = Ray.new(rayOrigin, rayDirection)
    local hit, position = workspace:FindPartOnRay(ray, character)

    return hit ~= nil
end

local function moveToDestination(destination)
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    local torso = character:WaitForChild("HumanoidRootPart")

    local currentPosition = torso.Position
    local distanceToDestination = (currentPosition - destination).magnitude
    if distanceToDestination <= 10 then
        humanoid:Move(Vector3.new(0, 0, 0))
        return  
    end

    if isStuck(character) then
        local adjustment = CFrame.new(-2, 0, -2)
        currentPosition = (torso.CFrame * adjustment).p
    end

    local path = PathfindingService:CreatePath({
        AgentRadius = 2,
        AgentHeight = 5,
        AgentCanJump = true,
        AgentJumpHeight = 4,
        AgentMaxSlope = 40,
        AgentWalkableFloor = 0.75,
        AgentMaxAcceleration = 300,
        AgentMaxSpeed = humanoid.WalkSpeed
    })

    path:ComputeAsync(currentPosition, destination)
    if path.Status == Enum.PathStatus.Success then
        local waypoints = path:GetWaypoints()
        for _, waypoint in ipairs(waypoints) do
            humanoid:MoveTo(waypoint.Position)
            humanoid.MoveToFinished:Wait()
            currentPosition = torso.Position
            distanceToDestination = (currentPosition - destination).magnitude
            if distanceToDestination <= 5 then
                humanoid:Move(Vector3.new(0, 0, 0))
                return
            end
        end
    else
        warn("Pathfinding failed to compute path to destination.")
    end
end

local function moveToChest()
    local closestChest = nil
    local lowestNumber = math.huge

    for i = 1, 5 do
        local chest = chests:FindFirstChild("Chest" .. i)
        local gate = gates:FindFirstChild("Gate" .. (i - 1))

        if chest and not gate and i < lowestNumber then
            closestChest = chest
            lowestNumber = i
        end
    end

    if closestChest then
        local destinationPosition = closestChest.PrimaryPart.Position + Vector3.new(10, 0, 0)
        moveToDestination(destinationPosition)
    end
end

local a = false
local function cofre()
    a = not a
    while a do
        local success, error = pcall(function()
            moveToChest()
            task.wait(2)
        end)

        if not success then
        else
        end
    end
end


local a = false
local function click()
    a = not a
    while a do
        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Click"):FireServer()
        task.wait()
    end
end

local a = false
local function Rebirth()
    a = not a
    while a do
        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Rebirth"):FireServer()
        task.wait(5)
    end
end

local a = false
local function Tokens()
    a = not a
    while a do
        tk()
        task.wait(5)
    end
end

local a = false
local function Spin()
    a = not a
    while a do
        game.ReplicatedStorage.Events.WheelSpin:FireServer("Normal")
        task.wait(5)
    end
end



game:GetService('Players').LocalPlayer.Idled:Connect(function()
    game:GetService('VirtualUser'):CaptureController()
    game:GetService('VirtualUser'):ClickButton2(Vector2.new())
end)

local zones = workspace.Zones:GetChildren()

local clientTokensFolder = workspace.ClientTokens

clientTokensFolder.ChildAdded:Connect(function(child)
    task.wait(0.2)
    if child:IsA("BasePart") then
        child:Destroy()
    end
end)

function copyd()
    copyToClipboard("https://discord.com/invite/23kFrRBSfD")
end

function copyy()
    copyToClipboard("https://youtube.com/@OneCreatorX")
end

Sec:CreateToggle("Auto Click", click)
Sec:CreateToggle("Auto Chest", cofre)
Sec:CreateToggle("Auto Tokens", Tokens)
Sec:CreateToggle("Auto Rebirth", Rebirth)
Sec:CreateToggle("Auto Spin", Spin)
Sec3:CreateButton("Update: 03/05/24", a)
Sec3:CreateButton("Version 6", a)
Sec2:CreateButton("Copy Link YouTube", copyy)
Sec2:CreateButton("Copy Link Discord", copyd)
