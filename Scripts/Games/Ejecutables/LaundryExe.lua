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

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 200, -0.2, 240)
mainFrame.Position = UDim2.new(0.5, -100, 0, 0)
mainFrame.BackgroundTransparency = 0.8 -- Valor entre 0 (opaco) y 1 (transparente)
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = gui

-- Agregar una imagen de fondo al marco principal
local backgroundImage = Instance.new("ImageLabel")
backgroundImage.Name = "BackgroundImage"
backgroundImage.Size = UDim2.new(1, 0, 0.30, -1)
backgroundImage.BackgroundTransparency = 1
backgroundImage.Image = "rbxassetid://13959537980" -- Reemplaza el ID de asset con la imagen deseada
backgroundImage.Parent = mainFrame

-- Crear el título
local titleText = Instance.new("TextLabel")
titleText.Size = UDim2.new(1, 0, 0, 40)
titleText.Position = UDim2.new(0, 0, -0.4, 20)
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
specialClothingButton.Text = "Ropas Especialew"
specialClothingButton.TextColor3 = Color3.new(1, 0, 0)
specialClothingButton.Font = Enum.Font.GothamSemibold
specialClothingButton.TextSize = 10
specialClothingButton.TextScaled = true
specialClothingButton.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
specialClothingButton.TextStrokeTransparency = 0.5
specialClothingButton.TextTransparency = 0.2
specialClothingButton.ClipsDescendants = true
specialClothingButton.Parent = mainFrame

-- Crear el botón de Auto Game
local autofarmButton = Instance.new("TextButton")
autofarmButton.Size = UDim2.new(0, 180, 0, 40)
autofarmButton.Position = UDim2.new(0.5, 0, 0, 97)
autofarmButton.AnchorPoint = Vector2.new(0.5, 0)
autofarmButton.BackgroundTransparency = 0.5
autofarmButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
autofarmButton.BorderSizePixel = 1
autofarmButton.Text = "Auto Game"
autofarmButton.TextColor3 = Color3.new(1, 0, 0)
autofarmButton.Font = Enum.Font.GothamSemibold
autofarmButton.TextSize = 15
autofarmButton.TextScaled = true
autofarmButton.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
autofarmButton.TextStrokeTransparency = 0.5
autofarmButton.TextTransparency = 0.2
autofarmButton.ClipsDescendants = true
autofarmButton.Parent = mainFrame

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

local isAutoFarmEnabled = false

local function ToggleAutoFarm()
    isAutoFarmEnabled = not isAutoFarmEnabled
    
    if isAutoFarmEnabled then
        specialClothingButton.Text = "Ropas Especiales"
        
        -- Iniciar el bucle de comprobación e invocación continua
        while isAutoFarmEnabled do
            local clothingList = UpdateClothingDirectory()
            local specialClothingList = {}

            for _, v in ipairs(clothingList) do
                local SpecialTag = v:FindFirstChild("SpecialTag")

                if SpecialTag then
                    table.insert(specialClothingList, v)
                end
            end

            -- Tomar las prendas especiales
            for _, v in ipairs(specialClothingList) do
                InvokeClothing(v)
                wait(0.2)
            end

            wait(1)  -- Esperar un segundo antes de realizar la próxima comprobación
        end
    else
        specialClothingButton.Text = "Ropas Especiales"
        
        -- Detener la función
        -- Implementa la lógica necesaria para detener la función según tus necesidades
    end
end

local function AutoFarm()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/Games/Scripts/Simulator/Laundry/AutoFarm.lua"))()
end

-- Función para cambiar el color del texto del botón de Auto Game
local function changeAutoFarmButtonColor()
    autofarmButton.TextColor3 = Color3.new(0, 1, 0) -- Cambiar a verde
end

-- Evento MouseButton1Click del botón de Auto Game
autofarmButton.MouseButton1Click:Connect(changeAutoFarmButtonColor)
autofarmButton.MouseButton1Click:Connect(function()
    AutoFarm()
end)

local function changeSpecialClothingButtonColor()
    specialClothingButtonState = not specialClothingButtonState -- Invertir el estado
    if specialClothingButtonState then
        specialClothingButton.TextColor3 = Color3.new(0, 1, 0) -- Cambiar a verde
        ToggleAutoFarm() -- Ejecutar función ToggleAutoFarm
    else
        specialClothingButton.TextColor3 = Color3.new(1, 0, 0) -- Cambiar a rojo
    end
end

specialClothingButton.MouseButton1Click:Connect(changeSpecialClothingButtonColor)