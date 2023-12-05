local dataTable = {}
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player.PlayerGui

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local function traverseStoragesModel(parent)
    local storagesModel = parent:WaitForChild("DinerPlaceHolder"):WaitForChild("Storages")

    if storagesModel then
        local ingredientNames = {}

        for _, storage in pairs(storagesModel:GetChildren()) do
            if storage:IsA("Model") then
                table.insert(ingredientNames, storage.Name)
            end
        end

        return ingredientNames
    else
        return nil
    end
end

local function changeIngredientName(ingredientName)
    local CookRemote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Cook")

    local args = {
        [1] = "AcquireIngredient",
        [2] = {
            ["Storage"] = true,
            ["Ingredient"] = ingredientName
        }
    }

    pcall(function()
        CookRemote:InvokeServer(unpack(args))
        print("Invocado CookRemote con éxito para", ingredientName)
    end)
end

local function markAsProcessed(npcModel)
    -- Marcar el NPC como procesado
    local processedMarker = Instance.new("BoolValue")
    processedMarker.Name = "Processed"
    processedMarker.Value = true
    processedMarker.Parent = npcModel
end

local function updateTableAndButtons()
    local buttonsToDestroy = {}

    for textValue, button in pairs(dataTable) do
        if not button:IsA("GuiObject") or not button.Parent then
            buttonsToDestroy[textValue] = true
        end
    end

    for _, npcModel in pairs(workspace.NPCS.Active:GetChildren()) do
        local trackerObj = npcModel:FindFirstChild("TrackerObj")
        local processedMarker = npcModel:FindFirstChild("Processed")

        if trackerObj and trackerObj:IsA("ObjectValue") and not processedMarker then
            local textValue = trackerObj.Value

            if not dataTable[textValue] or buttonsToDestroy[textValue] then
                -- Esperar antes de procesar para permitir que lleguen otros NPC
                processedMarker = npcModel:FindFirstChild("Processed")  -- Verificar nuevamente después del retraso
                if not processedMarker then
                    local notificationButton = Instance.new("TextButton")
                    notificationButton.Parent = screenGui
                    notificationButton.Size = UDim2.new(0, 150, 0, 30)
                    notificationButton.Position = UDim2.new(0.5, -75, 0, 0)
                    notificationButton.Text = tostring(textValue)
                    notificationButton.ZIndex = #dataTable

                    notificationButton.MouseButton1Click:Connect(function()
                        notificationButton:Destroy()
                        trackerObj:Destroy()
                        markAsProcessed(npcModel)  -- Marcar el NPC como procesado
                        local args = { [1] = tostring(textValue), [2] = "CreatePlate" }
                        game:GetService("ReplicatedStorage").Remotes.ChangeMenu:InvokeServer(unpack(args))
                    end)

                    dataTable[textValue] = notificationButton
                end
            end
        end
    end

    for textValue, shouldDestroy in pairs(buttonsToDestroy) do
        if shouldDestroy and dataTable[textValue] and dataTable[textValue]:IsA("GuiObject") then
            dataTable[textValue]:Destroy()
            dataTable[textValue] = nil
        end
    end
end

local function processIngredients()
    while true do
        -- Obtener nombres de archivos Model en Storages
        local ingredientNames = traverseStoragesModel(workspace) -- Reemplaza "workspace" con el objeto adecuado

        -- Iterar y cambiar nombres
        if ingredientNames then
            for _, ingredientName in pairs(ingredientNames) do
                changeIngredientName(ingredientName)
            end
        else
            print("No se pueden cambiar los nombres debido a un error.")
        end

        wait(2) -- Esperar 2 segundos antes de la siguiente iteración
    end
end

-- Llamar a la función para generar el ScreenGUI
updateTableAndButtons()

-- Conectar funciones a eventos
workspace.NPCS.Active.ChildAdded:Connect(updateTableAndButtons)
workspace.NPCS.Active.ChildRemoved:Connect(updateTableAndButtons)

-- Lanzar la función para procesar ingredientes en un hilo separado
spawn(processIngredients)
