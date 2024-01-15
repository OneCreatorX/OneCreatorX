local player = game.Players.LocalPlayer
local workspace = game.Workspace
local runService = game:GetService("RunService")

local function moveToPlayerPosition(part)
    if part and part:IsA("BasePart") then
        part.CFrame = player.Character.HumanoidRootPart.CFrame
        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("UGCEventRedeem"):InvokeServer()
        task.wait(1)
        part.CFrame = player.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, -5)
    end
end

local function disableCollisionAndInvisibility(part)
    if part and part:IsA("BasePart") then
        part.CanCollide = false
        part.Transparency = 1 
    end
end

local function movePartsInTycoon(tycoonModel)
    local buttonsFolder = tycoonModel:FindFirstChild("Buttons")

    if buttonsFolder and buttonsFolder:IsA("Folder") then
        for _, part in pairs(buttonsFolder:GetDescendants()) do
            disableCollisionAndInvisibility(part)
            moveToPlayerPosition(part)
        end
    end
end

local function findAndMoveParts()
    local tycoonValue = tostring(player.Tycoon.Value)
    local selectedTycoon = workspace.Tycoons:FindFirstChild(tycoonValue)

    if selectedTycoon then
        movePartsInTycoon(selectedTycoon)
    end
end

runService.Heartbeat:Connect(function()
    findAndMoveParts()
end)

local player = game.Players.LocalPlayer
local proximityMap = {}

local function isProximityValid(proximity)
    return true 
end

local function activateClosestPrompt()
    local humanoid = player.Character:WaitForChild("Humanoid")
    humanoid.WalkSpeed = 50

    while true do
        local closestPrompt, closestDist

        for _, descendant in pairs(workspace:GetDescendants()) do
            if descendant:IsA("ProximityPrompt") and isProximityValid(descendant) then
                local dist = (descendant.Parent.Position - humanoid.Parent.PrimaryPart.Position).Magnitude

                if not closestDist or dist < closestDist then
                    closestPrompt = descendant
                    closestDist = dist
                end
            end
        end

        if closestPrompt then
            humanoid:MoveTo(closestPrompt.Parent.Position)
            fireproximityprompt(closestPrompt)
        end

        task.wait(1)
    end
end

activateClosestPrompt()

LocalPlayer.Idled:Connect(function()
    local VirtualUser = game:GetService('VirtualUser')
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)
