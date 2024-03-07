local player = game.Players.LocalPlayer
local scavengerFolder = game.Workspace:WaitForChild("Scavenger")

game.StarterGui:SetCore("SendNotification", {
    Title = "OneCreatorX",
    Text = "Auto Collect",
    Duration = 10,
})

local endZone = game.Workspace:FindFirstChild("EndZone")

if endZone then
    player.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(endZone.Position)
else
    warn("EndZone does not exist.")
end

local purchaseRemote = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes"):FindFirstChild("Purchase")
local photobootRemote = game:GetService("ReplicatedStorage"):FindFirstChild("PhotobootClosed")

for _, part in ipairs(scavengerFolder:GetDescendants()) do
    if part:IsA("Part") or part:IsA("MeshPart") then
        player.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(part.Position)
        wait(1)
    end
end

if purchaseRemote then
    local purchaseArgs = {
        [1] = 16301305811
    }
    purchaseRemote:FireServer(unpack(purchaseArgs))
else
    warn("Purchase remote does not exist.")
end

if photobootRemote then
    local photobootArgs = {
        [1] = game:GetService("Players").LocalPlayer
    }
    photobootRemote:FireServer(unpack(photobootArgs))
else
    warn("Photoboot remote does not exist.")
end
