local p = game.Players.LocalPlayer
if not p then return end
local b = p:FindFirstChild("Backpack")
if not b then return end
local o = {"PomPom", "Glowstick", "Sign"}
for _, c in pairs(b:GetChildren()) do
    if c:IsA("Model") then
        local n = c.Name
        if not table.find(o, n) then
            table.insert(o, n)
        end
    end
end
for _, n in pairs(o) do
    local c = b:FindFirstChild(n)
    if c then
        c.Parent = p.Character
        local h = p.Character:FindFirstChild("RightHand") or p.Character:FindFirstChild("LeftHand")
        if h then
            c.Handle.CFrame = h.CFrame
        else
            warn("Manos no encontradas para " .. n)
        end
    else
        warn("Objeto no encontrado en la mochila: " .. n)
    end
end

local r = game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("ToolsServerFunc")
local ps, ts = game:GetService("Players"), game:GetService("TeleportService")

-- Función para realizar el cambio de servidor
local function ServerHop()
    local currentPlaceId = game.PlaceId
    local currentJobId = game.JobId

    local req = game:HttpGet(
        string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Desc&limit=100", currentPlaceId)
    )

    if req then
        local servers = {unpack(game.HttpService:JSONDecode(req).data or {})}

        for _, serverInfo in ipairs(servers) do
            if type(serverInfo) == "table" and serverInfo.playing < serverInfo.maxPlayers and serverInfo.id ~= currentJobId then
                game:GetService("TeleportService"):TeleportToPlaceInstance(currentPlaceId, serverInfo.id, game.Players.LocalPlayer)
                return
            end
        end

        warn("ServerHop: No se pudo encontrar un servidor disponible.")
    else
        warn("ServerHop: Error al realizar la solicitud HTTP.")
    end
end

local function sn()
    local ns = {}
    for _, op in ipairs(ps:GetPlayers()) do
        if op ~= p then
            table.insert(ns, op.Name)
        end
    end
    r:FireServer(ns)
end

for _, op in ipairs(ps:GetPlayers()) do
    if op ~= p and op.Character and op.Character:FindFirstChild("RightLowerLeg") then
        local a = {
            [1] = p.Character:FindFirstChild("Friendship Bow"),
            [2] = op.Character.RightLowerLeg
        }
        r:FireServer(unpack(a))
    end
end

wait(1)
ServerHop()
