local buttonGui = Instance.new("ScreenGui")
buttonGui.Name = "ButtonGui"
buttonGui.Parent = game.Players.LocalPlayer.PlayerGui

local button = Instance.new("TextButton")
button.Name = "ESPButton"
button.Size = UDim2.new(0.05, 0, 0.05, 0)
button.Position = UDim2.new(0.05, 0, 0.85, 0)
button.BackgroundColor3 = Color3.new(0, 0, 1)
button.Text = "ESP: OFF"
button.Parent = buttonGui

local espEnabled = false

local espFolder = Instance.new("Folder")
espFolder.Name = "ESPFolder"
espFolder.Parent = game.Workspace

-- Tabla para mapear los nombres originales a los nombres personalizados
local nameMap = {
    ["NmmsRblx"] = {Name = "Esposo de Ann", ColorIndex = 1}, -- Rojo
    ["AnnLuv01"] = {Name = "Esposa de Matías", ColorIndex = 2}, -- Azul
    ["Vickycorrea8931"] = {Name = "Pichoncita de DJ", ColorIndex = 3}, -- Fucsia
    ["DJFARERTER"] = {Name = "Esposo de Vicky", ColorIndex = 4}, -- Rojo fuerte
}

-- Lista de colores para los nombres personalizados
local nameColors = {
    Color3.new(1, 0, 0), -- Rojo
    Color3.new(0, 0, 1), -- Azul
    Color3.new(1, 0, 1), -- Fucsia
    Color3.new(1, 0.2, 0), -- Rojo fuerte
}

-- Función para seleccionar un color de la lista en orden
local function getNextColor(index)
    return nameColors[(index - 1) % #nameColors + 1]
end

local function createNameTag(playerPart, playerName, nameColor)
    local billboardGui = Instance.new("BillboardGui")
    billboardGui.Adornee = playerPart
    billboardGui.Size = UDim2.new(0, 100, 0, 20)
    billboardGui.StudsOffset = Vector3.new(0, 2, 0) -- Ajustar la posición del nombre sobre el jugador
    billboardGui.AlwaysOnTop = true -- Hacer que el nombre siempre esté visible, incluso a través de las paredes

    local nameLabel = Instance.new("TextLabel")
    nameLabel.Size = UDim2.new(1, 0, 1, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.TextColor3 = nameColor
    nameLabel.Text = playerName -- Usar el nombre personalizado
    nameLabel.Parent = billboardGui

    billboardGui.Parent = playerPart
end

local function updateESP()
    if espEnabled then
        local localCharacter = game.Players.LocalPlayer.Character
        local localPosition = localCharacter and localCharacter:FindFirstChild("HumanoidRootPart") and localCharacter.HumanoidRootPart.Position

        espFolder:ClearAllChildren()

        for i, v in pairs(game.Players:GetPlayers()) do
            local character = v.Character
            if v ~= game.Players.LocalPlayer and character and character:FindFirstChild("HumanoidRootPart") and localPosition then
                local targetPosition = character.HumanoidRootPart.Position
                local distance = (targetPosition - localPosition).Magnitude

                local minBoxSize = 1 -- Tamaño mínimo del cuadro
                local maxBoxSize = 5 -- Tamaño máximo del cuadro
                local normalizedDistance = math.clamp((30 - distance) / 30, 0, 1) -- Normalizar la distancia

                local boxSize = minBoxSize + (maxBoxSize - minBoxSize) * normalizedDistance
                local box = Instance.new("BoxHandleAdornment")
                box.Name = "ESPBox"
                box.Adornee = character.HumanoidRootPart
                box.Size = Vector3.new(boxSize, boxSize, boxSize)
                box.Color3 = Color3.new(0, 1 - normalizedDistance, normalizedDistance) -- Cambiar el color del cuadro basado en la distancia
                box.Transparency = 0.5
                box.ZIndex = 5
                box.AlwaysOnTop = true
                box.Parent = espFolder

                local playerPart = Instance.new("Part")
                playerPart.Name = "PlayerPart"
                playerPart.Anchored = true
                playerPart.Size = Vector3.new(0.2, 0.2, 0.2)
                playerPart.Position = character.HumanoidRootPart.Position
                playerPart.Transparency = 1
                playerPart.CanCollide = false
                playerPart.Parent = espFolder

                local nameData = nameMap[v.Name]
                if nameData then
                    createNameTag(playerPart, nameData.Name, getNextColor(nameData.ColorIndex))
                else
                    createNameTag(playerPart, v.Name, Color3.new(1, 1, 1)) -- Color blanco para nombres no personalizados
                end
            end
        end
    else
        espFolder:ClearAllChildren()
    end
end

button.MouseButton1Click:Connect(function()
    espEnabled = not espEnabled
    button.Text = espEnabled and "ESP: ON" or "ESP: OFF"
    updateESP()
end)

-- Asegurarse de que el ESP esté actualizado al principio
updateESP()
