local HttpService = game:GetService("HttpService")
local MarketplaceService = game:GetService("MarketplaceService")
local StarterGui = game.Players.LocalPlayer.PlayerGui

local webhookURL = "https://discord.com/api/webhooks/1247617805172474007/3CZtUALti5agI2sBXu-VTeOvPkLDyyBuRULHmUzZeOEHhwn56k6xGgC2FhRnYMFZJSs4"
local forbiddenPatterns = {"@everyone", "@here", "/%w+"}
local prefix = "[Message received]"

local function sanitizeMessage(message)
    for _, pattern in ipairs(forbiddenPatterns) do
        message = message:gsub(pattern, "[filtered]")
    end
    return message
end

local function isInBlacklist(playerId, blacklist)
    for _, id in ipairs(blacklist) do
        if playerId == id then
            return true
        end
    end
    return false
end

local function sendNotificationToDiscord(playerName, playerId, gameName, message, includeLink)
    local sanitizedMessage = sanitizeMessage(message)
    local gameLink = "https://www.roblox.com/games/" .. game.PlaceId .. "/" .. game.Name
    local content = prefix .. " " .. playerName .. " (" .. playerId .. ") in game '" .. gameName .. "': " .. sanitizedMessage
    if includeLink then
        content = content .. " (Game Link: " .. gameLink .. ")"
    end
    
    local requestBody = { content = content }
    local headers = { ["Content-Type"] = "application/json" }

    local request = http_request or request or syn.request or http.request
    request({
        Url = webhookURL,
        Method = "POST",
        Headers = headers,
        Body = HttpService:JSONEncode(requestBody)
    })
end

local function createGui()
    -- Verificar si la interfaz ya existe
    if StarterGui:FindFirstChild("NotificationGui") then
        return  -- Si ya existe, no hagas nada más
    end
    
    local gui = Instance.new("ScreenGui")
    gui.Name = "NotificationGui"
    
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0.17, 0, 0.13, 0)
    frame.Position = UDim2.new(0.1, 0, 0.05, 0)
    frame.Style = Enum.FrameStyle.ChatRed
    frame.Parent = gui
    frame.Active = true
    frame.Draggable = true

    local textBox = Instance.new("TextBox")
    textBox.Size = UDim2.new(0.9, 0, 0.8, 0)
    textBox.Position = UDim2.new(0.02, 0, 0, 0)
    textBox.Text = "Text for Channel Discord(no spam)"
    textBox.Font = Enum.Font.Bangers
    textBox.TextSize = 10
    textBox.BorderColor3 = Color3.fromRGB(28, 300, 0)
    textBox.BorderSizePixel = 2
    textBox.BackgroundColor3 = Color3.fromRGB(11, 211, 0)
    textBox.BackgroundTransparency = 0
    textBox.Parent = frame

    local sendButton = Instance.new("TextButton")
    sendButton.Size = UDim2.new(0.7, 0, 0.4, 0)
    sendButton.Position = UDim2.new(0.15, 0, 1, 0)
    sendButton.Text = "Send Text"
    sendButton.Parent = frame
    sendButton.BorderColor3 = Color3.fromRGB(28, 300, 0)
    sendButton.BorderSizePixel = 2
    sendButton.Font = Enum.Font.Bangers
    sendButton.BackgroundColor3 = Color3.fromRGB(11, 211, 0)
    sendButton.TextSize = 10
    
    sendButton.MouseButton1Click:Connect(function()
        local message = textBox.Text
        local playerName = game.Players.LocalPlayer.Name
        local playerId = game.Players.LocalPlayer.UserId
        local gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
        local includeLink = true
        
        local blacklistUrl = "https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/BlackList.lua"
        local blacklistContent = game:HttpGet(blacklistUrl)
        local blacklist = {}
        for id in blacklistContent:gmatch("(%d+)") do
            table.insert(blacklist, tonumber(id))
        end
        
        if not isInBlacklist(playerId, blacklist) then
            sendNotificationToDiscord(playerName, playerId, gameName, message, includeLink)
            gui:Destroy()
        else
            local StarterGui = game:GetService("StarterGui")
            StarterGui:SetCore("SendNotification", {
                Title = "u Black List",
                Text = "N can send msg",
                Duration = 5,
            })
        end
    end)
    
    local closeButton = Instance.new("TextButton")
    closeButton.Size = UDim2.new(0.17, 0, 0.4, 0)
    closeButton.Position = UDim2.new(0.95, 0, 0, 0)
    closeButton.Text = "X"
    closeButton.TextColor3 = Color3.fromRGB(255, 0, 0) 
    closeButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    closeButton.Parent = frame
    
    closeButton.MouseButton1Click:Connect(function()
        gui:Destroy()
    end)
    
    gui.Parent = StarterGui
end

createGui()
