local rl = loadstring(game:HttpGet("https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/UGCfree/Ning/Info.lua"))
spawn(rl)
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


local ba = false

function keys()
    ba = not ba
end

originalNamecall = hookmetamethod(game, "__namecall", function(self, ...)
    local args = {...}
    local method = getnamecallmethod()
    
    if method == "InvokeServer" and self.Name == "SetTraining" then
        -- Verificar el valor del primer argumento y la variable de control
        if args[1] == false and ba then 
            return nil
        else
  -- normal
        end
    end
    
    return originalNamecall(self, unpack(args))
end)



local function clickButton(btn)
    local pos = btn.AbsolutePosition
    local size = btn.AbsoluteSize
    local centerX = pos.X + size.X / 1
    local centerY = pos.Y + size.Y / 1
    game:GetService("VirtualInputManager"):SendMouseButtonEvent(centerX, centerY, 0, true, game, 1)
    wait(0.05) 
    game:GetService("VirtualInputManager"):SendMouseButtonEvent(centerX, centerY, 0, false, game, 1)
end

local ta = false
function click()
ta = not ta
while ta do
if Player.PlayerGui.Screen.HUD:FindFirstChild("PopupTemplate") then
clickButton(Player.PlayerGui.Screen.HUD.PopupTemplate)
wait(0.1)
else
wait(0.1)
end
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

Sec:CreateToggle("No Reset Time", keys)
Sec:CreateToggle("Auto Bubble", click)
Sec:CreateToggle("Auto Spin", spin)

Sec2:CreateButton("Copy Link YouTube", function() copyToClipboard("Link YouTube") end)
Sec2:CreateButton("Copy Link Discord", function() copyToClipboard("Link Discord") end)

game:GetService('Players').LocalPlayer.Idled:Connect(function()
    game:GetService('VirtualUser'):CaptureController()
    game:GetService('VirtualUser'):ClickButton2(Vector2.new())
end)
