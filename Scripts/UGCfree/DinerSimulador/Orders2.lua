local player = game.Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local lastSelectedFood, originalPlayerPosition
local screenGui = player.PlayerGui:FindFirstChild("MyScreenGui") or Instance.new("ScreenGui", player.PlayerGui)
screenGui.Name = "MyScreenGui"

local function markAsProcessed(npcModel)
    local processedMarker = Instance.new("BoolValue")
    processedMarker.Name = "Processed"
    processedMarker.Value = true
    processedMarker.Parent = npcModel

    local foodDeliveredMarker = npcModel:FindFirstChild("FoodDelivered")
    if not foodDeliveredMarker then
        foodDeliveredMarker = Instance.new("BoolValue")
        foodDeliveredMarker.Name = "FoodDelivered"
        foodDeliveredMarker.Value = false
        foodDeliveredMarker.Parent = npcModel
    end
end

local function teleportToNPCPosition(npcPosition)
    local playerPosition = player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character.HumanoidRootPart.Position

    if playerPosition then
        originalPlayerPosition = originalPlayerPosition or playerPosition
        print("[DEBUG] Posición del jugador:", playerPosition)
        player.Character.HumanoidRootPart.CFrame = CFrame.new(npcPosition)
        wait(0.2)
    else
        warn("[WARN] No se encontró el HumanoidRootPart en el personaje del jugador.")
    end
end

local function findNextNPCByName(npcName)
    for _, npc in pairs(workspace.NPCS.Active:GetChildren()) do
        local npcObj, foodDeliveredMarker = npc:FindFirstChild("TrackerObj"), npc:FindFirstChild("FoodDelivered")

        if npcObj and npcObj:IsA("ObjectValue") and npcObj.Value and npcObj.Value:IsA("Instance") then
            local foodName = npcObj.Value.Name:lower()

            if foodName == npcName:lower() and not (foodDeliveredMarker and foodDeliveredMarker.Value) then
                return npc, foodDeliveredMarker
            elseif foodDeliveredMarker and foodDeliveredMarker.Value then
                warn("[WARN] Este NPC ya ha recibido la entrega.")
            end
        end
    end
    return nil, nil
end

local function deliverFoodToNPC(npc, foodDeliveredMarker, platePosition)
    local npcHeadPosition = npc:FindFirstChild("Head") and npc.Head.Position

    if npcHeadPosition then
        ReplicatedStorage.Remotes.Plating:InvokeServer({
            PlateShelf = workspace.DinerPlaceHolder.PlateShelves.PlateShelf,
            Position = npcHeadPosition + Vector3.new(0, 3, 0)
        })
        wait(0.2)
        teleportToNPCPosition(originalPlayerPosition)

        if foodDeliveredMarker then
            foodDeliveredMarker.Value = true
        else
            warn("[WARN] No se encontró el marcador FoodDelivered en el NPC.")
        end
    else
        warn("[WARN] No se encontró la cabeza del NPC para la posición de entrega.")
    end
end

local function handleDeliverButtonClick()
    if lastSelectedFood then
        local npc = findNextNPCByName(lastSelectedFood)
        if npc then
            local npcPosition = npc:FindFirstChild("HumanoidRootPart") and npc.HumanoidRootPart.Position
            if npcPosition then
                teleportToNPCPosition(npcPosition)
                wait(0.2)
                deliverFoodToNPC(npc)
            end
        else
            warn("[WARN] No hay más NPCs que necesiten la comida. Entregando en la posición actual del jugador.")

            local playerPosition = player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character.HumanoidRootPart.Position
            if playerPosition then
                deliverFoodToPlayerPosition(playerPosition)
            else
                warn("[WARN] No se encontró el HumanoidRootPart en el personaje del jugador.")
            end
        end
    else
        warn("[WARN] No hay comida seleccionada.")
    end
end

local function deliverFoodToPlayerPosition(playerPosition)
    ReplicatedStorage.Remotes.Plating:InvokeServer({
        PlateShelf = workspace.DinerPlaceHolder.PlateShelves.PlateShelf,
        Position = playerPosition
    })
    wait(0.2)
    teleportToNPCPosition(originalPlayerPosition)
end

local deliveryScreenGui = player.PlayerGui:FindFirstChild("DeliveryScreenGui") or Instance.new("ScreenGui", player.PlayerGui)
deliveryScreenGui.Name = "DeliveryScreenGui"

