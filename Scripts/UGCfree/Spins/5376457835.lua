game:GetService('Players').LocalPlayer.Idled:Connect(function()
game:GetService('VirtualUser'):CaptureController()   game:GetService('VirtualUser'):ClickButton2(Vector2.new())
end)

while true do wait(3)
game:GetService("ReplicatedStorage"):WaitForChild("SharedModule"):WaitForChild("Remotes"):WaitForChild("Spin"):FireServer()
end
