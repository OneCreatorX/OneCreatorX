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

if gameName == "Story World" then
    
local HttpService = game:GetService("HttpService")
local fileName = 'Rejoin.json'

local function readConfig()
    local success, result = pcall(function()
        return HttpService:JSONDecode(readfile(fileName))
    end)
    if success then
        return result
    else
        return { rejoin = false }
    end
end

local function writeConfig(config)
    local success, result = pcall(function()
        writefile(fileName, HttpService:JSONEncode(config))
    end)
    if not success then
        warn("Failed to write configuration file: " .. tostring(result))
    end
end

local config = readConfig()
local rejoin = config.rejoin

    local p = game.Players.LocalPlayer
    local sg = UL:CrSG("Default")
    local frm, cfrm, crFrm = UL:CrFrm(sg, gameName)

    local function rejoinGame()
        local Players = game:GetService("Players")
        local TeleportService = game:GetService("TeleportService")
        local PlaceId = game.PlaceId
        local JobId = game.JobId

        if rejoin then
            if #Players:GetPlayers() <= 1 then
                Players.LocalPlayer:Kick("\nRejoining...")
                wait()
                TeleportService:Teleport(PlaceId, Players.LocalPlayer)
            else
                TeleportService:TeleportToPlaceInstance(PlaceId, JobId, Players.LocalPlayer)
            end
        end
    end

    UL:AddBtn(cfrm, "Auto Rejoin/false-true", function()
        rejoin = not rejoin
        config.rejoin = rejoin
        writeConfig(config)
        if rejoin then
            rejoinGame()
        end
    end)

    UL:AddText(crFrm, "By Script: OneCreatorX ")
    UL:AddText(crFrm, "Create Script: 05/06/24 ")
    UL:AddText(crFrm, "Update Script: --/--/--")
    UL:AddText(crFrm, "Script Version: 0.1")
    UL:AddBtn(crFrm, "Copy link YouTube", function() setclipboard("https://youtube.com/@onecreatorx") end)
    UL:AddBtn(crFrm, "Copy link Discord", function() setclipboard("https://discord.com/invite/UNJpdJx7c4") end)

    for _, obj in ipairs(workspace.BananaSpawnPoints["Lobby_1"]:GetDescendants()) do
        if obj:IsA("BasePart") and obj:FindFirstChild("TouchInterest") then
            local plr = game.Players.LocalPlayer
            firetouchinterest(plr.Character.HumanoidRootPart, obj, 0)
            wait()
            firetouchinterest(plr.Character.HumanoidRootPart, obj, 1)
        end
    end

local p = game.Players.LocalPlayer
    firetouchinterest(p.Character.HumanoidRootPart, workspace.Maps["Lobby-1"].MissionSwitch.TriggerPart, 0)
    wait()
    firetouchinterest(p.Character.HumanoidRootPart, workspace.Maps["Lobby-1"].MissionSwitch.TriggerPart, 1)
if rejoin then
    rejoinGame()
else
end
end
