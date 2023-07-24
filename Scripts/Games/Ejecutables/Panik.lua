-- Objetos a referenciar
local espEnabled = true
local espFolder = Instance.new("Folder")
espFolder.Name = "EnemyESP"
espFolder.Parent = game.Workspace

-- Variable para controlar el estado de los Tp de los Scanners hacia el jugador
local scannerTpEnabled = true

-- Función para crear el nombre de las etiquetas
local function createNameTag(parent, name, color)
    local label = Instance.new("BillboardGui")
    label.Name = "NameTag"
    label.Size = UDim2.new(0, 100, 0, 30)
    label.Adornee = parent

    local textLabel = Instance.new("TextLabel")
    textLabel.Name = "Text"
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.Text = name
    textLabel.TextColor3 = color
    textLabel.BackgroundTransparency = 1
    textLabel.Font = Enum.Font.SourceSansBold
    textLabel.TextSize = 16
    textLabel.Parent = label

    label.Parent = espFolder
    table.insert(nameTags, label)
end

-- Función para obtener el color de la etiqueta de nombre
local function getNextColor(colorIndex)
    local colors = {
        Color3.new(1, 0, 0),
        Color3.new(0, 1, 0),
        Color3.new(0, 0, 1)
    }

    return colors[(colorIndex % #colors) + 1]
end

-- Función para activar/desactivar la Box de los enemigos
local function toggleEnemyBox()
    espEnabled = not espEnabled
    if espEnabled then
        updateESP()
    else
        espFolder:ClearAllChildren()
    end
end

-- Función para activar/desactivar los Tp de los Scanners hacia el jugador
local function toggleScannerTp()
    scannerTpEnabled = not scannerTpEnabled
end

-- Función para eliminar el archivo workspace.Trapdoors
local function deleteTrapdoors()
    local trapdoors = game.Workspace:FindFirstChild("Trapdoors")
    if trapdoors then
        trapdoors:Destroy()
    end
end

-- Función para actualizar el ESP
local function updateESP()
    local localCharacter = game.Players.LocalPlayer.Character
    local localPosition = localCharacter and localCharacter:FindFirstChild("HumanoidRootPart") and localCharacter.HumanoidRootPart.Position

    espFolder:ClearAllChildren()

    if localPosition then
        local killersFolder = game.Workspace.Killers

        for _, killer in ipairs(killersFolder:GetChildren()) do
            if killer:IsA("Folder") then
                for _, enemy in ipairs(killer:GetChildren()) do
                    if enemy:IsA("Model") and enemy:FindFirstChild("HumanoidRootPart") then
                        local character = enemy
                        local targetPosition = character.HumanoidRootPart.Position

                        local distance = (targetPosition - localPosition).Magnitude
                        local minBoxSize = 1
                        local maxBoxSize = 5
                        local normalizedDistance = math.clamp((30 - distance) / 30, 0, 1)

                        local boxSize = minBoxSize + (maxBoxSize - minBoxSize) * normalizedDistance
                        local box = Instance.new("BoxHandleAdornment")
                        box.Name = "ESPBox"
                        box.Adornee = character.HumanoidRootPart
                        box.Size = Vector3.new(boxSize, boxSize, boxSize)
                        box.Color3 = Color3.new(0, 1 - normalizedDistance, normalizedDistance)
                        box.Transparency = 0.5
                        box.ZIndex = 5
                        box.AlwaysOnTop = true
                        box.Parent = espFolder

                        local name = enemy.Name
                        createNameTag(character.HumanoidRootPart, name, Color3.new(1, 1, 1))
                    end
                end
            end
        end
    end
end

-- Llamar a updateESP() inicialmente
updateESP()

-- Crear ScreenGui y botones
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "EnemyBoxTpButtons"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local enemyBoxButton = Instance.new("TextButton")
enemyBoxButton.Name = "EnemyBoxButton"
enemyBoxButton.Parent = screenGui
enemyBoxButton.Position = UDim2.new(0, 10, 0, 10)
enemyBoxButton.Size = UDim2.new(0, 150, 0, 30)
enemyBoxButton.Text = "Enemy Box: ON"
enemyBoxButton.MouseButton1Click:Connect(toggleEnemyBox)

local scannerTpButton = Instance.new("TextButton")
scannerTpButton.Name = "ScannerTpButton"
scannerTpButton.Parent = screenGui
scannerTpButton.Position = UDim2.new(0, 10, 0, 50)
scannerTpButton.Size = UDim2.new(0, 150, 0, 30)
scannerTpButton.Text = "Scanner TP: ON"
scannerTpButton.MouseButton1Click:Connect(toggleScannerTp)

local deleteTrapdoorsButton = Instance.new("TextButton")
deleteTrapdoorsButton.Name = "DeleteTrapdoorsButton"
deleteTrapdoorsButton.Parent = screenGui
deleteTrapdoorsButton.Position = UDim2.new(0, 10, 0, 90)
deleteTrapdoorsButton.Size = UDim2.new(0, 150, 0, 30)
deleteTrapdoorsButton.Text = "Delete Trapdoors"
deleteTrapdoorsButton.MouseButton1Click:Connect(deleteTrapdoors)

-- Evento que se ejecuta en cada frame para actualizar el texto de los botones
game:GetService("RunService").Heartbeat:Connect(function()
    enemyBoxButton.Text = espEnabled and "Enemy Box: ON" or "Enemy Box: OFF"
    scannerTpButton.Text = scannerTpEnabled and "Scanner TP: ON" or "Scanner TP: OFF"
end)

-- Evento que se ejecuta en cada frame para actualizar el ESP y mover los Scanners hacia el jugador
game:GetService("RunService").Heartbeat:Connect(function()
    if scannerTpEnabled then
        local localCharacter = game.Players.LocalPlayer.Character
        local localPosition = localCharacter and localCharacter:FindFirstChild("HumanoidRootPart") and localCharacter.HumanoidRootPart.Position

        if localPosition then
            local scannersFolder = game.Workspace.Scanners

            for _, scanner in ipairs(scannersFolder:GetChildren()) do
                if scanner:IsA("Model") and scanner:FindFirstChild("Scanner") then
                    local direction = (localPosition - scanner.Scanner.Position).unit
                    scanner.Scanner.Position = scanner.Scanner.Position + direction * 10 -- Velocidad de movimiento de los Scanners hacia el jugador (ajusta según tus necesidades)
                end
            end
        end
    end
end)
