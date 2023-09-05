local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Parent = player.PlayerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.2, 0, 0.35, 0)
frame.Position = UDim2.new(0.4, 0, 0.3, 0)
frame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
frame.BorderSizePixel = 2
frame.BorderColor3 = Color3.new(0, 0, 0)
frame.Active = true
frame.Draggable = true
frame.Parent = gui

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0.1, 0)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.Parent = frame
titleLabel.Text = "ID de Música"
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.BackgroundTransparency = 1
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.TextSize = 16
titleLabel.TextStrokeTransparency = 0.5

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0.1, 0, 0.1, 0)
closeButton.Position = UDim2.new(0.9, 0, 0, 0)
closeButton.Parent = frame
closeButton.BackgroundColor3 = Color3.new(1, 0, 0)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.TextSize = 16
closeButton.AutoButtonColor = false

local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(0.9, 0, 0.15, 0)
textBox.Position = UDim2.new(0.05, 0, 0.2, 0)
textBox.Parent = frame
textBox.PlaceholderText = "ID de música"
textBox.Font = Enum.Font.SourceSans
textBox.TextSize = 16

local button = Instance.new("TextButton")
button.Size = UDim2.new(0.6, 0, 0.15, 0)
button.Position = UDim2.new(0.2, 0, 0.4, 0)
button.Parent = frame
button.BackgroundColor3 = Color3.new(0, 0.5, 0)
button.Text = "Reproducir"
button.TextColor3 = Color3.new(1, 1, 1)
button.TextSize = 16

local confirmButton = Instance.new("TextButton")
confirmButton.Size = UDim2.new(0.6, 0, 0.15, 0)
confirmButton.Position = UDim2.new(0.2, 0, 0.6, 0)
confirmButton.Parent = frame
confirmButton.BackgroundColor3 = Color3.new(0, 0.5, 0)
confirmButton.Text = "Confirmar Envío"
confirmButton.TextColor3 = Color3.new(1, 1, 1)
confirmButton.TextSize = 16
confirmButton.Visible = false

local audio = nil
local currentID = nil

local function createNotification(message, color)
    local notification = Instance.new("TextLabel")
    notification.Size = UDim2.new(0.6, 0, 0.1, 0)
    notification.Position = UDim2.new(0.2, 0, 0.8, 0)
    notification.Parent = frame
    notification.Text = message
    notification.TextColor3 = color
    notification.BackgroundTransparency = 0.5
    notification.Font = Enum.Font.SourceSansBold
    notification.TextSize = 16
    notification.TextStrokeTransparency = 0.5
    wait(5)
    notification:Destroy()
end

local function playAudio(musicID)
    if audio then
        audio:Stop()
        audio:Destroy()
    end

    audio = Instance.new("Sound")
    audio.Parent = game.Workspace
    audio.SoundId = "rbxassetid://" .. musicID
    audio.Looped = false
    audio.Volume = 10

    audio:Play()
    wait(5)
    audio:Stop()
end

local function sendMusicID(musicID)
    local args = { musicID }
    game:GetService("ReplicatedStorage"):WaitForChild("MusicEvents"):WaitForChild("RequestSong"):FireServer(unpack(args))
    textBox.Text = ""
    createNotification("Música enviada con éxito", Color3.new(0, 1, 0))
end

local function handleButton()
    local musicID = tonumber(textBox.Text)
    if musicID then
        if currentID == musicID then
            playAudio(musicID)
            button.Text = "Reproducir de Nuevo"
            confirmButton.Visible = true
        else
            button.Text = "Reproducir"
            confirmButton.Visible = false
        end
        currentID = musicID
    else
        createNotification("ID de música inválido", Color3.new(1, 0, 0))
    end
end

button.MouseButton1Click:Connect(handleButton)

confirmButton.MouseButton1Click:Connect(function()
    local musicID = tonumber(textBox.Text)
    if musicID then
        sendMusicID(musicID)
        button.Text = "Reproducir"
        confirmButton.Visible = false
    end
end)

closeButton.MouseButton1Click:Connect(function()
    if audio then
        audio:Stop()
        audio:Destroy()
    end
    gui:Destroy()
end)
