-- Coloca este script en un objeto en el servidor

-- Crear un ScreenGui
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

-- Crear un botón principal dentro del ScreenGui
local teleportButton = Instance.new("TextButton")
teleportButton.Name = "TP LocalPlayer to All"
teleportButton.Text = "TP LocalPlayer to All"
teleportButton.Size = UDim2.new(0, 100, 0, 25) -- Tamaño reducido del botón principal
teleportButton.Position = UDim2.new(0, 20, 0.5, -50) -- Posición ajustada al lado izquierdo y en la mitad de la altura
teleportButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215) -- Color de fondo del botón
teleportButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- Color del texto del botón
teleportButton.TextSize = 14 -- Tamaño del texto del botón
teleportButton.Font = Enum.Font.SourceSansBold -- Fuente del texto del botón
teleportButton.Parent = screenGui

-- Crear un mini botón rojo como hijo del botón principal
local destroyButton = Instance.new("TextButton")
destroyButton.Name = "DestroyButton"
destroyButton.Text = "X"
destroyButton.Size = UDim2.new(0, 20, 0, 20) -- Tamaño del mini botón rojo
destroyButton.Position = UDim2.new(1, -20, 0, 0) -- Posición en la esquina superior derecha del botón principal
destroyButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Color de fondo del mini botón rojo
destroyButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- Color del texto del mini botón rojo
destroyButton.TextSize = 14 -- Tamaño del texto del mini botón rojo
destroyButton.Font = Enum.Font.SourceSansBold -- Fuente del texto del mini botón rojo
destroyButton.Parent = teleportButton

-- Función para teletransportar al jugador local hacia cada jugador
local function teleportLocalPlayer()
    -- Obtén el jugador local
    local localPlayer = game:GetService("Players").LocalPlayer

    -- Obtén todos los jugadores en el servidor
    local players = game:GetService("Players"):GetPlayers()

    -- Teletransporta al jugador local hacia cada jugador con un intervalo de 0.01 segundos
    for i, player in ipairs(players) do
        -- Asegúrate de que el jugador tenga un personaje y no sea el jugador local
        if player.Character and player ~= localPlayer then
            wait(0.01 * i)
            localPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame
        end
    end
end

-- Función para destruir la interfaz al hacer clic en el mini botón rojo
local function destroyInterface()
    screenGui:Destroy()
end

-- Conectar la función de teletransportar al jugador local al evento MouseButton1Click del botón principal
teleportButton.MouseButton1Click:Connect(teleportLocalPlayer)

-- Conectar la función de destruir la interfaz al evento MouseButton1Click del mini botón rojo
destroyButton.MouseButton1Click:Connect(destroyInterface)
