local player = game.Players.LocalPlayer
local guiEnabled = true

local function eliminateMarkers()
    local playerPosition = player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character.HumanoidRootPart.Position

    if playerPosition then
        local maxDistance = 300

        for _, marker in pairs(workspace:WaitForChild("Map"):GetDescendants()) do
            if marker:IsA("Model") and marker:FindFirstChild("TycoonBoundary") then
                local boundary = marker:FindFirstChild("TycoonBoundary")
                if boundary and boundary:IsA("Part") and (playerPosition - boundary.Position).Magnitude > maxDistance then
                    marker:Destroy()
                end
            end
        end
    end
end

local function executeTasks()
    if player.Character then
        for _ = 1, 15 do
            wait(0.1)
            game.ReplicatedStorage:WaitForChild("events-shared/global@GlobalEvents"):WaitForChild("getMoney"):FireServer(1e11)
        end

        local dominiButton = workspace.Map.TycoonPlots.TycoonMarker.Tycoon.DefaultButtons.Domini1000.Button.Button
        if player.Character:FindFirstChild("HumanoidRootPart") then
            player.Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(dominiButton.Position)
        end
    end
end

local function createUI()
    local screenGui = player.PlayerGui:FindFirstChild("OneCreatorXGui")
    if not screenGui then
        screenGui = Instance.new("ScreenGui")
        screenGui.Name = "OneCreatorXGui"
        screenGui.Parent = player.PlayerGui

        local frame = Instance.new("Frame")
        frame.Size = UDim2.new(0, 200, 0, 150)
        frame.Position = UDim2.new(0.5, -100, 0.5, -75)
        frame.BackgroundColor3 = Color3.new(0, 0, 0)
        frame.BorderSizePixel = 2
        frame.Draggable = true
        frame.Active = true
        frame.Parent = screenGui

        local title = Instance.new("TextLabel")
        title.Size = UDim2.new(1, 0, 0, 20)
        title.Text = "YT:@OneCreatorX"
        title.Font = Enum.Font.SourceSansBold
        title.TextSize = 20
        title.TextColor3 = Color3.new(1, 1, 1)
        title.BackgroundTransparency = 1
        title.Parent = frame

        local progressLabel = Instance.new("TextLabel")
        progressLabel.Size = UDim2.new(1, 0, 0, 20)
        progressLabel.Position = UDim2.new(0, 0, 0, 20)
        progressLabel.Text = "Progress: 0%"
        progressLabel.Font = Enum.Font.SourceSans
        progressLabel.TextSize = 18
        progressLabel.TextColor3 = Color3.new(1, 1, 1)
        progressLabel.BackgroundTransparency = 1
        progressLabel.Parent = frame

        local stopButton = Instance.new("TextButton")
        stopButton.Size = UDim2.new(1, 0, 0, 20)
        stopButton.Position = UDim2.new(0, 0, 0, 50)
        stopButton.Text = "Stop Execution"
        stopButton.Font = Enum.Font.SourceSans
        stopButton.TextSize = 16
        stopButton.TextColor3 = Color3.new(1, 1, 1)
        stopButton.BackgroundColor3 = Color3.new(0.8, 0.2, 0.2)
        stopButton.BorderSizePixel = 2
        stopButton.Parent = frame

        stopButton.MouseButton1Click:Connect(function()
            guiEnabled = not guiEnabled
            if guiEnabled then
                stopButton.BackgroundColor3 = Color3.new(0.8, 0.2, 0.2)
            else
                stopButton.BackgroundColor3 = Color3.new(0.2, 0.8, 0.2)
            end
        end)

        return progressLabel
    else
        return screenGui.OneCreatorXGui.ProgressLabel
    end
end

local function handleSignalConnection(progressLabel)
    local prestigeButton = workspace.Map.TycoonPlots.TycoonMarker.Tycoon.DefaultButtons.Prestige.Button.Button
    local prestigeLabel = prestigeButton.ButtonUI.Label

    local function onTextChanged()
        print("Text changed:", prestigeLabel.Text)

        local current, currentSuffix, total, totalSuffix = prestigeLabel.Text:match("([%d%.]+)([kmbtKMBT]*) / ([%d%.]+)([kmbtKMBT]*)")
        if current and total then
            current = tonumber(current)
            total = tonumber(total)

            local multipliers = {
                k = 1e3, m = 1e6, b = 1e9, t = 1e12,
                K = 1e3, M = 1e6, B = 1e9, T = 1e12,
                q = 1e15, Q = 1e15, s = 1e18, S = 1e18,
                o = 1e21, O = 1e21, n = 1e24, N = 1e24,
                d = 1e27, D = 1e27, U = 1e30, u = 1e30
            }

            local currentMultiplier = multipliers[currentSuffix] or 1
            local totalMultiplier = multipliers[totalSuffix] or 1

            current = current * currentMultiplier
            total = total * totalMultiplier

            print("Prestige Progress:", current, "/", total)

            local progress = math.floor((current / total) * 100)
            progressLabel.Text = "Progress: " .. progress .. "%"

            if progress >= 150 then
                -- Detener el bucle automáticamente si el porcentaje supera el 150%
                guiEnabled = false
            end

            if guiEnabled and progress >= 100 then
                -- Llamada a la función cuando se alcanza el 100% de progreso y la interfaz está habilitada
                executeTasks()
            end
        end
    end

    prestigeLabel:GetPropertyChangedSignal("Text"):Connect(onTextChanged)
end

eliminateMarkers()
local progressLabel = createUI()
handleSignalConnection(progressLabel)
executeTasks()
game:GetService('Players').LocalPlayer.Idled:Connect(function()
    game:GetService('VirtualUser'):CaptureController()
    game:GetService('VirtualUser'):ClickButton2(Vector2.new())
end)
