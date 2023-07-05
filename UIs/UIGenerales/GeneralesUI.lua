local playerName = game.Players.LocalPlayer.Name

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "MyScreenGUI"
screenGui.Parent = game.Players.LocalPlayer.PlayerGui

local frame = Instance.new("Frame")
frame.Name = "ScriptBox"
frame.Size = UDim2.new(0.5, 0, 0.7, 0)
frame.Position = UDim2.new(0.25, 0, 0.15, 0)
frame.BackgroundTransparency = 0.8
frame.BackgroundColor3 = Color3.new(0, 0, 0)
frame.BorderSizePixel = 2
frame.BorderColor3 = Color3.new(0.5, 0.5, 0.5)
frame.Parent = screenGui

-- Variable para almacenar la posición inicial del mouse al arrastrar
local dragStartPos

local function onDragStarted(input)
    -- Guarda la posición inicial del mouse
    dragStartPos = input.Position
    -- Establece el mouse a "capturar" (para seguir recibiendo eventos incluso si sale del cuadro)
    input.UserInputState = Enum.UserInputState.Begin
end

local function onDragMoved(input)
    if dragStartPos then
        -- Calcula la diferencia entre la posición actual del mouse y la posición inicial
        local delta = input.Position - dragStartPos
        -- Actualiza la posición del cuadro según la diferencia calculada
        frame.Position = frame.Position + UDim2.new(0, delta.X, 0, delta.Y)
        -- Actualiza la posición inicial del mouse al arrastrar
        dragStartPos = input.Position
    end
end

local function onDragEnded(input)
    -- Restablece la posición inicial del mouse al finalizar el arrastre
    dragStartPos = nil
    -- Establece el mouse a "no capturar"
    input.UserInputState = Enum.UserInputState.End
end

-- Conecta los eventos de mouse al cuadro para permitir el arrastre
frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        onDragStarted(input)
    end
end)

frame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        onDragMoved(input)
    end
end)

frame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        onDragEnded(input)
    end
end)

local backgroundText = Instance.new("TextLabel")
backgroundText.Name = "BackgroundText"
backgroundText.Size = UDim2.new(1, 0, 0.1, 0)
backgroundText.Position = UDim2.new(0, 0, 0, 0)
backgroundText.BackgroundTransparency = 1
backgroundText.Text = "Generales/Tools"
backgroundText.TextColor3 = Color3.new(1, 1, 1)
backgroundText.Font = Enum.Font.SourceSansBold
backgroundText.TextSize = 40
backgroundText.Parent = frame

local searchInput = ""

local searchBox = Instance.new("TextBox")
searchBox.Name = "SearchBox"
searchBox.AnchorPoint = Vector2.new(0.5, 0)
searchBox.Position = UDim2.new(0.5, 0, 0, 40)
searchBox.Size = UDim2.new(0.8, 0, 0, 30)
searchBox.Text = ""
searchBox.TextColor3 = Color3.new(1, 1, 1)
searchBox.BackgroundColor3 = Color3.new(0, 0, 0)
searchBox.BackgroundTransparency = 0.8
searchBox.BorderSizePixel = 2
searchBox.Font = Enum.Font.SourceSans
searchBox.TextSize = 18
searchBox.PlaceholderText = "Search"
searchBox.TextXAlignment = Enum.TextXAlignment.Center
searchBox.Parent = frame

local buttonContainer = Instance.new("ScrollingFrame")
buttonContainer.Name = "ButtonContainer"
buttonContainer.Size = UDim2.new(1, -20, 1, -80)
buttonContainer.Position = UDim2.new(0, 10, 0, 80)
buttonContainer.BackgroundColor3 = Color3.new(0, 0, 0)
buttonContainer.BackgroundTransparency = 0.8
buttonContainer.BorderSizePixel = 2
buttonContainer.BorderColor3 = Color3.new(0.5, 0.5, 0.5)
buttonContainer.ScrollBarThickness = 8
buttonContainer.CanvasSize = UDim2.new(0, 0, 0, 0)
buttonContainer.Parent = frame

local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -60, 0, 0)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.BackgroundColor3 = Color3.new(0, 0, 0)
closeButton.BackgroundTransparency = 0.5
closeButton.BorderSizePixel = 0
closeButton.Font = Enum.Font.SourceSans
closeButton.TextSize = 18
closeButton.Parent = frame

local expandButton = Instance.new("TextButton")
expandButton.Name = "ExpandButton"
expandButton.Size = UDim2.new(0, 30, 0, 30)
expandButton.Position = UDim2.new(1, -30, 0, 0)
expandButton.Text = "+"
expandButton.TextColor3 = Color3.new(1, 1, 1)
expandButton.BackgroundColor3 = Color3.new(0, 0, 0)
expandButton.BackgroundTransparency = 0.5
expandButton.BorderSizePixel = 0
expandButton.Font = Enum.Font.SourceSans
expandButton.TextSize = 18
expandButton.Parent = frame

local function closeInterface()
    screenGui:Destroy()
end

local function expandInterface()
    frame.Size = UDim2.new(0.8, 0, 0.8, 0)
    closeButton.Position = UDim2.new(1, -90, 0, 0)
    expandButton.Visible = false
end

