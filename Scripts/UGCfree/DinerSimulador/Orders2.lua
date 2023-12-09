local player = game.Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local lastSelectedFood = nil
local originalPlayerPosition = nil

local screenGui = player.PlayerGui:FindFirstChild("MyScreenGui") or Instance.new("ScreenGui", player.PlayerGui)
screenGui.Name = "MyScreenGui"

local function markAsProcessed(npcModel)
    local processedMarker = Instance.new("BoolValue")
    processedMarker.Name = "Processed"
    processedMarker.Value = true
    processedMarker.Parent = npcModel

    local foodDeliveredMarker = Instance.new("BoolValue")
    foodDeliveredMarker.Name = "FoodDelivered"
    foodDeliveredMarker.Value = false
    foodDeliveredMarker.Parent = npcModel
end

local function teleportToNPCPosition(npcPosition)
    local playerPosition = player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character.HumanoidRootPart.Position

    if playerPosition then
        if not originalPlayerPosition then
            originalPlayerPosition = playerPosition
        end

        print("[DEBUG] Posición del jugador:", playerPosition)
        player.Character.HumanoidRootPart.CFrame = CFrame.new(npcPosition)
        wait(0.2)
    else
        warn("[WARN] No se encontró el HumanoidRootPart en el personaje del jugador.")
    end
end

local function findNPCByName(npcName)
    for _, npc in pairs(workspace.NPCS.Active:GetChildren()) do
        local npcObj = npc:FindFirstChild("TrackerObj")
        local foodDeliveredMarker = npc:FindFirstChild("FoodDelivered")

        if npcObj and npcObj:IsA("ObjectValue") and npcObj.Value and typeof(npcObj.Value) == "Instance" then
            local foodName = npcObj.Value.Name
            print("[DEBUG] Buscando NPC por nombre:", npcName)
            print("[DEBUG] Nombre de comida del NPC:", foodName)

            if foodName:lower() == npcName:lower() and not (foodDeliveredMarker and foodDeliveredMarker.Value) then
                print("[DEBUG] NPC encontrado por nombre:", npcName)
                return npc
            end
        else
            print("[DEBUG] NPC sin TrackerObj o valor no válido:", npc.Name)
        end
    end
    print("[DEBUG] No se encontró un NPC con el nombre o ya recibió comida:", npcName)
    return nil
end

local function deliverFoodToNPC(npc, platePosition)
    print("[DEBUG] Entregando comida al NPC...")
    local npcHeadPosition = npc:FindFirstChild("Head") and npc.Head.Position

    if npcHeadPosition then
        ReplicatedStorage.Remotes.Plating:InvokeServer({
            PlateShelf = workspace.DinerPlaceHolder.PlateShelves.PlateShelf,
            Position = npcHeadPosition + Vector3.new(0, 2, 0)
        })
        wait(0.2)
        print("[DEBUG] Regresando al jugador a su posición original...")
        teleportToNPCPosition(originalPlayerPosition)

        -- Actualizar el estado de la propiedad FoodDelivered a true
        npc:FindFirstChild("FoodDelivered").Value = true
    else
        warn("[WARN] No se encontró la cabeza del NPC para la posición de entrega.")
    end
end

local function handleDeliverButtonClick()
    print("[DEBUG] Botón 'Entregar Comida' clickeado.")
    if lastSelectedFood then
        print("[DEBUG] Comida seleccionada:", lastSelectedFood)
        print("[DEBUG] Buscando el NPC con la misma comida...")
        local npc = findNPCByName(lastSelectedFood)
        if npc then
            local npcPosition = npc:FindFirstChild("HumanoidRootPart") and npc.HumanoidRootPart.Position
            if npcPosition then
                print("[DEBUG] NPC encontrado:")
                print("  - Nombre de la comida:", lastSelectedFood)
                print("  - Posición del NPC:", npcPosition)
                print("[DEBUG] Teleportando al jugador a la posición del NPC...")
                
                teleportToNPCPosition(npcPosition)
                wait(0.2)
                deliverFoodToNPC(npc)

            else
                warn("[WARN] No se encontró la cabeza del NPC para la posición de teletransporte.")
            end
        else
            warn("[WARN] No se encontró el HumanoidRootPart en el NPC.")
        end
    else
        warn("[WARN] No hay comida seleccionada.")
    end
end

