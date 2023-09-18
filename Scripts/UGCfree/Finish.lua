local jugador = game.Players.LocalPlayer
local winnersArea = game.Workspace.WinnersArea
local objetoPartEnd = winnersArea:FindFirstChild("End") -- Asegúrate de que el nombre coincida exactamente con el objeto Part que deseas mover

-- Define la posición por defecto a la que el jugador y el objeto se moverán
local posicionPorDefecto = Vector3.new(-6.41502, -3.34972, -13.0958)

-- Define el tiempo inicial de la cuenta regresiva (6 horas en segundos)
local tiempoTotal = 6 * 60 * 60
local tiempoRestante = tiempoTotal

-- Función para mostrar el tiempo restante en formato hh:mm:ss
local function mostrarTiempoRestante()
    local horas = math.floor(tiempoRestante / 3600)
    local minutos = math.floor((tiempoRestante % 3600) / 60)
    local segundos = tiempoRestante % 60
    return string.format("%02d:%02d:%02d", horas, minutos, segundos)
end

-- Crear un ScreenGUI para mostrar la cuenta regresiva
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CountdownGUI"
screenGui.Parent = jugador.PlayerGui

local texto = Instance.new("TextLabel")
texto.Size = UDim2.new(0, 200, 0, 50)
texto.Position = UDim2.new(0.5, -100, 0, 10)
texto.Font = Enum.Font.SourceSansBold -- Cambio a una fuente más gruesa
texto.FontSize = Enum.FontSize.Size36 -- Aumento el tamaño del texto
texto.TextColor3 = Color3.new(1, 1, 1)
texto.TextStrokeTransparency = 0
texto.BackgroundTransparency = 1
texto.Text = "Tiempo restante: " .. mostrarTiempoRestante()
texto.Parent = screenGui

while true do
    -- Comprueba el valor de UGCWins del jugador y muestra la cantidad de Wins llevados
    local ugcWinsValue = jugador:FindFirstChild("Values"):FindFirstChild("UGCWins")
    if ugcWinsValue then
        local winsLlevados = ugcWinsValue.Value
        print("Wins llevados: " .. winsLlevados)
    end

    -- Actualiza la cuenta regresiva y muestra el tiempo restante
    tiempoRestante = tiempoRestante - 1
    texto.Text = "Tiempo restante: " .. mostrarTiempoRestante()

    -- Detén el script si el tiempo restante llega a 0
    if tiempoRestante <= 0 then
        script:Destroy()
    end

    -- Verifica si el objeto "End" existe y cambia su posición
    if objetoPartEnd then
        objetoPartEnd.Position = posicionPorDefecto
    end

    wait(1) -- Espera 1 segundo antes de repetir el proceso
end
