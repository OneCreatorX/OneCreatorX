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

UL:AddTBox(cfrm, "Mission Obby Finish 1 to 4:", function(inputText)
    local num = tonumber(inputText)
    if num and num >= 1 and num <= 4 then
        local mapPoint = "Lobby-" .. num
        
        if num == 3 then
            -- Specific commands for Lobby-3
            local args = {
                [1] = {
                    ["Success"] = true
                }
            }

            local function fireLockedDoorRE(trapNumber, doorName)
                local door = workspace:WaitForChild("Maps")
                                    :WaitForChild(mapPoint)
                                    :WaitForChild("Trap")
                                    :WaitForChild(tostring(trapNumber))
                                    :WaitForChild(doorName)
                                    :WaitForChild("DoorControl")
                                    :WaitForChild("InteractRoot")
                                    :WaitForChild("LockedDoorRE")
                door:FireServer(unpack(args))
            end

            fireLockedDoorRE(6, "Door_Nailboard_Complete")
            wait()
            fireLockedDoorRE(1, "Door_Nailboard_Complete")
            wait()
            fireLockedDoorRE(2, "Door_Nailboard_Complete")
            wait()
            fireLockedDoorRE(2, "Door_Nailboard_Thorn")
            wait()
            fireLockedDoorRE(5, "Door_Nailboard_Thorn")
            wait()
            fireLockedDoorRE(1, "Door_Nailboard_Complete")
        elseif num == 4 then
            
            p.Character.HumanoidRootPart.CFrame = CFrame.new(-3128, 9, -405)
      p.Character.HumanoidRootPart.Anchored = true
    wait(3)
   p.Character.HumanoidRootPart.Anchored = false
        end

        local missionSwitch = workspace.Maps[mapPoint] and workspace.Maps[mapPoint].MissionSwitch and workspace.Maps[mapPoint].MissionSwitch.TriggerPart
        if missionSwitch then
            firetouchinterest(p.Character.HumanoidRootPart, missionSwitch, 0)
            wait()
            firetouchinterest(p.Character.HumanoidRootPart, missionSwitch, 1)
        end
    else
        warn("Please enter a valid number between 1 and 4.")
    end
end)

UL:AddText(crFrm, "By Script: OneCreatorX ")
UL:AddText(crFrm, "Create Script: 29/05/24 ")
UL:AddText(crFrm, "Update Script: --/--/--")
UL:AddText(crFrm, "Script Version: 0.1")
UL:AddBtn(crFrm, "Copy link YouTube", function() setclipboard("https://youtube.com/@onecreatorx") end)
UL:AddBtn(crFrm, "Copy link Discord", function() setclipboard("https://discord.com/invite/UNJpdJx7c4") end)

game:GetService('Players').LocalPlayer.Idled:Connect(function()
    game:GetService('VirtualUser'):CaptureController()
    game:GetService('VirtualUser'):ClickButton2(Vector2.new())
end)

for _, obj in ipairs(workspace.BananaSpawnPoints:GetDescendants()) do
    if obj:IsA("BasePart") and obj:FindFirstChild("TouchInterest") then
        local plr = game.Players.LocalPlayer
        firetouchinterest(plr.Character.HumanoidRootPart, obj, 0)
        wait()
        firetouchinterest(plr.Character.HumanoidRootPart, obj, 1)
    end
end
