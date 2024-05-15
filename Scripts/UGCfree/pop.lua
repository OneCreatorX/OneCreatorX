local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local gameName = ""
if gameName == "" then
    gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
end
local Win = Lib:NewWindow(gameName)
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




function lag()
  workspace.Mechanics:Destroy()
 workspace.Obstacles:Destroy()  
end)


function tp()
game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(workspace.Checkpoints.CheckpointSpawns["CHECKPOINT-14"].CFrame)
end

Sec:CreateButton("Tp Waypoint 14", tp)
Sec:CreateButton("Anti Lag", lag)

Sec2:CreateButton("Copy Link YouTube", function() copyToClipboard("Link YouTube") end)
Sec2:CreateButton("Copy Link Discord", function() copyToClipboard("Link Discord") end)

game:GetService('Players').LocalPlayer.Idled:Connect(function()
    game:GetService('VirtualUser'):CaptureController()
    game:GetService('VirtualUser'):ClickButton2(Vector2.new())
end)
