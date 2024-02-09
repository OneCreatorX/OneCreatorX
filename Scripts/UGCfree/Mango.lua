local placeholder = game.Workspace.A_placeholder
local clockTextLabel = placeholder:FindFirstChild("Clock", true)

if clockTextLabel then
    local humanoid = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")

    clockTextLabel:GetPropertyChangedSignal("Text"):Connect(function()
        if clockTextLabel.Text == "00:01" then
            task.wait(5)

            local imageLabel = placeholder:FindFirstChildWhichIsA("ImageLabel", true)

            if imageLabel then
                local id = tonumber(imageLabel.Image:match("id=(%d+)"))

                if id then
                    local questID = tostring(id)
                     
                    game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(Vector3.new(-240, 58, -346)))
                    task.wait(20)
                    local RFQuest = game:GetService("ReplicatedStorage"):FindFirstChild("RFQuest")
                    if RFQuest then
                        RFQuest:InvokeServer(tonumber(questID))
                    else
                        warn("No se encontró el Remote RFQuest.")
                    end
                    task.wait(15)
                    humanoid.WalkToPoint = Vector3.new(-239, 39, -494)
                    waitUntilArrival(humanoid, Vector3.new(-239, 39, -494), 3)
                end
            else
                warn("No se encontró ImageLabel bajo A_placeholder.")
            end
        end
    end)
else
    warn("No se encontró el Clock TextLabel como descendiente de A_placeholder.")
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
