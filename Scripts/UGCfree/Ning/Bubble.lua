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

local P = game:GetService("Players") local L = P.LocalPlayer local H = L.Character:WaitForChild("Humanoid") local R = L.Character:WaitForChild("HumanoidRootPart") local F,B = false,Instance.new("BodyVelocity") B.MaxForce = Vector3.new(math.huge, math.huge, math.huge) B.Velocity = Vector3.new(0, 0, 0) local SG = Instance.new("ScreenGui") SG.ResetOnSpawn = false
 SG.Parent = game.Players.LocalPlayer.PlayerGui local Fr = Instance.new("Frame") Fr.Size, Fr.Position, Fr.BackgroundTransparency, Fr.Parent = UDim2.new(0, 100, 0, 50), UDim2.new(0.25, 0, 0.5, -25), 1, SG local BCA,BCI = Color3.fromRGB(0, 200, 0), Color3.fromRGB(150, 150, 150) local Btn = Instance.new("TextButton") Btn.Size, Btn.Position, Btn.Text, Btn.TextSize, Btn.TextWrapped, Btn.BackgroundTransparency, Btn.BackgroundColor3, Btn.Parent = UDim2.new(0.8, 0, 1, 0), UDim2.new(0.1, 0, 0, 0), "bubble", 14, true, 0.5, BCI, Fr local Close = Instance.new("TextButton") Close.Size, Close.Position, Close.Text, Close.TextSize, Close.BackgroundColor3, Close.TextColor3, Close.Parent = UDim2.new(0, 20, 0, 20), UDim2.new(1, -20, 0, 0), "X", 14, Color3.fromRGB(255, 0, 0), Color3.fromRGB(255, 255, 255), Fr local Act = false local function TB() Act = not Act Btn.BackgroundColor3 = Act and BCA or BCI end Btn.MouseButton1Click:Connect(TB) local function DG() SG:Destroy() Btn.MouseButton1Click:Disconnect() Close.MouseButton1Click:Disconnect() game:GetService("RunService"):UnbindFromRenderStep("FlightModeUpdate") end Close.MouseButton1Click:Connect(DG) local function TF() F = not F if F then H:ChangeState(Enum.HumanoidStateType.Physics) B.Parent = R else H:ChangeState(Enum.HumanoidStateType.GettingUp) B.Parent = nil end end Btn.MouseButton1Click:Connect(TF) local CV = Vector3.new(0, 0, 0) local AC = 50 local function UF() if F then local MV = Vector3.new( game:GetService("UserInputService"):GetGamepadState(Enum.UserInputType.Gamepad1).ThumbstickDelta.x, 0, game:GetService("UserInputService"):GetGamepadState(Enum.UserInputType.Gamepad1).ThumbstickDelta.y ) CV = CV:Lerp(MV * 1000, AC * game:GetService("RunService").Heartbeat) B.Velocity = CV end end game:GetService("UserInputService").Gamepad2Connected:Connect(function() game:GetService("RunService"):BindToRenderStep("FlightModeUpdate", Enum.RenderPriority.Input.Value, UF) end) game:GetService("UserInputService").Gamepad2Disconnected:Connect(function() game:GetService("RunService"):UnbindFromRenderStep("FlightModeUpdate") B.Velocity, CV = Vector3.new(0, 0, 0), Vector3.new(0, 0, 0) end)
