local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")

local TeleportGui = Instance.new("ScreenGui")
TeleportGui.Name = "TeleportGui"
TeleportGui.Parent = game.Players.LocalPlayer.PlayerGui
TeleportGui.ResetOnSpawn = false

local TeleportMenu = Instance.new("Frame")
TeleportMenu.Name = "TeleportMenu"
TeleportMenu.Size = UDim2.new(0, 250, 0, 300)
TeleportMenu.Position = UDim2.new(0.5, -125, 1, -300)  
TeleportMenu.AnchorPoint = Vector2.new(0.5, 1)
TeleportMenu.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
TeleportMenu.BorderColor3 = Color3.new(0.4, 0.4, 1)
TeleportMenu.BorderSizePixel = 2
TeleportMenu.Parent = TeleportGui

local ScrollFrame = Instance.new("ScrollingFrame")
ScrollFrame.Size = UDim2.new(1, 0, 1, -60)
ScrollFrame.Position = UDim2.new(0, 0, 0, 0)
ScrollFrame.BackgroundTransparency = 1
ScrollFrame.ScrollBarThickness = 10
ScrollFrame.ScrollingDirection = Enum.ScrollingDirection.Y
ScrollFrame.BorderSizePixel = 0
ScrollFrame.Parent = TeleportMenu

local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0, 120, 0, 30)
ToggleButton.Position = UDim2.new(0.5, -60, 1, -30)
ToggleButton.AnchorPoint = Vector2.new(0.5, 1)
ToggleButton.BackgroundColor3 = Color3.new(0.4, 0.4, 1)
ToggleButton.TextColor3 = Color3.new(1, 1, 1)
ToggleButton.Text = "Ocultar menú"
ToggleButton.Parent = TeleportGui
ToggleButton.Visible = true

-- Variable para rastrear la posición del mouse cuando se inicia el arrastre
local dragStart = nil

-- Función para permitir arrastrar un objeto
local function EnableDrag(frame)
    local dragInput, dragStart, startPos

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragStart = input.Position
            startPos = frame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragStart = nil
                end
            end)
        end
    end)

    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragInput and input == dragInput then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end

-- Llamar a EnableDrag para permitir el arrastre de la interfaz y el botón de ocultar/mostrar
EnableDrag(TeleportMenu)
EnableDrag(ToggleButton)

local function ToggleMenu()
    isMenuVisible = not isMenuVisible
    TeleportMenu.Visible = isMenuVisible
    ToggleButton.Text = isMenuVisible and "Ocultar menú" or "Mostrar menú"
end

ToggleButton.MouseButton1Click:Connect(ToggleMenu)

local function TeleportToPlayer(player)
    if player.Character then
        local rootPart = player.Character:FindFirstChild("HumanoidRootPart")
        if rootPart then
            LocalPlayer.Character:MoveTo(rootPart.Position)
        end
    end
end

local selectedPlayer = nil  -- Almacenar al jugador seleccionado

local function CreateTeleportButton(player)
    local TeleportButton = Instance.new("TextButton")
    TeleportButton.Size = UDim2.new(0.9, 0, 0, 30)
    TeleportButton.Position = UDim2.new(0.05, 0, 0, 10 + ((30 + 10) * (#ScrollFrame:GetChildren())))
    TeleportButton.BackgroundColor3 = Color3.new(0.4, 0.4, 1)
    TeleportButton.TextColor3 = Color3.new(1, 1, 1)
    TeleportButton.Text = player.Name
    TeleportButton.Parent = ScrollFrame
    TeleportButton.MouseButton1Click:Connect(function()
        if selectedPlayer == nil or selectedPlayer ~= player then
            selectedPlayer = player
            TeleportToPlayer(player)
            ToggleMenu()
        end
    end)
end

local function UpdatePlayerList()
    for _, button in ipairs(ScrollFrame:GetChildren()) do
        if button:IsA("TextButton") then
            button:Destroy()
        end
    end

    selectedPlayer = nil  -- Reiniciar la selección de jugador

    local totalHeight = 10
    local buttonHeight = 30
    local spacing = 10

    local players = Players:GetPlayers()
    table.sort(players, function(a, b)
        return a.Name < b.Name
    end)

    for i, player in ipairs(players) do
        if player ~= LocalPlayer then
            CreateTeleportButton(player)
            totalHeight = totalHeight + buttonHeight + spacing
        end
    end

    ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, totalHeight)
end

UpdatePlayerList()

spawn(function()
    while wait(2) do
        if isMenuVisible then
            UpdatePlayerList()
        end
    end
end)