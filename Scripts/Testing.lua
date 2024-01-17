local player = game.Players.LocalPlayer

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
        for _ = 1, 20 do
            wait(0.1)
            game.ReplicatedStorage:WaitForChild("events-shared/global@GlobalEvents"):WaitForChild("getMoney"):FireServer(1e11)
        end

        local dominiButton = workspace.Map.TycoonPlots.TycoonMarker.Tycoon.DefaultButtons.Domini1000.Button.Button
        if player.Character:FindFirstChild("HumanoidRootPart") then
            player.Character:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(dominiButton.Position + Vector3.new(0, 4, 0))
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
        frame.Size = UDim2.new(0, 200, 0, 130)
        frame.Position = UDim2.new(0.5, -100, 0.5, -65)
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
        progressLabel.Size = UDim2.new(1, 0, 0.5, -20)
        progressLabel.Position = UDim2.new(0, 0, 0, 20)
        progressLabel.Text = "Progress: 0%"
        progressLabel.Font = Enum.Font.SourceSans
        progressLabel.TextSize = 18
        progressLabel.TextColor3 = Color3.new(1, 1, 1)
        progressLabel.BackgroundTransparency = 1
        progressLabel.Parent = frame

        local manualPrestigeButton = Instance.new("TextButton")
        manualPrestigeButton.Size = UDim2.new(1, 0, 0.5, -20)
        manualPrestigeButton.Position = UDim2.new(0, 0, 0.5, 0)
        manualPrestigeButton.Text = "Manual Prestige"
        manualPrestigeButton.Font = Enum.Font.SourceSans
        manualPrestigeButton.TextSize = 18
        manualPrestigeButton.TextColor3 = Color3.new(1, 1, 1)
        manualPrestigeButton.BackgroundColor3 = Color3.new(0, 0.5, 0.5)
        manualPrestigeButton.BorderSizePixel = 0
        manualPrestigeButton.Parent = frame

        return progressLabel, manualPrestigeButton
    else
        return screenGui.OneCreatorXGui.ProgressLabel, screenGui.OneCreatorXGui.ManualPrestigeButton
    end
end

local function handleSignalConnection(progressLabel, manualPrestigeButton)
    local prestigeButton = workspace.Map.TycoonPlots.TycoonMarker.Tycoon.DefaultButtons.Prestige.Button.Button
    local prestigeLabel = prestigeButton.ButtonUI.Label

    -- Tabla de valores asociados a letras
    local letterValues = {
        k = 1e3, m = 1e6, b = 1e9, t = 1e12,
        K = 1e3, M = 1e6, B = 1e9, T = 1e12,
        q = 1e15, Q = 1e15, s = 1e18, S = 1e18,
        o = 1e21, O = 1e21, n = 1e24, N = 1e24,
        d = 1e27, D = 1e27, U = 1e30, u = 1e30
    }

    local function convertToNumber(text)
        local number, suffix = text:match("([%d%.]+)([kmbtKMBTqQsSoOnNdDuU]*)")
        if number then
            local multiplier = letterValues[suffix] or 1
            return tonumber(number) * multiplier
        end
        return nil
    end

    local function onTextChanged()
        local current = convertToNumber(prestigeLabel.Text)
        local total = convertToNumber(prestigeLabel.Text:match("/ ([%d%.]+)([kmbtKMBTqQsSoOnNdDuU]*)"))

        if current and total then
            local progress = math.floor((current / total) * 100)
            progressLabel.Text = "Progress: " .. progress .. "%"

            if progress >= 100 then
                if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    player.Character:FindFirstChild("HumanoidRootPart").CFrame = prestigeButton.CFrame
                end

                wait(0.3)
                local prestigeArgs = {
                    [1] = workspace.Map.TycoonPlots.TycoonMarker.Tycoon.DefaultButtons.Prestige
                }
                game:GetService("ReplicatedStorage"):WaitForChild("events-shared/global@GlobalEvents"):WaitForChild("buttonPressed"):FireServer(unpack(prestigeArgs))
                executeTasks()
            elseif progress >= 500 then
                -- Si el progreso es igual o mayor al 500%, activar el botón de "Manual Prestige" y detener el bucle
                manualPrestigeButton.Visible = true
                return
            end
        end
    end

    local function onManualPrestigeButtonClick()
        -- Ejecutar manualmente la función executeTasks() y ocultar el botón
        executeTasks()
        manualPrestigeButton.Visible = false
    end

    if prestigeLabel and prestigeLabel:IsA("TextLabel") then
        prestigeLabel:GetPropertyChangedSignal("Text"):Connect(onTextChanged)
    end

    manualPrestigeButton.MouseButton1Click:Connect(onManualPrestigeButtonClick)
end

eliminateMarkers()
local progressLabel, manualPrestigeButton = createUI()
handleSignalConnection(progressLabel, manualPrestigeButton)
executeTasks()

game:GetService('Players').LocalPlayer.Idled:Connect(function()
    game:GetService('VirtualUser'):CaptureController()
    game:GetService('VirtualUser'):ClickButton2(Vector2.new())
end)
