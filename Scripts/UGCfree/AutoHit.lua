local sg = Instance.new("ScreenGui")
sg.Parent = game.Players.LocalPlayer.PlayerGui

local tl = Instance.new("TextLabel")
tl.Size = UDim2.new(0, 200, 0, 50)
tl.Position = UDim2.new(0.5, -100, 0.5, -25)
tl.Text = "YT:@OneCreatorX"
tl.TextScaled = true
tl.BackgroundTransparency = 1
tl.TextColor3 = Color3.new(1, 1, 1)
tl.Parent = sg

local p = game.Players.LocalPlayer

local function adjustPosition()
    local maxDistance, forwardDistance = 500, 50
    local currentPos = p.Character and p.Character:FindFirstChild("Head") and p.Character.Head.Position

    if currentPos then
        local direction = p.Character.Head.CFrame.LookVector
        local newPos = currentPos + direction * forwardDistance

        if (newPos - currentPos).Magnitude > maxDistance then
            newPos = currentPos + direction * maxDistance
        end

        local args = {
            [1] = newPos,
            [2] = false
        }

        game:GetService("ReplicatedStorage"):WaitForChild("Court_ClientHitBall"):InvokeServer(unpack(args))
    end
end

while wait(0.05) do
    adjustPosition()
end
