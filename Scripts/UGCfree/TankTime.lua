local ReplicatedStorage = game:GetService("ReplicatedStorage")

local remoteEvent = ReplicatedStorage:WaitForChild("Remote"):WaitForChild("Events"):WaitForChild("EasterEggEvent")
remoteEvent:FireServer()

game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
