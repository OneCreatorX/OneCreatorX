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
