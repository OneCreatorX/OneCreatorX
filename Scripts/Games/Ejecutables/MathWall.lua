 -- Función para crear y configurar un botón con estilo y centrarlo en el eje X
local function createStyledButton(name, parent, position, size, active)
    local button = Instance.new("TextButton")
    button.Name = name
    button.Parent = parent
    button.Position = UDim2.new(0.5, position.X.Offset, 0, position.Y.Offset) -- Ajuste para centrar horizontalmente
    button.Size = size
    button.Text = name
    button.Font = Enum.Font.SourceSansBold
    button.TextSize = 14
    button.TextColor3 = Color3.new(1, 1, 1)
    button.BackgroundTransparency = 0.5
    button.TextWrapped = true

    -- Establecer color rojo por defecto para botones desactivados
    button.BackgroundColor3 = active and Color3.new(0, 0.7, 0) or Color3.new(0.7, 0, 0) -- Verde o Rojo

    -- Cambiar el color del botón cuando es activado/desactivado
    button.Activated:Connect(function()
        active = not active
        if active then
            button.BackgroundColor3 = Color3.new(0, 0.7, 0) -- Verde
        else
            button.BackgroundColor3 = Color3.new(0.7, 0, 0) -- Rojo
        end
    end)

    -- Cambiar el color del botón al hacer hover (pasar el mouse por encima)
    button.MouseEnter:Connect(function()
        if active then
            button.BackgroundColor3 = Color3.new(0, 1, 0) -- Verde claro
        else
            button.BackgroundColor3 = Color3.new(1, 0, 0) -- Rojo claro
        end
    end)

    -- Cambiar el color del botón cuando se deja de hacer hover
    button.MouseLeave:Connect(function()
        if active then
            button.BackgroundColor3 = Color3.new(0, 0.7, 0) -- Verde
        else
            button.BackgroundColor3 = Color3.new(0.7, 0, 0) -- Rojo
        end
    end)

    -- Agregar un efecto visual al presionar el botón
    button.MouseButton1Down:Connect(function()
        button.BackgroundColor3 = Color3.new(0.5, 0.5, 0.5) -- Gris oscuro
    end)

    -- Restaurar el color del botón al soltar el clic
    button.MouseButton1Up:Connect(function()
        if active then
            button.BackgroundColor3 = Color3.new(0, 0.7, 0) -- Verde
        else
            button.BackgroundColor3 = Color3.new(0.7, 0, 0) -- Rojo
        end
    end)

    return button
end

-- Crear el ScreenGUI (igual que antes)
local gui = Instance.new("ScreenGui")
gui.Parent = game.Players.LocalPlayer.PlayerGui
gui.Name = "FarmGUI" -- Puedes cambiar el nombre si lo deseas
gui.DisplayOrder = 10 -- Para que se muestre encima de otros elementos

-- Título (actualizado con más detalles visuales)
local title = Instance.new("TextLabel")
title.Parent = gui
title.Size = UDim2.new(1, 0, 0, 60) -- Aumentar el tamaño para que cruce todo lo horizontal
title.BackgroundColor3 = Color3.new(0, 0, 0)
title.BackgroundTransparency = 0.7
title.BorderSizePixel = 0
title.Text = "Math Wall | YT:@OneCreatorX"
title.Font = Enum.Font.SourceSansBold
title.TextColor3 = Color3.new(1, 1, 1)
title.TextSize = 36 -- Aumentar el tamaño del texto para que sea más prominente
title.TextXAlignment = Enum.TextXAlignment.Center -- Alinear el texto al centro horizontal
title.TextWrapped = true -- Permitir que el texto se ajuste a varias líneas
title.TextScaled = true -- Escalar el texto para ajustarse al tamaño del título

-- Calcular la posición vertical del primer botón
local firstButtonYOffset = title.Size.Y.Offset + 20 -- Espacio entre el título y el primer botón

