local gameId = game.GameId
local supportedActions = {
    [5251802284] = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/UGCfree/InstantUGC.lua"))() 
    end,
    [5616226528] = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/UGCfree/AutoSpin2.lua"))()
    end
}

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Loading Scripts",
    Text = "Loading scripts...",
    Duration = 5
})

local function checkGameId()
    if supportedActions[gameId] then
        supportedActions[gameId]()
    else
      
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "No support Game",
            Text = "The game is not supported.",
            Duration = 5
        })
    end
end

checkGameId()
