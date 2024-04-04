local pp = game.Players.LocalPlayer
local g = Instance.new("ScreenGui")
g.ResetOnSpawn = false
g.Parent = pp.PlayerGui

local f = Instance.new("Frame", g)
f.Size, f.Position, f.BackgroundColor3, f.BorderSizePixel, f.BorderColor3, f.Draggable, f.Active = UDim2.new(0, 200, 0, 150), UDim2.new(0.5, -100, 0.5, -80), Color3.fromRGB(32, 32, 32), 2, Color3.new(1, 1, 1), true, true

local t = Instance.new("TextLabel", f)
t.Size, t.Position, t.Text, t.TextSize, t.TextColor3, t.BackgroundColor3 = UDim2.new(1, 0, 0, 30), UDim2.new(0, 0, 0, 0), "YT: OneCreatorX v2", 16, Color3.fromRGB(255, 255, 255), Color3.fromRGB(46, 46, 46)

local a = Instance.new("TextButton", f)
a.Size, a.Position, a.Text, a.TextColor3, a.BackgroundColor3 = UDim2.new(1, 0, 0, 30), UDim2.new(0, 0, 0, 60), "Auto Click (OFF)", Color3.fromRGB(255, 255, 255), Color3.fromRGB(46, 46, 46)

local a2 = Instance.new("TextButton", f)
a2.Size, a2.Position, a2.Text, a2.TextColor3, a2.BackgroundColor3 = UDim2.new(1, 0, 0, 30), UDim2.new(0, 0, 0, 30), "Auto Rebirth (OFF)", Color3.fromRGB(255, 255, 255), Color3.fromRGB(46, 46, 46)

local b = Instance.new("TextButton", f)
b.Size, b.Position, b.Text, b.TextColor3, b.BackgroundColor3 = UDim2.new(1, 0, 0, 30), UDim2.new(0, 0, 0, 90), "Auto Tokens - Options", Color3.fromRGB(255, 255, 255), Color3.fromRGB(46, 46, 46)

local o = Instance.new("Frame", f)
o.Size, o.Position, o.BackgroundColor3, o.BorderSizePixel, o.BorderColor3, o.Visible = UDim2.new(1, 0, 0, 60), UDim2.new(0, 0, 0, 150), Color3.fromRGB(32, 32, 32), 2, Color3.new(1, 1, 1), false

local tF = workspace:WaitForChild("Tokens")
local fO = {}

for _, f in pairs(tF:GetChildren()) do
    if f:IsA("Folder") then
        table.insert(fO, f.Name)
    end
end

local cOpt = {}

local function executeOption(optionName)
    local selectedZones = {}
    for _, selectedOpt in ipairs(cOpt) do
        if tF:FindFirstChild(selectedOpt) then
            table.insert(selectedZones, tF:FindFirstChild(selectedOpt))
        end
    end
    for _, zone in ipairs(selectedZones) do
        for _, part in pairs(zone:GetDescendants()) do
            if (part:IsA("Part") or part:IsA("MeshPart")) and part:FindFirstChild("TouchInterest") then
                part.CFrame = CFrame.new(pp.Character.HumanoidRootPart.Position)
            end
        end
    end
end

for i, n in ipairs(fO) do
    local oB = Instance.new("TextButton")
    oB.Size = UDim2.new(1, 0, 0, 20)
    oB.Position = UDim2.new(0, 0, 0, (i - 1) * 20)
    oB.Text = n
    oB.TextColor3 = Color3.fromRGB(255, 255, 255)
    oB.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
    oB.Name = n
    oB.Parent = o
    oB.MouseButton1Click:Connect(function()
        local index = table.find(cOpt, n)
        if not index then
            table.insert(cOpt, n)
            oB.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        else
            table.remove(cOpt, index)
            oB.BackgroundColor3 = Color3.fromRGB(46, 46, 46)
        end
    end)
end


local aC, a2C = false, false

local function optionLoop()
    while true do
        task.wait(1)
        executeOption(cOpt)
    end
end

a.MouseButton1Click:Connect(function()
    aC = not aC
    a.Text, a.BackgroundColor3 = aC and "Auto Click (ON)" or "Auto Click (OFF)", aC and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(46, 46, 46)
    while aC do
        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Click"):FireServer()
        task.wait(0.1)
    end
end)

a2.MouseButton1Click:Connect(function()
    a2C = not a2C
    a2.Text, a2.BackgroundColor3 = a2C and "Auto Rebirth (ON)" or "Auto Rebirth (OFF)", a2C and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(46, 46, 46)
    while a2C do
        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("Rebirth"):FireServer()
        task.wait(5)
    end
end)

b.MouseButton1Click:Connect(function()
    o.Visible = not o.Visible
end)

local bi = Instance.new("TextButton", f)
bi.Size, bi.Position, bi.Text, bi.TextColor3, bi.BackgroundColor3 = UDim2.new(1, 0, 0, 30), UDim2.new(0, 0, 0, 120), "Auto Chest Spin OFF", Color3.fromRGB(255, 255, 255), Color3.fromRGB(46, 46, 46)

local p = game.Players.LocalPlayer
local c = workspace.Scriptables.Chests
local g = workspace.Scriptables.Gates
local n = { "Chest1", "Chest2", "Chest3", "Chest4", "Chest5" }

bi.MouseButton1Click:Connect(function()
    autoChest = not autoChest
    bi.Text = autoChest and "Auto Chest Spin ON" or "Auto Chest Spin OFF"

    while autoChest do
        local success, error = pcall(function()
            game.ReplicatedStorage.Events.WheelSpin:FireServer("Normal")

            local destinationChest = nil

            for i = 1, 5 do
                local chest = c:FindFirstChild("Chest" .. i)

                if chest then
                    local previousGate = g:FindFirstChild("Gate" .. (i - 1))
                    if not previousGate then
                        destinationChest = chest
                        break  -- Salir del bucle si se encuentra un cofre existente sin puerta anterior
                    end
                end
            end

            if destinationChest then
                local pp = destinationChest.PrimaryPart
                local destination = pp.Position + Vector3.new(0, 8, 0)
                local start = p.Character.HumanoidRootPart.Position
                local distance = (destination - start).magnitude
                local duration = distance / 50

                for t = 0, 1, 0.01 do
                    p.Character.HumanoidRootPart.CFrame = CFrame.new(start:Lerp(destination, t))
                    task.wait(duration * 0.01)
                end

                task.wait(0.1)
            end

            task.wait(5)
        end)

        if not success then
            warn("Error in Auto Chest loop:", error)
        end
    end
end)

task.spawn(optionLoop)

game:GetService('Players').LocalPlayer.Idled:Connect(function()
    game:GetService('VirtualUser'):CaptureController()
    game:GetService('VirtualUser'):ClickButton2(Vector2.new())
end)
