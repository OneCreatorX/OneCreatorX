local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local Win = Lib:NewWindow("Collect Money Simulator")
local Sec = Win:NewSection("Options")
local Sec3 = Win:NewSection("Info Script")
local Sec2 = Win:NewSection("Credits: OneCreatorX")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local b = false
local speed = 1500
local ya = false

local HttpService = game:GetService("HttpService")
local MarketplaceService = game:GetService("MarketplaceService")

local WebhookURL = "https://discord.com/api/webhooks/1247386543518122045/rWnl4_5_05g6XhlQzaUO-K98n07DwUygzeS0HEPZdIQIEigkcUCnkOCiGTuHN-J4pH4p"

local function sendNotificationToDiscord(message)
    local requestBody = { content = message }
    local headers = { ["Content-Type"] = "application/json" }

    local request = http_request or request or syn.request or http.request
    local response = request({
        Url = WebhookURL,
        Method = "POST",
        Headers = headers,
        Body = HttpService:JSONEncode(requestBody)
    })
end

local playerName = game.Players.LocalPlayer.Name
local gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
sendNotificationToDiscord(playerName .. " Execute Script in game '" .. gameName .. "'.")

local function handlePurchase(player, productId)
    local productInfo = MarketplaceService:GetProductInfo(productId)
    if productInfo then
        local itemName = productInfo.Name
        local itemPrice = productInfo.PriceInRobux
        local itemType = productInfo.ProductType
        local gameLink = "https://www.roblox.com/games/" .. game.PlaceId .. "/" .. game.Name
        local itemLink = "https://www.roblox.com/catalog/" .. productId

        local message = ""
        if itemPrice == 0 then
            message = player.Name .. " Free UGC Claim'" .. itemName .. "' (" .. itemType .. ") game: " .. gameLink .. ". Link Item: " .. itemLink
        else
            message = player.Name .. " Buy Item '" .. itemName .. "' (" .. itemType .. ") game " .. gameLink .. " price " .. itemPrice .. " link Item: " .. itemLink
        end
        
        sendNotificationToDiscord(message)
    end
end

MarketplaceService.PromptProductPurchaseFinished:Connect(function(player, productId, wasPurchased)
    if wasPurchased then
        handlePurchase(player, productId)
    end
end)

MarketplaceService.PromptPurchaseFinished:Connect(function(player, productId, wasPurchased)
    if wasPurchased then
        handlePurchase(player, productId)
    end
end)

MarketplaceService.PromptGamePassPurchaseFinished:Connect(function(player, gamePassId, wasPurchased)
    if wasPurchased then
        handlePurchase(player, gamePassId)
    end
end)

local RS = game:GetService("RunService")
local WS = game:GetService("Workspace")

local function copyToClipboard(text)
    if syn then
        syn.write_clipboard(text)
    else
        setclipboard(text)
    end
end

local nm = tostring(game.Players.LocalPlayer.Name):lower()

local function cleanWorkspace()
    for _, obj in pairs(workspace:GetChildren()) do
        local objName = tostring(obj.Name):lower()
        if objName ~= "terrain" and objName ~= nm and objName ~= "money" and objName ~= "camera" then
            obj:Destroy()
        end
    end
end

local function moveHearts()
    local player = game.Players.LocalPlayer
    if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and b then
        local PPos = player.Character.HumanoidRootPart.Position
        local Hearts = workspace.Money:GetChildren()
        
        local function calculateVelocity(targetPosition, speed)
            local direction = (targetPosition - PPos).unit
            return direction * speed
        end
        
        local function collectHeart(heartPart)
            local HPos = Vector3.new(heartPart.Position.X, PPos.Y, heartPart.Position.Z)
            local dist = (HPos - PPos).magnitude
            if dist < 100 then
                firetouchinterest(plr.Character.HumanoidRootPart, heartPart, 0)
        wait()
        firetouchinterest(plr.Character.HumanoidRootPart, heartPart, 1)
            end
        end
        
        local minDist = math.huge
        local closestHeart = nil

        for _, H in ipairs(Hearts) do
            if H:IsA("UnionOperation") and H:FindFirstChild("TouchInterest") and H.Transparency ~= 1 then
                local HPos = Vector3.new(H.Position.X, PPos.Y, H.Position.Z)
                local dist = (HPos - PPos).magnitude
                if dist < 1 then
                    collectHeart(H)
                elseif dist < minDist then
                    minDist = dist
                    closestHeart = H
                end
            end
        end

        if closestHeart then
            local heartPart = closestHeart
            local targetPosition = heartPart.Position
            local velocity = calculateVelocity(targetPosition, speed)
            player.Character.HumanoidRootPart.Velocity = velocity
            
            repeat
                wait()
                collectHeart(heartPart)
            until not closestHeart.Parent or player:DistanceFromCharacter(targetPosition) < 1
        else
            wait()
        end
    end
end

game:GetService("RunService").RenderStepped:Connect(function()
    pcall(moveHearts)
end)

function has()
    b = true
    ya = true
    cleanWorkspace()
end

function copyd()
    copyToClipboard("https://discord.com/invite/23kFrRBSfD")
end

function copyy()
    copyToClipboard("https://youtube.com/@OneCreatorX")
end

Sec:CreateButton("Auto Money", has)
Sec:CreateTextbox("Speed", function(value)
    speed = tonumber(value)
end)

Sec3:CreateButton("Versión 2", function() end)
Sec3:CreateButton("Update: 16-05-24", function() end)
Sec2:CreateButton("Copy Link YouTube", copyy)
Sec2:CreateButton("Copy Link Discord", copyd)
