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

Sec3:CreateButton("Update 05/05/24", sa)
Sec3:CreateButton("Version 1", sa)
Sec2:CreateButton("Copy Link YouTube", copyy)
Sec2:CreateButton("Copy Link Discord", copyd)
Sec:CreateToggle("Kill Aura", hh)

Sec:CreateTextbox("Speed", function(value)
             speed = value
    speede()
end)


local StarterGui = game:GetService("StarterGui")
    StarterGui:SetCore("SendNotification", {
        Title = "Version 1 Here",
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


local StarterGui = game:GetService("StarterGui")
    StarterGui:SetCore("SendNotification", {
        Title = "Version 0.3 Here",
        Text = "Anti Lag Ready",
        Duration = 5,
    })



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
    local distance = (targetPosition - playerPosition).magnitude
    
    if distance < 5 then
        currentTarget = currentTarget + 1 
        if currentTarget > #positions then
            currentTarget = 1 
        end
    else
        moveTo(targetPosition)  
    end
end)

Sec:CreateToggle("Auto Walk Farm", waa)

game:GetService('Players').LocalPlayer.Idled:Connect(function()
game:GetService('VirtualUser'):CaptureController()   game:GetService('VirtualUser'):ClickButton2(Vector2.new())
end)

while true do wait()
hitRandomBugs()
end
