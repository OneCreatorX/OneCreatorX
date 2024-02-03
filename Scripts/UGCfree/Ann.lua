local player = game.Players.LocalPlayer

if not player then return end

local backpack = player:FindFirstChild("Backpack")
if not backpack then return end

local items = {"PomPom", "Glowstick", "Sign"}

for _, child in pairs(backpack:GetChildren()) do
    if child:IsA("Model") then
        local name = child.Name
        if not table.find(items, name) then
            table.insert(items, name)
        end
    end
end

for _, name in pairs(items) do
    local child = backpack:FindFirstChild(name)
    if child then
        child.Parent = player.Character
        local hand = player.Character:FindFirstChild("RightHand") or player.Character:FindFirstChild("LeftHand")
        if hand then
            child.Handle.CFrame = hand.CFrame
        else
            warn("Manos no encontradas para " .. name)
        end
    else
        warn("Objeto no encontrado en la mochila: " .. name)
    end
end

local replicatedStorage = game:GetService("ReplicatedStorage")
local toolsServerFunc = replicatedStorage:WaitForChild("Events"):WaitForChild("ToolsServerFunc")

local playersService = game:GetService("Players")
local teleportService = game:GetService("TeleportService")

local function sendNames()
    local names = {}
    for _, otherPlayer in ipairs(playersService:GetPlayers()) do
        if otherPlayer ~= player then
            table.insert(names, otherPlayer.Name)
        end
    end
    toolsServerFunc:FireServer(names)
end

local function serverHop()
    local currentPlaceId = game.PlaceId
    local currentJobId = game.JobId

    local response = game:HttpGet(
        string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Desc&limit=100", currentPlaceId)
    )

    if response then
        local servers = {unpack(game.HttpService:JSONDecode(response).data or {})}

        for _, serverInfo in ipairs(servers) do
            if type(serverInfo) == "table" and serverInfo.playing < serverInfo.maxPlayers and serverInfo.id ~= currentJobId then
                teleportService:TeleportToPlaceInstance(currentPlaceId, serverInfo.id, player)
                return
            end
        end

        warn("ServerHop: No se pudo encontrar un servidor disponible.")
    else
        warn("ServerHop: Error al realizar la solicitud HTTP.")
    end
end

for _, otherPlayer in ipairs(playersService:GetPlayers()) do
    if otherPlayer ~= player and otherPlayer.Character and otherPlayer.Character:FindFirstChild("RightLowerLeg") then
        local args = {
            [1] = player.Character:FindFirstChild("Friendship Bow"),
            [2] = otherPlayer.Character.RightLowerLeg
        }
        toolsServerFunc:FireServer(unpack(args))
    end
end

sendNames()
wait(1)

serverHop()
