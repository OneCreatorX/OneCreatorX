local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")

local userInputService = game:GetService("UserInputService")

local function ShowNegativeValueTextBox()
    -- Crear una instancia de la clase TextBox
    local textBox = Instance.new("TextBox")
    textBox.Size = UDim2.new(0, 200, 0, 30) -- Establecer el tamaño del cuadro de texto
    textBox.Position = UDim2.new(0.5, -100, 0.5, -15) -- Establecer la posición del cuadro de texto
    textBox.AnchorPoint = Vector2.new(0.5, 0.5) -- Establecer el punto de anclaje en el centro
    textBox.FontSize = Enum.FontSize.Size14 -- Establecer el tamaño de fuente
    textBox.ClearTextOnFocus = true -- Borrar el texto cuando se hace clic en el cuadro de texto
    textBox.PlaceholderText = "Ingresa un valor negativo" -- Establecer el texto de marcador de posición
    textBox.Parent = LocalPlayer.PlayerGui

    -- Función para verificar el valor negativo y realizar la teletransportación si es necesario
    local function checkNegativeValue()
        local value = tonumber(textBox.Text)
        if value and value < 0 then
            local currentPosition = Character.PrimaryPart.Position
            local playerHeight = Character:GetExtentsSize().Y
            local dangerZone = currentPosition.Y + playerHeight + value

            -- Conectar el evento StateChanged para verificar la caída del jugador en la zona de peligro
            local function onStateChanged(old, new)
                if new == Enum.HumanoidStateType.Freefall and old ~= Enum.HumanoidStateType.Jumping and Character.PrimaryPart.Position.Y <= dangerZone then
                    -- Teletransportar al jugador a la posición guardada
                    Character:SetPrimaryPartCFrame(CFrame.new(currentPosition))
                    print("Teleportado a la posición guardada")
                end
            end

            Humanoid.StateChanged:Connect(onStateChanged)
        end

        textBox:Destroy()
    end

    -- Enfocar el cuadro de texto
    userInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide
    userInputService.MouseIconEnabled = false
    textBox:CaptureFocus()
    userInputService.MouseIconEnabled = true
    userInputService.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None

    -- Conectar el evento FocusLost para verificar el valor negativo
    textBox.FocusLost:Connect(checkNegativeValue)
end

-- Llamar a la función ShowNegativeValueTextBox() para iniciar la captura de entrada del usuario
ShowNegativeValueTextBox()
