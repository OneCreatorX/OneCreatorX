local UI = {}

-- Función base para crear botones
local function createButton(parent, text, callback)
    local btn = Instance.new("TextButton", parent)
    btn.Text = text
    btn.Size = UDim2.new(1, 0, 0, 30)
    btn.Position = UDim2.new(0, 0, 0, #parent:GetChildren() * 30 - 30)
    btn.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    btn.BackgroundTransparency = 0.2
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.SourceSans
    btn.TextSize = 18
    btn.MouseButton1Click:Connect(callback)
    return btn
end

function UI:CreateScreen(name)
    for _, gui in ipairs(game.Players.LocalPlayer:WaitForChild("PlayerGui"):GetChildren()) do
        if gui:IsA("ScreenGui") and gui:FindFirstChild("UILibId") then
            gui:Destroy()
        end
    end

    local scr = Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui"))
    scr.Name = name
    scr.ResetOnSpawn = false
    Instance.new("BoolValue", scr).Name = "UILibId" -- Identificador único
    return scr
end

function UI:CreateFrame(parent, title)
    local frm = Instance.new("Frame", parent)
    frm.Size = UDim2.new(0.35, 0, 0, 60)
    frm.Position = UDim2.new(0.325, 0, 0.3, 0)
    frm.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    frm.BackgroundTransparency = 0.1
    frm.BorderSizePixel = 0
    frm.Active = true
    frm.Draggable = true

    local titleLbl = Instance.new("TextLabel", frm)
    titleLbl.Text = title
    titleLbl.Size = UDim2.new(1, 0, 0, 30)
    titleLbl.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    titleLbl.BackgroundTransparency = 0.2
    titleLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLbl.Font = Enum.Font.SourceSans
    titleLbl.TextSize = 18

    local toggleBtn = createButton(frm, "-", function()
        isMinimized = not isMinimized
        if isMinimized then
            contentFrm.Visible = false
            toggleBtn.Text = "+"
            frm.Size = UDim2.new(0.35, 0, 0, 60)
        else
            contentFrm.Visible = true
            toggleBtn.Text = "-"
            frm.Size = UDim2.new(0.35, 0, 0, 60 + contentFrm.AbsoluteContentSize.Y) -- Ajustar tamaño al contenido
        end
    end)
    toggleBtn.Size = UDim2.new(0, 30, 0, 30)
    toggleBtn.Position = UDim2.new(1, -30, 0, 0)

    local contentFrm = Instance.new("Frame", frm)
    contentFrm.Size = UDim2.new(1, 0, 1, -60)
    contentFrm.Position = UDim2.new(0, 0, 0, 30)
    contentFrm.BackgroundTransparency = 1

    local creditsBtn = createButton(frm, "Créditos: OneCreatorX", function()
        creditsFrm.Visible = not creditsFrm.Visible
    end)
    creditsBtn.Size = UDim2.new(1, 0, 0, 30)
    creditsBtn.Position = UDim2.new(0, 0, 1, -30)

    local creditsFrm = Instance.new("Frame", parent)
    creditsFrm.Size = UDim2.new(0.2, 0, 0.4, 0)
    creditsFrm.Position = UDim2.new(0.635, 0, 0.3, 0)
    creditsFrm.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    creditsFrm.BackgroundTransparency = 0.1
    creditsFrm.BorderSizePixel = 1
    creditsFrm.Visible = false

    local creditsTitleLbl = Instance.new("TextLabel", creditsFrm)
    creditsTitleLbl.Text = "Créditos"
    creditsTitleLbl.Size = UDim2.new(1, 0, 0, 30)
    creditsTitleLbl.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    creditsTitleLbl.BackgroundTransparency = 0.2
    creditsTitleLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
    creditsTitleLbl.Font = Enum.Font.SourceSans
    creditsTitleLbl.TextSize = 18

    local isMinimized = false

    -- Sincronizar posición del Frame de créditos
    local function syncFrames()
        creditsFrm.Position = UDim2.new(frm.Position.X.Scale + frm.Size.X.Scale, frm.Position.X.Offset, frm.Position.Y.Scale, frm.Position.Y.Offset)
    end
    frm:GetPropertyChangedSignal("Position"):Connect(syncFrames)

    return frm, contentFrm, creditsFrm 
end

function UI:AddButton(parent, btnText, callback)
    local btn = createButton(parent, btnText, callback)
    parent.Parent.Size = UDim2.new(0.35, 0, 0, 60 + parent.AbsoluteContentSize.Y) -- Ajustar tamaño al contenido
    return btn
end

function UI:AddOptionsButton(parent, optionsName)
    local optionsFrm = Instance.new("Frame", parent.Parent)
    optionsFrm.Size = UDim2.new(0.25, 0, 0.4, 0)
    optionsFrm.Position = UDim2.new(1.02, 0, 0, 0)
    optionsFrm.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    optionsFrm.BackgroundTransparency = 0.1
    optionsFrm.BorderSizePixel = 0
    optionsFrm.Visible = false

    local optionsTitleLbl = Instance.new("TextLabel", optionsFrm)
    optionsTitleLbl.Text = optionsName
    optionsTitleLbl.Size = UDim2.new(1, 0, 0, 30)
    optionsTitleLbl.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    optionsTitleLbl.BackgroundTransparency = 0.2
    optionsTitleLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
    optionsTitleLbl.Font = Enum.Font.SourceSans
    optionsTitleLbl.TextSize = 18

    local btn = createButton(parent, optionsName, function()
        optionsFrm.Visible = not optionsFrm.Visible
    end)

    return btn, optionsFrm
end

function UI:AddToggleButton(parent, toggleText, defaultState, callback)
    local state = defaultState
    local btn = createButton(parent, toggleText .. " (" .. (state and "On" or "Off") .. ")", function()
        state = not state
        btn.Text = toggleText .. " (" .. (state and "On" or "Off") .. ")"
        callback(state)
    end)
    parent.Parent.Size = UDim2.new(0.35, 0, 0, 60 + parent.AbsoluteContentSize.Y)
    return btn
end

function UI:AddTextbox(parent, textboxText, defaultText, callback)
    local frm = Instance.new("Frame", parent)
    frm.Size = UDim2.new(1, 0, 0, 30)
    frm.Position = UDim2.new(0, 0, 0, #parent:GetChildren() * 30 - 30)
    frm.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    frm.BackgroundTransparency = 0.2

    local label = Instance.new("TextLabel", frm)
    label.Text = textboxText
    label.Size = UDim2.new(0.4, 0, 1, 0)
    label.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    label.BackgroundTransparency = 0.2
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Font = Enum.Font.SourceSans
    label.TextSize = 18

    local textbox = Instance.new("TextBox", frm)
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

    parent.Parent.Size = UDim2.new(0.35, 0, 0, 60 + parent.AbsoluteContentSize.Y)

    return frm, textbox
end

return UI
