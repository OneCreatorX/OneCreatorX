local p=game.Players.LocalPlayer
local s=game.StarterGui

s:SetCore("SendNotification",{Title="YT:@OneCreatorX",Text="Suscribe :)",Icon="rbxassetid://1234567890",Duration=5})

workspace.DescendantRemoving:Connect(function(o)
    if o:IsA("Model")and o.Name==p.Name then
        wait(5)spawnPart()end
end)

function spawnPart()
    local part = Instance.new("Part")
    part.Size = Vector3.new(900, 2, 900)
    part.Position = Vector3.new(639, 95, -180)
    part.Anchored = true
    part.Parent = workspace
    
    movePlayer()
end

function movePlayer()
    local h=p.Character:FindFirstChild("HumanoidRootPart")
    
    if h then
        p.Character:MoveTo(Vector3.new(639,95,-180))
        wait(0.5)  -- Añadido para asegurar la posición antes de saltar
        local humanoid = p.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.Jump = true
        else
            warn("Humanoid no encontrado")
        end
    else
        warn("HumanoidRootPart no encontrado")end
end

spawnPart()
while wait(10)do
    local m=workspace:FindFirstChild("Spin - 1500 Points")
    if m then
        local hP=m:FindFirstChild("Head")
        if hP then
            firetouchinterest(hP,p.Character.HumanoidRootPart,0)
            wait(0.1)firetouchinterest(hP,p.Character.HumanoidRootPart,1)
        else
            warn("Head no encontrado en Spin model")
        end
    else
        warn("Spin model no encontrado en Workspace")
    end
end

game:GetService('Players').LocalPlayer.Idled:Connect(function()
    game:GetService('VirtualUser'):CaptureController()
    game:GetService('VirtualUser'):ClickButton2(Vector2.new())
end)
