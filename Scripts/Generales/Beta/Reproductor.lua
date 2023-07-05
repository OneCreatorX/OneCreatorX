local player = game.Players.LocalPlayer

-- Crea un servicio de sonido
local soundService = game:GetService("SoundService")

-- Crea una pantalla GUI
local gui = Instance.new("ScreenGui")
gui.Parent = player.PlayerGui

-- Crea un marco para mostrar la lista de música
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 200)
frame.Position = UDim2.new(0.5, -100, 0.5, -100)
frame.BackgroundTransparency = 0.5
frame.BackgroundColor3 = Color3.new(0, 0, 0)
frame.BorderSizePixel = 0
frame.Visible = false -- Inicialmente oculto
frame.Parent = gui

-- Crea un cuadro de texto para ingresar el nombre de la música
local nameTextBox = Instance.new("TextBox")
nameTextBox.Size = UDim2.new(0, 150, 0, 20)
nameTextBox.Position = UDim2.new(0, 25, 0, 25)
nameTextBox.Text = "Nombre de música"
nameTextBox.Visible = false -- Inicialmente oculto
nameTextBox.Parent = frame

-- Crea un cuadro de texto para ingresar el ID de la música
local idTextBox = Instance.new("TextBox")
idTextBox.Size = UDim2.new(0, 150, 0, 20)
idTextBox.Position = UDim2.new(0, 25, 0, 50)
idTextBox.Text = "ID de música"
idTextBox.Visible = false -- Inicialmente oculto
idTextBox.Parent = frame

-- Crea un botón para agregar la música
local addButton = Instance.new("TextButton")
addButton.Size = UDim2.new(0, 150, 0, 30)
addButton.Position = UDim2.new(0,25, 0, 80)
addButton.Text = "Agregar música Temporal"
addButton.Visible = false -- Inicialmente oculto
addButton.Parent = frame

-- Crea una lista para mostrar las canciones agregadas
local musicList = Instance.new("ScrollingFrame")
musicList.Size = UDim2.new(0, 180, 0, 100)
musicList.Position = UDim2.new(0, 10, 0, 120)
musicList.BackgroundTransparency = 0.5
musicList.BackgroundColor3 = Color3.new(1, 1, 1)
musicList.BorderSizePixel = 0
musicList.ScrollBarThickness = 5
musicList.Visible = false -- Inicialmente oculto
musicList.Parent = frame

-- Variable para almacenar la canción actual
local currentMusic = nil

-- Función para reproducir una canción
local function playSong(soundId)
    if currentMusic then
        currentMusic:Stop() -- Detener la canción actual antes de reproducir una nueva
        currentMusic = nil
    end

    local music = soundService:FindFirstChild(soundId)
    if not music then
        music = Instance.new("Sound")
        music.SoundId = "rbxassetid://" .. soundId
        music.Parent = soundService
    end

    music.Volume = 10 -- Ajustar el volumen de la música
    music:Play()

    currentMusic = music
end

-- Función para agregar una canción a la lista
local function addSong(soundId, songName)
    local songButton = Instance.new("TextButton")
    songButton.Size = UDim2.new(0, 160, 0, 20)
    songButton.Position = UDim2.new(0, 10, 0, #musicList:GetChildren() * 25)
    songButton.Text = songName
    songButton.Parent = musicList

    songButton.MouseButton1Click:Connect(function()
        playSong(soundId)
    end)
end

-- Función para ocultar la interfaz
local function hideUI()
    frame.Visible = false
    nameTextBox.Visible = false
    idTextBox.Visible = false
    addButton.Visible = false
    musicList.Visible = false
end

-- Función para mostrar la interfaz
local function showUI()
    frame.Visible = true
    nameTextBox.Visible = true
    idTextBox.Visible = true
    addButton.Visible = true
    musicList.Visible = true
end

-- Ocultar la interfaz al iniciar
hideUI()

-- Crear un botón para ocultar/mostrar la interfaz
local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(0, 100, 0, 30)
toggleButton.Position = UDim2.new(0.5, -50, 0, 10)
toggleButton.Text = "Mostrar UI"
toggleButton.Parent = gui

toggleButton.MouseButton1Click:Connect(function()
    if frame.Visible then
        hideUI()
        toggleButton.Text = "Mostrar UI"
    else
        showUI()
        toggleButton.Text = "Ocultar UI"
    end
end)

-- Conexión del botón de agregar música
addButton.MouseButton1Click:Connect(function()
    local songName = nameTextBox.Text
    local songId = tonumber(idTextBox.Text)

    if songName ~= "" and songId then
        addSong(songId, songName)
    end
end)

-- Canciones predefinidas
local defaultSongs = {
    {SoundId = 7023785633, SongName = "Music1"},
    {SoundId = 728913008, SongName = "Music2"},
    {SoundId = 1841231508, SongName = "Music3"}
}

-- Agregar canciones predefinidas a la lista
for _, songData in ipairs(defaultSongs) do
    addSong(songData.SoundId, songData.SongName)
end

