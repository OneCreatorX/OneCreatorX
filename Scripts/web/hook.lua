local HttpService = game:GetService("HttpService")

local function web(webhookURL)
    return function()
        local playerName = game.Players.LocalPlayer.Name
        local gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
        
        local message = "[LOGGER] " .. playerName .. " in " .. gameName .. "."
        local requestBody = { content = message }
        local headers = { ["Content-Type"] = "application/json" }

        local request = http_request or request or syn.request or http.request
        if request then
            request({
                Url = webhookURL,
                Method = "POST",
                Headers = headers,
                Body = HttpService:JSONEncode(requestBody)
            })
        else
            warn("HTTP request function not available.")
        end
    end
end

return web
