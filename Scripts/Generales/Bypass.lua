loadstring(game:HttpGet("https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/Bypass.lua"))()

local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local Win = Lib:NewWindow("Password")
local Sec = Win:NewSection("Options")
local Sec2 = Win:NewSection("Credits: OneCreatorX")

local userListScript = game:HttpGet("https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/passw.txt")
local userList = {}
for name in userListScript:gmatch("%S+") do
    table.insert(userList, name:lower())
end

local function gaa(value)
    local playerName = value:lower()
    local playerInList = false
    for _, name in ipairs(userList) do
        if playerName == name then
            playerInList = true
            break
        end
    end

    if playerInList then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/Bypass.lua"))()
    else
        local StarterGui = game:GetService("StarterGui")
        StarterGui:SetCore("SendNotification", {
            Title = "Password X",
            Text = "This is not correct",
            Duration = 5,
        })
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

function pass()
    copyToClipboard("https://paste-drop.com/paste/liUkNRa2HW")
end

Sec:CreateTextbox("Password", function(value)
    gaa(value)
end)

Sec:CreateButton("Copy Link Password", pass)

Sec2:CreateButton("Copy Link YouTube", copyy)
Sec2:CreateButton("Copy Link Discord", copyd)

game:GetService('Players').LocalPlayer.Idled:Connect(function()
    game:GetService('VirtualUser'):CaptureController()
    game:GetService('VirtualUser'):ClickButton2(Vector2.new())
end)
