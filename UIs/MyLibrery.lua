local UILibrary = {}

-- Crea un ScreenGui
function UILibrary:CreateScreenGui(name)
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = name
    screenGui.Parent = game.Players.LocalPlayer.PlayerGui
    screenGui.ResetOnSpawn = false

    local identifier = Instance.new("BoolValue")
    identifier.Name = "UILibraryIdentifier"
    identifier.Value = true
    identifier.Parent = screenGui

    return screenGui
end

-- Crea un Frame con título, botón de minimizar y contenido
function UILibrary:CreateFrame(parent, title)
    local frame = Instance.new("Frame")
    frame.Parent = parent
    frame.Size = UDim2.new(0.35, 0, 0, 60)
    frame.Position = UDim2.new(0.325, 0, 0.3, 0)
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
    creditsButton.Text = "Crédits: OneCreatorX"
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
    creditsFrame.BorderSizePixel = 1
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
        if isMinimized then
            contentFrame.Visible = false
            toggleButton.Text = "+"
            frame.Size = UDim2.new(0.35, 0, 0, 60)
        else
            contentFrame.Visible = true
            toggleButton.Text = "-"
            frame.Size = UDim2.new(0.35, 0, 0, 60 + #contentFrame:GetChildren() * 30)
        end
    end)

    creditsButton.MouseButton1Click:Connect(function()
        creditsFrame.Visible = not creditsFrame.Visible
    end)

    local function syncFrames()
        creditsFrame.Position = UDim2.new(frame.Position.X.Scale + frame.Size.X.Scale, frame.Position.X.Offset, frame.Position.Y.Scale, frame.Position.Y.Offset)
    end

    frame:GetPropertyChangedSignal("Position"):Connect(syncFrames)
    frame:GetPropertyChangedSignal("Size"):Connect(syncFrames)

    return frame, contentFrame, creditsFrame
end

-- Crea un botón normal
function UILibrary:AddButton(parent, buttonText, callback)
    return UILibrary:CreateButton(parent, buttonText, callback)
end

-- Crea un botón de opciones
function UILibrary:AddOptionsButton(parent, optionsName)
    local button, optionsFrame = UILibrary:CreateButton(parent, optionsName, function()
        optionsFrame.Visible = not optionsFrame.Visible
    end)

    optionsFrame.Parent = parent.Parent
    optionsFrame.Size = UDim2.new(0.25, 0, 0.4, 0)
    optionsFrame.Position = UDim2.new(1.02, 0, 0, 0)  -- Ajusta la posición para que esté a la derecha del frame principal
    optionsFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    optionsFrame.BackgroundTransparency = 0.1
    optionsFrame.BorderSizePixel = 0
    optionsFrame.Visible = false

    local optionsTitleLabel = Instance.new("TextLabel")
    optionsTitleLabel.Parent = optionsFrame
    optionsTitleLabel.Text = optionsName
    optionsTitleLabel.Size = UDim2.new(1, 0, 0, 30)
    optionsTitleLabel.Position = UDim2.new(0, 0, 0, 0)
    optionsTitleLabel.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    optionsTitleLabel.BackgroundTransparency = 0.2
    optionsTitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    optionsTitleLabel.Font = Enum.Font.SourceSans
    optionsTitleLabel.TextSize = 18

    return button, optionsFrame
end

-- Crea un botón de Toggle
function UILibrary:AddToggleButton(parent, toggleText, defaultState, callback)
    local button = Instance.new("TextButton")
    button.Parent = parent
    button.Text = toggleText .. " (" .. (defaultState and "On" or "Off") .. ")"
    button.Size = UDim2.new(1, 0, 0, 30)
    button.Position = UDim2.new(0, 0, 0, #parent:GetChildren() * 30 - 30)
    button.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    button.BackgroundTransparency = 0.2
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.SourceSans
    button.TextSize = 18

    local state = defaultState

    button.MouseButton1Click:Connect(function()
        state = not state
        button.Text = toggleText .. " (" .. (state and "On" or "Off") .. ")"
        callback(state)
    end)

    parent.Parent.Size = UDim2.new(0.35, 0, 0, 60 + #parent:GetChildren() * 30)

    return button
end

-- Crea una caja de texto
function UILibrary:AddTextbox(parent, textboxText, defaultText, callback)
    local frame = Instance.new("Frame")
    frame.Parent = parent
    frame.Size = UDim2.new(1, 0, 0, 30)
    frame.Position = UDim2.new(0, 0, 0, #parent:GetChildren() * 30 - 30)
    frame.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    frame.BackgroundTransparency = 0.2

    local label = Instance.new("TextLabel")
    label.Parent = frame
    label.Text = textboxText
    label.Size = UDim2.new(0.4, 0, 1, 0)
    label.Position = UDim2.new(0, 0, 0, 0)
    label.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    label.BackgroundTransparency = 0.2
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Font = Enum.Font.SourceSans
    label.TextSize = 18

    local textbox = Instance.new("TextBox")
    textbox.Parent = frame
    textbox.Text = defaultText or ""
    textbox.Size = UDim2.new(0.6, 0, 1, 0)
    textbox.Position = UDim2.new(0.4, 0, 0, 0)
    textbox.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    textbox.BackgroundTransparency = 0.2
    textbox.TextColor3 = Color3.fromRGB(255, 255, 255)
    textbox.Font = Enum.Font.SourceSans
    textbox.TextSize = 18

    textbox.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            callback(textbox.Text)
        end
    end)

    parent.Parent.Size = UDim2.new(0.35, 0, 0, 60 + #parent:GetChildren() * 30)

    return frame, textbox
end

-- Función auxiliar para crear botones
function UILibrary:CreateButton(parent, buttonText, callback)
    local button = Instance.new("TextButton")
    button.Parent = parent
    button.Text = buttonText
    button.Size = UDim2.new(1, 0, 0, 30)
    button.Position = UDim2.new(0, 0, 0, #parent:GetChildren() * 30 - 30)
    button.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    button.BackgroundTransparency = 0.2
    button.TextColor3 = Color3.fromRGB(255, 255, 255)
    button.Font = Enum.Font.SourceSans
    button.TextSize = 18

    button.MouseButton1Click:Connect(callback)

    parent.Parent.Size = UDim2.new(0.35, 0, 0, 60 + #parent:GetChildren() * 30)

    return button
end

return UILibrary
