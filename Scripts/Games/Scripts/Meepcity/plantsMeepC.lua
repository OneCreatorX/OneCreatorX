-- Variables
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
local mainFrame = Instance.new("Frame")
local collectCoinsButton = Instance.new("TextButton")
local removePlantsButton = Instance.new("TextButton")
local plantPlantsButton = Instance.new("TextButton")
local waterPlantsButton = Instance.new("TextButton")
local executeAllButton = Instance.new("TextButton")
local closeButton = Instance.new("TextButton")
local running = false

-- Configuración de la GUI
gui.Name = "FloatingMenu"
gui.Parent = player.PlayerGui

mainFrame.Name = "MainFrame"
mainFrame.Position = UDim2.new(0.5, -75, 0.5, -135)
mainFrame.Size = UDim2.new(0, 150, 0, 270)
mainFrame.Style = Enum.FrameStyle.DropShadow
mainFrame.Parent = gui

collectCoinsButton.Name = "CollectCoinsButton"
collectCoinsButton.Position = UDim2.new(0.5, -50, 0.05, 0)
collectCoinsButton.Size = UDim2.new(0, 100, 0, 30)
collectCoinsButton.Text = "Recoger"
collectCoinsButton.Parent = mainFrame

removePlantsButton.Name = "RemovePlantsButton"
removePlantsButton.Position = UDim2.new(0.5, -50, 0.2, 0)
removePlantsButton.Size = UDim2.new(0, 100, 0, 30)
removePlantsButton.Text = "Remover Plantas"
removePlantsButton.Parent = mainFrame

plantPlantsButton.Name = "PlantPlantsButton"
plantPlantsButton.Position = UDim2.new(0.5, -50, 0.35, 0)
plantPlantsButton.Size = UDim2.new(0, 100, 0, 30)
plantPlantsButton.Text = "Plantar Plantas"
plantPlantsButton.Parent = mainFrame

waterPlantsButton.Name = "WaterPlantsButton"
waterPlantsButton.Position = UDim2.new(0.5, -50, 0.5, 0)
waterPlantsButton.Size = UDim2.new(0, 100, 0, 30)
waterPlantsButton.Text = "Regar Plantas"
waterPlantsButton.Parent = mainFrame

executeAllButton.Name = "ExecuteAllButton"
executeAllButton.Position = UDim2.new(0.5, -75, 0.65, 0)
executeAllButton.Size = UDim2.new(0, 150, 0, 30)
executeAllButton.Text = "Ejecutar Todo"
executeAllButton.Parent = mainFrame

closeButton.Name = "CloseButton"
closeButton.Position = UDim2.new(0.5, -50, 0.9, 0)
closeButton.Size = UDim2.new(0, 100, 0, 30)
closeButton.Text = "Cerrar menú"
closeButton.Parent = mainFrame

-- Funciones
local function executeCode(code)
    if code then
        loadstring(code)()
    end
end

local function collectCoins()
    running = true

    for i = 0, 20 do
        if not running then
            break
        end

        executeCode('game:GetService("ReplicatedStorage").ConnectionEvent:FireServer(228, ' .. i .. ')')
        wait(0.01) -- Esperar 10 milisegundos por cada iteración
    end

    running = false
end

local function removePlants()
    running = true

    for i = 0, 20 do
        if not running then
            break
        end

        executeCode('game:GetService("ReplicatedStorage").Connection:InvokeServer(96, ' .. i .. ')')
        wait(0.01) -- Esperar 10 milisegundos por cada iteración
    end

    running = false
end

local function plantPlants()
    running = true

    for i = 0, 20 do
        if not running then
            break
        end

        executeCode('game:GetService("ReplicatedStorage").Connection:InvokeServer(99, ' .. i .. ', 17)')
        wait(0.01) -- Esperar 10 milisegundos por cada iteración
    end

    running = false
end

local function waterPlants()
    running = true

    for i = 0, 20 do
        if not running then
            break
        end

        executeCode('game:GetService("ReplicatedStorage").Connection:InvokeServer(93, ' .. i .. ')')
        wait(0.01) -- Esperar 10 milisegundos por cada iteración
    end

   running = true

    for i = 0, 20 do
        if not running then
            break
        end

        executeCode('game:GetService("ReplicatedStorage").Connection:InvokeServer(93, ' .. i .. ')')
        wait(0.01) -- Esperar 10 milisegundos por cada iteración
    end

    running = false
end

-- Eventos de botones
collectCoinsButton.MouseButton1Click:Connect(function()
    if not running then
        collectCoins()
    end
end)

removePlantsButton.MouseButton1Click:Connect(function()
    if not running then
        removePlants()
    end
end)

plantPlantsButton.MouseButton1Click:Connect(function()
    if not running then
        plantPlants()
    end
end)

waterPlantsButton.MouseButton1Click:Connect(function()
    if not running then
        waterPlants()
    end
end)
executeAllButton.MouseButton1Click:Connect(function()
    if not running then
        running = true

        -- Ejecutar en orden: Recoger, Remover Plantas, Plantar Plantas, Regar Plantas
        collectCoins()
        removePlants()
        plantPlants()
        waterPlants()
        gui:Destroy()

        running = false
    end
end)

closeButton.MouseButton1Click:Connect(function()
    running = false
    gui:Destroy()
end)
