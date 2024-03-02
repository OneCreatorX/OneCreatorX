local gameId = game.GameId
local supportedActions = {
    [5533844790] = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/UGCfree/SpinForUGC.lua"))()
    end,
    [5616226528] = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/UGCfree/AutoSpin2.lua"))()
    end,
    [5376457835] = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/UGCfree/Spins/5376457835.lua"))()
    end,
    [5598801336] = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/UGCfree/Spins/5598801336.lua"))()
    end,
    [5376457835] = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/UGCfree/Spins/5376457835.lua"))()
    end,
    [5601506762] = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/UGCfree/Spins/5601506762.lua"))()
    end,
    [3380613938] = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/UGCfree/Spins/3380613938.lua"))()
    end,
    [5631238011] = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/UGCfree/Spins/5631238011.lua"))()
    end,
    [4035073289] = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/UGCfree/Spins/4035073289.lua"))()
    end,
    [5656037427] = function()
        while true do
            wait(1)
            game:GetService("ReplicatedStorage").openCrate:InvokeServer("Main")
        end
    end,
        [5647872310] = function()
        while true do
            wait(0.1)
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Spin"):InvokeServer()
            end
    end
}

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "YT:@OneCreatorX",
    Text = "Loading scripts...",
    Duration = 5
})

local function checkGameId()
    local action = supportedActions[gameId]
    local notificationText = action and "Ready Script Execute" or "The game is not supported."

    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Game Support",
        Text = notificationText,
        Duration = 5
    })

    if action then
        action()
    end
end

game:GetService('Players').LocalPlayer.Idled:Connect(function()
game:GetService('VirtualUser'):CaptureController()   game:GetService('VirtualUser'):ClickButton2(Vector2.new())
end)

checkGameId()
