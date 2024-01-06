local s = Instance.new("ScreenGui")
s.Parent = game.Players.LocalPlayer.PlayerGui

local f = Instance.new("Frame")
f.Size, f.Position, f.BackgroundColor3, f.BackgroundTransparency, f.Parent = UDim2.new(0, 200, 0, 150), UDim2.new(0, 10, 0, 10), Color3.fromRGB(50, 50, 50), 0.5, s
f.Active = true
f.Draggable = true

local tt = Instance.new("TextLabel")
tt.Size, tt.Position, tt.Text, tt.TextColor3, tt.Font, tt.TextSize, tt.Parent = UDim2.new(1, 0, 0, 20), UDim2.new(0, 0, 0, 5), "Run Simulator [Beta W1]", Color3.fromRGB(255, 255, 255), Enum.Font.SourceSansBold, 14, f

local tb1 = Instance.new("TextButton")
tb1.Size, tb1.Position, tb1.Text, tb1.BackgroundColor3, tb1.TextColor3, tb1.Parent = UDim2.new(0, 180, 0, 20), UDim2.new(0, 10, 0, 30), "AutoEgg OFF", Color3.fromRGB(0, 150, 255), Color3.fromRGB(255, 255, 255), f

local tb2 = Instance.new("TextButton")
tb2.Size, tb2.Position, tb2.Text, tb2.BackgroundColor3, tb2.TextColor3, tb2.Parent = UDim2.new(0, 180, 0, 20), UDim2.new(0, 10, 0, 60), "AutoWins OFF", Color3.fromRGB(255, 0, 0), Color3.fromRGB(255, 255, 255), f

local it = Instance.new("TextLabel")
it.Size, it.Position, it.Text, it.TextColor3, it.Parent = UDim2.new(1, 0, 0, 20), UDim2.new(0, 0, 1, -20), "YT:@OneCreatorX", Color3.fromRGB(255, 255, 255), f

local caea, ctmp = false, false

local function toggleAE()
    caea = not caea
    tb1.Text = caea and "AutoEgg ON" or "AutoEgg OFF"
end

local function toggleMP()
    ctmp = not ctmp
    tb2.Text = ctmp and "AutoWins ON" or "AutoWins OFF"
end

tb1.MouseButton1Click:Connect(toggleAE)
tb2.MouseButton1Click:Connect(toggleMP)

local pe, rp, fl, up = Vector3.new(-38, 326, -56), workspace.Race["1"].Rewards, workspace.Race["1"].Road.End.Floor, Vector3.new(-36, 326, 37)

local function assignPositions()
    while true do
        if ctmp then
            for _, p in pairs(game.Players:GetPlayers()) do
                local c = p.Character
                if c and c:FindFirstChild("HumanoidRootPart") then
                    c:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(pe.x, c:FindFirstChild("HumanoidRootPart").Position.y, pe.z)
                end
            end
            task.wait()

            for i = 1, 10 do
                local part = rp[tostring(i)]
                if part then
                    for _, p in pairs(game.Players:GetPlayers()) do
                        local c = p.Character
                        if c and c:FindFirstChild("HumanoidRootPart") then
                            c:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(part.Position.x, c:FindFirstChild("HumanoidRootPart").Position.y, part.Position.z)
                        end
                    end
                    task.wait(0.1)
                end
            end

            for _, p in pairs(game.Players:GetPlayers()) do
                local c = p.Character
                if c and c:FindFirstChild("HumanoidRootPart") then
                    c:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(fl.Position.x, c:FindFirstChild("HumanoidRootPart").Position.y, fl.Position.z)
                end
            end

            task.wait(0.7)
            for _, p in pairs(game.Players:GetPlayers()) do
                local c = p.Character
                if c and c:FindFirstChild("HumanoidRootPart") then
                    c:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(up.x, c:FindFirstChild("HumanoidRootPart").Position.y, up.z)
                end
            end

            task.wait(0.7)
        else
            task.wait(0.7)
        end
    end
end

spawn(assignPositions)

local eggRemote = game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("EggOpened")
local eggArgs = {
    [1] = "Basic",
    [2] = "Single",
    [3] = {
        ["Dog"] = true,
        ["Kitty"] = true,
        ["Deer"] = true
    }
}

while true do
    if caea then
        eggRemote:InvokeServer(unpack(eggArgs))
        task.wait(0.5)
    else
        task.wait(1)
    end
end

