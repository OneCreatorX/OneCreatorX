local rl = loadstring(game:HttpGet("https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/UGCfree/Ning/Info.lua"))
spawn(rl)
local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local Win = Lib:NewWindow("Roll For UGC")
local Sec = Win:NewSection("Options")
local Sec2 = Win:NewSection("Credits: OneCreatorX")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local function copyToClipboard(text)
    if syn then
        syn.write_clipboard(text)
    else
        setclipboard(text)
    end
end

function auto()
    if Player.Joinstats.Auto.Value == 1 then
        Player.Joinstats.Auto.Value = 0
    else
        Player.Joinstats.Auto.Value = 1 
    end
end

local ba = false

function keys()
    ba = not ba
    while ba do
        wait()
        if Player.leaderstats.Keys.Value < 100 then
            Player.leaderstats.Keys.Value = 100
        end
    end
    Player.leaderstats.Keys.Value = 30
end

function fast()
    if Player.Gamepass.FastRoll.Value == 1 then
        Player.Gamepass.FastRoll.Value = 0
    else
        Player.Gamepass.FastRoll.Value = 1
    end
end

function x3()
    if Player.Gamepass.Roll3x.Value == 1 then
        Player.Gamepass.Roll3x.Value = 0
    else
        Player.Gamepass.Roll3x.Value = 1
    end
end

function lucky()
    if Player.Gamepass.Lucky.Value == 1 then
        Player.Gamepass.Lucky.Value = 0
    else
        Player.Gamepass.Lucky.Value = 1
    end
end

Sec:CreateToggle("Auto Roll", auto)
Sec:CreateToggle("Fast Roll", fast)
Sec:CreateToggle("Roll x3", x3)
Sec:CreateToggle("Lucky Active", lucky)
Sec:CreateToggle("Inf Keys", keys)
Sec2:CreateButton("Copy Link YouTube", function() copyToClipboard("Link YouTube") end)
Sec2:CreateButton("Copy Link Discord", function() copyToClipboard("Link Discord") end)

game:GetService('Players').LocalPlayer.Idled:Connect(function()
    game:GetService('VirtualUser'):CaptureController()
    game:GetService('VirtualUser'):ClickButton2(Vector2.new())
end)
