local espEnabled = true
local espFolder = Instance.new("Folder")
espFolder.Name = "ESPEnemyFolder"
espFolder.Parent = game.Workspace

local function createESPBox(targetPart)
    local box = Instance.new("BoxHandleAdornment")
    box.Name = "ESPBox"
    box.Adornee = targetPart
    box.Size = Vector3.new(5, 5, 5)
    box.Color3 = Color3.new(1, 0, 0)
    box.Transparency = 0.5
    box.ZIndex = 5
    box.AlwaysOnTop = true
    box.Parent = espFolder
end

local function updateESPEnemy()
    espFolder:ClearAllChildren()
    if espEnabled then
        local killersFolder = game.Workspace:FindFirstChild("Killers")
        if killersFolder then
            for _, killerCharacter in ipairs(killersFolder:GetDescendants()) do
                if killerCharacter:IsA("BasePart") then
                    createESPBox(killerCharacter)
                end
            end
        end
    end
end

local function moveScannersToPlayer()
    local localCharacter = game.Players.LocalPlayer.Character
    local localPosition = localCharacter and localCharacter:FindFirstChild("HumanoidRootPart") and localCharacter.HumanoidRootPart.Position

    if localPosition then
        local scannersFolder = game.Workspace:FindFirstChild("Scanners")

        for _, scanner in ipairs(scannersFolder:GetChildren()) do
            if scanner:IsA("Model") and scanner:FindFirstChild("Scanner") then
                local direction = (localPosition - scanner.Scanner.Position).unit
                scanner.Scanner.Position = scanner.Scanner.Position + direction * 10
            end
        end
    end
end

local function movePartstoPlayer()
    local localCharacter = game.Players.LocalPlayer.Character
    local localPosition = localCharacter and localCharacter:FindFirstChild("HumanoidRootPart") and localCharacter.HumanoidRootPart.Position

    if localPosition then
        local trapdoors = game.Workspace:FindFirstChild("Trapdoors")
        for _, trapdoor in ipairs(trapdoors:GetChildren()) do
            if trapdoor:IsA("Model") then
                for _, child in ipairs(trapdoor:GetChildren()) do
                    if child:IsA("BasePart") then
                        child.Position = localPosition
                    end
                end
            end
        end
    end
end

-- Create ScreenGui and buttons
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "EnemyBoxTpGui"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 220, 0, 140) -- Slightly larger size
mainFrame.Position = UDim2.new(0.5, -110, 0.5, -70) -- Centered position
mainFrame.BackgroundColor3 = Color3.new(0, 0, 0)
mainFrame.BackgroundTransparency = 0.5
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = screenGui

-- Add Title TextLabel
local title = Instance.new("TextLabel")
title.Name = "Title"
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundColor3 = Color3.new(0, 0, 0)
title.Text = "Panik | YT:@OneCreatorX"
title.TextColor3 = Color3.new(1, 1, 1) -- White text color for better visibility
title.TextSize = 18
title.Font = Enum.Font.SourceSansBold
title.Parent = mainFrame

local function createButton(name, text, yPos, callback)
    local button = Instance.new("TextButton")
    button.Name = name
    button.Size = UDim2.new(1, -10, 0, 25) -- Smaller size
    button.Position = UDim2.new(0, 5, 0, yPos)
    button.BackgroundColor3 = Color3.new(0, 0, 1)
    button.TextColor3 = Color3.new(1, 1, 1) -- White text color for better visibility
    button.Text = text
    button.Parent = mainFrame
    button.MouseButton1Click:Connect(callback)
end

createButton("ESPEnemyButton", "ESP: ON", 40, function()
    espEnabled = not espEnabled
    updateESPEnemy()
    -- Update the button text based on espEnabled state
    local buttonText = espEnabled and "ESP: ON" or "ESP: OFF"
    mainFrame.ESPEnemyButton.Text = buttonText
end)

createButton("ScannerTpButton", "Move Scanners", 70, moveScannersToPlayer)

createButton("MovePartsToPlayerButton", "Move Parts", 100, movePartstoPlayer)

createButton("DeleteEscapeHatchFakeButton", "Delete Fake", 130, function()
    local trapdoors = game.Workspace:FindFirstChild("Trapdoors")
    for _, trapdoor in ipairs(trapdoors:GetChildren()) do
        if trapdoor:IsA("Model") and trapdoor.Name:find("Fake") then
            trapdoor:Destroy()
        end
    end
end)

local minimizeMaximizeButton = Instance.new("TextButton")
minimizeMaximizeButton.Name = "MinimizeMaximizeButton"
minimizeMaximizeButton.Size = UDim2.new(0, 20, 0, 20)
minimizeMaximizeButton.Position = UDim2.new(1, -25, 0, 5)
minimizeMaximizeButton.Text = "X"
minimizeMaximizeButton.TextSize = 18
minimizeMaximizeButton.Parent = mainFrame

local function toggleInterfaceVisibility()
    mainFrame.Visible = not mainFrame.Visible
    minimizeMaximizeButton.Text = mainFrame.Visible and "-" or "+"
end

minimizeMaximizeButton.MouseButton1Click:Connect(toggleInterfaceVisibility)

game:GetService("RunService").Heartbeat:Connect(function()
    minimizeMaximizeButton.Text = mainFrame.Visible and "x" or "x"
end)
