-- Crear un ScreenGui para la interfaz gráfica
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "GameInterface"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Crear un marco principal para la interfaz
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 300, 0, 200)
mainFrame.Position = UDim2.new(0.5, -150, 0, 20)
mainFrame.BackgroundColor3 = Color3.fromRGB(33, 33, 33)
mainFrame.BorderSizePixel = 3
mainFrame.BorderColor3 = Color3.fromRGB(255, 255, 255)
mainFrame.Active = true -- Hacer el marco interactivo para arrastrar
mainFrame.Draggable = true -- Hacer que el marco sea arrastrable
mainFrame.Parent = screenGui

-- Crear un título dentro del marco principal
local titleLabel = Instance.new("TextLabel")
titleLabel.Text = "Cartoon Network Game On"
titleLabel.TextSize = 20
titleLabel.Size = UDim2.new(1, 0, 0.15, 0)
titleLabel.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Parent = mainFrame

-- Crear un marco para la información adicional
local infoFrame = Instance.new("Frame")
infoFrame.Size = UDim2.new(1, 0, 0.85, 0)
infoFrame.Position = UDim2.new(0, 0, 0.15, 0)
infoFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
infoFrame.Parent = mainFrame

-- Crear un recuadro para la información adicional
local infoTextFrame = Instance.new("Frame")
infoTextFrame.Size = UDim2.new(0.8, 0, 0.8, 0)
infoTextFrame.Position = UDim2.new(0.1, 0, 0.1, 0)
infoTextFrame.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
infoTextFrame.Parent = infoFrame

-- Crear un texto para la información adicional
local infoLabel = Instance.new("TextLabel")
infoLabel.Text = "Auto collect All - UGC\nYT: OneCreatorX"
infoLabel.TextSize = 18
infoLabel.Size = UDim2.new(1, 0, 1, 0)
infoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
infoLabel.Parent = infoTextFrame

-- Sobresalir la interfaz gráfica
mainFrame.Position = UDim2.new(0.5, -150, 0, -100)

-- Restaurar la posición cuando se inicia el juego
game.Players.LocalPlayer.CharacterAdded:Connect(function()
    mainFrame.Position = UDim2.new(0.5, -150, 0, 20)
end)

-- Función para invocar acciones en el servidor
local function invokeServer(action, ...)
    local servicePath = game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("ProgressionDataService"):WaitForChild("RF")
    local actionService = servicePath and servicePath[action]
    if actionService then
        actionService:InvokeServer(...)
    else
        warn("Error: Action service not found.")
    end
end

-- Función para cambiar la posición del jugador al Collision de cada modelo
local function movePlayerToCollision()
    local collectablesFolder = workspace:WaitForChild("Powerpuff Girls Collectables")

    for _, powerpuffBubblesFolder in pairs(collectablesFolder:GetChildren()) do
        if powerpuffBubblesFolder:IsA("Folder") then
            print("Encontrado folder:", powerpuffBubblesFolder.Name)

            for _, collectableModel in pairs(powerpuffBubblesFolder:GetChildren()) do
                if collectableModel:IsA("Model") then
                    local collisionPart = collectableModel:FindFirstChild("Collision")

                    if collisionPart and collisionPart:IsA("Part") then
                        -- Cambiar la posición del jugador al Collision de cada modelo
                        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(collisionPart.CFrame)

                        print("Cambiando posición a Collision en modelo:", collectableModel.Name)

                        -- Esperar un tiempo antes de pasar al siguiente
                        wait(1)
                    else
                        print("ADVERTENCIA: No se encontró Collision en el modelo:", collectableModel.Name)
                    end
                else
                    print("ADVERTENCIA: Se encontró un elemento que no es un modelo en 'PowerpuffBubbles':", collectableModel.Name)
                end
            end
        else
            print("ADVERTENCIA: Se encontró un elemento que no es una carpeta en 'Powerpuff Girls Collectables':", powerpuffBubblesFolder.Name)
        end
    end
end

-- Tu código de spam aquí...
while true do
    -- Iniciar cada invocación en un hilo separado
    spawn(function()
        invokeServer("GiveExp", 1, "COTC")
    end)

    spawn(function()
        invokeServer("GiveExp", 1, "AWOG")
    end)

    spawn(function()
        local args = {
            "CNToken"
        }
        invokeServer("HandlePickupsDataAdd", unpack(args))
    end)

    spawn(function()
        invokeServer("GiveExp", 1, "TTG")
    end)

    for i = 1, 20 do
        spawn(function()
            invokeServer("EventCollectableCollected", "PPG_ChemicalX_PowerpuffBubbles", i, false)
        end)
    end

    wait(0.3)

    -- Llamar a la función para cambiar la posición del jugador a cada Collision
    movePlayerToCollision()
end
