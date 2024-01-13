local p = game.Players.LocalPlayer
local m = p.Character:WaitForChild("HumanoidRootPart")
local function aPPInPart(part)
    for _, o in ipairs(part:GetDescendants()) do
        if o:IsA("ProximityPrompt") then
            fireproximityprompt(o)
            cP = o
        end
    end
end

local function aPPInFolder()
    while true do
        for _, part in ipairs(workspace:WaitForChild("SpawnedPoints"):GetDescendants()) do
            if part:IsA("Part") then
                m.CFrame = CFrame.new(part.Position)
                if cP and cP.Parent ~= part then
                    cP = nil
                end
                aPPInPart(part)
            end
        end
        task.wait(0.3)
        local h = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
        h.WalkSpeed = 100
    end
end

spawn(aPPInFolder)
