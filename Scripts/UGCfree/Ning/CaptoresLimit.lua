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

UL:AddTBtn(cfrm, "Auto Fast Fish", a, function(b)
    a = b
    local arg1
    local arg2

    local function hookRemoteInvoke()
        local mt = getrawmetatable(game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("fish"))
        local oldInvokeServer = mt.__namecall

        setreadonly(mt, false)

        mt.__namecall = newcclosure(function(self, ...)
            local args = {...}
            local method = getnamecallmethod()

            if method == "InvokeServer" and self.Name == "fish" then
                if a then
                    spawn(function()
                        arg1 = args[1]
                        arg2 = args[2]
                    end)
                end
                return oldInvokeServer(self, ...)
            end

            return oldInvokeServer(self, ...)
        end)

        setreadonly(mt, true)
    end

    hookRemoteInvoke()

    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("menuNotify").OnClientEvent:Connect(function(...)
        if arg1 and arg2 and a then
            local args = {
                [1] = arg1,
                [2] = arg2
            }
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("fish"):InvokeServer(unpack(args))
        end
    end)
end)


UL:AddTBtn(cfrm, "Auto Farm Noobs", nn, function(m)
    nn = m
    while nn do
        pcall(function()
            for _, h in pairs(workspace.Limiteds:GetChildren()) do
                if nn and h:IsA("Model") and h:FindFirstChild("Handle") then
                    local ggg = h.Handle
                    local distance = (game.Players.LocalPlayer.Character.PrimaryPart.Position - ggg.Position).Magnitude

                    if nn and distance < math.huge then
                        local argsDamage = {
                            [1] = ggg
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("damageLimited"):FireServer(unpack(argsDamage))
                        
                        local argsPet = {
                            [1] = ggg,
                            [2] = Vector3.new(1, 0, 0)
                        }
                        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("sendPet"):FireServer(unpack(argsPet))
                        wait() 
                    end
                end
            end
        end)
        wait(0.1)
    end
end)


UL:AddTBtn(cfrm, "Auto Coin", ja, function(m)
ja = m
while ja do
wait()
for _, qa in (workspace:GetChildren()) do
if qa:IsA("MeshPart") and qa.Name == "Coin" then
qa.Position = game.Players.LocalPlayers.Character.PrimaryPart.Position
end
end
end
end)

UL:AddText(crFrm, "By Script: OneCreatorX ")
UL:AddText(crFrm, "Create Script: 03/06/24 ")
UL:AddText(crFrm, "Update Script: --/--/--")
UL:AddText(crFrm, "Script Version: 0.1")
UL:AddBtn(crFrm, "Copy link YouTube", function() setclipboard("https://youtube.com/@onecreatorx") end)
UL:AddBtn(crFrm, "Copy link Discord", function() setclipboard("https://discord.com/invite/UNJpdJx7c4") end)

game:GetService('Players').LocalPlayer.Idled:Connect(function()
    game:GetService('VirtualUser'):CaptureController()
    game:GetService('VirtualUser'):ClickButton2(Vector2.new())
end)

