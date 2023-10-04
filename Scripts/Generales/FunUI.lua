-- Obtén el ID del juego en tiempo real
local gameID = game.GameId

-- Formato correcto para el archivo "Links.lua":
-- "Nombre del Juego:Nombre del Archivo:ID del Juego"
-- Ejemplo:
-- "Mi Juego:archivo:8310127828"

local linkURL = "https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/UIs/FunUI/Links.lua"
local response = game:HttpGet(linkURL)

for line in response:gmatch("[^\r\n]+") do
    local name, filename, id = line:match("([^:]+):([^:]+):([^:]+)")

    if name and filename and id and tonumber(id) == gameID then
        local button = Instance.new("TextButton")
        button.Name = name
        button.Size = UDim2.new(0, 100, 0, 30)
        button.Position = UDim2.new(0.5, -50, 0, 50)
        button.Text = "Play " .. name
        button.Parent = game.Players.LocalPlayer.PlayerGui

        button.MouseButton1Click:Connect(function()
            local scriptUrl = "https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/Games/Fun/" .. filename .. ".lua"
            loadstring(game:HttpGet(scriptUrl))()
        end)
    end
end