-- Calcular la posición vertical del segundo botón
local secondButtonYOffset = firstButtonYOffset + 40 -- Espacio entre el primer botón y el segundo botón

-- Crear el botón Auto Farm con estilo usando tu función
local autoFarmButton = createStyledButton("Auto Farm", gui, UDim2.new(0, -50, 0, firstButtonYOffset), UDim2.new(0, 100, 0, 30), activeAutoFarm)

-- Crear el botón Pasivo Farm con estilo usando tu función
local pasivoFarmButton = createStyledButton("Pasivo Farm", gui, UDim2.new(0, -50, 0, secondButtonYOffset), UDim2.new(0, 100, 0, 30), activePasivoFarm)

-- Variables para controlar el estado de los botones (igual que antes)
local activeAutoFarm = false
local activePasivoFarm = false

-- Almacenar la posición del Part más cercano
local closestPartPosition = nil

-- Función para copiar y pegar la posición del jugador en los Part
local function autoFarm()
    activeAutoFarm = not activeAutoFarm

    while activeAutoFarm do
        local player = game.Players.LocalPlayer
        local position = player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character.HumanoidRootPart.Position

        local map = game.Workspace.Map
        for _, child in ipairs(map:GetChildren()) do
            if child:IsA("Model") and child.Name ~= "SpecialParts" then
                child:Destroy()
            end
        end

        local finishes = map.SpecialParts.Finishes
        for _, class in ipairs({"Class 15"}) do
            local part = finishes:FindFirstChild(class)
            if part then
                part.Size = Vector3.new(4, 30, 1)
                part.Position = position
                player.Character.Humanoid.Jump = true
            end
        end

        wait(0.5) -- Esperar 0.5 segundos antes de repetir el ciclo
    end
end

-- Variable para almacenar la posición del Part más cercano
local closestPartPosition = nil

local function pasivoFarm()
    activePasivoFarm = not activePasivoFarm

    -- Si el proceso ya está en ejecución, detenerlo
    if pasivoFarmRunning then
        pasivoFarmRunning = false
        return
    end

    -- Si el botón se acaba de activar, buscar y almacenar la posición del Part más cercano
    if activePasivoFarm then
        local player = game.Players.LocalPlayer
        local position = player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character.HumanoidRootPart.Position

        local map = game.Workspace.Map
        local finishes = map.SpecialParts.Finishes:GetChildren()
        local closestPart
        local closestDistance = math.huge

        for _, part in ipairs(finishes) do
            if part:IsA("Part") then
                local distance = (position - part.Position).magnitude
                if distance < closestDistance then
                    -- Verificar si el Part más cercano es accesible para el jugador
                    local raycastParams = RaycastParams.new()
                    raycastParams.FilterDescendantsInstances = {player.Character}
                    local raycastResult = workspace:Raycast(position, part.Position - position, raycastParams)
                    if raycastResult then
                        closestDistance = distance
                        closestPart = part
                        closestPartPosition = part.Position -- Almacenar la posición del Part más cercano
                    end
                end
            end
        end

        if closestPart then
            -- Mover al jugador hacia el Part más cercano
            player.Character.Humanoid.WalkToPoint = closestPart.Position
        end
    end

    -- Ejecutar el bucle solo si el botón está activado y ya se encontró la posición del Part más cercano
    while activePasivoFarm and closestPartPosition do
        pasivoFarmRunning = true

        local player = game.Players.LocalPlayer
        local position = player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character.HumanoidRootPart.Position

        -- Mover al jugador hacia la posición almacenada del Part más cercano
        player.Character.Humanoid.WalkToPoint = closestPartPosition

        wait(0.5) -- Esperar 0.5 segundos antes de repetir el ciclo

        pasivoFarmRunning = false
    end
end


-- Conectar las funciones a los botones (igual que antes)
autoFarmButton.Activated:Connect(autoFarm)
pasivoFarmButton.Activated:Connect(pasivoFarm)