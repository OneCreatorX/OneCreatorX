-- Crear un ScreenGui
local gui = Instance.new("ScreenGui")
gui.Parent = game.Players.LocalPlayer.PlayerGui

-- Crear un TextBox
local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(0, 20, 0, 20)
textBox.Position = UDim2.new(0.35, -10, 0.3, -10) -- Cambiar los valores para ajustar la posición
textBox.FontSize = Enum.FontSize.Size10
textBox.Parent = gui

-- Función para buscar y teletransportarse
local function teleportToPlayer(playerName)
    -- Recorrer todos los jugadores en el juego
    for _, player in ipairs(game.Players:GetPlayers()) do
        -- Comprobar si el nombre del jugador coincide con la pista proporcionada
        if string.sub(player.Name, 1, string.len(playerName)) == playerName then
            -- Teletransportar al jugador local al jugador encontrado
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame
            break
        end
    end
end

-- Evento para detectar cambios en el TextBox
textBox.Changed:Connect(function(property)
    -- Verificar si el cambio ocurrió en el texto
    if property == "Text" then
        local playerName = textBox.Text
        -- Eliminar los espacios en blanco al inicio y al final del texto
        playerName = string.gsub(playerName, "^%s*(.-)%s*$", "%1")
        
        -- Verificar si el nombre no está vacío
        if playerName ~= "" then
            teleportToPlayer(playerName)
        end
    end
end)

