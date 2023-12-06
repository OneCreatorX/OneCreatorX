local player = game.Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local freePositions = {
    Vector3.new(209, 6.20046329498291, -86),
    Vector3.new(210, 6.20046329498291, -86),
    Vector3.new(211, 6.20046329498291, -86),
    Vector3.new(212, 6.20046329498291, -86),
    Vector3.new(213, 6.20046329498291, -86),
    Vector3.new(214, 6.20046329498291, -86),
    Vector3.new(215, 6.20046329498291, -86),
    Vector3.new(216, 6.20046329498291, -86),
    Vector3.new(217, 6.20046329498291, -86),
}

local foodPositions = {}
local lastSelectedFood = nil

local screenGui = player.PlayerGui:FindFirstChild("MyScreenGui")
if not screenGui then
    screenGui = Instance.new("ScreenGui")
    screenGui.Name = "MyScreenGui"
    screenGui.Parent = player.PlayerGui
end

local function markAsProcessed(npcModel)
    local processedMarker = Instance.new("BoolValue")
    processedMarker.Name = "Processed"
    processedMarker.Value = true
    processedMarker.Parent = npcModel
end

local function updateTableAndButtons()
    print("[INFO] Actualizando tabla y botones...")

    local previousFoodPositions = {}
    for key, value in pairs(foodPositions) do
        previousFoodPositions[key] = value
    end

    for _, npcModel in pairs(workspace.NPCS.Active:GetChildren()) do
        local trackerObj, processedMarker = npcModel:FindFirstChild("TrackerObj"), npcModel:FindFirstChild("Processed")

        if trackerObj and trackerObj:IsA("ObjectValue") and not processedMarker then
            wait(0.2)

            local textValue, button = trackerObj.Value, Instance.new("TextButton")

            button.Parent = screenGui
            button.Size = UDim2.new(0, 150, 0, 30)
            button.Position = UDim2.new(0.5, -75, 0, 0)
            button.Text = tostring(textValue)

            local npcNumber = 1
            while screenGui:FindFirstChild("NPC_" .. npcNumber) do
                npcNumber = npcNumber + 1
            end

            local npcIdentifier = "NPC_" .. npcNumber

            button.Name = npcIdentifier  -- Asignar el nombre único como nombre del botón
            button.ZIndex = 1

            button.MouseButton1Click:Connect(function()
                button:Destroy()
                trackerObj:Destroy()
                markAsProcessed(npcModel)
                ReplicatedStorage.Remotes.ChangeMenu:InvokeServer(tostring(textValue), "CreatePlate")
                
                lastSelectedFood = tostring(textValue)
                print("[INFO] Último plato seleccionado:", lastSelectedFood)
            end)

            markAsProcessed(npcModel)

            -- Convertir el nombre a minúsculas para evitar problemas de mayúsculas y minúsculas
            local lowercaseTextValue = string.lower(tostring(textValue))

            if not foodPositions[lowercaseTextValue] then

                local foodPosition = table.remove(freePositions, 1)
                foodPositions[lowercaseTextValue] = foodPosition
                print("[INFO] Se agregó a la tabla: Nombre:", lowercaseTextValue, "Posición:", foodPosition)

                local npcFile = Instance.new("ObjectValue")
                npcFile.Name = "NPCFile"
                npcFile.Value = npcIdentifier
                npcFile.Parent = npcModel
            else
                print("[INFO] La comida '" .. lowercaseTextValue .. "' ya existe en la tabla. Posición actual:", foodPositions[lowercaseTextValue])
            end
        end
    end

    for key, _ in pairs(previousFoodPositions) do
        if not foodPositions[key] then
            -- El nombre ya no existe en la tabla, destruir el botón correspondiente
            local existingButton = screenGui:FindFirstChild(tostring(key))
            if existingButton then
                existingButton:Destroy()
                print("[INFO] Se destruyó el botón correspondiente a la comida '" .. key .. "'.")
            end
        end
    end

    print("[INFO] Tabla de posiciones de comida actualizada:", foodPositions)
end

local function createPlaceOnTableButton()
    print("[INFO] Creando botón 'Colocar en mesa'...")
    local button = Instance.new("TextButton")
    button.Parent = screenGui
    button.Size = UDim2.new(0, 150, 0, 30)
    button.Position = UDim2.new(0.5, -75, 0, 40)
    button.Text = "Colocar en mesa"
    button.ZIndex = #screenGui:GetChildren() + 1

    button.MouseButton1Click:Connect(function()
        print("[INFO] Botón 'Colocar en mesa' clickeado.")

        local currentFoodName = lastSelectedFood or "Colocar en mesa" 

        local lowercaseCurrentFoodName = string.lower(currentFoodName)

        if foodPositions[lowercaseCurrentFoodName] then
            local foodPosition = foodPositions[lowercaseCurrentFoodName]

            local playerPosition = player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character.HumanoidRootPart.Position

            if playerPosition then
                local newPosition = Vector3.new(212.617172, 6.14484358, -83.0590057, 0.999130905, 2.48580339e-08, -0.0416823365, -2.91946627e-08, 1, -1.03431248e-07, 0.0416823365, 1.04558261e-07, 0.999130905)
                player.Character.HumanoidRootPart.CFrame = CFrame.new(newPosition)

                wait(0.2)
                ReplicatedStorage.Remotes.Plating:InvokeServer({PlateShelf = workspace.DinerPlaceHolder.PlateShelves.PlateShelf, Position = foodPosition})
                wait(0.2)
                player.Character.HumanoidRootPart.CFrame = CFrame.new(playerPosition)
                print("[INFO] Plato colocado en la mesa en posición:", foodPosition)
            else
                warn("[WARN] No se encontró el HumanoidRootPart en el personaje del jugador.")
            end
        else
            warn("[WARN] No se encontró la posición para el plato seleccionado.")
        end
    end)
end

createPlaceOnTableButton()

workspace.NPCS.Active.ChildAdded:Connect(updateTableAndButtons)
workspace.NPCS.Active.ChildRemoved:Connect(updateTableAndButtons)

-- Imprimir la tabla completa de posiciones de comida
print("[INFO] Tabla de posiciones de comida:", foodPositions)

