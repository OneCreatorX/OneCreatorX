local StarterGui = game:GetService("StarterGui")
    StarterGui:SetCore("SendNotification", {
        Title = "Auto Reconnect - Anti AFK",
        Text = "by OneCreatorX",
        Duration = 5,
    })


local NetworkClient = game:GetService("NetworkClient")
local Players = game:GetService("Players")
local TeleportService = game:GetService("TeleportService")

local PlaceId = game.GameId
local localPlayer = Players.LocalPlayer

NetworkClient.ChildRemoved:Connect(function(child)
local PlaceId = game.PlaceId
local JobId = game.JobId
local TeleportService = game:GetService("TeleportService")

if #game.Players:GetPlayers() <= 1 then
        game.Players.LocalPlayer:Kick("\nRejoining...")
        wait()
        TeleportService:Teleport(PlaceId, game.Players.LocalPlayer)
    else
        TeleportService:TeleportToPlaceInstance(PlaceId, JobId, game.Players.LocalPlayer)
    end

end)

game:GetService('Players').LocalPlayer.Idled:Connect(function()
    game:GetService('VirtualUser'):CaptureController()
    game:GetService('VirtualUser'):ClickButton2(Vector2.new())
end)
