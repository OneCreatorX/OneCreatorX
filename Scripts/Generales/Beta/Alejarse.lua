local JugadorLocal = game.Players.LocalPlayer
local HumanoidRootPart = JugadorLocal.Character and JugadorLocal.Character:WaitForChild("HumanoidRootPart")

local INTERVALO_COMPROBACION = 0.1 -- Intervalo de tiempo en segundos para realizar el cálculo de alejamiento
local TIEMPO_ULTIMA_COMPROBACION = 0
local comprobadorActivo = false -- El botón estará desactivado por defecto

local function CalcularNuevaPosicion(jugador)
    if not comprobadorActivo then return end -- Si el comprobador no está activo, no realizar la comprobación

    local PosicionLocal = HumanoidRootPart and HumanoidRootPart.Position
    local PosicionJugador = jugador.Character and jugador.Character:WaitForChild("HumanoidRootPart").Position

    if PosicionLocal and PosicionJugador then
        local Distancia = (PosicionJugador - PosicionLocal).Magnitude

        if Distancia <= 7 then
            local Direccion = (PosicionLocal - PosicionJugador).Unit
            local NuevaPosicion = PosicionLocal + Direccion * 5
            HumanoidRootPart.CFrame = CFrame.new(NuevaPosicion)
        end
    end
end

game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        if player ~= JugadorLocal then -- Solo verifica otros jugadores, no al propio jugador local.
            CalcularNuevaPosicion(player)
        end
    end)
end)

game:GetService("RunService").Heartbeat:Connect(function()
    if tick() - TIEMPO_ULTIMA_COMPROBACION >= INTERVALO_COMPROBACION then
        TIEMPO_ULTIMA_COMPROBACION = tick()
        for _, jugador in ipairs(game.Players:GetPlayers()) do
            if jugador ~= JugadorLocal then
                CalcularNuevaPosicion(jugador)
            end
        end
    end
end)

local gui = Instance.new("ScreenGui")
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 100, 0, 50) -- Tamaño más pequeño
mainFrame.Position = UDim2.new(1, -110, 1, -70) -- Posición ajustada
mainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
mainFrame.BackgroundTransparency = 0.5
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true -- Permite arrastrar la interfaz
mainFrame.Parent = gui

local closeButton = Instance.new("TextButton")
closeButton.Text = "x"
closeButton.Size = UDim2.new(0, 20, 0, 20)
closeButton.Position = UDim2.new(1, -25, 0, 5) -- Sobrepuesto en la esquina
closeButton.BackgroundTransparency = 1 -- Sin fondo
closeButton.Font = Enum.Font.SourceSansBold
closeButton.TextColor3 = Color3.fromRGB(255, 0, 0) -- Rojo para indicar cerrar
closeButton.TextSize = 18
closeButton.Parent = mainFrame

local toggleButton = Instance.new("TextButton")
toggleButton.Text = "Alejarse"
toggleButton.Size = UDim2.new(0, 80, 0, 25) -- Tamaño más pequeño
toggleButton.Position = UDim2.new(0, 10, 0, 20) -- Posición ajustada
toggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Rojo para indicar desactivado por defecto
toggleButton.Parent = mainFrame

local function cambiarEstadoComprobador()
    comprobadorActivo = not comprobadorActivo
    if comprobadorActivo then
        toggleButton.Text = "Alejandose"
        toggleButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Verde para indicar activado
    else
        toggleButton.Text = "Alejarse"
        toggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Rojo para indicar desactivado
    end
end

local function destruirGUI()
    gui:Destroy()
end

toggleButton.MouseButton1Click:Connect(cambiarEstadoComprobador)
closeButton.MouseButton1Click:Connect(destruirGUI)
