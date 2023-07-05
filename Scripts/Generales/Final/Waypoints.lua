local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Camera = workspace.CurrentCamera

-- Crear y configurar la interfaz
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = Player.PlayerGui

local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 300, 0, 400)
Frame.Position = UDim2.new(0.5, -150, 0.5, -200)
Frame.BackgroundTransparency = 0.5
Frame.Active = true
Frame.Draggable = true
Frame.Parent = ScreenGui

local ButtonContainer = Instance.new("ScrollingFrame")
ButtonContainer.Size = UDim2.new(0, 280, 0, 360)
ButtonContainer.Position = UDim2.new(0, 10, 0, 40)
ButtonContainer.BackgroundTransparency = 1
ButtonContainer.ScrollBarThickness = 8
ButtonContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
ButtonContainer.Parent = Frame

local MinimizeButton = Instance.new("TextButton")
MinimizeButton.Size = UDim2.new(0, 20, 0, 20)
MinimizeButton.Position = UDim2.new(1, -25, 0, 10)
MinimizeButton.Text = "-"
MinimizeButton.TextSize = 18
MinimizeButton.TextColor3 = Color3.new(1, 1, 1)
MinimizeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
MinimizeButton.BorderSizePixel = 0
MinimizeButton.Parent = Frame

local isMinimized = false
local originalSize = Frame.Size

local function toggleTeleportButton(visible)
    FirstButton.Visible = visible
end

local buttons = {}

