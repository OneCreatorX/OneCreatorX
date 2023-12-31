local espEnabled = true
local espFolder = Instance.new("Folder")
espFolder.Name = "ESPEnemyFolder"
espFolder.Parent = game.Workspace

local maxDistance = 1000 -- Distancia máxima para mostrar el ESP en unidades (ajusta según tus necesidades)

local function createESPBox(targetPart)
    local box = targetPart:FindFirstChild("ESPBox")
    if not box then
        box = Instance.new("BoxHandleAdornment")
        box.Name = "ESPBox"
        box.Adornee = targetPart
        box.Size = Vector3.new(5, 5, 5)
        box.Color3 = Color3.new(1, 0, 0)
        box.Transparency = 0.5
        box.ZIndex = 5
        box.AlwaysOnTop = true
        box.Parent = espFolder
    end
end

local function updateESPEnemy()
    if espEnabled then
        local killersFolder = game.Workspace:FindFirstChild("Killers")
        if killersFolder then
            for _, killerCharacter in ipairs(killersFolder:GetDescendants()) do
                if killerCharacter:IsA("BasePart") then
                    local distance = (killerCharacter.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).magnitude
                    if distance <= maxDistance then
                        createESPBox(killerCharacter)
                    else
                        local box = killerCharacter:FindFirstChild("ESPBox")
                        if box then
                            box:Destroy()
                        end
                    end
                end
            end
        end
    end
end

local function onNewKillerAdded(newKiller)
    if espEnabled then
        createESPBox(newKiller)
    end
end

-- Conectamos el evento para detectar nuevos Killers
game.Workspace.ChildAdded:Connect(function(child)
    if child:IsA("Model") and child.Name == "Killers" then
        child.DescendantAdded:Connect(onNewKillerAdded)
    end
end)

local function createBox(part, color, size)
    if part:FindFirstChild("Box") then
        part.Box:Destroy()
    end

    local box = Instance.new("BillboardGui")
    box.Name = "Box"
    box.Size = UDim2.new(0, size.X, 0, size.Y)
    box.Adornee = part
    box.AlwaysOnTop = true

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundTransparency = 0.5
    frame.BackgroundColor3 = color

    frame.Parent = box
    box.Parent = part
end

local function moveScannersToPlayer()
    local localCharacter = game.Players.LocalPlayer.Character
    local localPosition = localCharacter and localCharacter:FindFirstChild("HumanoidRootPart") and localCharacter.HumanoidRootPart.Position

    if localPosition then
        local scannersFolder = game.Workspace:FindFirstChild("Scanners")

        for _, scanner in ipairs(scannersFolder:GetChildren()) do
            if scanner:IsA("Model") and scanner:FindFirstChild("Scanner") then
                local boxSize = Vector2.new(12, 10) -- Adjust size as needed (width, height)
                local direction = (scanner.Scanner.Position - localPosition).unit
                local lookAtCFrame = CFrame.lookAt(localPosition, scanner.Scanner.Position, Vector3.new(0, 1, 0))
                local rotatedSize = lookAtCFrame:VectorToWorldSpace(Vector3.new(boxSize.X, boxSize.Y, 0))
                createBox(scanner.Scanner, Color3.new(0, 0, 1), Vector2.new(rotatedSize.X, rotatedSize.Y))
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
                local nearestPart = nil
                local nearestDistance = math.huge

                for _, child in ipairs(trapdoor:GetChildren()) do
                    if child:IsA("BasePart") then
                        local distance = (localPosition - child.Position).magnitude
                        if distance < nearestDistance then
                            nearestDistance = distance
                            nearestPart = child
                        end
                    end
                end

                if nearestPart then
                    local boxSize = Vector2.new(20, 10) -- Adjust size as needed
                    createBox(nearestPart, Color3.new(0, 1, 0), boxSize)
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

createButton("ScannerTpButton", "ESP Scanners", 70, moveScannersToPlayer)

createButton("MovePartsToPlayerButton", "ESP Door Scape", 100, movePartstoPlayer)

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
