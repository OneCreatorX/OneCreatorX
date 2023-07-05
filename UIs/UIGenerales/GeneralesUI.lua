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

    local linkURL = "https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/UIs/UIGenerales/Links.lua"

local searchInput = ""
local buttonContainer = script.Parent.ButtonContainer
local buttonTemplate = script.Parent.ButtonTemplate

local function updateButtons()
    for _, button in ipairs(buttonContainer:GetChildren()) do
        if button:IsA("TextButton") then
            button:Destroy()
        end
    end

    local linkResponse = game:HttpGet(linkURL)
    local linkFileList = {}

    for line in linkResponse:gmatch("[^\r\n]+") do
        local name, type, state, folder, file = line:match("([^:]+):([^:]+):([^:]+):([^:]+):(.+)")
        if name and folder and file then
            if not type then
                type = "Utilidad"
            end
            if not state then
                state = "Live"
            end
            linkFileList[name] = {
                type = type,
                state = state,
                folder = folder,
                file = file
            }
        end
    end

    local filteredFiles = {}

    for name, data in pairs(linkFileList) do
        if string.find(string.lower(name), string.lower(searchInput)) then
            table.insert(filteredFiles, {name = name, data = data})
        end
    end

    table.sort(filteredFiles, function(a, b)
        return a.name < b.name
    end)

    buttonContainer.CanvasSize = UDim2.new(0, 0, 0, #filteredFiles * 40)

    for i, fileData in ipairs(filteredFiles) do
        local newButton = buttonTemplate:Clone()
        newButton.Parent = buttonContainer
        newButton.Position = UDim2.new(0, 0, 0, (i - 1) * 40)
        newButton.Visible = true
        newButton.Text = fileData.name

        local typeLabel = newButton.TypeLabel
        local stateLabel = newButton.StateLabel

        typeLabel.Text = "Tipo: " .. fileData.data.type
        stateLabel.Text = "Estado: " .. fileData.data.state

        local clickButton = newButton.ClickButton

        clickButton.MouseButton1Click:Connect(function()
            print("Se ha hecho clic en el botón " .. fileData.name)
            local scriptCode = "loadstring(game:HttpGet('https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/Generales/" .. fileData.data.folder .. "/" .. fileData.data.file .. "'))()"
            loadstring(scriptCode)()
        end)
    end
end

script.Parent.SearchButton.MouseButton1Click:Connect(function()
    searchInput = script.Parent.SearchBox.Text
    updateButtons()
end)

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