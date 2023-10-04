-- Obtén el ID del juego en tiempo real
local gameID = game.GameId

-- Formato correcto para el archivo "Links.lua":
-- "Nombre del Juego:Nombre del Archivo:ID del Juego"
-- Ejemplo:
-- "Mi Juego:archivo:8310127828"

local linkURL = "https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/UIs/FunUI/Links.lua"
local response = game:HttpGet(linkURL)

-- Crea una nueva instancia de ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "GameButtons"
screenGui.ResetOnSpawn = false
screenGui.Parent = game.Players.LocalPlayer.PlayerGui

-- Variable para controlar la posición vertical de los botones
local yOffset = 0
local resultsCount = 0 -- Contador de resultados encontrados

for line in response:gmatch("[^\r\n]+") do
    local name, filename, id = line:match("([^:]+):([^:]+):([^:]+)")

    if name and filename and id and tonumber(id) == gameID then
        resultsCount = resultsCount + 1

        local button = Instance.new("TextButton")
        button.Name = name
        button.Size = UDim2.new(0, 100, 0, 30)
        button.Position = UDim2.new(0.5, -50, 0, 50 + yOffset)
        button.Text = "Play " .. name
        button.Parent = screenGui

        yOffset = yOffset + 40

        button.MouseButton1Click:Connect(function()
            local scriptUrl = "https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/Games/Fun/" .. filename .. ".lua"
            loadstring(game:HttpGet(scriptUrl))()
        end)
    end
end

-- Agregar notificación de resultados
local notification = Instance.new("TextLabel")
notification.Name = "ResultsNotification"
notification.Size = UDim2.new(0, 200, 0, 30)
notification.Position = UDim2.new(0.5, -100, 0, 10)
notification.Text = ""
notification.Parent = screenGui

-- Agregar notificación de resultados
if resultsCount > 0 then
    notification.Text = "Se encontraron " .. resultsCount .. " resultado(s) para este juego."
else
    notification.Text = "No se encontraron scripts para este juego."
end

-- Agregar notificación de resultados
wait(3)
notification:Destroy() -- Eliminar la notificación después de 3 segundos

-- Depuración: Imprimir el número de resultados encontrados
print("Resultados encontrados:", resultsCount)
