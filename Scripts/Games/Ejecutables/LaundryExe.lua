local Plot = game:GetService("Players").LocalPlayer.NonSaveVars.OwnsPlot.Value

local function UpdateClothingDirectory()
    return game:GetService("Workspace").Debris.Clothing:GetChildren()
end

local function InvokeClothing(clothing)
    game:GetService("ReplicatedStorage").Events.GrabClothing:FireServer(clothing)
end

local function DropClothesInChute()
    game:GetService("ReplicatedStorage").Events.DropClothesInChute:FireServer()
end

-- Crear la interfaz gráfica (gui)
local gui = Instance.new("ScreenGui")
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Crear el marco principal
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 200, -0.5, 240)
mainFrame.Position = UDim2.new(0.5, -100, 0, 0)
mainFrame.BackgroundTransparency = 0.8 -- Valor entre 0 (opaco) y 1 (transparente)
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = gui

-- Crear el título
local titleText = Instance.new("TextLabel")
titleText.Size = UDim2.new(1, 0, 0, 40)
titleText.Position = UDim2.new(0, 0, -0.4, 40)
titleText.BackgroundTransparency = 0.4
titleText.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
titleText.BorderSizePixel = 1
titleText.Text = "Laundry X"
titleText.TextColor3 = Color3.fromRGB(255, 255, 255)
titleText.Font = Enum.Font.GothamSemibold
titleText.TextSize = 14
titleText.TextScaled = true
titleText.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
titleText.TextStrokeTransparency = 0.5
titleText.TextTransparency = 0.2
titleText.ClipsDescendants = true
titleText.Parent = mainFrame

-- Crear el botón para ropa especial
local specialClothingButton = Instance.new("TextButton")
specialClothingButton.Size = UDim2.new(0, 180, 0, 40)
specialClothingButton.Position = UDim2.new(0.5, 0, 0, 52)
specialClothingButton.AnchorPoint = Vector2.new(0.5, 0)
specialClothingButton.BackgroundTransparency = 0.5
specialClothingButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
specialClothingButton.BorderSizePixel = 2
specialClothingButton.Text = "Ropas Especiales"
specialClothingButton.TextColor3 = Color3.new(1, 0, 0)
specialClothingButton.Font = Enum.Font.GothamSemibold
specialClothingButton.TextSize = 10
specialClothingButton.TextScaled = true
specialClothingButton.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
specialClothingButton.TextStrokeTransparency = 0.5
specialClothingButton.TextTransparency = 0.2
specialClothingButton.ClipsDescendants = true
specialClothingButton.Parent = mainFrame

-- Crear el botón para todas las prendas
local allClothingButton = Instance.new("TextButton")
allClothingButton.Size = UDim2.new(0, 180, 0, 40)
allClothingButton.Position = UDim2.new(0.5, 0, 0, 97)
allClothingButton.AnchorPoint = Vector2.new(0.5, 0)
allClothingButton.BackgroundTransparency = 0.5
allClothingButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
allClothingButton.BorderSizePixel = 1
allClothingButton.Text = "Todas las Prendas"
allClothingButton.TextColor3 = Color3.new(1, 0, 0)
allClothingButton.Font = Enum.Font.GothamSemibold
allClothingButton.TextSize = 15
allClothingButton.TextScaled = true
allClothingButton.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
allClothingButton.TextStrokeTransparency = 0.5
allClothingButton.TextTransparency = 0.2
allClothingButton.ClipsDescendants = true
allClothingButton.Parent = mainFrame

-- Crear el botón para AutoFarm
local autoFarmButton = Instance.new("TextButton")
autoFarmButton.Size = UDim2.new(0, 180, 0, 40)
autoFarmButton.Position = UDim2.new(0.5, 0, 0, 142)
autoFarmButton.AnchorPoint = Vector2.new(0.5, 0)
autoFarmButton.BackgroundTransparency = 0.5
autoFarmButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
autoFarmButton.BorderSizePixel = 1
autoFarmButton.Text = "AutoFarm"
autoFarmButton.TextColor3 = Color3.new(1, 0, 0)
autoFarmButton.Font = Enum.Font.GothamSemibold
autoFarmButton.TextSize = 15
autoFarmButton.TextScaled = true
autoFarmButton.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
autoFarmButton.TextStrokeTransparency = 0.5
autoFarmButton.TextTransparency = 0.2
autoFarmButton.ClipsDescendants = true
autoFarmButton.Parent = mainFrame

local titleTexts = {"Laundry X", "YT:@OneCreatorX"}
local titleColors = {
    Color3.fromRGB(255, 0, 0),   -- Rojo
    Color3.fromRGB(0, 255, 0),   -- Verde
    Color3.fromRGB(0, 0, 255)    -- Azul
}
local currentIndex = 1

local function changeTitleTextAndColor()
    currentIndex = currentIndex % #titleTexts + 1
    titleText.Text = titleTexts[currentIndex]
    titleText.TextColor3 = titleColors[currentIndex]
end

local titleChangeInterval = 5 -- Intervalo en segundos para cambiar el texto y color del título

spawn(function()
    while true do
        wait(titleChangeInterval)
        changeTitleTextAndColor()
    end
end)

