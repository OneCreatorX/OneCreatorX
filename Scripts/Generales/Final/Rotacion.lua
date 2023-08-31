local player = game.Players.LocalPlayer
local character = player.Character

local isRotating = false
local rotationSpeed = math.rad(360)  -- Velocidad de rotación en radianes por segundo (360 grados en radianes)

local function rotateCharacter()
    if not character or not character:FindFirstChild("Humanoid") then
        return
    end
    
    local humanoid = character:FindFirstChild("Humanoid")
    isRotating = true

    local startTime = tick()
    local startRotation = humanoid.RootPart.CFrame

    while isRotating do
        local elapsedTime = tick() - startTime

        humanoid.RootPart.CFrame = startRotation * CFrame.Angles(0, rotationSpeed * elapsedTime, 0)
        wait(0.02)
    end
end

local function stopRotation()
    isRotating = false
end

local function createDraggableFrame(position, size, parent)
    local frame = Instance.new("Frame")
    frame.Position = position
    frame.Size = size
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.BackgroundTransparency = 0.7
    frame.BorderSizePixel = 0
    frame.Active = true
    frame.Draggable = true
    frame.Parent = parent
    return frame
end

local function onCloseGUIClicked()
    stopRotation()
    local screenGui = player.PlayerGui:FindFirstChild("RotationGui")
    if screenGui then
        screenGui:Destroy()
    end
end

local function onButtonClicked()
    if not isRotating then
        rotateCharacter()
    else
        stopRotation()
    end
end

local function onIncreaseSpeedClicked()
    rotationSpeed = rotationSpeed * 1.5  -- Aumentar la velocidad en un 50%
end

local function onDecreaseSpeedClicked()
    rotationSpeed = rotationSpeed * 0.5  -- Disminuir la velocidad en un 50%
end

-- Crear un ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "RotationGui"
screenGui.Parent = player.PlayerGui

-- Crear un Frame draggable dentro del ScreenGui
local frame = createDraggableFrame(UDim2.new(0.5, -100, 0, 10), UDim2.new(0, 200, 0, 80), screenGui)

-- Crear botones dentro del Frame
local mainButton = Instance.new("TextButton")
mainButton.Text = "Girar"
mainButton.Size = UDim2.new(0.6, 0, 0, 30)
mainButton.Position = UDim2.new(0.2, 0, 0.1, 0)
mainButton.BackgroundColor3 = Color3.fromRGB(60, 180, 75)
mainButton.Parent = frame

local closeButton = Instance.new("TextButton")
closeButton.Text = "X"
closeButton.Size = UDim2.new(0, 20, 0, 20)
closeButton.Position = UDim2.new(1, -25, 0, 5)
closeButton.BackgroundColor3 = Color3.fromRGB(180, 60, 75)
closeButton.Parent = mainButton

local increaseSpeedButton = Instance.new("TextButton")
increaseSpeedButton.Text = "+"
increaseSpeedButton.Size = UDim2.new(0, 20, 0, 20)
increaseSpeedButton.Position = UDim2.new(0.5, 5, 0.6, 0)
increaseSpeedButton.BackgroundColor3 = Color3.fromRGB(100, 100, 180)
increaseSpeedButton.Parent = frame

local decreaseSpeedButton = Instance.new("TextButton")
decreaseSpeedButton.Text = "-"
decreaseSpeedButton.Size = UDim2.new(0, 20, 0, 20)
decreaseSpeedButton.Position = UDim2.new(0.5, -25, 0.6, 0)
decreaseSpeedButton.BackgroundColor3 = Color3.fromRGB(180, 100, 100)
decreaseSpeedButton.Parent = frame

-- Conexión de eventos
mainButton.MouseButton1Click:Connect(onButtonClicked)
closeButton.MouseButton1Click:Connect(onCloseGUIClicked)
increaseSpeedButton.MouseButton1Click:Connect(onIncreaseSpeedClicked)
decreaseSpeedButton.MouseButton1Click:Connect(onDecreaseSpeedClicked)
