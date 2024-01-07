local function moverYVolver(part)
    local originalEstado = {
        Position = part.Position,
        CanCollide = part.CanCollide,
        Transparency = part.Transparency
    }

    part.CanCollide = false
    part.Transparency = 1

    part.Position = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position

    wait(1)

    part.Position = originalEstado.Position
    part.CanCollide = originalEstado.CanCollide
    part.Transparency = originalEstado.Transparency
end

while true do
    local jugadorLocal = game.Players.LocalPlayer
    if jugadorLocal and jugadorLocal.Character then
        for _, object in pairs(workspace:GetDescendants()) do
            if object:IsA("BasePart") and object:FindFirstChild("TouchInterest") then
                local humanoidRootPart = jugadorLocal.Character:FindFirstChild("HumanoidRootPart")
                if humanoidRootPart then
                    local distancia = (object.Position - humanoidRootPart.Position).Magnitude

                    if distancia < 150 then
                        moverYVolver(object)
                    end
                end
            end
        end
    end

    wait(1)
end

LocalPlayer.Idled:Connect(function()
    local VirtualUser = game:GetService('VirtualUser')
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)
