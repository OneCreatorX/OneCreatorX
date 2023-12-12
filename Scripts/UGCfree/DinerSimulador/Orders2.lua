local player = game.Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local lastSelectedFood, originalPlayerPosition
local screenGui = player.PlayerGui:FindFirstChild("MyScreenGui") or Instance.new("ScreenGui", player.PlayerGui)
screenGui.Name = "MyScreenGui"

local npcCounter = 0

local function createNPCIdentifierFile(npc)
    npcCounter = npcCounter + 1
    local identifierFile = Instance.new("StringValue")
    identifierFile.Name = "NPCIdentifier"
    identifierFile.Value = npcCounter
    identifierFile.Parent = npc
end

local function getNPCIdentifier(npc)
    local identifierFile = npc:FindFirstChild("NPCIdentifier")
    return identifierFile and identifierFile.Value or nil
end

local function asegurarMarcadorFoodDeliveredEnTodosNPCs()
    for _, npcModel in pairs(workspace.NPCS.Active:GetChildren()) do
        local foodDeliveredMarker = npcModel:FindFirstChild("FoodDelivered")

        if not foodDeliveredMarker then
            foodDeliveredMarker = Instance.new("BoolValue")
            foodDeliveredMarker.Name = "FoodDelivered"
            foodDeliveredMarker.Value = false
            foodDeliveredMarker.Parent = npcModel
        end
    end
end

local function markAsProcessed(npcModel)
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
                if not foodDeliveredMarker then
                    foodDeliveredMarker = Instance.new("BoolValue")
                    foodDeliveredMarker.Name = "FoodDelivered"
                    foodDeliveredMarker.Value = false
                    foodDeliveredMarker.Parent = npc
                end
                return npc
            elseif foodDeliveredMarker and foodDeliveredMarker.Value then
                warn("[WARN] Este NPC ya ha recibido la entrega.")
            end
        end
    end
    return nil
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
            local foodDeliveredMarker = npc:FindFirstChild("FoodDelivered")
            local npcPosition = npc:FindFirstChild("HumanoidRootPart") and npc.HumanoidRootPart.Position

            if foodDeliveredMarker then
                if not foodDeliveredMarker.Value then
                    teleportToNPCPosition(npcPosition)
                    wait(0.2)
                    deliverFoodToNPC(npc, foodDeliveredMarker)
                else
                    warn("[WARN] Este NPC ya ha recibido la entrega. Buscando otro NPC...")
                    handleDeliverButtonClick()
                end
            else
                warn("[WARN] No se encontró el marcador FoodDelivered en el NPC. Buscando otro NPC...")
                handleDeliverButtonClick() 
            end
        else
            warn("[WARN] No hay NPCs que necesiten la comida. Dejando la comida en la posición actual del jugador.")

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
        deliverButton.Size = UDim2.new(0, 100, 0, 30)
        deliverButton.Position = UDim2.new(0.97, -75, 0, 40)
        deliverButton.Text = "Entregar Comida"
        deliverButton.Name = deliverButtonName

        deliverButton.MouseButton1Click:Connect(handleDeliverButtonClick)
    end
end

local npcOrders = {}
local takeOrderButton
local orderCountLabel
local originalButtonText = "Tomar Orden"

local function createOrUpdateTakeOrderButton()
    if not takeOrderButton then
        takeOrderButton = Instance.new("TextButton", screenGui)
        takeOrderButton.Name = "TakeOrderButton"
        takeOrderButton.Size = UDim2.new(0, 90, 0, 30)
        takeOrderButton.Position = UDim2.new(0.06, -75, 0, 30)
        takeOrderButton.Text = originalButtonText
        takeOrderButton.MouseButton1Click:Connect(function()
            if #npcOrders > 0 then
                lastSelectedFood = npcOrders[1]
                ReplicatedStorage.Remotes.ChangeMenu:InvokeServer(npcOrders[1], "CreatePlate")

                table.remove(npcOrders, 1)

                if orderCountLabel then
                    orderCountLabel.Text = #npcOrders
                end
            else
takeOrderButton.Text = "No hay ordenes"
                wait(1)
                takeOrderButton.Text = originalButtonText
            end
        end)
    end

    if not orderCountLabel then
        orderCountLabel = Instance.new("TextLabel", screenGui)
        orderCountLabel.Size = UDim2.new(0, 30, 0, 20)
        orderCountLabel.Position = UDim2.new(0.12, -40, 0, 35)
    end

    orderCountLabel.Text = #npcOrders
end

local function updateTableAndButtons()
    asegurarMarcadorFoodDeliveredEnTodosNPCs()

    local npcList = {}

    for _, npcModel in pairs(workspace.NPCS.Active:GetChildren()) do
        if not npcModel:FindFirstChild("NPCIdentifier") then
            createNPCIdentifierFile(npcModel)
        end

        local trackerObj, selectedMarker = npcModel:FindFirstChild("TrackerObj"), npcModel:FindFirstChild("SelectedMarker")
        local foodDeliveredMarker = npcModel:FindFirstChild("FoodDelivered")

        if trackerObj and trackerObj:IsA("ObjectValue") and (not selectedMarker or not selectedMarker.Value) then
            wait(0.1)

            local textValue = trackerObj.Value
            local buttonText = tostring(textValue)
            local npcIdentifier = getNPCIdentifier(npcModel)

            if buttonText ~= "Served_Wait_To_Destroy" and foodDeliveredMarker and not foodDeliveredMarker.Value then
                table.insert(npcList, { model = npcModel, identifier = npcIdentifier, button = buttonText })
            end
        end
    end

    table.sort(npcList, function(a, b)
        return tonumber(a.identifier) < tonumber(b.identifier)
    end)

    npcOrders = {}
    for _, npcData in ipairs(npcList) do
        table.insert(npcOrders, npcData.button)
    end

    createOrUpdateTakeOrderButton()
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
        -- Utilizar pcall para manejar posibles errores sin imprimir en la consola
        local success, error_message = pcall(onNewModelDetected, newChild)
        if not success then
            warn("Error al procesar nuevo modelo:", error_message)
        end
    end
end)

buscarIngredient(game)
createDeliverButton()

workspace.NPCS.Active.ChildAdded:Connect(updateTableAndButtons)
workspace.NPCS.Active.ChildRemoved:Connect(updateTableAndButtons)



