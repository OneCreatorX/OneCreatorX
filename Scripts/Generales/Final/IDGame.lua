-- Crear un ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "GameIDGui" -- Puedes cambiar el nombre según tus necesidades
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui") -- Esto lo coloca en el PlayerGui

-- Crear un TextBox dentro del ScreenGui
local textBox = Instance.new("TextBox")
textBox.Name = "GameIDTextBox" -- Cambia el nombre según tus necesidades
textBox.Size = UDim2.new(0, 200, 0, 30) -- Tamaño del TextBox
textBox.Position = UDim2.new(0.5, -100, 0.5, -15) -- Posición en el centro de la pantalla
textBox.Parent = screenGui
textBox.Text = "" -- Inicialmente, el texto estará vacío

-- Obtener el ID del juego
local gameID = game.GameId

-- Establecer el texto del TextBox con el ID del juego
textBox.Text = "ID del juego actual: " .. tostring(gameID)
