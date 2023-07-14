local directorio = workspace.Debris.Clothing
local jugador = game.Players.LocalPlayer
local scriptActivadoEspecial = false
local scriptActivadoCercano = false
local player = game.Players.LocalPlayer
local plotValue = player.NonSaveVars.OwnsPlot
local WashingMachines

-- Función para obtener la distancia entre dos puntos en 3D
local function obtenerDistancia(puntoA, puntoB)
    return (puntoA - puntoB).Magnitude
end

-- Invocar todas las prendas especiales del directorio más cercanas al jugador
local function invocarRopasEspecialesCercanas()
    -- Actualizar el directorio y la lista de ropas especiales
    local function actualizarDirectorioEspecial()
        local listaRopasEspeciales = {}

        for _, ropa in ipairs(directorio:GetChildren()) do
            if ropa:FindFirstChild("SpecialTag") then
                table.insert(listaRopasEspeciales, ropa)
            end
        end

        -- Ordenar la lista de ropas especiales por distancia al jugador
        table.sort(listaRopasEspeciales, function(a, b)
            return obtenerDistancia(a.Position, jugador.Character.HumanoidRootPart.Position) < obtenerDistancia(b.Position, jugador.Character.HumanoidRootPart.Position)
        end)

        return listaRopasEspeciales
    end

    -- Invocar las ropas especiales más cercanas al jugador
    local function invocarRopasEspeciales(listaRopasEspeciales)
        for _, ropa in ipairs(listaRopasEspeciales) do
            if ropa:IsDescendantOf(directorio) then
                game:GetService("ReplicatedStorage").Events.GrabClothing:FireServer(ropa)
                wait()
            end
        end
    end

    local listaRopasEspeciales = actualizarDirectorioEspecial()
    invocarRopasEspeciales(listaRopasEspeciales)
end

-- Invocar todas las prendas del directorio más cercanas al jugador
local function invocarRopasCercanas()
    -- Actualizar el directorio y la lista de ropas
    local function actualizarDirectorioCercano()
        local listaRopas = {}

        for _, ropa in ipairs(directorio:GetChildren()) do
            table.insert(listaRopas, ropa)
        end

        -- Ordenar la lista de ropas por distancia al jugador
        table.sort(listaRopas, function(a, b)
            return obtenerDistancia(a.Position, jugador.Character.HumanoidRootPart.Position) < obtenerDistancia(b.Position, jugador.Character.HumanoidRootPart.Position)
        end)

        return listaRopas
    end

    -- Invocar las ropas más cercanas al jugador
    local function invocarRopas(listaRopas)
        for _, ropa in ipairs(listaRopas) do
            if ropa:IsDescendantOf(directorio) then
                game:GetService("ReplicatedStorage").Events.GrabClothing:FireServer(ropa)
                wait(0.1)
            end
        end
    end

    local listaRopas = actualizarDirectorioCercano()
    invocarRopas(listaRopas)
end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ClothingScriptGui"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Name = "MainFrame"
frame.Size = UDim2.new(0, 220, 0, 200)
frame.Position = UDim2.new(0.5, -110, 0.5, -100)
frame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
frame.BorderSizePixel = 0
frame.Active = true -- Habilitar la capacidad de interactuar con el marco
frame.Draggable = true -- el arrastre del marco
frame.Parent = screenGui

local title = Instance.new("TextLabel")
title.Name = "TitleLabel"
title.Text = "Laundry @OneCreatorX"
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.SourceSansBold
title.FontSize = Enum.FontSize.Size18
title.Parent = frame

local specialButton = Instance.new("TextButton")
specialButton.Name = "SpecialButton"
specialButton.Text = "Invocar Ropas Especiales (OFF)"
specialButton.Size = UDim2.new(0, 200, 0, 50)
specialButton.Position = UDim2.new(0, 10, 0, 30)
specialButton.Font = Enum.Font.SourceSans
specialButton.TextColor3 = Color3.new(1, 1, 1)
specialButton.TextSize = 20
specialButton.BackgroundColor3 = Color3.new(0.2, 0.6, 1)
specialButton.BorderSizePixel = 0
specialButton.Parent = frame

