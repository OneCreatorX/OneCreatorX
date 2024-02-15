local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local p = Players.LocalPlayer
local r = p.Character.Laser.Remotes.hit
local loopRunning = true

local respawnSignal = Instance.new("BindableEvent")
respawnSignal.Name = "PlayerRespawnSignal"
respawnSignal.Parent = p.Character

local function invokeServerWithEctoplasm(amount)
    local args = {
        [1] = "Ectoplasm",
        [2] = amount
    }

    ReplicatedStorage:WaitForChild("GamePackages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("LootService"):WaitForChild("RF"):WaitForChild("PlayerCollectedLoot"):InvokeServer(unpack(args))
end
function findAndHitEnemies()
    local function hitEnemies()
        invokeServerWithEctoplasm(100000000)
        invokeServerWithEctoplasm(10000000)
        invokeServerWithEctoplasm(1000000)
invokeServerWithEctoplasm(100000)
invokeServerWithEctoplasm(10000)
invokeServerWithEctoplasm(1000)
invokeServerWithEctoplasm(500)
invokeServerWithEctoplasm(100)
invokeServerWithEctoplasm(10)

        local head = p.Character and p.Character:FindFirstChild("Head")
        while not head do
            task.wait()
            head = p.Character and p.Character:FindFirstChild("Head")
        end

        local headPosition = head.Position

        local playerBody = p.Character and p.Character:FindFirstChild("Humanoid")
        local rootPart = p.Character and p.Character:FindFirstChild("HumanoidRootPart")

        if not playerBody or not rootPart or playerBody.Health < 5 then
        loopConnection:Disconnect()
        print("loopRunning set to false")
        return
    end
end


        for _, arena in pairs(workspace.Arenas:GetChildren()) do
            for _, descendant in pairs(arena:GetDescendants()) do
                if descendant:IsA("Humanoid") then
                    local args = {[1] = {descendant}, [2] = false, [3] = headPosition}
                    r:FireServer(unpack(args))
                end
            end
        end
    end

    RunService.Heartbeat:Connect(hitEnemies)
end

findAndHitEnemies()
