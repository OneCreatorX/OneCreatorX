local Players = game:GetService("Players")
local p = Players.LocalPlayer
local sg = Instance.new("ScreenGui")
sg.ResetOnSpawn = false
sg.Name = "CustomGui"
sg.Parent = p.PlayerGui

local moveUpButton = Instance.new("TextButton")
moveUpButton.Name = "MoveUpButton"
moveUpButton.Text = "Move Up"
moveUpButton.Size = UDim2.new(0, 100, 0, 50)
moveUpButton.Position = UDim2.new(0.4, 10, 0, 10)
moveUpButton.Parent = sg

moveUpButton.MouseButton1Click:Connect(function()
    local c = p.Character.HumanoidRootPart.Position
    p.Character:SetPrimaryPartCFrame(CFrame.new(c.X, c.Y + 80, c.Z))
end)

local moveUpButton = Instance.new("TextButton")
moveUpButton.Name = "MoveUpButton"
moveUpButton.Text = "Move Up"
moveUpButton.Size = UDim2.new(0, 100, 0, 50)
moveUpButton.Position = UDim2.new(0.4, 10, 0, 10)
moveUpButton.Parent = sg

moveUpButton.MouseButton1Click:Connect(function()
    local c = p.Character.HumanoidRootPart.Position
    p.Character:SetPrimaryPartCFrame(CFrame.new(c.X, c.Y + 80, c.Z))
end)


