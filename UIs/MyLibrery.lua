local UILibrary = {}

-- Crear el ScreenGui
function UILibrary:CreateScreenGui(name)
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = name
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    return screenGui
end

-- Crear el Frame principal y sus subframes
function UILibrary:CreateFrame(screenGui, title)
    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(0, 200, 0, 300)
    mainFrame.Position = UDim2.new(0.5, -100, 0.5, -150)
    mainFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    mainFrame.Parent = screenGui

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, 0, 0, 30)
    titleLabel.Text = title
    titleLabel.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.Parent = mainFrame

    local mainContentFrame = Instance.new("Frame")
    mainContentFrame.Size = UDim2.new(1, 0, 1, -30)
    mainContentFrame.Position = UDim2.new(0, 0, 0, 30)
    mainContentFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    mainContentFrame.Parent = mainFrame

    local creditsFrame = Instance.new("Frame")
    creditsFrame.Size = UDim2.new(1, 0, 0, 30)
    creditsFrame.Position = UDim2.new(0, 0, 1, -30)
    creditsFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    creditsFrame.Parent = mainFrame

    local creditsLabel = Instance.new("TextLabel")
    creditsLabel.Size = UDim2.new(1, 0, 1, 0)
    creditsLabel.Text = "Credits: OneCreatorX"
    creditsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    creditsLabel.Parent = creditsFrame

    return mainFrame, mainContentFrame, creditsFrame
end

-- Función base para agregar elementos a un frame
function UILibrary:AddElement(parent, elementType, text, callback, additionalProperties)
    local element = Instance.new(elementType)
    element.Size = UDim2.new(1, -10, 0, 30)
    element.Position = UDim2.new(0, 5, 0, (#parent:GetChildren() - 1) * 35 + 5)
    element.Text = text
    element.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    element.TextColor3 = Color3.fromRGB(255, 255, 255)
    element.Parent = parent

    if additionalProperties then
        for property, value in pairs(additionalProperties) do
            element[property] = value
        end
    end

    if callback then
        if elementType == "TextButton" then
            element.MouseButton1Click:Connect(callback)
        elseif elementType == "TextBox" then
            element.FocusLost:Connect(function(enterPressed)
                if enterPressed then
                    callback(element.Text)
                end
            end)
        end
    end

    return element
end

-- Agregar un botón normal
function UILibrary:AddButton(parent, text, callback)
    self:AddElement(parent, "TextButton", text, callback)
end

-- Agregar un botón de opciones
function UILibrary:AddOptionsButton(parent, text)
    local button = self:AddElement(parent, "TextButton", text)
    local optionsFrame = Instance.new("Frame")
    optionsFrame.Size = UDim2.new(1, -10, 0, 0)
    optionsFrame.Position = UDim2.new(0, 5, 0, (#parent:GetChildren()) * 35 + 5)
    optionsFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    optionsFrame.ClipsDescendants = true
    optionsFrame.Parent = parent

    button.MouseButton1Click:Connect(function()
        optionsFrame.Size = optionsFrame.Size == UDim2.new(1, -10, 0, 0) and UDim2.new(1, -10, 0, (#optionsFrame:GetChildren() * 35)) or UDim2.new(1, -10, 0, 0)
    end)

    return button, optionsFrame
end

-- Agregar un botón toggle
function UILibrary:AddToggleButton(parent, text, defaultState, callback)
    local state = defaultState
    local button = self:AddElement(parent, "TextButton", text .. " (" .. (state and "On" or "Off") .. ")")
    button.MouseButton1Click:Connect(function()
        state = not state
        button.Text = text .. " (" .. (state and "On" or "Off") .. ")"
        callback(state)
    end)
end

-- Agregar un Textbox
function UILibrary:AddTextbox(parent, text, placeholder, callback)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, -10, 0, 30)
    frame.Position = UDim2.new(0, 5, 0, (#parent:GetChildren() - 1) * 35 + 5)
    frame.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    frame.Parent = parent

    local label = self:AddElement(frame, "TextLabel", text, nil, {Size = UDim2.new(0.4, 0, 1, 0), Position = UDim2.new(0, 0, 0, 0)})

    local textbox = self:AddElement(frame, "TextBox", "", callback, {Size = UDim2.new(0.6, 0, 1, 0), Position = UDim2.new(0.4, 0, 0, 0), PlaceholderText = placeholder})
end

return UILibrary
