local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local Win = Lib:NewWindow("Collect Stars For UGC")
local Sec = Win:NewSection("Options")
local Sec3 = Win:NewSection("Info Script")
local Sec2 = Win:NewSection("Credits: OneCreatorX")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer


local sc = 0

for _, obj in ipairs(workspace.ClaimableStars:GetDescendants()) do
    if obj:IsA("BasePart") and obj:FindFirstChild("TouchInterest") then
        sc = sc + 1
    end
end

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Estrellas Disponibles",
    Text = "Cantidad : " .. sc,
    Duration = 10
})
local lagg = false

function lag()
    lagg = not lagg
    while lagg do
     wait(0.3)   
for _, obj in ipairs(workspace.ClaimableStars:GetDescendants()) do
    if obj:IsA("BasePart") and obj:FindFirstChild("TouchInterest") then

local plr = game.Players.LocalPlayer
firetouchinterest(plr.Character.HumanoidRootPart, obj, 0)
        wait()
        firetouchinterest(plr.Character.HumanoidRootPart, obj, 1)
end end
wait(0.5)
    end
end


local function copyToClipboard(text)
    if syn then
        syn.write_clipboard(text)
    else
        setclipboard(text)
    end
end

function copyd()
    copyToClipboard("https://discord.com/invite/23kFrRBSfD")
end

function copyy()
    copyToClipboard("https://youtube.com/@OneCreatorX")
end


function ss()
end

Sec:CreateToggle("Auto Stars", lag)

Sec2:CreateButton("Copy Link YouTube", copyy)
Sec2:CreateButton("Copy Link Discord", copyd)
Sec3:CreateButton("Update: 24-05-24", ss)
Sec3:CreateButton("Version 3", ss)
game:GetService('Players').LocalPlayer.Idled:Connect(function()
game:GetService('VirtualUser'):CaptureController()   game:GetService('VirtualUser'):ClickButton2(Vector2.new())
end)
