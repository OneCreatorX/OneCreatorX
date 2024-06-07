local UL = loadstring(game:HttpGet("https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/UIs/MyLibrery.lua"))()
    
    local gameName = ""
    if gameName == "" then
        gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
    end
    
    local function cleanGameName(name)
        name = name:gsub("%b[]", "")
        name = name:match("^[^:]*")
        return name:match("^%s*(.-)%s*$")
    end
    
    gameName = cleanGameName(gameName)
    
    local p = game.Players.LocalPlayer
    local sg = UL:CrSG("Default")
    local frm, cfrm, crFrm = UL:CrFrm(sg, gameName)
    
    
    UL:AddTBtn(cfrm, "Equip Better Click[World]", a, function(b)
 a = b
local function callFunctionRepeatedly(localScript, functionName)
    if not localScript:IsA("LocalScript") then
        return
    end

    local success, senv = pcall(function() return getsenv(localScript) end)
    if not success or senv == nil then
        return
    end

    local targetFunction = senv[functionName]
    if not targetFunction or typeof(targetFunction) ~= "function" then
        return
    end

    while a do
        local result = targetFunction()

        local args = {
            [1] = game:GetService("ReplicatedStorage"):WaitForChild("Items"):WaitForChild("Pencil"):WaitForChild(tostring(result)),
            [2] = false
        }

        game:GetService("ReplicatedStorage"):WaitForChild("GameClient"):WaitForChild("Events"):WaitForChild("RemoteEvent"):WaitForChild("ClickChangeEvent"):FireServer(unpack(args))

        wait(1)
    end
end

local player = game:GetService("Players").LocalPlayer
local scriptPath = player.PlayerGui.ScreenGui.NewClicks.LocalScript
if scriptPath:IsA("LocalScript") then
    callFunctionRepeatedly(scriptPath, "GetBestsClick")
else
   
end

 end)

local name = p.Name
UL:AddTBox(cfrm, "   Tp World e.g: 2, 4, 6, 8, etc", function(text) 
local args = {
    [1] = tostring(text),
    [2] = workspace:WaitForChild(tostring(name)),
    [3] = false
}

game:GetService("ReplicatedStorage"):WaitForChild("PortalC"):FireServer(unpack(args))


end)


UL:AddTBtn(cfrm, "Auto Fast Click", j, function(b)
j = b
while j do
local args = {
    [1] = "Click",
    [2] = false
}

game:GetService("ReplicatedStorage"):WaitForChild("ClickEvent"):FireServer(unpack(args))
wait()
end
end)
    
   
UL:AddTBtn(cfrm, "Auto Claim Reward", n, function(b)
n = b
while n do
for i = 1, 12 do
local args = {
    [1] = "Reward".. i
}

game:GetService("ReplicatedStorage"):WaitForChild("GameClient"):WaitForChild("Events"):WaitForChild("RemoteEvent"):WaitForChild("ClaimGift"):FireServer(unpack(args))
wait(1)
end
wait(1)
end
end) 


    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local remoteEvent = ReplicatedStorage:WaitForChild("WinEvent")
    local originalFireServer = remoteEvent.FireServer
  local mt = getrawmetatable(remoteEvent)
    local oldNamecall = mt.__namecall
   setreadonly(mt, false)
local arg1

    local function newFireServer(self, ...)
        local args = {...}
        spawn(function()
            arg1 = args[1]
local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("SendNotification", {
    Title = "Enemy Detect is => " .. arg1,
    Text = "adjusted Farm Wins ",
    Duration = 2
})
end)
        return oldNamecall(self, ...)
    end

    
    mt.__namecall = newcclosure(function(self, ...)
        local method = getnamecallmethod()
        if method == "FireServer" and self == remoteEvent then
            return newFireServer(self, ...)
        end
        return oldNamecall(self, ...)
    end)

    setreadonly(mt, true)


UL:AddTBtn(cfrm, "Farm Wins", ja, function(b)
    vaa = b
    while vaa do
if arg1 ~= nil then
local args = {
    [1] = 1
}

game:GetService("ReplicatedStorage"):WaitForChild("RemoveC"):FireServer(unpack(args))


wait(3)
local args = {
    [1] = tostring(arg1)
}

game:GetService("ReplicatedStorage"):WaitForChild("WinEvent"):FireServer(unpack(args))

wait(1.5)
local args = {
    [1] = 0
}

game:GetService("ReplicatedStorage"):WaitForChild("RemoveC"):FireServer(unpack(args))
end
end
end)



    UL:AddText(crFrm, "By Script: OneCreatorX ")
    UL:AddText(crFrm, "Create Script: 06/06/24 ")
    UL:AddText(crFrm, "Update Script: --/--/--")
    UL:AddText(crFrm, "Script Version: 0.1")
    UL:AddBtn(crFrm, "Copy link YouTube", function() setclipboard("https://youtube.com/@onecreatorx") end)
    UL:AddBtn(crFrm, "Copy link Discord", function() setclipboard("https://discord.com/invite/UNJpdJx7c4") end)
    
    game:GetService('Players').LocalPlayer.Idled:Connect(function()
        game:GetService('VirtualUser'):CaptureController()
        game:GetService('VirtualUser'):ClickButton2(Vector2.new())
    end)
