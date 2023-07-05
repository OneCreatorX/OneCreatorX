-- Crea el ScreenGUI y el contador
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "CountdownGUI"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local TextLabel = Instance.new("TextLabel")
TextLabel.Name = "CountdownLabel"
TextLabel.Size = UDim2.new(0, 200, 0, 100)
TextLabel.Position = UDim2.new(0.5, -100, 0.5, -50)
TextLabel.BackgroundTransparency = 1
TextLabel.TextColor3 = Color3.new(1, 1, 1)
TextLabel.TextScaled = true
TextLabel.Parent = ScreenGui

-- Función para actualizar el contador en pantalla
local function UpdateCountdown(seconds)
    TextLabel.Text = tostring(seconds)
end

-- Inicia el bucle hasta que se alcancen los 5 segundos
local startTime = os.time()
while os.time() - startTime < 5 do
    -- Genera el evento cada vez que se ejecuta el bucle
    game:GetService("ReplicatedStorage").ConnectionEvent:FireServer({
        ["Toppings"] = {2, 3, 4, 6, 5, 8, 7},
        ["Sauce"] = 1
    })
    
    -- Actualiza el contador en pantalla
    UpdateCountdown(5 - (os.time() - startTime))
    
    -- Espera 1 segundo antes de la siguiente iteración
    wait(1)
end

-- Limpia el ScreenGUI después de los 5 segundos
ScreenGui:Destroy()

