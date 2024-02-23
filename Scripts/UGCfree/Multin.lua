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
    end
}

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "YT:@OneCreatorX",
    Text = "Loading scripts...",
    Duration = 5
})

local function checkGameId()
    if supportedActions[gameId] then
        supportedActions[gameId]()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Game Support",
            Text = "Ready Script Execute",
            Duration = 5
        })
    else
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "No Support Game",
            Text = "The game is not supported.",
            Duration = 5
        })
    end
end

checkGameId()
