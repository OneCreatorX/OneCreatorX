local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local Win = Lib:NewWindow(gameName)
local Sec = Win:NewSection("Options")
local Sec2 = Win:NewSection("Credits: OneCreatorX")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local arg2, arg3 = 1, 1

Sec:CreateTextbox("Choose Boss (1-4)", function(value)
    arg3 = tonumber(value) or arg3
end)

local function ah()
    local args = {[1] = true}
    game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("PushEvent"):FireServer(unpack(args))
    wait(0.8)
    Player.Character.HumanoidRootPart.CFrame = workspace.BreakableParts["Stage" .. arg2][arg3].PrimaryPart.CFrame
end

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Events = ReplicatedStorage:WaitForChild("Events")
local AutoFight = Events:WaitForChild("AutoFight")
local originalFireServer = AutoFight.FireServer

local function newFireServer(self, ...)
    local args = {...}
    arg2 = args[2] -- Guardar el valor del argumento 2 en la variable arg2
    args[3] = arg3 -- Reemplazar el valor del argumento 3 con el valor de la variable arg3
    spawn(ah)
    return originalFireServer(self, unpack(args))
end

local mt = getrawmetatable(game)
local oldNamecall = mt.__namecall
setreadonly(mt, false)

mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    if method == "FireServer" and self == AutoFight then
        return newFireServer(self, ...)
    end
    return oldNamecall(self, ...)
end)

setreadonly(mt, true)