local isSpecialClothingButtonHighlighted = false
local isAllClothingButtonHighlighted = false
local isAutoFarmButtonHighlighted = false
local invokeClothingProcessCoroutine
local manageWashingMachineCoroutine
local dropClothesInChuteCoroutine

local function ToggleSpecialClothing()
    isSpecialClothingButtonHighlighted = not isSpecialClothingButtonHighlighted

    if isSpecialClothingButtonHighlighted then
        specialClothingButton.TextColor3 = Color3.new(0, 1, 0) -- Cambiar a verde
    else
        specialClothingButton.TextColor3 = Color3.new(1, 0, 0) -- Cambiar a rojo
    end

    if not isAllClothingButtonHighlighted then
        invokeClothingProcessCoroutine = coroutine.create(invokeClothingProcess)
        coroutine.resume(invokeClothingProcessCoroutine)
    end
end

local function ToggleAllClothing()
    isAllClothingButtonHighlighted = not isAllClothingButtonHighlighted

    if isAllClothingButtonHighlighted then
        allClothingButton.TextColor3 = Color3.new(0, 1, 0) -- Cambiar a verde
    else
        allClothingButton.TextColor3 = Color3.new(1, 0, 0) -- Cambiar a rojo
    end

    if not isSpecialClothingButtonHighlighted then
        invokeClothingProcessCoroutine = coroutine.create(invokeClothingProcess)
        coroutine.resume(invokeClothingProcessCoroutine)
    end
end

local function ToggleAutoFarm()
    isAutoFarmButtonHighlighted = not isAutoFarmButtonHighlighted

    if isAutoFarmButtonHighlighted then
        autoFarmButton.TextColor3 = Color3.new(0, 1, 0) -- Cambiar a verde
        manageWashingMachineCoroutine = coroutine.create(manageWashingMachine)
        dropClothesInChuteCoroutine = coroutine.create(dropClothesInChute)
        coroutine.resume(manageWashingMachineCoroutine, Plot)
        coroutine.resume(dropClothesInChuteCoroutine)
    else
        autoFarmButton.TextColor3 = Color3.new(1, 0, 0) -- Cambiar a rojo
        if manageWashingMachineCoroutine then
            coroutine.kill(manageWashingMachineCoroutine)
            manageWashingMachineCoroutine = nil
        end
        if dropClothesInChuteCoroutine then
            coroutine.kill(dropClothesInChuteCoroutine)
            dropClothesInChuteCoroutine = nil
        end
    end
end

-- Evento MouseButton1Click del botón de Ropas Especiales
specialClothingButton.MouseButton1Click:Connect(ToggleSpecialClothing)

-- Evento MouseButton1Click del botón de Todas las Prendas
allClothingButton.MouseButton1Click:Connect(ToggleAllClothing)

-- Evento MouseButton1Click del botón de AutoFarm
autoFarmButton.MouseButton1Click:Connect(ToggleAutoFarm)

local function invokeSpecialClothing()
    if isSpecialClothingButtonHighlighted then
        local clothingList = UpdateClothingDirectory()
        local specialClothingList = {}

        for _, v in ipairs(clothingList) do
            local specialTag = v:FindFirstChild("SpecialTag")

            if specialTag then
                table.insert(specialClothingList, v)
            end
        end

        -- Tomar las prendas especiales
        for _, v in ipairs(specialClothingList) do
            InvokeClothing(v)
            wait(0.2)
        end
    end
end

local function invokeAllClothing()
    if isAllClothingButtonHighlighted then
        local clothingList = UpdateClothingDirectory()
        local playerPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position

        table.sort(clothingList, function(a, b)
            local distanceA = (a.Position - playerPosition).Magnitude
            local distanceB = (b.Position - playerPosition).Magnitude
            return distanceA < distanceB
        end)

        for _, clothing in ipairs(clothingList) do
            InvokeClothing(clothing)
            wait(0.01)
        end
    end
end

local function invokeClothingProcess()
    while true do
        invokeSpecialClothing()
        invokeAllClothing()
        wait(1.6)
    end
end

local function manageWashingMachine(washingMachine)
    while true do
        -- Iniciar lavadora
        game:GetService("ReplicatedStorage").Events.LoadWashingMachine:FireServer(washingMachine)

        -- Detener lavadora
        game:GetService("ReplicatedStorage").Events.UnloadWashingMachine:FireServer(washingMachine)
        wait(0.8)
    end
end

local function dropClothesInChute()
    while true do
        game:GetService("ReplicatedStorage").Events.DropClothesInChute:FireServer()
        wait(1)
    end
end

local function startSpam()
    local plot = Plot
    if plot then
        local washingMachines = plot.WashingMachines:GetChildren()

        for _, washingMachine in ipairs(washingMachines) do
            spawn(function()
                manageWashingMachine(washingMachine)
            end)
        end

        invokeClothingProcessCoroutine = coroutine.create(invokeClothingProcess)
        coroutine.resume(invokeClothingProcessCoroutine)
        spawn(dropClothesInChute)
    else
        print("No se encontró el Plot del jugador.")
    end
end

autoFarmButton.MouseButton1Click:Connect(startSpam)

local Gamepasses = game.Players.LocalPlayer.Gamepasses

for _, gamepass in ipairs(Gamepasses:GetChildren()) do
    local gamepassName = gamepass.Name

    if gamepassName ~= "VIP" then
        gamepass.Value = true
    end
end
