local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ProgressScreenGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = playerGui

local frame = Instance.new("Frame", screenGui)
frame.Size, frame.Position, frame.BackgroundColor3, frame.BorderSizePixel, frame.Draggable = UDim2.new(0.2, 0, 0.2, 0), UDim2.new(0.5, 0, 0.4, 0), Color3.new(0.2, 0.2, 0.2), 4, true

local progressLabel = Instance.new("TextLabel", frame)
progressLabel.Size, progressLabel.Position, progressLabel.Text, progressLabel.TextScaled, progressLabel.TextColor3 = UDim2.new(1, 0, 0.4, 0), UDim2.new(0, 0, 0, 0), "Progreso restante: ", true, Color3.new(1, 0.7, 0)

progressLabel.BackgroundTransparency = 1

local timeLabel = Instance.new("TextLabel", frame)
timeLabel.Size, timeLabel.Position, timeLabel.Text, timeLabel.TextScaled, timeLabel.TextColor3 = UDim2.new(1, 0, 0.4, 0), UDim2.new(0, 0, 0.4, 0), "Tiempo estimado: ", true, Color3.new(0.7, 0.7, 1)

 hacer el fondo del texto transparente
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

while wait(1) do
    parseValue(getValue(path))
    counter = counter + 1

    if counter % 5 == 0 and #intervals > 1 then
        local initialProgress, finalProgress = intervals[1].progressRemaining, intervals[#intervals].progressRemaining
        local progressRate = (initialProgress - finalProgress) / counter
        local estimatedTime = finalProgress / progressRate

        -- Ajuste en el cálculo del tiempo estimado
        local totalTime = estimatedTime * #intervals / counter

        updateGUI(finalProgress, string.format("%02d:%02d:%02d", totalTime / 3600, totalTime % 3600 / 60, totalTime % 60))

        counter, intervals = 0, {}
    end
end