local deliverButtonName, deliverButton = "DeliverButton"
local function createDeliverButton()
    if not deliverButton then
        deliverButton = Instance.new("TextButton", deliveryScreenGui)
        deliverButton.Size = UDim2.new(0, 150, 0, 30)
        deliverButton.Position = UDim2.new(0.94, -75, 0, 60)
        deliverButton.Text = "Entregar Comida"
        deliverButton.Name = deliverButtonName

        deliverButton.MouseButton1Click:Connect(handleDeliverButtonClick)
    end
end

local function updateTableAndButtons()
    for _, existingButton in pairs(screenGui:GetChildren()) do
        if existingButton:IsA("TextButton") and existingButton.Name ~= deliverButtonName then
            existingButton:Destroy()
        end
    end

    createDeliverButton()
    wait(0.2)

    for _, npcModel in pairs(workspace.NPCS.Active:GetChildren()) do
        print("Procesando NPC:", npcModel.Name)

        local foodDeliveredMarker = npcModel:FindFirstChild("FoodDelivered")

        if not foodDeliveredMarker then
            print("Creando FoodDelivered para NPC:", npcModel.Name)
            foodDeliveredMarker = Instance.new("BoolValue")
            foodDeliveredMarker.Name = "FoodDelivered"
            foodDeliveredMarker.Value = false
            foodDeliveredMarker.Parent = npcModel
        end

        local trackerObj, selectedMarker = npcModel:FindFirstChild("TrackerObj"), npcModel:FindFirstChild("SelectedMarker")

        if trackerObj and trackerObj:IsA("ObjectValue") and (not selectedMarker or not selectedMarker.Value) then
            local textValue = trackerObj.Value
            local buttonText = tostring(textValue)

            if buttonText ~= "Served_Wait_To_Destroy" then
                local button = Instance.new("TextButton", screenGui)
                button.Size = UDim2.new(0, 150, 0, 30)
                button.Position = UDim2.new(0.03, -75, 0, 40)
                button.Text = buttonText

                button.MouseButton1Click:Connect(function()
                    button:Destroy()
                    lastSelectedFood = buttonText
                    ReplicatedStorage.Remotes.ChangeMenu:InvokeServer(buttonText, "CreatePlate")

                    local selectedMarker = Instance.new("BoolValue", npcModel)
                    selectedMarker.Name = "SelectedMarker"
                    selectedMarker.Value = true
                end)
            end
        end
    end
end

local function buscarIngredient(parent)
    local storages = parent.Workspace.DinerPlaceHolder.Storages

    if storages then
        local function procesarIngrediente(descendant)
            if descendant:IsA("TextLabel") and descendant.Name == "Ingredient_Quantity" then
                local ingredientName = descendant.Parent:FindFirstChild("Ingredient_Name")

                if ingredientName then
                    local cantidadInicial = tonumber(descendant.Text and descendant.Text:match("%d+")) or 0

                    local function comprarIngredientes(cantidad)
                        if cantidad and cantidad < 2 then
                            local args = {
                                [1] = "Ingredient",
                                [2] = {
                                    ["Ingredient_Name"] = ingredientName.Text,
                                    ["Quantity"] = 4
                                }
                            }

                            ReplicatedStorage.Remotes.Purchase:InvokeServer(unpack(args))
                        end
                    end

                    comprarIngredientes(cantidadInicial)

                    descendant:GetPropertyChangedSignal("Text"):Connect(function()
                        local nuevaCantidad = tonumber(descendant.Text and descendant.Text:match("%d+")) or 0

                        if nuevaCantidad < cantidadInicial then
                            comprarIngredientes(nuevaCantidad)
                        end

                        cantidadInicial = nuevaCantidad
                    end)
                end
            end
        end

        storages.DescendantAdded:Connect(procesarIngrediente)

        for _, descendant in pairs(storages:GetDescendants()) do
            procesarIngrediente(descendant)
        end
    end
end

local function onNewModelDetected(newModel)
    ReplicatedStorage.Remotes.UseSink:InvokeServer("PutPlateInSink", workspace.DinerPlaceHolder.Stations.Dish_Sink)
    ReplicatedStorage.Remotes.UseSink:InvokeServer("PutPlateInSink", workspace.DinerPlaceHolder.Stations.Dish_Washer)
end

workspace.ChildAdded:Connect(function(newChild)
    if newChild:IsA("Model") then
        onNewModelDetected(newChild)
    end
end)

buscarIngredient(game)
createDeliverButton()

workspace.NPCS.Active.ChildAdded:Connect(updateTableAndButtons)
workspace.NPCS.Active.ChildRemoved:Connect(updateTableAndButtons)

