local UILibrary = {}

function UILibrary:CreateScreenGui(name)
    -- Buscar y destruir cualquier ScreenGui creado por esta librería
    for _, gui in ipairs(game.Players.LocalPlayer:WaitForChild("PlayerGui"):GetChildren()) do
        if gui:IsA("ScreenGui") and gui:FindFirstChild("UILibraryIdentifier") then
            gui:Destroy()
        end
    end

    -- Crear un nuevo ScreenGui
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = name
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    screenGui.ResetOnSpawn = false

    -- Agregar un identificador único
    local identifier = Instance.new("BoolValue")
    identifier.Name = "UILibraryIdentifier"
    identifier.Value = true
    identifier.Parent = screenGui

    return screenGui
end

function UILibrary:CreateFrame(parent, title)
    local frame = Instance.new("Frame")
    frame.Parent = parent
    frame.Size = UDim2.new(0.27, 0, 0.4, 0)
    frame.Position = UDim2.new(0.365, 0, 0.3, 0)
    frame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    frame.BackgroundTransparency = 0.1
    frame.BorderSizePixel = 0
    frame.Active = true
    frame.Draggable = true

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Parent = frame
    titleLabel.Text = title
    titleLabel.Size = UDim2.new(1, 0, 0, 30)
    titleLabel.Position = UDim2.new(0, 0, 0, 0)
    titleLabel.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    titleLabel.BackgroundTransparency = 0.2
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.Font = Enum.Font.SourceSans
    titleLabel.TextSize = 18

    local toggleButton = Instance.new("TextButton")
    toggleButton.Parent = frame
    toggleButton.Text = "-"
    toggleButton.Size = UDim2.new(0, 30, 0, 30)
    toggleButton.Position = UDim2.new(1, -30, 0, 0)
    toggleButton.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    toggleButton.BackgroundTransparency = 0.2
    toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleButton.Font = Enum.Font.SourceSans
    toggleButton.TextSize = 18

    local contentFrame = Instance.new("Frame")
    contentFrame.Parent = frame
    contentFrame.Size = UDim2.new(1, 0, 1, -60)
    contentFrame.Position = UDim2.new(0, 0, 0, 30)
    contentFrame.BackgroundTransparency = 1

    local creditsButton = Instance.new("TextButton")
    creditsButton.Parent = frame
    creditsButton.Text = "Créditos"
    creditsButton.Size = UDim2.new(1, 0, 0, 30)
    creditsButton.Position = UDim2.new(0, 0, 1, -30)
    creditsButton.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    creditsButton.BackgroundTransparency = 0.2
    creditsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    creditsButton.Font = Enum.Font.SourceSans
    creditsButton.TextSize = 18

    local creditsFrame = Instance.new("Frame")
    creditsFrame.Parent = parent
    creditsFrame.Size = UDim2.new(0.2, 0, 0.4, 0)
    creditsFrame.Position = UDim2.new(0.635, 0, 0.3, 0)
    creditsFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    creditsFrame.BackgroundTransparency = 0.1
    creditsFrame.BorderSizePixel = 0
    creditsFrame.Visible = false

    local creditsTitleLabel = Instance.new("TextLabel")
    creditsTitleLabel.Parent = creditsFrame
    creditsTitleLabel.Text = "Créditos"
    creditsTitleLabel.Size = UDim2.new(1, 0, 0, 30)
    creditsTitleLabel.Position = UDim2.new(0, 0, 0, 0)
    creditsTitleLabel.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    creditsTitleLabel.BackgroundTransparency = 0.2
    creditsTitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    creditsTitleLabel.Font = Enum.Font.SourceSans
    creditsTitleLabel.TextSize = 18

    local isMinimized = false
    toggleButton.MouseButton1Click:Connect(function()
        isMinimized = not isMinimized
        if (isMinimized) then
            contentFrame.Visible = false
            toggleButton.Text = "+"
            frame.Size = UDim2.new(0.27, 0, 0, 60)
        else
            contentFrame.Visible = true
            toggleButton.Text = "-"
            frame.Size = UDim2.new(0.27, 0, 0.4, 0)
        end
    end)

    creditsButton.MouseButton1Click:Connect(function()
        if creditsFrame then
            creditsFrame.Visible = not creditsFrame.Visible
        end
    end)

    local function syncFrames()
        creditsFrame.Position = UDim2.new(frame.Position.X.Scale + frame.Size.X.Scale, frame.Position.X.Offset, frame.Position.Y.Scale, frame.Position.Y.Offset)
    end

    frame:GetPropertyChangedSignal("Position"):Connect(syncFrames)
    frame:GetPropertyChangedSignal("Size"):Connect(syncFrames)

    return frame, contentFrame
