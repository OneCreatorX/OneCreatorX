local replicatedStorage = game:GetService("ReplicatedStorage")
local playerId = 15796495241

if replicatedStorage:FindFirstChild("PT-ReplicatedStorage") then
    replicatedStorage["PT-ReplicatedStorage"].Remotes.darUGC:FireServer(playerId)
end
