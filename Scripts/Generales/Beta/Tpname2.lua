-- Crear un ScreenGui
local gui = Instance.new("ScreenGui")
gui.Parent = game.Players.LocalPlayer.PlayerGui

-- Crear un Frame para el fondo y el área de arrastre
local frameBackground = Instance.new("Frame")
frameBackground.Size = UDim2.new(0, 200, 0, 120)
frameBackground.Position = UDim2.new(0.5, -100, 0.3, -60) -- Ajustar la posición
frameBackground.BackgroundTransparency = 0.7
frameBackground.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Fondo negro
frameBackground.BorderSizePixel = 0
frameBackground.Active = true
frameBackground.Draggable = true
frameBackground.Parent = gui

-- Crear un título para el Frame
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.Font = Enum.Font.SourceSansBold
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 16
title.Text = "TP Name Height | Name"
title.TextXAlignment = Enum.TextXAlignment.Center
title.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Fondo negro para el título
title.Parent = frameBackground

-- Crear un TextBox para la altura
local textBoxHeight = Instance.new("TextBox")
textBoxHeight.Size = UDim2.new(0, 180, 0, 20)
textBoxHeight.Position = UDim2.new(0.5, -90, 0.3, -10) -- Ajustar la posición
textBoxHeight.Font = Enum.Font.SourceSans
textBoxHeight.TextColor3 = Color3.fromRGB(255, 255, 255) -- Texto blanco
textBoxHeight.TextSize = 14
textBoxHeight.PlaceholderText = ""
textBoxHeight.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Fondo negro para el TextBox
textBoxHeight.Parent = frameBackground

-- Crear un TextBox para el nombre del jugador
local textBoxPlayerName = Instance.new("TextBox")
textBoxPlayerName.Size = UDim2.new(0, 180, 0, 20)
textBoxPlayerName.Position = UDim2.new(0.5, -90, 0.5, -10) -- Ajustar la posición
textBoxPlayerName.Font = Enum.Font.SourceSans
textBoxPlayerName.TextColor3 = Color3.fromRGB(255, 255, 255) -- Texto blanco
textBoxPlayerName.TextSize = 14
textBoxPlayerName.PlaceholderText = ""
textBoxPlayerName.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Fondo negro para el TextBox
textBoxPlayerName.Parent = frameBackground

-- Crear un botón para teletransportarse
local buttonTeleport = Instance.new("TextButton")
buttonTeleport.Size = UDim2.new(0, 100, 0, 30)
buttonTeleport.Position = UDim2.new(0.5, -50, 0.8, -15) -- Ajustar la posición
buttonTeleport.Font = Enum.Font.SourceSansBold
buttonTeleport.TextColor3 = Color3.fromRGB(255, 255, 255) -- Texto blanco
buttonTeleport.TextSize = 14
buttonTeleport.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Fondo negro para el botón
buttonTeleport.Text = "Teleport"
buttonTeleport.Parent = frameBackground

-- Crear un botón para cerrar el script
local buttonClose = Instance.new("TextButton")
buttonClose.Size = UDim2.new(0, 20, 0, 20)
buttonClose.Position = UDim2.new(1, -25, 0, 5) -- Esquina superior derecha
buttonClose.Font = Enum.Font.SourceSansBold
buttonClose.TextColor3 = Color3.fromRGB(255, 255, 255) -- Texto blanco
buttonClose.TextSize = 14
buttonClose.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- Fondo negro para el botón de cerrar
buttonClose.Text = "X"
buttonClose.Parent = frameBackground

-- Cerrar el script cuando se hace clic en el botón de cerrar
buttonClose.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

-- Variable para almacenar la altura ingresada
local heightModifier

-- Función para buscar y teletransportarse
local function teleportToPlayer(playerName)
    -- Recorrer todos los jugadores en el juego
    for _, player in ipairs(game.Players:GetPlayers()) do
        -- Comprobar si el nombre del jugador coincide con la pista proporcionada
        if string.sub(player.Name, 1, string.len(playerName)) == playerName then
            -- Calcular la altura ajustada según el contenido del TextBox de altura
            local height = tonumber(heightModifier) or 0
            if heightModifier and heightModifier ~= "" then
                local sign = heightModifier:sub(1, 1)
                if sign == "-" then
                    height = -tonumber(heightModifier:sub(2)) or 0
                else
                    height = tonumber(heightModifier) or 0
                end
            end

            -- Teletransportar al jugador local al jugador encontrado con la altura ajustada
            local rootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
            rootPart.CFrame = CFrame.new(player.Character.HumanoidRootPart.Position.X,
                                         player.Character.HumanoidRootPart.Position.Y + height,
                                         player.Character.HumanoidRootPart.Position.Z)
            break
        end
    end

    -- Limpiar el contenido del TextBox de altura después del teletransporte
    textBoxHeight.Text = ""
    heightModifier = nil
end

-- Evento para detectar cambios en el TextBox de altura
textBoxHeight.Changed:Connect(function(property)
    -- Verificar si el cambio ocurrió en el texto
    if property == "Text" then
        heightModifier = textBoxHeight.Text
    end
end)

-- Evento para detectar cuando el jugador hace clic en el botón de teletransportarse
buttonTeleport.MouseButton1Click:Connect(function()
    local playerName = textBoxPlayerName.Text
    -- Eliminar los espacios en blanco al inicio y al final del texto
    playerName = string.gsub(playerName, "^%s*(.-)%s*$", "%1")

    -- Verificar si el nombre no está vacío
    if playerName ~= "" then
        -- Teletransportar al jugador usando el nombre ingresado
        teleportToPlayer(playerName)
    end
end)
