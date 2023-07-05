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

local searchInput = ""

local searchBox = Instance.new("TextBox")
searchBox.Name = "SearchBox"
searchBox.AnchorPoint = Vector2.new(0.5, 0)
searchBox.Position = UDim2.new(0.5, 0, 0, 10)
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
buttonContainer.Size = UDim2.new(1, -20, 1, -60)
buttonContainer.Position = UDim2.new(0, 10, 0, 60)
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
closeButton.Position = UDim2.new(1, -90, 0, 10)
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
expandButton.Position = UDim2.new(1, -30, 0, 10)
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
    closeButton.Position = UDim2.new(1, -120, 0, 10)
    expandButton.Visible = false
end

local function updateButtons()
    for _, button in ipairs(buttonContainer:GetChildren()) do
        if button:IsA("TextButton") then
            button:Destroy()
        end
    end

    local linkURL = "https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/UIs/UIGenerales/Links.lua" -- Reemplaza con la URL del archivo de Lua en GitHub

    local response = game:HttpGet(linkURL)

    -- Crea los botones utilizando los datos del archivo de Lua
    local yOffset = 0
    for line in response:gmatch("[^\r\n]+") do
        local name, directory = line:match("(%w+):(%S+)")

        if name and directory then
            local button = Instance.new("TextButton")
            button.Name = name
            button.Size = UDim2.new(1, -20, 0, 40)
            button.Position = UDim2.new(0, 10, 0, yOffset)
            button.Text = name
            button.TextColor3 = Color3.new(1, 1, 1)
            button.BackgroundColor3 = Color3.new(0, 0, 0)
            button.BackgroundTransparency = 0.5
            button.BorderSizePixel = 2
            button.Font = Enum.Font.SourceSans
            button.TextSize = 18
            button.Parent = buttonContainer

            yOffset = yOffset + 50

            button.MouseButton1Click:Connect(function()
                local scriptUrl = "https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/Generales/" .. directory .. ".lua"
loadstring(game:HttpGet(scriptUrl))()
                -- Hacer algo con la URL del script, como cargar/ejecutar el script
                print(scriptUrl)
            end)
        end
    end

    buttonContainer.CanvasSize = UDim2.new(0, 0, 0, yOffset)
end

updateButtons()

closeButton.MouseButton1Click:Connect(closeInterface)
expandButton.MouseButton1Click:Connect(expandInterface)

searchBox:GetPropertyChangedSignal("Text"):Connect(function()
    searchInput = searchBox.Text
    updateButtons()
end)
