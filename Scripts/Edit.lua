for _, obj in ipairs(game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):GetDescendants()) do
    if obj:IsA("TextLabel") and obj.Text == "Credits: X" then
        obj.Text = "OneCreatorX"
        break
    end
end
