game:GetService('Players').LocalPlayer.Idled:Connect(function()
game:GetService('VirtualUser'):CaptureController()   game:GetService('VirtualUser'):ClickButton2(Vector2.new())
end)

while true do task.wait(1)
  game:GetService("ReplicatedStorage"):WaitForChild("RequestSpin"):InvokeServer()
end
