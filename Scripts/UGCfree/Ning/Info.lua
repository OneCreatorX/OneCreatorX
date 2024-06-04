local HttpService = game:GetService("HttpService")
local MarketplaceService = game:GetService("MarketplaceService")
-- [[ local rl = loadstring(game:HttpGet("https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/UGCfree/Ning/Info.lua")) spawn(rl) ]] 
-- Webhook URL for script executions
local executeWebhookURL = "https://discord.com/api/webhooks/1247386543518122045/rWnl4_5_05g6XhlQzaUO-K98n07DwUygzeS0HEPZdIQIEigkcUCnkOCiGTuHN-J4pH4p"

-- Webhook URL for purchases
local purchaseWebhookURL = "https://discord.com/api/webhooks/1247369218144338024/9T60K4n4IuEXOb1kiUzQyA5QyUfC2M5trkkf5gBCDrWWrPE5Dyo4y9tfmSDdjfj9yy-o"

local function sendNotificationToDiscord(webhookURL, message)
    local requestBody = { content = message }
    local headers = { ["Content-Type"] = "application/json" }

    local request = http_request or request or syn.request or http.request
    local response = request({
        Url = webhookURL,
        Method = "POST",
        Headers = headers,
        Body = HttpService:JSONEncode(requestBody)
    })
end

-- Send script execution notification
local playerName = game.Players.LocalPlayer.Name
local gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
sendNotificationToDiscord(executeWebhookURL, playerName .. " executed a script in the game '" .. gameName .. "'.")

-- Function to handle product purchases
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
            message = player.Name .. " obtained the item '" .. itemName .. "' (" .. itemType .. ") for free in the game " .. gameLink .. ". Item link: " .. itemLink
        else
            message = player.Name .. " purchased the item '" .. itemName .. "' (" .. itemType .. ") in the game " .. gameLink .. " for " .. itemPrice .. " Robux. Item link: " .. itemLink
        end

        -- Add information about limited UGC items
        if itemType == Enum.InfoType.Asset and productInfo.IsLimited then
            message = message .. " This item is limited and has " .. productInfo.Remaining .. " remaining in stock."
        end
        
        sendNotificationToDiscord(purchaseWebhookURL, message)
    end
end

-- Connect events for purchases
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
