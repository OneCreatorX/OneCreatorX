-- Crear la GUI flotante

local gui = Instance.new("ScreenGui")

gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")

frame.Size = UDim2.new(0, 200, 0, 140)

frame.Position = UDim2.new(0, 10, 0.5, -70)

frame.BackgroundColor3 = Color3.new(1, 1, 1)

frame.BackgroundTransparency = 0.5

frame.BorderSizePixel = 0

frame.Active = true

frame.Draggable = true

frame.Parent = gui

-- Botón para cerrar el menú

local closeButton = Instance.new("TextButton")

closeButton.Size = UDim2.new(0, 20, 0, 20)

closeButton.Position = UDim2.new(1, -20, 0, 0)

closeButton.Text = "X"

closeButton.TextColor3 = Color3.new(1, 1, 1)

closeButton.BackgroundColor3 = Color3.new(1, 0, 0)

closeButton.Parent = frame

-- Función para cerrar el menú

local function closeMenu()

    gui:Destroy()

end

-- Conectar el evento del botón de cerrar

closeButton.MouseButton1Click:Connect(closeMenu)

-- Crear los elementos de la GUI

local usernameLabel = Instance.new("TextLabel")

usernameLabel.Size = UDim2.new(0, 180, 0, 20)

usernameLabel.Position = UDim2.new(0, 10, 0, 10)

usernameLabel.BackgroundTransparency = 1

usernameLabel.Text = "Nombre de usuario:"

usernameLabel.TextColor3 = Color3.new(0, 0, 0)

usernameLabel.TextSize = 14

usernameLabel.Parent = frame

local usernameTextBox = Instance.new("TextBox")

usernameTextBox.Size = UDim2.new(0, 180, 0, 20)

usernameTextBox.Position = UDim2.new(0, 10, 0, 30)

usernameTextBox.Text = ""

usernameTextBox.Parent = frame

local valueLabel = Instance.new("TextLabel")

valueLabel.Size = UDim2.new(0, 180, 0, 20)

valueLabel.Position = UDim2.new(0, 10, 0, 55)

valueLabel.BackgroundTransparency = 1

valueLabel.Text = "Valor a reemplazar:"

valueLabel.TextColor3 = Color3.new(0, 0, 0)

valueLabel.TextSize = 14

valueLabel.Parent = frame

local valueTextBox = Instance.new("TextBox")

valueTextBox.Size = UDim2.new(0, 180, 0, 20)

valueTextBox.Position = UDim2.new(0, 10, 0, 75)

valueTextBox.Text = ""

valueTextBox.Parent = frame

local executeButton = Instance.new("TextButton")

executeButton.Size = UDim2.new(0, 80, 0, 30)

executeButton.Position = UDim2.new(0.5, -40, 0, 110)

executeButton.Text = "Ejecutar"

executeButton.TextColor3 = Color3.new(1, 1, 1)

executeButton.BackgroundColor3 = Color3.new(0, 0, 1)

executeButton.Parent = frame

-- Función para ejecutar el código

local function executeCode()

    -- Obtener los valores de los cuadros de texto

    local username = usernameTextBox.Text

    local value = valueTextBox.Text

    -- Obtener la posición del jugador y restar 4 a la altura

    local playerPosition = game.Players[username].Character.HumanoidRootPart.Position

    playerPosition = Vector3.new(playerPosition.X, playerPosition.Y - 4, playerPosition.Z)

    -- Reemplazar los valores en el código

    local code = [[

local args = {

    [1] = 8,

    [2] = ']] .. value .. [[',

    [3] = {

        ["WorldPosition"] = Vector3.new(]] .. playerPosition.X .. [[, ]] .. playerPosition.Y .. [[, ]] .. playerPosition.Z .. [[),

        ["NormalFace"] = Vector3.new(0, 1, 0),

        ["FloorLevel"] = 1

    }

}

game:GetService("ReplicatedStorage"):WaitForChild("ConnectionEvent"):FireServer(unpack(args))

    ]]

    -- Ejecutar el código actualizado

    loadstring(code)()

end

-- Conectar el evento del botón de ejecutar

executeButton.MouseButton1Click:Connect(executeCode)

-- Mover el menú al lado izquierdo de la pantalla

frame.Position = UDim2.new(0, 10, 0.5, -70)

frame.AnchorPoint = Vector2.new(0, 0.5)

frame.Size = UDim2.new(0, 200, 0, 140)

-- Función para actualizar la posición al mover el menú

local function updatePosition()

    frame.Position = UDim2.new(0, 10, 0.5, -70)

end

frame.Changed:Connect(updatePosition)
