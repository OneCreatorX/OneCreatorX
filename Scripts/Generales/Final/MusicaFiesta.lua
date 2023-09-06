-- Crear un ScreenGUI
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Parent = player.PlayerGui

-- Crear un Frame principal (fondo)
local background = Instance.new("Frame")
background.Size = UDim2.new(0.3, 0, 0.2, 0) -- Aumentar el tamaño de la interfaz
background.Position = UDim2.new(0.35, 0, 0.4, 0) -- Ajustar la posición
background.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
background.BorderSizePixel = 0
background.Active = true
background.Draggable = true
background.Parent = gui

-- Crear el directorio "MiMusica" en Workspace y una única instancia de Sound
local workspace = game:GetService("Workspace")
local musicFolder = workspace:FindFirstChild("MiMusica")
local sound = nil

if not musicFolder then
    musicFolder = Instance.new("Folder")
    musicFolder.Name = "MiMusica"
    musicFolder.Parent = workspace
end

if not sound then
    sound = Instance.new("Sound")
    sound.Parent = musicFolder
end

-- Crear un TextBox
local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(0.7, 0, 0.15, 0) -- Ajustar el tamaño del TextBox
textBox.Position = UDim2.new(0.15, 0, 0.25, 0) -- Ajustar la posición del TextBox
textBox.Parent = background

-- Crear un botón de cierre (X)
local buttonCerrar = Instance.new("TextButton")
buttonCerrar.Size = UDim2.new(0.05, 0, 0.05, 0)
buttonCerrar.Position = UDim2.new(0.9, 0, 0.05, 0)
buttonCerrar.Text = "X"
buttonCerrar.TextColor3 = Color3.new(1, 1, 1)
buttonCerrar.BackgroundColor3 = Color3.new(1, 0, 0)
buttonCerrar.BorderSizePixel = 0
buttonCerrar.Parent = background

-- Función para cambiar el fondo de color
local function cambiarColor(color)
    background.BackgroundColor3 = color
end

-- Función para cerrar la interfaz
local function cerrarInterfaz()
    gui:Destroy()
end

-- Conectar la función al botón de cierre
buttonCerrar.MouseButton1Click:Connect(cerrarInterfaz)

-- Función para verificar el ID y cargar la música
local function verificarID()
    local musicID = tonumber(textBox.Text)
    print("Verificando ID:", musicID)

    -- Escuchar el evento Loaded para saber cuándo se carga el sonido
    local loadedConnection
    loadedConnection = sound.Loaded:Connect(function()
        loadedConnection:Disconnect()
        print("Música cargada, fondo verde")

        print("Enviando ID al servidor...")

        local args = { musicID }
        game:GetService("ReplicatedStorage"):WaitForChild("MusicEvents"):WaitForChild("RequestSong"):FireServer(unpack(args))
        cambiarColor(Color3.new(0, 1, 0))

        print("ID enviado al servidor.")

        wait(3)
        cambiarColor(Color3.new(0.2, 0.2, 0.2))
    end)

    local loadSuccess, loadErrorMsg = pcall(function()
        sound.SoundId = "rbxassetid://" .. musicID
        sound:LoadAsync()
    end)

    if not loadSuccess then
        cambiarColor(Color3.new(1, 0, 0))
        print("Error al cargar la música:", loadErrorMsg)
        wait(2)
        cambiarColor(Color3.new(0.2, 0.2, 0.2))
    end
end

-- Conectar la función al botón
local button = Instance.new("TextButton")
button.Size = UDim2.new(0.4, 0, 0.15, 0) -- Aumentar el tamaño del botón
button.Position = UDim2.new(0.3, 0, 0.55, 0) -- Ajustar la posición del botón
button.Text = "Enviar ID"
button.Parent = background
button.MouseButton1Click:Connect(verificarID)
