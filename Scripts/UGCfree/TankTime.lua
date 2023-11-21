local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ProgressScreenGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

local frame = Instance.new("Frame", screenGui)
frame.Size, frame.Position, frame.BackgroundColor3, frame.BorderSizePixel, frame.Draggable = UDim2.new(0.2, 0, 0.2, 0), UDim2.new(0.5, 0, 0.4, 0), Color3.new(0.2, 0.2, 0.2), 4, true

local progressLabel = Instance.new("TextLabel", frame)
progressLabel.Size = UDim2.new(1, 0, 0.4, 0)
progressLabel.Position = UDim2.new(0, 0, 0, 0)
progressLabel.Text = "Progreso restante: "
progressLabel.TextScaled = true
progressLabel.TextColor3 = Color3.new(1, 0.7, 0)

-- Ajusta la propiedad BackgroundTransparency para hacer el fondo del texto transparente
progressLabel.BackgroundTransparency = 1

local timeLabel = Instance.new("TextLabel", frame)
timeLabel.Size = UDim2.new(1, 0, 0.4, 0)
timeLabel.Position = UDim2.new(0, 0, 0.4, 0)
timeLabel.Text = "Tiempo estimado: "
timeLabel.TextScaled = true
timeLabel.TextColor3 = Color3.new(0.7, 0.7, 1)

-- Ajusta la propiedad BackgroundTransparency para hacer el fondo del texto transparente
timeLabel.BackgroundTransparency = 1

frame.Draggable = true
frame.Active = true
local dragStart, startPos, offset

frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragStart = input.Position
        startPos = frame.Position
        offset = startPos - UDim2.new(0, dragStart.X, 0, dragStart.Y)
    end
end)

frame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        frame.Position = offset + UDim2.new(0, delta.X, 0, delta.Y)
    end
end)

local function updateGUI(progress, time)
    progressLabel.Text, timeLabel.Text = "Progreso restante: " .. progress, "Tiempo estimado: " .. time
end

local path = "PlayerGui.MainUI.UI_Group.RebirthFrame.Frames.AddPets.Bar.Rebirths"
local intervals = {}
local counter = 0

local function getValue(path)
    local current = game.Players.LocalPlayer
    for part in path:gmatch("[^%.]+") do
        current = current:FindFirstChild(part)
        if not current then
            warn("Error al acceder a la ruta:", path)
            return
        end
    end
    local value = current:IsA("TextLabel") and current.Text
    return value:match("%d+%.?%d*%a*/%d+%.?%d*%a*")
end

local function parseValue(value)
    local start, unit, finish, unitFinish = value:match("(%d+%.?%d*)(%a*)/(%d+%.?%d*)(%a*)")
    if start and finish then
        start, finish = tonumber(start) or 0, tonumber(finish) or 1
        local remainingProgress = finish - start
        table.insert(intervals, {progressRemaining = remainingProgress, time = os.time()})
    end
end

-- Inicializa una bandera para controlar si se ha registrado al menos un tiempo estimado
local hasLowestEstimatedTime = false

local function updateLowestEstimatedTimeGUI(timeString)
    progressLabel.Text = "Tiempo estimado más bajo: " .. timeString
end

local function updateGUI(progress, time)
    timeLabel.Text = "Tiempo estimado: " .. time
end

while wait(1) do
    parseValue(getValue(path))
    counter = counter + 1

    if counter % 10 == 0 and #intervals > 1 then
        local initialProgress, finalProgress = intervals[1].progressRemaining, intervals[#intervals].progressRemaining

        -- Asegurémonos de que haya habido un cambio de progreso antes de calcular el tiempo estimado
        if initialProgress ~= finalProgress then
            local progressRate = (initialProgress - finalProgress) / counter
            local estimatedTime = finalProgress / progressRate

            -- Ajuste en el cálculo del tiempo estimado
            local totalTime = estimatedTime * #intervals / counter

            -- Actualiza el tiempo estimado más bajo si es el primero o es más bajo que el registrado anteriormente
            if not hasLowestEstimatedTime or totalTime < lowestEstimatedTime then
                lowestEstimatedTime = totalTime
                hasLowestEstimatedTime = true

                -- Actualiza el GUI del tiempo estimado más bajo
                updateLowestEstimatedTimeGUI(string.format("%02d:%02d:%02d", lowestEstimatedTime / 3600, lowestEstimatedTime % 3600 / 60, lowestEstimatedTime % 60))
            end

            -- Actualiza el tiempo estimado
            updateGUI(finalProgress, string.format("%02d:%02d:%02d", totalTime / 3600, totalTime % 3600 / 60, totalTime % 60))
        else
            warn("No hay cambio de progreso en el último intervalo de tiempo. No se actualizó la estimación.")

            -- Comprueba si ha habido un renacimiento (valores de progreso y total han cambiado)
            local currentProgress, currentTotal = getValue(path):match("(%d+%.?%d*)(%a*)/(%d+%.?%d*)(%a*)")
            currentProgress, currentTotal = tonumber(currentProgress) or 0, tonumber(currentTotal) or 1

            if currentProgress < initialProgress and currentTotal > initialTotal then
                -- Ha habido un renacimiento, resetea el tiempo estimado más bajo
                lowestEstimatedTime = math.huge
                hasLowestEstimatedTime = false
            end
        end

        counter, intervals = 0, {}
    end
end
