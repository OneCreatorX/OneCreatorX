local SG, TL1, TL2 = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui), Instance.new("TextLabel", SG), Instance.new("TextLabel", SG)
TL1.Size, TL1.Position, TL1.BackgroundTransparency, TL1.TextColor3, TL1.Text, TL1.Font, TL1.TextSize = UDim2.new(0, 200, 0, 50), UDim2.new(0.5, -100, 0, 0), 1, Color3.new(1, 1, 1), "OneCreatorX", Enum.Font.SourceSansBold, 20
TL2.Size, TL2.Position, TL2.BackgroundTransparency, TL2.TextColor3, TL2.Text, TL2.Font, TL2.TextSize = UDim2.new(0, 200, 0, 50), UDim2.new(0.5, -100, 0, 50), 1, Color3.new(1, 1, 1), "Automatic Find", Enum.Font.SourceSansBold, 20

local placeholder = game.Workspace.A_placeholder
local imageLabel = placeholder:FindFirstChildWhichIsA("ImageLabel", true)

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local function findRemote(remoteName)
    local remote = ReplicatedStorage:FindFirstChild(remoteName, true)
    return remote
end

if imageLabel then
    local id = imageLabel.Image:match("id=(%d+)")

    if id then
        local questID = tostring(id)
        local descendants = placeholder:GetDescendants()
        local clockTextLabel

        for _, descendant in pairs(descendants) do
            if descendant:IsA("TextLabel") and descendant.Name == "Clock" then
                clockTextLabel = descendant
                break
            end
        end

        if clockTextLabel then
            local humanoid = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")

            clockTextLabel:GetPropertyChangedSignal("Text"):Connect(function()
                if clockTextLabel.Text == "00:01" then
                    wait(10)  -- Waiting for 10 seconds

                    local newPrimaryPart = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
                    newPrimaryPart.CFrame = CFrame.new(Vector3.new(-238, 40, -457))

                    local RFQuest = findRemote("RFQuest")

                    if RFQuest then
                        RFQuest:InvokeServer(questID))
                    else
                        warn("No se encontró el Remote RFQuest.")
                    end

                    humanoid.WalkToPoint = Vector3.new(-238, 41, -492)
                    waitUntilArrival(humanoid, Vector3.new(-238, 41, -492), 3)
                end
            end)
        else
            warn("No se encontró el Clock TextLabel como descendiente de A_placeholder.")
        end
    end
else
    warn("No ImageLabel found under A_placeholder.")
end

function waitUntilArrival(humanoid, targetPosition, tolerance)
    while humanoid.Parent and humanoid.Health > 0 and humanoid.Parent:FindFirstChild("HumanoidRootPart") do
        local currentPosition = humanoid.Parent.HumanoidRootPart.Position
        local distance = (currentPosition - targetPosition).Magnitude

        if distance <= tolerance then
            break
        end

        wait(0.05)
    end
end
