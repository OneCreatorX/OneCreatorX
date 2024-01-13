while wait(0.01) do
    local closestPlayer,minDistance = nil,math.huge

    for _,player in pairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer then
            local distance = (player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position) and (player.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude or math.huge

            if distance < minDistance then
                minDistance,closestPlayer = distance,player
            end
        end
    end

    if closestPlayer then
        local lookVector = (closestPlayer.Character.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Unit
        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position,game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(lookVector.X,0,lookVector.Z)))
    end

    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("Combat"):WaitForChild("Hit"):FireServer()
end
