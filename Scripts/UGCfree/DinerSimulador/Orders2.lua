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

            if foodName:lower() == npcName:lower() and not (foodDeliveredMarker and foodDeliveredMarker.Value) then
                return npc
            end
        else
        end
    end
    return nil
end

local function deliverFoodToNPC(npc, platePosition)
    local npcHeadPosition = npc:FindFirstChild("Head") and npc.Head.Position

    if npcHeadPosition then
        ReplicatedStorage.Remotes.Plating:InvokeServer({
            PlateShelf = workspace.DinerPlaceHolder.PlateShelves.PlateShelf,
            Position = npcHeadPosition + Vector3.new(0, 3, 0)
        })
        wait(0.2)
        teleportToNPCPosition(originalPlayerPosition)

        npc:FindFirstChild("FoodDelivered").Value = true
    else
        warn("[WARN] No se encontró la cabeza del NPC para la posición de entrega.")
    end
end

local function handleDeliverButtonClick()
    if lastSelectedFood then
        local npc = findNPCByName(lastSelectedFood)
        if npc then
            local npcPosition = npc:FindFirstChild("HumanoidRootPart") and npc.HumanoidRootPart.Position
            if npcPosition then
            teleportToNPCPosition(npcPosition)
                wait(0.2)
                deliverFoodToNPC(npc)

            else
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
    deliverButton.Position = UDim2.new(0.95, -75, 0, 60)
    deliverButton.Text = "Entregar Comida"

    deliverButton.MouseButton1Click:Connect(handleDeliverButtonClick)
end

local function updateTableAndButtons()
    for _, npcModel in pairs(workspace.NPCS.Active:GetChildren()) do
        local trackerObj, processedMarker = npcModel:FindFirstChild("TrackerObj"), npcModel:FindFirstChild("Processed")

        if trackerObj and trackerObj:IsA("ObjectValue") and not processedMarker then
            wait(0.2)

            local textValue, button = trackerObj.Value, Instance.new("TextButton")

            button.Parent = screenGui
            button.Size = UDim2.new(0, 150, 0, 30)
            button.Position = UDim2.new(0.1, -75, 0, 40)
            button.Text = tostring(textValue)

            button.MouseButton1Click:Connect(function()
                lastSelectedFood = tostring(textValue)
                markAsProcessed(npcModel)
               button:Destroy() ReplicatedStorage.Remotes.ChangeMenu:InvokeServer(tostring(textValue), "CreatePlate")
            end)
            markAsProcessed(npcModel)
        end
    end

    for _, npc in pairs(workspace.NPCS.Active:GetChildren()) do
        local npcName = npc:FindFirstChild("TrackerObj") and npc.TrackerObj.Value
        print("  - NPC:", npcName)
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
                                    ["Quantity"] = 2
                                }
                            }

                            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Purchase"):InvokeServer(unpack(args))
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
local args = {
            [1] = "PutPlateInSink",
            [2] = workspace.DinerPlaceHolder.Stations.Dish_Sink
        }

        game.ReplicatedStorage.Remotes.UseSink:InvokeServer(unpack(args))

local args = {
    [1] = "PutPlateInSink",
    [2] = workspace:WaitForChild("DinerPlaceHolder"):WaitForChild("Stations"):WaitForChild("Dish_Washer")
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("UseSink"):InvokeServer(unpack(args))

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