local function updateButtons()
    for _, button in ipairs(buttonContainer:GetChildren()) do
        if button:IsA("Frame") then
            button:Destroy()
        end
    end

    local linkURL = "https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/UIs/UIGenerales/Links.lua?token=GHSAT0AAAAAACEXSESJRXQKORNS74NHPBGIZFFO24Q"
    local response = game:HttpGet(linkURL)
    local fileList = {}

    for line in response:gmatch("[^\r\n]+") do
        local name, type, state, url = line:match("([^:]+):([^:]+):([^:]+):(.+)")
        if name and url then
            if not type then
                type = "Utilidad" -- Valor predeterminado para el tipo
            end
            if not state then
                state = "Live" -- Valor predeterminado para el estado
            end
            fileList[name] = {
                type = type,
                state = state,
                url = url
            }
        end
    end

    local filteredFiles = {}

    for name, data in pairs(fileList) do
        if string.find(string.lower(name), string.lower(searchInput)) then
            table.insert(filteredFiles, {name = name, data = data})
        end
    end

    table.sort(filteredFiles, function(a, b)
        return a.name < b.name
    end)

    buttonContainer.CanvasSize = UDim2.new(0, 0, 0, #filteredFiles * 40)

    for i, fileData in ipairs(filteredFiles) do
        local buttonFrame = Instance.new("Frame")
        buttonFrame.Name = fileData.name
        buttonFrame.Size = UDim2.new(1, 0, 0, 30)
        buttonFrame.Position = UDim2.new(0, 0, 0, (i - 1) * 40)
        buttonFrame.BackgroundTransparency = 1
        buttonFrame.Parent = buttonContainer

        local buttonText = Instance.new("TextLabel")
        buttonText.Name = "ButtonText"
        buttonText.Size = UDim2.new(0.5, 0, 1, 0)
        buttonText.Position = UDim2.new(0, 0, 0, 0)
        buttonText.BackgroundTransparency = 1
        buttonText.Text = fileData.name
        buttonText.TextColor3 = Color3.new(1, 1, 1)
        buttonText.Font = Enum.Font.SourceSans
        buttonText.TextSize = 18
        buttonText.TextXAlignment = Enum.TextXAlignment.Left
        buttonText.Parent = buttonFrame

        local typeStateText = Instance.new("TextLabel")
        typeStateText.Name = "TypeStateText"
        typeStateText.Size = UDim2.new(0.5, 0, 1, 0)
        typeStateText.Position = UDim2.new(0.5, 0, 0, 0)
        typeStateText.BackgroundTransparency = 1
        typeStateText.Text = fileData.data.type .. " | " .. fileData.data.state
        typeStateText.TextColor3 = Color3.new(1, 1, 1)
        typeStateText.Font = Enum.Font.SourceSans
        typeStateText.TextSize = 18
        typeStateText.TextXAlignment = Enum.TextXAlignment.Right
        typeStateText.Parent = buttonFrame

        local clickButton = Instance.new("TextButton")
        clickButton.Name = "ClickButton"
        clickButton.Size = UDim2.new(1, 0, 1, 0)
        clickButton.Position = UDim2.new(0, 0, 0, 0)
        clickButton.Text = ""
        clickButton.BackgroundColor3 = Color3.new(0, 0, 0)
        clickButton.BackgroundTransparency = 0.5
        clickButton.BorderSizePixel = 0
        clickButton.Parent = buttonFrame

        clickButton.MouseButton1Click:Connect(function()
            print("Se ha hecho clic en el botón " .. fileData.name)
            local scriptCode = "loadstring(game:HttpGet('" .. fileData.data.url .. "'))()"
            loadstring(scriptCode)()
        end)
    end
end

searchBox:GetPropertyChangedSignal("Text"):Connect(function()
    searchInput = searchBox.Text
    updateButtons()
end)

closeButton.MouseButton1Click:Connect(closeInterface)
expandButton.MouseButton1Click:Connect(expandInterface)

updateButtons()

local canDrag = false -- Variable para controlar si se permite el arrastre

-- Variables para almacenar la posición inicial del mouse o el toque al arrastrar
local dragStartPos
local dragStartFramePos

local function onDragStarted(input)
    -- Guarda la posición inicial del mouse o del toque
    dragStartPos = input.Position
    dragStartFramePos = frame.Position
    -- Establece el mouse o el toque a "capturar" (para seguir recibiendo eventos incluso si sale del cuadro)
    input.UserInputState = Enum.UserInputState.Begin
    canDrag = true -- Permite el arrastre
end

local function onDragMoved(input)
    if canDrag and dragStartPos then
        -- Calcula la diferencia entre la posición actual del mouse o del toque y la posición inicial
        local delta = input.Position - dragStartPos
        -- Actualiza la posición del cuadro según la diferencia calculada
        frame.Position = dragStartFramePos + UDim2.new(0, delta.X, 0, delta.Y)
    end
end

local function onDragEnded(input)
    if canDrag then
        -- Restablece las variables al finalizar el arrastre
        dragStartPos = nil
        dragStartFramePos = nil
        -- Establece el mouse o el toque a "no capturar"
        input.UserInputState = Enum.UserInputState.End
        canDrag = false -- Desactiva el arrastre
    end
end

-- Conecta los eventos de mouse y táctil al cuadro para permitir el arrastre
frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        onDragStarted(input)
    end
end)

frame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        onDragMoved(input)
    end
end)

frame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        onDragEnded(input)
    end
end)