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



local ta = false
function click()
ta = not ta
while ta do
wait()

for _, obj in ipairs(workspace:GetChildren()) do
    if obj:IsA("BasePart") and obj.Name == "Bubble" then

local plr = game.Players.LocalPlayer
firetouchinterest(plr.Character.HumanoidRootPart, obj, 0)
        wait()
        firetouchinterest(plr.Character.HumanoidRootPart, obj, 1)
end end
wait()
end
end

local taa = false

function spin()
taa = not taa
while taa do
game:GetService("ReplicatedStorage"):WaitForChild("Modules"):WaitForChild("StellarFramework"):WaitForChild("Network"):WaitForChild("Executables"):WaitForChild("Spin"):InvokeServer()
wait(5)
end
end

Sec:CreateToggle("Auto Bubble", click)

Sec2:CreateButton("Copy Link YouTube", function() copyToClipboard("Link YouTube") end)
Sec2:CreateButton("Copy Link Discord", function() copyToClipboard("Link Discord") end)

game:GetService('Players').LocalPlayer.Idled:Connect(function()
    game:GetService('VirtualUser'):CaptureController()
    game:GetService('VirtualUser'):ClickButton2(Vector2.new())
end)
