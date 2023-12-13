local args = {
    [1] = 99
}

game:GetService("ReplicatedStorage"):WaitForChild("LimitedPickups"):WaitForChild("Remotes"):WaitForChild("ObtainedLimitedPickup"):FireServer(unpack(args))

local function realizarTransaccion(id)
    local args = {
        [1] = 1,
        [2] = id,
        [3] = 1,
        [4] = false
    }

    game:GetService("ReplicatedStorage"):WaitForChild("Shopping"):WaitForChild("Remotes"):WaitForChild("ToServer"):WaitForChild("RequestTransaction"):FireServer(unpack(args))
end

local function spamTransaction2()
    local args = {
        [1] = 2,
        [2] = 142,
        [3] = 1,
        [4] = true
    }

    for _ = 1, 90000 do
        wait(0.1)
        game:GetService("ReplicatedStorage"):WaitForChild("Shopping"):WaitForChild("Remotes"):WaitForChild("ToServer"):WaitForChild("RequestTransaction"):FireServer(unpack(args))
    end
end

local args = {
    [1] = 19
}

local function spamLimitedPickups()
    for _ = 1, 90000 do
        game:GetService("ReplicatedStorage"):WaitForChild("LimitedPickups"):WaitForChild("Remotes"):WaitForChild("ObtainedLimitedPickup"):FireServer(unpack(args))
        wait(0.1)
    end
end

local function spamTransacciones()
    for _ = 1, 90000 do
        wait(0.1)
        realizarTransaccion(140)
        realizarTransaccion(141)
    end
end

local coroutineLimitedPickups = coroutine.create(spamLimitedPickups)
local coroutineTransacciones = coroutine.create(spamTransacciones)
local coroutineTransaction2 = coroutine.create(spamTransaction2)

coroutine.resume(coroutineLimitedPickups)
coroutine.resume(coroutineTransacciones)
coroutine.resume(coroutineTransaction2)

local NPCsFolder = workspace:WaitForChild("GAMEPLAY"):WaitForChild("NPCs"):WaitForChild("ActiveNPCs")

for _, npc in ipairs(NPCsFolder:GetChildren()) do
    game:GetService("ReplicatedStorage"):WaitForChild("NPCs"):WaitForChild("Remotes"):WaitForChild("ToServer"):WaitForChild("RequestNewNpcLine"):FireServer(npc)
end

for _ = 1, 80 do
    local args = {
        [1] = 19
    }

    game:GetService("ReplicatedStorage"):WaitForChild("LimitedPickups"):WaitForChild("Remotes"):WaitForChild("ObtainedLimitedPickup"):FireServer(unpack(args))
end

game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(Vector3.new(210.11, 3.65284, 110.622)))

task.wait(140)

game:GetService("ReplicatedStorage"):WaitForChild("LoginCalendar"):WaitForChild("Remotes"):WaitForChild("ToServer"):WaitForChild("ClaimTimedRewards"):FireServer()
game:GetService("ReplicatedStorage"):WaitForChild("LoginCalendar"):WaitForChild("Remotes"):WaitForChild("ToServer"):WaitForChild("ClaimDailyRewards"):FireServer()

local gui = Instance.new("ScreenGui")
gui.IgnoreGuiInset = true
gui.Parent = game.Players.LocalPlayer.PlayerGui

local fondo = Instance.new("Frame")
fondo.Size = UDim2.new(0.5, 0, 0.2, 0)
fondo.Position = UDim2.new(0.25, 0, 0.75, 0)
fondo.BackgroundColor3 = Color3.new(0, 0, 0)
fondo.BackgroundTransparency = 0.5

local texto = Instance.new("TextLabel")
texto.Size = UDim2.new(1, 0, 1, 0)
texto.Position = UDim2.new(0, 0, 0, 0)
texto.Text = "Reset Character"
texto.TextSize = 40
texto.TextColor3 = Color3.new(1, 1, 1)
texto.BackgroundTransparency = 1
texto.Parent = fondo
fondo.Parent = gui
