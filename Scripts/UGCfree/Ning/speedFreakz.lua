local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local Win = Lib:NewWindow("Simulator Speed Freakz")
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


local ba = false

function keys()
    ba = not ba
    while ba do
        wait(0.5)
local args = {
    [1] = "rev up",
    [2] = 100000000000000000000000000000000000000000000000
}

game:GetService("ReplicatedStorage"):WaitForChild("Core"):WaitForChild("RemoteEvents"):WaitForChild("TrackEvent"):FireServer(unpack(args))
wait()
end
end



Sec:CreateToggle("Good Fast Farm", keys)

Sec2:CreateButton("Copy Link YouTube", function() copyToClipboard("Link YouTube") end)
Sec2:CreateButton("Copy Link Discord", function() copyToClipboard("Link Discord") end)

game:GetService('Players').LocalPlayer.Idled:Connect(function()
    game:GetService('VirtualUser'):CaptureController()
    game:GetService('VirtualUser'):ClickButton2(Vector2.new())
end)