local nearbyButton = Instance.new("TextButton")
nearbyButton.Name = "NearbyButton"
nearbyButton.Text = "Invocar todas las ropa (OFF)"
nearbyButton.Size = UDim2.new(0, 200, 0, 50)
nearbyButton.Position = UDim2.new(0, 10, 0, 85)
nearbyButton.Font = Enum.Font.SourceSans
nearbyButton.TextColor3 = Color3.new(1, 1, 1)
nearbyButton.TextSize = 20
nearbyButton.BackgroundColor3 = Color3.new(0.2, 0.6, 1)
nearbyButton.BorderSizePixel = 0
nearbyButton.Parent = frame

local plotButton = Instance.new("TextButton")
plotButton.Name = "PlotButton"
plotButton.Text = "Iniciar Process Lavadoras"
plotButton.Size = UDim2.new(0, 200, 0, 50)
plotButton.Position = UDim2.new(0, 10, 0, 140)
plotButton.Font = Enum.Font.SourceSans
plotButton.TextColor3 = Color3.new(1, 1, 1)
plotButton.TextSize = 20
plotButton.BackgroundColor3 = Color3.new(0.2, 0.6, 1)
plotButton.BorderSizePixel = 0
plotButton.Parent = frame

-- Funciones para alternar el estado de los scripts
local function toggleSpecialScriptState()
    scriptActivadoEspecial = not scriptActivadoEspecial
    specialButton.Text = scriptActivadoEspecial and "Invocar Ropas Especiales (ON)" or "Invocar Ropas Especiales (OFF)"
end

local function toggleNearbyScriptState()
    scriptActivadoCercano = not scriptActivadoCercano
    nearbyButton.Text = scriptActivadoCercano and "Invocar todas las Ropas (ON)" or "Invocar todas las ropas (OFF)"
end

specialButton.MouseButton1Click:Connect(toggleSpecialScriptState)
nearbyButton.MouseButton1Click:Connect(toggleNearbyScriptState)

local function alternarEstadoScriptLavarropas()
    isRunning = not isRunning
    plotButton.Text = isRunning and "Detener lavadoras" or "Iniciar Lavadoras"

    while isRunning do
        if WashingMachines then
            for _, washingMachine in ipairs(WashingMachines) do
                game:GetService("ReplicatedStorage").Events.LoadWashingMachine:FireServer(washingMachine)
                wait(0.8)
                game:GetService("ReplicatedStorage").Events.UnloadWashingMachine:FireServer(washingMachine)
                game:GetService("ReplicatedStorage").Events.DropClothesInChute:FireServer()
            end
        end
    end
end

-- Conectar los eventos de clic de los botones a las funciones correspondientes
specialButton.MouseButton1Click:Connect(alternarEstadoScriptEspecial)
nearbyButton.MouseButton1Click:Connect(alternarEstadoScriptCercano)
plotButton.MouseButton1Click:Connect(alternarEstadoScriptLavarropas)

-- Verificar si el jugador tiene un plot asignado
if plotValue.Value then
    local Plot = plotValue.Value.Name
    WashingMachines = workspace.Plots[Plot].WashingMachines:GetChildren()
    local isRunning = false

    plotButton.Visible = true
else
    plotButton.Visible = false
end

-- Invocar ropas especiales cercanas al jugador
game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
    jugador = game.Players.LocalPlayer
    if scriptActivadoEspecial then
        invocarRopasEspecialesCercanas()
    end
    if scriptActivadoCercano then
        invocarRopasCercanas()
    end
end)

-- Invocar ropas cercanas al jugador en el momento de ejecución del script
if game.Players.LocalPlayer.Character then
    jugador = game.Players.LocalPlayer
    if scriptActivadoEspecial then
        invocarRopasEspecialesCercanas()
    end
    if scriptActivadoCercano then
        invocarRopasCercanas()
    end
end

-- Actualizar el directorio y la lista de ropas especiales cada cierto tiempo si el script está activado
while true do
    wait(0.2)
    if scriptActivadoEspecial then
        invocarRopasEspecialesCercanas()
    end
    if scriptActivadoCercano then
        invocarRopasCercanas()
    end
end
