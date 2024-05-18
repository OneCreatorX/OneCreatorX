local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local gameName = ""
if gameName == "" then
    gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
end
local Win = Lib:NewWindow(gameName)
local Sec = Win:NewSection("Options")
local Sec2 = Win:NewSection("Credits: OneCreatorX")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local function copyToClipboard(text)
    if syn then
        syn.write_clipboard(text)
    else
        setclipboard(text)
    end
end



local ta = false
function click()
ta = not ta
while ta do
wait()

for _, obj in ipairs(workspace:GetChildren()) do
    if obj:IsA("BasePart") and obj.Name == "Bubble" then

local plr = game.Players.LocalPlayer
firetouchinterest(plr.Character.HumanoidRootPart, obj, 0)
        wait(1)
        firetouchinterest(plr.Character.HumanoidRootPart, obj, 1)
                wait(5)
end end
wait()
end
end


local function claim()
    local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("SendNotification", {
    Title = "Auto Cancel Auto Spin",
    Text = "Claim UGC = Auto Spin OFF",
    Duration = 5,
})
    
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")

local notificationSent = {
    buyButton = false,
    cancelButton = false
}

local function sendNotification(title, text, duration)
    if not notificationSent[title] then
        StarterGui:SetCore("SendNotification", {
            Title = title,
            Text = text,
            Duration = duration,
        })
        notificationSent[title] = true
    end
end

sendNotification("YT:@OneCreatorX", "-> Auto Claim FREE UGC <- -> Auto Cancel No Free <-", 30)


local function clickCancelButton(purchasePrompt)
    local cancelButtonText = nil
    local zeroTextButton = nil

    for _, descendant in ipairs(purchasePrompt:GetDescendants()) do
        if descendant:IsA("TextLabel") and descendant.Name == "Text" then
            local text = descendant.Text:lower()
            if text == "cancelar" or text == "cancel" then
                cancelButtonText = text
            elseif text == "0" then
                zeroTextButton = descendant
            end
        end
    end

    if zeroTextButton then
        local buttonCenterX = zeroTextButton.AbsolutePosition.X + zeroTextButton.AbsoluteSize.X / 0.5
        local buttonCenterY = zeroTextButton.AbsolutePosition.Y + zeroTextButton.AbsoluteSize.Y / 0.5
        
        game:GetService("VirtualInputManager"):SendMouseButtonEvent(buttonCenterX, buttonCenterY, 0, true, game, 1)
        game:GetService("VirtualInputManager"):SendMouseButtonEvent(buttonCenterX, buttonCenterY, 0, false, game, 1)
        sendNotification("FREE UGC Available", "Auto Claim Accept. By:OneCreatorX", 5)
                 game.Players.LocalPlayer.UserData.OwnsAutoSpin.Value = false
    elseif cancelButtonText then
        for _, descendant in ipairs(purchasePrompt:GetDescendants()) do
            if descendant:IsA("TextLabel") and descendant.Name == "Text" and descendant.Text:lower() == cancelButtonText then
                local buttonCenterX = descendant.AbsolutePosition.X + descendant.AbsoluteSize.X / 0.5
                local buttonCenterY = descendant.AbsolutePosition.Y + descendant.AbsoluteSize.Y / 0.5
                
                game:GetService("VirtualInputManager"):SendMouseButtonEvent(buttonCenterX, buttonCenterY, 0, true, game, 1)
                game:GetService("VirtualInputManager"):SendMouseButtonEvent(buttonCenterX, buttonCenterY, 0, false, game, 1)
                sendNotification("NO FREE UGC", "Auto Claim Decline. By:OneCreatorX", 5)
                break
            end
        end
    end
end

local coreGui = game:GetService("CoreGui")
local purchasePrompt = coreGui:WaitForChild("PurchasePrompt")

RunService.Heartbeat:Connect(function()
    local buttonsFound = false

    for _, descendant in ipairs(purchasePrompt:GetDescendants()) do
        if descendant:IsA("TextLabel") and descendant.Name == "Text" then
            buttonsFound = true
            break
        end
    end

    if not buttonsFound then
        notificationSent = {
            buyButton = false,
            cancelButton = false
        }
    end

    clickCancelButton(purchasePrompt)
end)
end

function spin()
game.Players.LocalPlayer.UserData.OwnsAutoSpin.Value = not game.Players.LocalPlayer.UserData.OwnsAutoSpin.Value
end

Sec:CreateToggle("Auto Bubble", click)

Sec:CreateToggle("Auto Spin", spin)
Sec:CreateButton("Auto Claim UGC", claim)

Sec2:CreateButton("Copy Link YouTube", function() copyToClipboard("Link YouTube") end)
Sec2:CreateButton("Copy Link Discord", function() copyToClipboard("Link Discord") end)

game:GetService('Players').LocalPlayer.Idled:Connect(function()
    game:GetService('VirtualUser'):CaptureController()
    game:GetService('VirtualUser'):ClickButton2(Vector2.new())
end)