local function createDeliverButton()
    local deliverButton = Instance.new("TextButton")
    deliverButton.Parent = screenGui
    deliverButton.Size = UDim2.new(0, 150, 0, 30)
    deliverButton.Position = UDim2.new(0.931, -75, 0, 60)
    deliverButton.Text = "Entregar Comida"
    deliverButton.TextScaled = true

    deliverButton.MouseButton1Click:Connect(handleDeliverButtonClick)
end

local function updateTableAndButtons()
    print("[DEBUG] Actualizando tabla y botones...")
    for _, npcModel in pairs(workspace.NPCS.Active:GetChildren()) do
        local trackerObj, processedMarker = npcModel:FindFirstChild("TrackerObj"), npcModel:FindFirstChild("Processed")

        if trackerObj and trackerObj:IsA("ObjectValue") and not processedMarker then
            wait(0.2)

            local textValue, button = trackerObj.Value, Instance.new("TextButton")

            button.Parent = screenGui
            button.Size = UDim2.new(0, 150, 0, 30)
            button.Position = UDim2.new(0.07, -75, 0, 40)
            button.Text = tostring(textValue)
            button.TextScaled = true

            button.MouseButton1Click:Connect(function()
                lastSelectedFood = tostring(textValue)
                markAsProcessed(npcModel)
                ReplicatedStorage.Remotes.ChangeMenu:InvokeServer(tostring(textValue), "CreatePlate")
                button:Destroy()
            end)

            markAsProcessed(npcModel)
        end
    end
                    
local function buscarIngredient(parent)
    local storages = parent.Workspace.DinerPlaceHolder.Storages

    if storages then
        -- Función para procesar un ingrediente
        local function procesarIngrediente(descendant)
            if descendant:IsA("TextLabel") and descendant.Name == "Ingredient_Quantity" then
                local ingredientName = descendant.Parent:FindFirstChild("Ingredient_Name")
                if ingredientName then
                    local cantidad = tonumber(descendant.Text and descendant.Text:match("%d+")) or 0

                    if cantidad then
                        print("Encontrado", descendant.Parent.Name, "-", ingredientName.Text, "-", cantidad)

                        if cantidad < 2 then
                            local args = {
                                [1] = "Ingredient",
                                [2] = {
                                    ["Ingredient_Name"] = ingredientName.Text,
                                    ["Quantity"] = 2
                                }
                            }

                            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Purchase"):InvokeServer(unpack(args))
                            print("Ejecutado el script para el ingrediente:", ingredientName.Text)
                        end

                        descendant:GetPropertyChangedSignal("Text"):Connect(function()
                            local nuevaCantidad = tonumber(descendant.Text and descendant.Text:match("%d+")) or 0

                            if nuevaCantidad then
                                print("Actualizado", descendant.Parent.Name, "-", ingredientName.Text, "-", nuevaCantidad)

                                if nuevaCantidad < 2 then
                                    local args = {
                                        [1] = "Ingredient",
                                        [2] = {
                                            ["Ingredient_Name"] = ingredientName.Text,
                                            ["Quantity"] = 2
                                        }
                                    }

                                    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Purchase"):InvokeServer(unpack(args))
                                    print("Ejecutado el script para el ingrediente:", ingredientName.Text)
                                end
                            else
                                warn("Cantidad no válida para el ingrediente:", ingredientName.Text)
                            end
                        end)
                    else
                        warn("Cantidad no válida para el ingrediente:", ingredientName.Text)
                    end
                else
                    warn("No se encontró Ingredient_Name en el modelo:", descendant.Parent.Name)
                end
            end
        end

        -- Buscar ingredientes existentes
        for _, descendant in pairs(storages:GetDescendants()) do
            procesarIngrediente(descendant)
        end

        -- Conectar el evento ChildAdded para detectar nuevos ingredientes
        storages.ChildAdded:Connect(function(newIngredient)
            procesarIngrediente(newIngredient)
        end)
    else
        warn("No se encontró Workspace.DinerPlaceHolder.Storages. Asegúrate de que la jerarquía sea correcta.")
    end
end

    print("[DEBUG] Lista de comidas y NPCs:")
    for _, npc in pairs(workspace.NPCS.Active:GetChildren()) do
        local npcName = npc:FindFirstChild("TrackerObj") and npc.TrackerObj.Value
        print("  - NPC:", npcName)
    end
end

buscarIngredient(game)

createPlaceOnTableButton()

workspace.NPCS.Active.ChildAdded:Connect(updateTableAndButtons)
workspace.NPCS.Active.ChildRemoved:Connect(updateTableAndButtons)
