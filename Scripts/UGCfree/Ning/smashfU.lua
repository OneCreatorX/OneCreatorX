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

function ha()
local StarterGui = game:GetService("StarterGui")
    StarterGui:SetCore("SendNotification", {
        Title = " add Soon Update",
        Text = "Actualización Próximamente",
        Duration = 5,
    })
end
Sec3:CreateButton("Update 05/05/24", sa)
Sec3:CreateButton("Version 0.1", sa)
Sec2:CreateButton("Copy Link YouTube", copyy)
Sec2:CreateButton("Copy Link Discord", copyd)
Sec:CreateToggle("Kill Aura", hh)
Sec:CreateButton("Auto Walk Farm(soon)", ha)
Sec:CreateTextbox("Speed", function(value)
             speed = value
    speede()
end)


local StarterGui = game:GetService("StarterGui")
    StarterGui:SetCore("SendNotification", {
        Title = "Eficiencia del kill Aura",
        Text = "Depende del Ping",
        Duration = 5,
    })

local StarterGui = game:GetService("StarterGui")
    StarterGui:SetCore("SendNotification", {
        Title = "Aura kill efficiency",
        Text = "Depends on Ping",
        Duration = 5,
    })

while true do wait()
hitRandomBugs()
end
