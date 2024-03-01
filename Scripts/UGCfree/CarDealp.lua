local plr = game.Players.LocalPlayer
local rmt = game:GetService("ReplicatedStorage").Remotes.Collectibles.TryToCollect

local function collectExtinguishers()
    while true do
        for _, m in ipairs(workspace:GetChildren()) do
            if m.Name == "Model" then
                local fExt = m:FindFirstChild("FireExt", true)
                local oPart = m:FindFirstChild("Part")

                if fExt and fExt:IsA("MeshPart") and oPart and oPart:IsA("Part") then
                    plr.Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(oPart.Position)
                    task.wait(0.3)
                    rmt:FireServer(oPart)
                    task.wait(0.3)
                    rmt:FireServer(oPart)
                    game:GetService("ReplicatedStorage").Remotes.Collectibles.TryToCollect:FireServer(oPart)
                    
                end
            end
        end
    end
end

collectExtinguishers()
