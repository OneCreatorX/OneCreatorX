local player = game.Players.LocalPlayer
local userInputService = game:GetService("UserInputService")

local function FireServerAndWait(childName)
    local ingredientCollider = workspace.Ingredients:WaitForChild(childName):WaitForChild("Ingredient_Collider")
    game:GetService("ReplicatedStorage").Remotes.TI_0:FireServer(ingredientCollider)
end

local function addIngredients(horno, ingredientCount)
    local ingredientsFolder = workspace.Ingredients
    local ingredients = {}

    for _, ingredient in ipairs(ingredientsFolder:GetChildren()) do
        table.insert(ingredients, ingredient.Name)
    end

    local ingredientChunks = {}

    for i = 1, ingredientCount, 4 do
        local chunk = {}
        for j = i, i + 3 do
            local ingredientIndex = (j - 1) % #ingredients + 1
            table.insert(chunk, ingredients[ingredientIndex])
        end
        table.insert(ingredientChunks, chunk)
    end

    for _, chunk in ipairs(ingredientChunks) do
        for _, ingredient in ipairs(chunk) do
            spawn(function()
                FireServerAndWait(ingredient)
            end)
        end
        wait(0.8)
    end
end

local function addExtraIngredients(horno, ingredientCount)
    local ingredientsFolder = workspace.Ingredients
    local ingredients = {}

    for _, ingredient in ipairs(ingredientsFolder:GetChildren()) do
        table.insert(ingredients, ingredient.Name)
    end

    local ingredientChunks = {}

    for i = 1, ingredientCount, 4 do
        local chunk = {}
        for j = i, i + 3 do
            local ingredientIndex = (j - 1) % #ingredients + 1
            table.insert(chunk, ingredients[ingredientIndex])
        end
        table.insert(ingredientChunks, chunk)
    end

    for _, chunk in ipairs(ingredientChunks) do
        for _, ingredient in ipairs(chunk) do
            spawn(function()
                FireServerAndWait(ingredient)
            end)
        end
        wait(1)
    end
end

local function HandleHornos(hornoList, waitTime)
    local currentIndex = 1

    while true do
        local hornoData = hornoList[currentIndex]
        local horno = hornoData.Horno
        local smokePoint = hornoData.Posicion

        spawn(function()
            addIngredients(horno, 20) -- Damos 20 ingredientes predefinidos por horno
            addExtraIngredients(horno, 10) -- Damos 10 ingredientes adicionales por horno
        end)

        local bakeArgs = {
            [1] = horno,
            [2] = "Exotic"
        }

        game:GetService("ReplicatedStorage").Remotes.StartBake:FireServer(unpack(bakeArgs))
        wait(0.5)
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(smokePoint)
        wait(waitTime)

        currentIndex = currentIndex % #hornoList + 1
        wait(waitTime) -- Reducimos el tiempo de espera entre hornos a 10 segundos
    end
end

-- Obtener la lista de hornos y sus posiciones
local hornoList = {}

for _, horno in ipairs(workspace.Plots.Plot3.Ovens:GetChildren()) do
    table.insert(hornoList, {
        Horno = horno,
        Posicion = horno.SmokePoint.Position
    })
end

-- Crear una función para mostrar el cuadro de texto y obtener la entrada del usuario
local function ShowTextBox()
    -- Crear una instancia de la clase TextBox
    local textBox = Instance.new("TextBox")
    textBox.Size = UDim2.new(0, 200, 0, 30) -- Establecer el tamaño del cuadro de texto
    textBox.Position = UDim2.new(0.5, -100, 0.5, -15) -- Establecer la posición del cuadro de texto
    textBox.AnchorPoint = Vector2.new(0.5, 0.5) -- Establecer el punto de anclaje en el centro
    textBox.FontSize = Enum.FontSize.Size14 -- Establecer el tamaño de fuente
    textBox.ClearTextOnFocus = true -- Borrar el texto cuando se hace clic en el cuadro de texto
    textBox.PlaceholderText = "Ingresa un valor" -- Establecer el texto de marcador de posición

    -- Obtener la entrada del usuario cuando se presione la tecla Enter
    textBox.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            local enteredText = textBox.Text
            textBox:Destroy() -- Destruir el cuadro de texto después de obtener la entrada

            -- Ejecutar el script con el nuevo valor ingresado
            local waitTime = tonumber(enteredText) or 3 -- Convertir la entrada en un número o usar 3 segundos por defecto
            HandleHornos(hornoList, waitTime)
        end
    end)

    -- Parentar el cuadro de texto al jugador local
    textBox.Parent = game.Players.LocalPlayer.PlayerGui

    -- Enfocar el cuadro de texto
    textBox:CaptureFocus()
end

-- Llamar a la función para mostrar el cuadro de texto
ShowTextBox()

