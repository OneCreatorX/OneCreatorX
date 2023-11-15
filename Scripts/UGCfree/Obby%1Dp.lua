local player = game.Players.LocalPlayer

while wait(2) do
    for _, collectible in pairs(workspace.ICC_PopUp_Package.RunCollectables:GetChildren()) do
        collectible.CFrame = CFrame.new(player.Character.HumanoidRootPart.Position)
    end
    game:GetService("ReplicatedStorage").ICC_PopUp_Package.Packages.Knit.Services.SpinnerService.RF.RequestSpin:InvokeServer()
end
