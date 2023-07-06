-- Crear ScreenGUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
workspace.CurrentCamera.CameraType = Enum.CameraType.Fixed

-- Crear Frame para los botones
local Frame = Instance.new("Frame")
Frame.Name = "ButtonFrame"
Frame.Size = UDim2.new(0, 200, 0, 300)
Frame.Position = UDim2.new(0.5, -100, 0.5, -150)
Frame.BackgroundTransparency = 0.5
Frame.BackgroundColor3 = Color3.new(0, 0, 0)
Frame.Parent = ScreenGui

-- Función para destruir el UI
local function DestroyUI()
    ScreenGui:Destroy()
end

-- Crear los 6 botones
for i = 1, 6 do
    local Button = Instance.new("TextButton")
    Button.Name = "Button" .. i
    Button.Size = UDim2.new(0, 180, 0, 40)
    Button.Position = UDim2.new(0.5, -90, 0, (i - 1) * 50)
    Button.BackgroundColor3 = Color3.new(1, 1, 1)
    Button.TextColor3 = Color3.new(0, 0, 0)
    Button.TextSize = 14
    Button.Text = "Posición " .. i
    Button.Parent = Frame

    -- Evento de clic para ejecutar el script y destruir el UI
    Button.MouseButton1Click:Connect(function()
        local scriptUrl = "https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/Games/Scripts/Simulator/CaffeeShop/Cafe" .. i .. ".lua"
        loadstring(game:HttpGet(scriptUrl))()
        DestroyUI()
    end)
end
