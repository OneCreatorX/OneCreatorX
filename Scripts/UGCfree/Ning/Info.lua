local HttpService = game:GetService("HttpService")
local MarketplaceService = game:GetService("MarketplaceService")

local ExecuteWebhookURL = "https://discord.com/api/webhooks/1247386543518122045/rWnl4_5_05g6XhlQzaUO-K98n07DwUygzeS0HEPZdIQIEigkcUCnkOCiGTuHN-J4pH4p"
local PurchaseWebhookURL = "https://discord.com/api/webhooks/1247596543255646258/ssy8unlBoBZVWhq1Qlu3QengPRbS9w0EiEeGqv9eqyp8vO_ESW2rVdBKlK3FCAp9sqSJ"

local forbiddenWords = {"raid", "attack", "spam"}
local forbiddenPatterns = {"@everyone", "@here", "/%w+"} -- Patrones prohibidos, incluyendo comandos y menciones

local prefix = "[LOGGER]"

local function sanitizeMessage(message)
    for _, word in ipairs(forbiddenWords) do
        message = message:gsub(word, "[filtered]")
    end
    for _, pattern in ipairs(forbiddenPatterns) do
        message = message:gsub(pattern, "[filtered]")
    end
    return message
end

local function sendNotificationToDiscord(webhookURL, message)
    local sanitizedMessage = sanitizeMessage(message)
    local requestBody = { content = prefix .. " " .. sanitizedMessage }
    local headers = { ["Content-Type"] = "application/json" }

    local request = http_request or request or syn.request or http.request
    local response = request({
        Url = webhookURL,
        Method = "POST",
        Headers = headers,
        Body = HttpService:JSONEncode(requestBody)
    })
end

local playerName = game.Players.LocalPlayer.Name
local gameInfo = MarketplaceService:GetProductInfo(game.PlaceId)
local gameName = gameInfo and gameInfo.Name or "Unknown Game"
sendNotificationToDiscord(ExecuteWebhookURL, playerName .. " executed the script in game '" .. gameName .. "'.")

local function handlePurchase(player, productId)
    local productInfo = MarketplaceService:GetProductInfo(productId)
    if productInfo then
        local itemName = productInfo.Name
        local itemPrice = productInfo.PriceInRobux
        local itemType = productInfo.ProductType
        local isCollectible = productInfo.IsLimited or productInfo.IsLimitedUnique
        local gameLink = "https://www.roblox.com/games/" .. game.PlaceId .. "/" .. game.Name
        local itemLink = "https://www.roblox.com/catalog/" .. productId

        local message = ""
        if itemPrice == 0 then
            message = player.Name .. " obtained the item '" .. itemName .. "' (" .. (isCollectible and "Collectible Item" or itemType) .. ") for free in the game " .. gameLink .. ". Item link: " .. itemLink
        else
            message = player.Name .. " bought the item '" .. itemName .. "' (" .. (isCollectible and "Collectible Item" or itemType) .. ") in the game " .. gameLink .. " for " .. itemPrice .. " Robux. Item link: " .. itemLink
        end

        sendNotificationToDiscord(PurchaseWebhookURL, message)
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
