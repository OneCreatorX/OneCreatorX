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

local function createButton(textValue, npcModel)
    local notificationButton = Instance.new("TextButton")
    notificationButton.Parent = screenGui
    notificationButton.Size = UDim2.new(0, 150, 0, 30)
    notificationButton.Position = UDim2.new(0.5, -75, 0, 0)
    notificationButton.Text = tostring(textValue)
    notificationButton.ZIndex = #screenGui:GetChildren() + 1

    notificationButton.MouseButton1Click:Connect(function()
        notificationButton:Destroy()
        markAsProcessed(npcModel)  -- Marcar el NPC como procesado
        local args = { [1] = tostring(textValue), [2] = "CreatePlate" }
        ReplicatedStorage.Remotes.ChangeMenu:InvokeServer(unpack(args))
    end)

    return notificationButton
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

local function onNPCAdded(npcModel)
    local trackerObj = npcModel:FindFirstChild("TrackerObj")
    local processedMarker = npcModel:FindFirstChild("Processed")

    if trackerObj and trackerObj:IsA("ObjectValue") and not processedMarker then
        local textValue = trackerObj.Value

        local existingButton = screenGui:FindFirstChild(tostring(textValue))
        if not existingButton then
            local notificationButton = createButton(textValue, npcModel)
        end
    end
end

-- Llamar a la función para generar el ScreenGUI
workspace.NPCS.Active.ChildAdded:Connect(onNPCAdded)

-- Lanzar la función para procesar ingredientes en un hilo separado
spawn(processIngredients)
