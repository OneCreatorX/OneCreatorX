-- Crear un ScreenGui para la interfaz gráfica
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "GameInterface"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Crear un marco principal para la interfaz
local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 250, 0, 150)
mainFrame.Position = UDim2.new(0.5, -125, 0, 20)
mainFrame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
mainFrame.BorderSizePixel = 2
mainFrame.BorderColor3 = Color3.new(1, 1, 1)
mainFrame.Active = true -- Hacer el marco interactivo para arrastrar
mainFrame.Draggable = true -- Hacer que el marco sea arrastrable
mainFrame.Parent = screenGui

-- Crear un título dentro del marco principal
local titleLabel = Instance.new("TextLabel")
titleLabel.Text = "Cartoon Network Game On"
titleLabel.TextSize = 20
titleLabel.Size = UDim2.new(1, 0, 0.2, 0)
titleLabel.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.Parent = mainFrame

-- Crear un marco para la información adicional
local infoFrame = Instance.new("Frame")
infoFrame.Size = UDim2.new(1, 0, 0.6, 0)
infoFrame.Position = UDim2.new(0, 0, 0.2, 0)
infoFrame.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
infoFrame.Parent = mainFrame

-- Crear un texto para la información adicional
local infoLabel = Instance.new("TextLabel")
infoLabel.Text = "Auto collect All - UGC\nYT: OneCreatorX"
infoLabel.TextSize = 16
infoLabel.Size = UDim2.new(1, 0, 1, 0)
infoLabel.TextColor3 = Color3.new(1, 1, 1)
infoLabel.Parent = infoFrame

-- Sobresalir la interfaz gráfica
mainFrame.Position = UDim2.new(0.5, -125, 0, -75)

-- Restaurar la posición cuando se inicia el juego
game.Players.LocalPlayer.CharacterAdded:Connect(function()
    mainFrame.Position = UDim2.new(0.5, -125, 0, 20)
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

    for i = 1, 20 do
        spawn(function()
            local args = {
                "PowerpuffBubbles",
                "HeartsCollected",
                i,
                true
            }
            invokeServer("UgcEventProgressSet", unpack(args))
        end)
    end
end
