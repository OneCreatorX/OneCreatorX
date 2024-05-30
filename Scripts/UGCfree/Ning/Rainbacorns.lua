local UL = loadstring(game:HttpGet("https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/UIs/MyLibrery.lua"))()

local gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local cleanGameName = function(name)
    return name:gsub("%b[]", ""):match("^[^:]*"):match("^%s*(.-)%s*$")
end
gameName = cleanGameName(gameName)

local p = game.Players.LocalPlayer
local sg = UL:CrSG("Default")
local frm, cfrm, crFrm = UL:CrFrm(sg, gameName)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local dataRemoteEvent = ReplicatedStorage:WaitForChild("dataRemoteEvent")

local function compareTextsAndSendEvents()
    for i = 1, 20 do
        local obj = workspace.Camera:FindFirstChild(tostring(i))
        if obj then
            local surfaceGui = obj:FindFirstChild("SurfaceGui")
            if surfaceGui then
                local frame = surfaceGui:FindFirstChild("Frame")
                if frame then
                    local textLabel = frame:FindFirstChild("TextLabel")
                    if textLabel and textLabel.Text ~= "" then
                        local text = textLabel.Text
                        local indices = {}
                        for j = i + 1, 20 do
                            local otherObj = workspace.Camera:FindFirstChild(tostring(j))
                            if otherObj then
                                local otherTextLabel = otherObj:FindFirstChild("SurfaceGui"):FindFirstChild("Frame"):FindFirstChild("TextLabel")
                                if otherTextLabel and otherTextLabel.Text == text then
                                    table.insert(indices, j)
                                end
                            end
                        end
                        if #indices > 0 then
                            for _, index in ipairs(indices) do
                                local args = {
                                    [1] = {
                                        [1] = {
                                            ["MinigameID"] = "DiscoGame",
                                            ["Payload"] = {
                                                ["Method"] = "Flip",
                                                ["Selected"] = index
                                            }
                                        },
                                        [2] = "0"
                                    }
                                }
                                dataRemoteEvent:FireServer(unpack(args))
                            end
                        end
                    end
                end
            end
        end
    end
end

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local dataRemoteEvent = ReplicatedStorage:WaitForChild("dataRemoteEvent")

local function findAndFlipCard()
    local cards = {}
    for i = 1, 20 do
        local obj = workspace.Camera:FindFirstChild(tostring(i))
        if obj then
            local surfaceGui = obj:FindFirstChild("SurfaceGui")
            if surfaceGui then
                local frame = surfaceGui:FindFirstChild("Frame")
                if frame then
                    local textLabel = frame:FindFirstChild("TextLabel")
                    if textLabel and textLabel.Text ~= "" then
                        table.insert(cards, i)
                    end
                end
            end
        end
    end

    if #cards >= 2 then
        for _, index in ipairs(cards) do
            local text = workspace.Camera[tostring(index)].SurfaceGui.Frame.TextLabel.Text
            local indices = {}
            for j = index + 1, 20 do
                local otherText = workspace.Camera[tostring(j)].SurfaceGui.Frame.TextLabel.Text
                if otherText == text then
                    table.insert(indices, j)
                end
            end

            if #indices > 0 then
                table.insert(indices, index)
                for _, idx in ipairs(indices) do
                    local args = {
                        [1] = {
                            [1] = {
                                ["MinigameID"] = "DiscoGame",
                                ["Payload"] = {
                                    ["Method"] = "Flip",
                                    ["Selected"] = idx
                                }
                            },
                            [2] = "0"
                        }
                    }
                    dataRemoteEvent:FireServer(unpack(args))
                end
                return
            end
        end
    end

    local emptyCards = {}
    for i = 1, 20 do
        local obj = workspace.Camera:FindFirstChild(tostring(i))
        if obj then
            local surfaceGui = obj:FindFirstChild("SurfaceGui")
            if surfaceGui then
                local frame = surfaceGui:FindFirstChild("Frame")
                if frame then
                    local textLabel = frame:FindFirstChild("TextLabel")
                    if not textLabel or textLabel.Text == "" then
                        table.insert(emptyCards, i)
                    end
                end
            end
        end
    end

    if #emptyCards > 0 then
        local randomIndex = math.random(1, #emptyCards)
        local randomCard = emptyCards[randomIndex]
        local args = {
            [1] = {
                [1] = {
                    ["MinigameID"] = "DiscoGame",
                    ["Payload"] = {
                        ["Method"] = "Flip",
                        ["Selected"] = randomCard
                    }
                },
                [2] = "0"
            }
        }
        dataRemoteEvent:FireServer(unpack(args))
    end
end



OB, OF = UL:AddOBtn(cfrm, "MiniGames")

UL:AddTBtn(OF, "Auto Moños", a, function(b) 
    a = b
    while a do
        wait(0.1)
        for _, h in ipairs(workspace:GetChildren()) do
            if h.Name == "Bowtie" then
                fireproximityprompt(h["Meshes/bowV1.1_Cube"].ProximityPrompt)
            end
        end
    end
end)

-- [[ UL:AddTBtn(OF, "Auto Flip(so revealed)(Memorama)", a, function(b) 
    a = b
    while a do
        
        compareTextsAndSendEvents()
wait(1)
    end
end) ]]

-- [[ UL:AddTBtn(OF, "Auto Random Flip(Momorama)", a, function(b) 
    a = b
    while a do
        
        findAndFlipCard()
wait(1)
    end
end) ]]


UL:AddTBtn(cfrm, "Auto Flowers", a, function(b) 
    a = b
    while a do
        for _, h in ipairs(workspace.Activators:GetChildren()) do
            if h.Name == "Flower" and a then
                game.Players.LocalPlayer.Character.PrimaryPart.CFrame = h.Part.CFrame
wait(0.5)
                fireproximityprompt(h.Part.ProximityPrompt)
                wait(0.2)
            end
        end
    end
end)

UL:AddTBtn(cfrm, "Auto Claim Gift", a, function(b) 
    a = b
    while a do
        for i = 1, 9 do
            local args = {
                [1] = {
                    [1] = {
                        [1] = "\1",
                        [2] = "BERRIES_" .. i .. "00"
                    },
                    [2] = "-"
                }
            }

            game:GetService("ReplicatedStorage"):WaitForChild("dataRemoteEvent"):FireServer(unpack(args))
            wait(1)
        end
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
