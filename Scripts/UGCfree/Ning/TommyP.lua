


local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("SendNotification", {
            Title = "YT:OneCreatorX",
            Text = "Auto Fast Collect",
            Duration = 10,
        })




local RS = game:GetService("ReplicatedStorage")
local Network = RS:WaitForChild("Shared"):WaitForChild("lib"):WaitForChild("Network")
local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

local function teleportAndCollect(location)
    local TeleportRequest = Network:WaitForChild("TeleportRequest")
    local CollectToken = Network:WaitForChild("CollectToken")
    local args = {[1] = location}
    TeleportRequest:FireServer(unpack(args))
    task.wait(1)
    local spawns = RS:WaitForChild("Tokens"):WaitForChild("Spawns")
    for _, child in ipairs(spawns:GetChildren()) do
        local args = {[1] = child}
        CollectToken:FireServer(unpack(args))
    end
end

local locations = {"Race", "Monolith", "Freefall", "FreezeTag"}

for _, location in ipairs(locations) do
    teleportAndCollect(location)
end

local player = Players.LocalPlayer
if player then
    player:Kick("Rejoin All Collect")
end

task.wait(2)

TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId)
