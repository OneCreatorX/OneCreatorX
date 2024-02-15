local Players = game:GetService("Players")
local p = Players.LocalPlayer
local r = p.Character.Laser.Remotes.hit
local loopRunning = true

local respawnSignal = Instance.new("BindableEvent")
respawnSignal.Name = "PlayerRespawnSignal"
respawnSignal.Parent = p.Character

function findAndHitEnemies()
    while loopRunning do
local args = {
    [1] = "Ectoplasm",
    [2] = 100
}

game:GetService("ReplicatedStorage"):WaitForChild("GamePackages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("LootService"):WaitForChild("RF"):WaitForChild("PlayerCollectedLoot"):InvokeServer(unpack(args))

        local head = p.Character and p.Character:FindFirstChild("Head")
        while not head do
            task.wait()
            head = p.Character and p.Character:FindFirstChild("Head")
        end

        local headPosition = head.Position

        local playerBody = p.Character and p.Character:FindFirstChild("Humanoid")
        local rootPart = p.Character and p.Character:FindFirstChild("HumanoidRootPart")

        if not playerBody or not rootPart or playerBody.Health < 5 then
            break
        end

        for _, arena in pairs(workspace.Arenas:GetChildren()) do
            for _, descendant in pairs(arena:GetDescendants()) do
                if descendant:IsA("Humanoid") then
                    local args = {[1] = {descendant}, [2] = false, [3] = headPosition}
                    r:FireServer(unpack(args))
                end
            end
        end

        task.wait()
    end
end

findAndHitEnemies()