end

function UILibrary:AddToggleButton(parent, toggleName)
    local toggleButton = Instance.new("TextButton")
    toggleButton.Parent = parent
    toggleButton.Text = toggleName
    toggleButton.Size = UDim2.new(1, 0, 0, 30)
    toggleButton.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    toggleButton.BackgroundTransparency = 0.2
    toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleButton.Font = Enum.Font.SourceSans
    toggleButton.TextSize = 18

    local toggleFrame = Instance.new("Frame")
    toggleFrame.Parent = parent.Parent
    toggleFrame.Size = UDim2.new(0.2, 0, 0.4, 0)
    toggleFrame.Position = UDim2.new(0.635, 0, 0.3, 0)
    toggleFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    toggleFrame.BackgroundTransparency = 0.1
    toggleFrame.BorderSizePixel = 0
    toggleFrame.Visible = false

    local toggleTitleLabel = Instance.new("TextLabel")
    toggleTitleLabel.Parent = toggleFrame
    toggleTitleLabel.Text = toggleName
    toggleTitleLabel.Size = UDim2.new(1, 0, 0, 30)
    toggleTitleLabel.Position = UDim2.new(0, 0, 0, 0)
    toggleTitleLabel.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    toggleTitleLabel.BackgroundTransparency = 0.2
    toggleTitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleTitleLabel.Font = Enum.Font.SourceSans
    toggleTitleLabel.TextSize = 18

    toggleButton.MouseButton1Click:Connect(function()
        toggleFrame.Visible = not toggleFrame.Visible
    end)

    local function syncFrames()
        toggleFrame.Position = UDim2.new(parent.Position.X.Scale + parent.Size.X.Scale, parent.Position.X.Offset, parent.Position.Y.Scale, parent.Position.Y.Offset)
    end

    parent:GetPropertyChangedSignal("Position"):Connect(syncFrames)
    parent:GetPropertyChangedSignal("Size"):Connect(syncFrames)

    return toggleButton, toggleFrame
end

function UILibrary:AddOptionsButton(parent, buttonText)
    local optionsButton = Instance.new("TextButton")
    optionsButton.Parent = parent
    optionsButton.Text = buttonText
    optionsButton.Size = UDim2.new(1, 0, 0, 30)
    optionsButton.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    optionsButton.BackgroundTransparency = 0.2
    optionsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    optionsButton.Font = Enum.Font.SourceSans
    optionsButton.TextSize = 18

    local optionsFrame = Instance.new("Frame")
    optionsFrame.Parent = parent.Parent
    optionsFrame.Size = UDim2.new(0.2, 0, 0.4, 0)
    optionsFrame.Position = UDim2.new(0.635, 0, 0.3, 0)
optionsFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
optionsFrame.BackgroundTransparency = 0.1
optionsFrame.BorderSizePixel = 0
optionsFrame.Visible = false

local optionsTitleLabel = Instance.new("TextLabel")
optionsTitleLabel.Parent = optionsFrame
optionsTitleLabel.Text = buttonText
optionsTitleLabel.Size = UDim2.new(1, 0, 0, 30)
optionsTitleLabel.Position = UDim2.new(0, 0, 0, 0)
optionsTitleLabel.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
optionsTitleLabel.BackgroundTransparency = 0.2
optionsTitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
optionsTitleLabel.Font = Enum.Font.SourceSans
optionsTitleLabel.TextSize = 18

-- Aquí puedes agregar más elementos al frame de opciones, como otros botones
local newButton = Instance.new("TextButton")
newButton.Parent = optionsFrame
newButton.Text = "New Option"
newButton.Size = UDim2.new(1, 0, 0, 30)
newButton.Position = UDim2.new(0, 0, 0, 30)
newButton.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
newButton.BackgroundTransparency = 0.2
newButton.TextColor3 = Color3.fromRGB(255, 255, 255)
newButton.Font = Enum.Font.SourceSans
newButton.TextSize = 18

optionsButton.MouseButton1Click:Connect(function()
    optionsFrame.Visible = not optionsFrame.Visible
end)

local function syncFrames()
    optionsFrame.Position = UDim2.new(parent.Position.X.Scale + parent.Size.X.Scale, parent.Position.X.Offset, parent.Position.Y.Scale, parent.Position.Y.Offset)
end

parent:GetPropertyChangedSignal("Position"):Connect(syncFrames)
parent:GetPropertyChangedSignal("Size"):Connect(syncFrames)

return optionsButton, optionsFrame
end

return UILibrary