local function createButton(name, cframe)
    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(0, 260, 0, 30)
    Button.Position = UDim2.new(0, 10, 0, (#ButtonContainer:GetChildren() * 40) + 10)
    Button.Text = name
    Button.TextSize = 10
    Button.TextColor3 = Color3.new(1, 1, 1)
    Button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    Button.BorderSizePixel = 0
    Button.Parent = ButtonContainer

    local Shadow = Instance.new("ImageLabel")
    Shadow.Name = "Shadow"
    Shadow.Size = UDim2.new(1, 6, 1, 6)
    Shadow.Position = UDim2.new(0, -3, 0, -3)
    Shadow.BackgroundTransparency = 1
    Shadow.Image = "rbxassetid://1316045217"
    Shadow.ImageTransparency = 0.6
    Shadow.ScaleType = Enum.ScaleType.Slice
    Shadow.SliceCenter = Rect.new(10, 10, 118, 118)
    Shadow.Parent = Button

    Button.MouseEnter:Connect(function()
        Button.BackgroundColor3 = Color3.fromRGB(90, 90, 90)
        Shadow.ImageTransparency = 0.3
    end)

    Button.MouseLeave:Connect(function()
        Button.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
        Shadow.ImageTransparency = 0.6
    end)

    local XButton = Instance.new("TextButton")
    XButton.Size = UDim2.new(0, 20, 0, 20)
    XButton.Position = UDim2.new(1, -30, 0, 5)
    XButton.Text = "x"
    XButton.TextSize = 18
    XButton.TextColor3 = Color3.new(1, 1, 1)
    XButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    XButton.BorderSizePixel = 0
    XButton.Parent = Button

    local DeltaButton = Instance.new("TextButton")
    DeltaButton.Size = UDim2.new(0, 20, 0, 20)
    DeltaButton.Position = UDim2.new(1, -50, 0, 5)
    DeltaButton.Text = "∆"
    DeltaButton.TextSize = 18
    DeltaButton.TextColor3 = Color3.new(1, 1, 1)
    DeltaButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    DeltaButton.BorderSizePixel = 0
    DeltaButton.Parent = Button

    Button.MouseButton1Click:Connect(function()
        Player.Character:MoveTo(cframe.Position)
    end)

    XButton.MouseButton1Click:Connect(function()
        Button:Destroy()
        buttons[name] = nil
        ButtonContainer.CanvasSize = UDim2.new(0, 0, 0, (#ButtonContainer:GetChildren() - 1) * 40)
    end)

    DeltaButton.MouseButton1Click:Connect(function()
        Camera.CFrame = cframe

        local Connection
        Connection = Camera:GetPropertyChangedSignal("CFrame"):Connect(function()
            Camera.CFrame = cframe
        end)

        task.delay(5, function()
            Connection:Disconnect()
        end)
    end)

    buttons[name] = {
        Button = Button,
        CFrame = cframe
    }

    ButtonContainer.CanvasSize = UDim2.new(0, 0, 0, (#ButtonContainer:GetChildren() - 1) * 40)
end

local Button = Instance.new("TextButton")
Button.Size = UDim2.new(1, -10, 0, 20)
Button.Position = UDim2.new(0, 5, 0, -30)
Button.TextSize = 14
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
Button.BorderColor3 = Color3.fromRGB(30, 30, 30)
Button.AutoButtonColor = false
Button.Font = Enum.Font.SourceSansBold
Button.Text = "Enter name" -- Cambia "Enter" por el texto que desees utilizar
Button.Parent = Frame

local TextBox = Instance.new("TextBox")
TextBox.Size = Button.Size
TextBox.Position = Button.Position
TextBox.TextSize = Button.TextSize
TextBox.TextColor3 = Button.TextColor3
TextBox.BackgroundColor3 = Button.BackgroundColor3
TextBox.BorderColor3 = Button.BorderColor3
TextBox.Font = Button.Font
TextBox.Text = "" -- Texto inicialmente vacío
TextBox.Visible = false -- El TextBox se oculta inicialmente
TextBox.Parent = Frame

local Shadow = Instance.new("ImageLabel")
Shadow.Name = "Shadow"
Shadow.Size = UDim2.new(1, 6, 1, 6)
Shadow.Position = UDim2.new(0, -3, 0, -3)
Shadow.BackgroundTransparency = 1
Shadow.Image = "rbxassetid://1316045217"
Shadow.ImageTransparency = 0.6
Shadow.ScaleType = Enum.ScaleType.Slice
Shadow.SliceCenter = Rect.new(10, 10, 118, 118)
Shadow.Parent = Button

Button.MouseEnter:Connect(function()
    Button.BackgroundColor3 = Color3.fromRGB(0, 140, 255)
    Shadow.ImageTransparency = 0.3
end)

Button.MouseLeave:Connect(function()
    Button.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
    Shadow.ImageTransparency = 0.6
end)

Button.MouseButton1Click:Connect(function()
    TextBox.Visible = true -- Mostrar el TextBox al hacer clic en el botón
    TextBox:CaptureFocus() -- Capturar el enfoque del TextBox
end)

TextBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        local name = TextBox.Text
        local cframe = Player.Character.HumanoidRootPart.CFrame
        createButton(name, cframe)
        TextBox.Text = ""
        TextBox.Visible = false -- Ocultar el TextBox después de ingresar el texto
    end
end)

local OButton = Instance.new("TextButton")
OButton.Size = UDim2.new(0, 20, 0, 20)
OButton.Position = UDim2.new(1, -40, 0.02, 10)
OButton.Text = "⁰"
OButton.TextSize = 20
OButton.TextColor3 = Color3.new(1, 1, 1)
OButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
OButton.BorderSizePixel = 0
OButton.Visible = false
OButton.Parent = Frame
OButton.MouseButton1Click:Connect(function()
    local lastButton = nil
    local lastCFrame = nil
    for _, buttonData in pairs(buttons) do
        if not lastButton or buttonData.Button.Position.Y.Offset > lastButton.Position.Y.Offset then
            lastButton = buttonData.Button
            lastCFrame = buttonData.CFrame
        end
    end
    if lastButton and lastCFrame then
        Player.Character:MoveTo(lastCFrame.Position)
    end
end)

local FirstButton = Instance.new("TextButton")
FirstButton.Size = UDim2.new(0, 20, 0, 20)
FirstButton.Position = UDim2.new(1, -60, 0.02, 10)
FirstButton.Text = "¹"
FirstButton.TextSize = 20
FirstButton.TextColor3 = Color3.new(1, 1, 1)
FirstButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
FirstButton.BorderSizePixel = 0
FirstButton.Visible = false
FirstButton.Parent = Frame

FirstButton.MouseButton1Click:Connect(function()
    local firstButtonData = nil
    for _, buttonData in pairs(buttons) do
        if not firstButtonData or buttonData.Button.Position.Y.Offset < firstButtonData.Button.Position.Y.Offset then
            firstButtonData = buttonData
        end
    end
    if firstButtonData then
        Player.Character:MoveTo(firstButtonData.CFrame.Position)
    end
end)

local function toggleTeleportButton(visible)
    FirstButton.Visible = visible
    OButton.Visible = visible
end

-- Animación de entrada
Frame.Position = UDim2.new(0.5, -150, 0.5, -200)
Frame:TweenPosition(UDim2.new(0.5, -150, 0.5, -150), Enum.EasingDirection.Out, Enum.EasingStyle.Back, 1, true)

MinimizeButton.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    if isMinimized then
        Frame.Size = UDim2.new(0, 100, 0, 30)
        ButtonContainer.Visible = false
        MinimizeButton.Text = "+"
        toggleTeleportButton(true) -- Mostrar el botón de teleportación cuando se minimiza
    else
        Frame.Size = originalSize
        ButtonContainer.Visible = true
        MinimizeButton.Text = "-"
        toggleTeleportButton(false) -- Ocultar el botón de teleportación cuando se maximiza
    end
end)
