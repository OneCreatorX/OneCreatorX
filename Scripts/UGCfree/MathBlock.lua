-- Crear un ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer.PlayerGui

-- Estilo común para las etiquetas de texto
local estiloTexto = Enum.Font.Gotham
local colorTexto = Color3.new(1, 1, 1) -- Color blanco

-- Etiqueta de texto en el centro
local textoCentro = Instance.new("TextLabel")
textoCentro.Size = UDim2.new(0, 300, 0, 200)
textoCentro.Position = UDim2.new(0.5, -150, 0.5, -100)
textoCentro.Text = "OneCreatorX Suscribe Ya XD"
textoCentro.TextScaled = true
textoCentro.Font = estiloTexto
textoCentro.TextColor3 = colorTexto
textoCentro.BackgroundTransparency = 1 -- Sin fondo
textoCentro.Parent = screenGui

-- Etiqueta de texto debajo
local textoDebajo = Instance.new("TextLabel")
textoDebajo.Size = UDim2.new(0, 200, 0, 50)
textoDebajo.Position = UDim2.new(0.5, -100, 0.8, -25)
textoDebajo.Text = "AntiAFK ON"
textoDebajo.TextScaled = true
textoDebajo.Font = estiloTexto
textoDebajo.TextColor3 = colorTexto
textoDebajo.BackgroundTransparency = 1 -- Sin fondo
textoDebajo.Parent = screenGui

local jugadorLocal = game.Players.LocalPlayer
local winPart = game.Workspace.Game.Win

local function moverHaciaJugador()
    if jugadorLocal and jugadorLocal.Character and jugadorLocal.Character:FindFirstChild("HumanoidRootPart") then
        winPart.CFrame = CFrame.new(jugadorLocal.Character.HumanoidRootPart.Position)
    end
end

while wait(0.2) do
    moverHaciaJugador()
end
