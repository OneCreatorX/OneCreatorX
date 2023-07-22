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

local nameMap = {
    ["NmmsRblx"] = {Name = "Esposo de Ann", ColorIndex = 1}, -- Rojo
    ["AnnLuv01"] = {Name = "Esposa de Matías", ColorIndex = 2}, -- Azul
    ["vickycorrea8931"] = {Name = "Pichoncita de DJ", ColorIndex = 3}, -- Fucsia
    ["DJFARERTER"] = {Name = "Esposo de Vicky", ColorIndex = 4}, -- Rojo fuerte
}

local nameColors = {
    Color3.new(1, 0, 0), -- Rojo
    Color3.new(0, 0, 1), -- Azul
    Color3.new(1, 0, 1), -- Fucsia
    Color3.new(1, 0.2, 0), -- Rojo fuerte
}

local function getNextColor(index)
    return nameColors[(index - 1) % #nameColors + 1]
end

local function createNameTag(playerPart, playerName, nameColor)
    local billboardGui = Instance.new("BillboardGui")
    billboardGui.Adornee = playerPart
    billboardGui.Size = UDim2.new(0, 100, 0, 20)
    billboardGui.StudsOffset = Vector3.new(0, 2, 0)
    billboardGui.AlwaysOnTop = true

    local nameLabel = Instance.new("TextLabel")
    nameLabel.Size = UDim2.new(1, 0, 1, 0)
    nameLabel.BackgroundTransparency = 1
    nameLabel.TextColor3 = nameColor
    nameLabel.Text = playerName
    nameLabel.Parent = billboardGui

    billboardGui.Parent = playerPart
end

local function updateESP()
    espFolder:ClearAllChildren()

    if espEnabled then
        local localCharacter = game.Players.LocalPlayer.Character
        local localPosition = localCharacter and localCharacter:FindFirstChild("HumanoidRootPart") and localCharacter.HumanoidRootPart.Position

        if localPosition then
            for _, player in ipairs(game.Players:GetPlayers()) do
                if player ~= game.Players.LocalPlayer and player.Character then
                    local character = player.Character
                    local targetPosition = character:FindFirstChild("HumanoidRootPart") and character.HumanoidRootPart.Position

                    if targetPosition then
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

                        local nameData = nameMap[player.Name]
                        if nameData then
                            createNameTag(character.HumanoidRootPart, nameData.Name, getNextColor(nameData.ColorIndex))
                        else
                            createNameTag(character.HumanoidRootPart, player.Name, Color3.new(1, 1, 1))
                        end
                    end
                end
            end
        end
    end
end

button.MouseButton1Click:Connect(function()
    espEnabled = not espEnabled
    button.Text = espEnabled and "ESP: ON" or "ESP: OFF"
    updateESP()
end)

-- Llamar a updateESP() inicialmente
updateESP()
