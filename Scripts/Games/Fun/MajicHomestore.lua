-- Variables para controlar el cambio de colores
local colorRotationActive = {
    Glowstick = false,
    PomPom = false,
    Heels = false
}

-- Colores para los botones
local buttonBackgroundColor = Color3.new(0.2, 0.2, 0.2) -- Color de fondo
local buttonTextColor = Color3.new(1, 1, 1) -- Color del texto

-- Ejecutar comandos iniciales
game:GetService("ReplicatedStorage"):WaitForChild("ToolEvents"):WaitForChild("PomPomEvent"):FireServer()
game:GetService("ReplicatedStorage"):WaitForChild("ToolEvents"):WaitForChild("GlowstickEvent"):FireServer()
game:GetService("ReplicatedStorage"):WaitForChild("ToolEvents"):WaitForChild("SignEvent"):FireServer()

-- Variables para el desplazamiento de palabras
local mensajeCompleto = ""
local mensajeIndex = 1

-- Función para rotar colores de una herramienta
local function rotarColores(toolName)
    while colorRotationActive[toolName] do
        local randomColor = Color3.new(math.random(), math.random(), math.random())

        local args = {
            [1] = toolName,
            [2] = randomColor
        }

        game:GetService("ReplicatedStorage"):WaitForChild("HandleToolColor"):FireServer(unpack(args))
        wait(0.2)
    end
end

-- Función para enviar el texto al servidor con desplazamiento
local function enviarTextoAlServidor()
    local player = game.Players.LocalPlayer

    while true do
        local createMsg = player.PlayerGui:FindFirstChild("SignGui")
        if createMsg then
            local textMsg = createMsg:FindFirstChild("CreateMsg"):FindFirstChild("TextMsg")
            if textMsg then
                local mensaje = textMsg.Text
                if mensaje and mensaje ~= "" then
                    if mensaje ~= mensajeCompleto then
                        mensajeCompleto = mensaje
                        mensajeIndex = 1
                    end

                    local mensajeParcial = mensajeCompleto:sub(mensajeIndex) .. " " .. mensajeCompleto:sub(1, mensajeIndex - 1)
                    local argsMensaje = { [1] = mensajeParcial }
                    game:GetService("Players").LocalPlayer.Character.Sign.UpdateSign:FireServer(unpack(argsMensaje))
                    mensajeIndex = mensajeIndex + 1
                    if mensajeIndex > #mensajeCompleto then
                        mensajeIndex = 1
                    end
                end
            end
        end
        wait(0.3) -- Espera un tiempo antes de mostrar la siguiente letra
    end
end

-- Función para crear la interfaz de usuario
local function crearUI()
    local player = game.Players.LocalPlayer

    -- Crear una nueva ventana de UI
    local gui = Instance.new("ScreenGui")
    gui.Parent = player.PlayerGui

    -- Crear botones para activar/desactivar rotación de colores
    local function crearBoton(toolName, x, y)
        local toolButton = Instance.new("TextButton")
        toolButton.Size = UDim2.new(0, 100, 0, 30)
        toolButton.Position = UDim2.new(0, x, 0, y)
        toolButton.Parent = gui
        toolButton.BackgroundColor3 = buttonBackgroundColor
        toolButton.TextColor3 = buttonTextColor

        local function actualizarTexto()
            if colorRotationActive[toolName] then
                toolButton.Text = "Desactivar " .. toolName
            else
                toolButton.Text = "Activar " .. toolName
            end
        end

        toolButton.MouseButton1Click:Connect(function()
            colorRotationActive[toolName] = not colorRotationActive[toolName]
            actualizarTexto()
            rotarColores(toolName)  -- Iniciar rotación de colores al hacer clic
        end)

        actualizarTexto()
    end

    crearBoton("Glowstick", 10, 10)
    crearBoton("PomPom", 120, 10)
    crearBoton("Heels", 230, 10)
end

-- Iniciar la creación de la interfaz y el envío de texto al servidor con desplazamiento
crearUI()
enviarTextoAlServidor()
