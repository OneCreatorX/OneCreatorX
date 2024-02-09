local placeholder = workspace.A_placeholder
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
                    if RFQuest then RFQuest:InvokeServer(tonumber(questID)) end
                    task.wait(15)
                    game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(Vector3.new(-239, 41, -494)))
                end
            end
        end
    end)
else
    warn("No se encontró el Clock TextLabel como descendiente de A_placeholder.")
end

local player = game.Players.LocalPlayer
local workspace = game.Workspace
local playerGui = player:WaitForChild("PlayerGui")

local function movePlayerToCameraCFrame()
    game:GetService("ReplicatedStorage"):WaitForChild("TMReplicatedStorage"):WaitForChild("InvitaAmigos"):FireServer()
    
    local tmStarterGui = playerGui:WaitForChild("TMStarterGui", 5)
    if not tmStarterGui then return end

    local success, camera = pcall(function()
        return tmStarterGui:WaitForChild("Camera", 5)
    end)

    if success and camera and camera:IsA("Camera") then
        local character = player.Character
        if character then
            local playerCFrame = character:GetPrimaryPartCFrame()
            local cameraCFrame = camera.CFrame

            character:SetPrimaryPartCFrame(cameraCFrame)
            wait(1.5)

            for _, part in pairs(workspace:GetDescendants()) do
                if (part:IsA("BasePart") or part:IsA("MeshPart")) and part:FindFirstChild("ProximityPrompt") then
                    local proximity = part.ProximityPrompt
                    if proximity and (part.Position - character:GetPrimaryPartCFrame().Position).Magnitude < 10 then
                        fireproximityprompt(proximity)
                        wait(2)
                        game:GetService("ReplicatedStorage"):WaitForChild("FB-ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ResetearAspecto"):FireServer()
                    end
                end
            end
        end
    end
end

local function activateFunction()
    task.wait(10)
    movePlayerToCameraCFrame()
end

local function checkTaskTimer()
    local descendants = playerGui:GetDescendants()

    for _, descendant in ipairs(descendants) do
        if descendant:IsA("TextLabel") and descendant.Name == "taskTimer" then
            descendant:GetPropertyChangedSignal("Text"):Connect(function()
                if descendant.Text == "Next task in: 00:00" then
                    activateFunction()
                end
            end)
            break
        end
    end
end

checkTaskTimer()
