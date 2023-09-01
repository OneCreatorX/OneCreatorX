local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")

local rotationSpeed = math.rad(360)  -- Velocidad de rotación en radianes por segundo (360 grados en radianes)
local isRotating = false

local function startRotation()
    isRotating = true
    while isRotating do
        local deltaTime = RunService.RenderStepped:Wait()
        local rotation = CFrame.Angles(0, rotationSpeed * deltaTime, 0)
        Character.HumanoidRootPart.CFrame = Character.HumanoidRootPart.CFrame * rotation
    end
end

local function stopRotation()
    isRotating = false
end

local function increaseSpeed()
    rotationSpeed = rotationSpeed * 1.5
end

local function decreaseSpeed()
    rotationSpeed = rotationSpeed * 0.5
end

-- Crear un ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "RotationGui"
ScreenGui.Parent = LocalPlayer.PlayerGui

-- Crear un Frame draggable dentro del ScreenGui
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 80)
frame.Position = UDim2.new(0.5, -100, 0, 10)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BackgroundTransparency = 0.7
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = ScreenGui

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
mainButton.MouseButton1Click:Connect(function()
    if isRotating then
        stopRotation()
    else
        startRotation()
    end
end)

closeButton.MouseButton1Click:Connect(function()
    stopRotation()
    ScreenGui:Destroy()
end)

increaseSpeedButton.MouseButton1Click:Connect(increaseSpeed)

decreaseSpeedButton.MouseButton1Click:Connect(decreaseSpeed)

