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

        player.Character.HumanoidRootPart.CFrame = CFrame.new(npcPosition)
        wait(0.2)
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
        end
    end
    return nil
end

local function deliverFoodToNPC(npc, platePosition)
    local npcHeadPosition = npc:FindFirstChild("Head") and npc.Head.Position

    if npcHeadPosition then
        ReplicatedStorage.Remotes.Plating:InvokeServer({
            PlateShelf = workspace.DinerPlaceHolder.PlateShelves.PlateShelf,
            Position = npcHeadPosition + Vector3.new(0, 2.7, 0)
        })
        wait(0.2)
        teleportToNPCPosition(originalPlayerPosition)
        npc:FindFirstChild("FoodDelivered").Value = true
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
            end
        end
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
end

local function buscarIngredient(parent)
    local storages = parent.Workspace.DinerPlaceHolder.Storages

    if storages then
        local function procesarIngrediente(descendant)
            if descendant:IsA("TextLabel") and descendant.Name == "Ingredient_Quantity" then
                local ingredientName = descendant.Parent:FindFirstChild("Ingredient_Name")
                if ingredientName then
                    local cantidad = tonumber(descendant.Text and descendant.Text:match("%d+")) or 0

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

                    descendant:GetPropertyChangedSignal("Text"):Connect(function()
                        local nuevaCantidad = tonumber(descendant.Text and descendant.Text:match("%d+")) or 0

                        if nuevaCantidad and nuevaCantidad < 2 then
                            local args = {
                                [1] = "Ingredient",
                                [2] = {
                                    ["Ingredient_Name"] = ingredientName.Text,
                                    ["Quantity"] = 2
                                }
                            }

                            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Purchase"):InvokeServer(unpack(args))
                        end
                    end)
                end
            end
        end

        for _, descendant in pairs(storages:GetDescendants()) do
            procesarIngrediente(descendant)
        end

        storages.ChildAdded:Connect(function(newIngredient)
            procesarIngrediente(newIngredient)
        end)
    end
end

buscarIngredient(game)
createDeliverButton()

workspace.NPCS.Active.ChildAdded:Connect(updateTableAndButtons)
workspace.NPCS.Active.ChildRemoved:Connect(updateTableAndButtons)
