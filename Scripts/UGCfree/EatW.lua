-- ScreenGui
local g = Instance.new("ScreenGui")
g.Name = "YT_OneCreatorX"
g.ResetOnSpawn = false
g.Parent = game.Players.LocalPlayer.PlayerGui

-- Frame principal
local f = Instance.new("Frame")
f.Size = UDim2.new(0, 200, 0, 100)
f.Position = UDim2.new(0, 10, 0, 10)
f.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
f.BorderSizePixel = 0
f.Active = true
f.Draggable = true
f.Parent = g

-- Título
local t = Instance.new("TextLabel")
t.Size = UDim2.new(1, 0, 0, 20)
t.Text = "YT: OneCreatorX"
t.TextColor3 = Color3.new(1, 1, 1)
t.BackgroundTransparency = 1
t.Parent = f

-- Botón de control
local b = Instance.new("TextButton")
b.Size = UDim2.new(0, 180, 0, 30)
b.Position = UDim2.new(0, 10, 0, 40)
b.BackgroundColor3 = Color3.new(0, 0.6, 0.2)
b.Text = "Auto Farm OFF"
b.TextColor3 = Color3.new(1, 1, 1)
b.Parent = f

local le = false
local minRange = 30
local maxRange = 300

local function toggleLoop()
    local success, error = pcall(function()
        while le do
            local p = game.Players.LocalPlayer
            local c = p.Character

            if c and c:FindFirstChild("Humanoid") then
                local h = c:WaitForChild("Humanoid")
                local cc = c.CurrentChunk

                if cc and cc:IsA("ObjectValue") then
                    if cc.Value == nil then
                        local fp = workspace.Map.Fragmentable:GetChildren()

                        if #fp > 0 then
                            local validOptions = {}

                            for _, pt in ipairs(fp) do
                                local hrp = c:WaitForChild("HumanoidRootPart")
                                local distance = (pt.Position - hrp.Position).Magnitude

                                if distance >= minRange and distance <= maxRange then
                                    table.insert(validOptions, pt.Position)
                                end
                            end

                            if #validOptions > 0 then
                                local randomIndex = math.random(1, #validOptions)
                                local targetPosition = validOptions[randomIndex]

                                h.WalkToPoint = targetPosition
                                h.Jump = true
                                wait(0.5)
                                game:GetService("Players").LocalPlayer.Character.Events.Sell:FireServer()

                                local a = {
                                    [1] = false,
                                    [2] = false
                                }

                                local s, e = pcall(function()
                                    game:GetService("Players").LocalPlayer.Character.Events.Grab:FireServer(unpack(a))
                                    wait(2)
                                end)

                                if not s then
                                    warn("Error executing Grab remote:", e)
                                end
                            else
                                warn("No valid fragmentable parts within range.")
                            end
                        else
                            warn("No fragmentable parts available.")
                        end
                    else
                        local s, e = pcall(function()
                            game:GetService("Players").LocalPlayer.Character.Events.Eat:FireServer()
                        end)

                        if not s then
                            warn("Error executing Eat remote:", e)
                        end
                    end
                end
            end

            wait(0.5)
        end
    end)

    if not success then
        warn("Error in toggleLoop:", error)
    end
end

b.MouseButton1Click:Connect(function()
    le = not le
    b.Text = le and "Auto Farm ON" or "Auto Farm OFF"
    
    if le then
        toggleLoop()
    end
end)

game:GetService('Players').LocalPlayer.Idled:Connect(function()
game:GetService('VirtualUser'):CaptureController()   game:GetService('VirtualUser'):ClickButton2(Vector2.new())
end)
