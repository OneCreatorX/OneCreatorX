local p=game.Players.LocalPlayer
local s=game.StarterGui
s:SetCore("SendNotification",{Title="YT:@OneCreatorX",Text="Suscribe :)",Icon="rbxassetid://1234567890",Duration=5})
workspace.DescendantRemoving:Connect(function(o)
    if o:IsA("Model")and o.Name==p.Name then
        wait(5)moveP()end
end)
function moveP()
    local h=p.Character:FindFirstChild("HumanoidRootPart")
    
    if h then
        p.Character:MoveTo(Vector3.new(93, -32, -16))
        h.Anchored=true
    else
        warn("HumanoidRootPart no encontrado")end
end
moveP()
while wait(10)do
    local m=workspace:FindFirstChild("Spin - 1500 Points")
    if m then
        local hP=m:WaitForChild("Head")
        firetouchinterest(hP,p.Character.HumanoidRootPart,0)
        wait(0.1)firetouchinterest(hP,p.Character.HumanoidRootPart,1)
    else
        warn("Spin model no encontrado en Workspace")end
end
game:GetService('Players').LocalPlayer.Idled:Connect(function()
    game:GetService('VirtualUser'):CaptureController()
    game:GetService('VirtualUser'):ClickButton2(Vector2.new())
end)
