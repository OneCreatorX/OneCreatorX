local UL = {}
print("Version UI 0.1")

local uiProperties = {
    BackgroundColor3 = Color3.fromRGB(65, 65, 65),
    BackgroundTransparency = 0.8,
    TextColor3 = Color3.fromRGB(255, 255, 255),
    Font = Enum.Font.LuckiestGuy,
    TextSize = 13
}

function UL:CrSG(name)
    for _, gui in ipairs(game.Players.LocalPlayer:WaitForChild("PlayerGui"):GetChildren()) do
        if gui:IsA("ScreenGui") and gui:FindFirstChild("ULId") then
            gui:Destroy()
        end
    end

    local sg = Instance.new("ScreenGui")
    sg.Name = name
    sg.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    sg.ResetOnSpawn = false

    local id = Instance.new("BoolValue")
    id.Name = "ULId"
    id.Value = true
    id.Parent = sg

    return sg
end

function UL:CrFrm(parent, title)
    local frm = Instance.new("Frame")
    frm.Parent = parent
    frm.Size = UDim2.new(0.25, 0, 0, 60)
    frm.Position = UDim2.new(0.2, 0, 0.2, 0)
    frm.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    frm.BackgroundTransparency = 0.4
    frm.BorderSizePixel = 1
    frm.Active = true
    frm.Draggable = true

    local lbl = Instance.new("TextLabel")
lbl.Parent = frm
lbl.Text = title
lbl.Size = UDim2.new(1, 0, 0, 33)
lbl.Position = UDim2.new(0, 0, -0.02, 0)
lbl.BackgroundColor3 = Color3.fromRGB(128, 0, 128)
lbl.BackgroundTransparency = 0.8
lbl.TextColor3 = Color3.fromRGB(255, 255, 255) 
lbl.Font = Enum.Font.GothamSemibold
lbl.TextSize = 16
lbl.TextWrapped = true
lbl.TextXAlignment = Enum.TextXAlignment.Center
lbl.TextYAlignment = Enum.TextYAlignment.Center
    
    local tbtn = Instance.new("TextButton")
    tbtn.Parent = frm
    tbtn.Text = "+"
    tbtn.Size = UDim2.new(0, 30, 0, 30)
    tbtn.Position = UDim2.new(1, -30, 0, 0)
    for prop, value in pairs(uiProperties) do
        tbtn[prop] = value
    end

    local cfrm = Instance.new("Frame")
    cfrm.Parent = frm
    cfrm.Size = UDim2.new(1, 0, 1, -30)
    cfrm.Position = UDim2.new(0, 0, 0, 30)
    cfrm.BackgroundTransparency = 0.6
    cfrm.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    cfrm.Visible = false

    local crBtn = Instance.new("TextButton")
    crBtn.Parent = frm
    crBtn.Text = "Info Script"
    crBtn.Size = UDim2.new(1, 0, 0, 30)
    crBtn.Position = UDim2.new(0, 0, 1, -30)
    for prop, value in pairs(uiProperties) do
        crBtn[prop] = value
    end

    local crFrm = Instance.new("Frame")
    crFrm.Parent = parent
    crFrm.Size = UDim2.new(0.25, 0, 0.4, 60)
    crFrm.Position = UDim2.new(0.685, 0, 0.3, 0)
    crFrm.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    crFrm.BackgroundTransparency = 1
    crFrm.BorderSizePixel = 1
    crFrm.Visible = false

    local crLbl = Instance.new("TextLabel")
    crLbl.Parent = crFrm
    crLbl.Text = "Info/Updats/Credits"
    crLbl.Size = UDim2.new(1, 0, 0, 30)
    crLbl.Position = UDim2.new(0, 0, 0, 0)
    for prop, value in pairs(uiProperties) do
        crLbl[prop] = value
    end

    crFrm.Size = UDim2.new(0.25, 0, 0, 60 + #crFrm:GetChildren() * 60) 

    local minimized = true
    tbtn.MouseButton1Click:Connect(function()
        minimized = not minimized
        if minimized then
            cfrm.Visible = false
            tbtn.Text = "+"
            frm.Size = UDim2.new(0.25, 0, 0, 60)
        else
            cfrm.Visible = true
            tbtn.Text = "-"
            frm.Size = UDim2.new(0.25, 0, 0, 60 + #cfrm:GetChildren() * 30)
        end
    end)

    function gg()
        crFrm.BackgroundColor3 = crFrm.Visible and Color3.fromRGB(120, 0, 120) or Color3.fromRGB(65, 65, 65)
    end
    
    crBtn.MouseButton1Click:Connect(function()
        crFrm.Visible = not crFrm.Visible
            
             crBtn.BackgroundColor3 = crFrm.Visible and Color3.fromRGB(150, 0, 150) or Color3.fromRGB(65, 65, 65)
            gg()
    end)

    local function syncFrames()
        crFrm.Position = UDim2.new(frm.Position.X.Scale + frm.Size.X.Scale, frm.Position.X.Offset, frm.Position.Y.Scale, frm.Position.Y.Offset)
    end

    frm:GetPropertyChangedSignal("Position"):Connect(syncFrames)
    frm:GetPropertyChangedSignal("Size"):Connect(syncFrames)

    frm.Size = UDim2.new(0.25, 0, 0, 60 + #cfrm:GetChildren() * 30)
    crFrm.Size = UDim2.new(0.25, 0, 0, 60 + #crFrm:GetChildren() * 30) 

    return frm, cfrm, crFrm
end

function UL:AddBtn(parent, text, callback)
    local btn = Instance.new("TextButton")
    btn.Parent = parent
    btn.Text = text
    btn.Size = UDim2.new(1, 0, 0, 30)
    btn.Position = UDim2.new(0, 0, 0, #parent:GetChildren() * 30 - 30)
    for prop, value in pairs(uiProperties) do
        btn[prop] = value
    end

    btn.MouseButton1Click:Connect(callback)
    
    return btn
end

function UL:AddTBtn(parent, text, state, callback)
    local btn = Instance.new("TextButton")
    btn.Parent = parent
    btn.Text = text .. " (" .. (state and "✓" or "X") .. ")"
    btn.Size = UDim2.new(1, 0, 0, 30)
    btn.Position = UDim2.new(0, 0, 0, #parent:GetChildren() * 30 - 30)
    for prop, value in pairs(uiProperties) do
        btn[prop] = value
    end

    btn.MouseButton1Click:Connect(function()
        state = not state
        btn.Text = text .. " (" .. (state and "✓" or "X") .. ")"
        btn.BackgroundColor3 = state and Color3.fromRGB(85, 170, 85) or Color3.fromRGB(65, 65, 65)
        callback(state)
    end)

    return btn
end

function UL:AddTBox(parent, placeholder, callback)
    local box = Instance.new("TextBox")
    box.Parent = parent
    box.PlaceholderText = placeholder
    box.Text = placeholder
    box.BorderSizePixel = 2
    box.Size = UDim2.new(1, 0, 0, 28)
    box.Position = UDim2.new(0, 0, 0, #parent:GetChildren() * 30 - 30)
    for prop, value in pairs(uiProperties) do
        box[prop] = value
    end

    box.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            callback(box.Text)
        end
    end)

    return box
end

function UL:AddOBtn(parent, name)
    local oFrm = Instance.new("Frame")
    oFrm.Parent = parent.Parent
    oFrm.Size = UDim2.new(0.7, 0, 0.7, 0) 
    oFrm.Position = UDim2.new(parent.Position.X.Scale + 1, 0, parent.Position.Y.Scale, parent.Position.Y.Offset)
    oFrm.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    oFrm.BackgroundTransparency = 0.4
    oFrm.BorderSizePixel = 1
    oFrm.Visible = false

    local lbl = Instance.new("TextLabel")
    lbl.Parent = oFrm
    lbl.Text = name
    lbl.Size = UDim2.new(1, 0, 0, 30)
    lbl.Position = UDim2.new(0, 0, 0, 0)
    for prop, value in pairs(uiProperties) do
        lbl[prop] = value
    end

    local btn = Instance.new("TextButton")
    btn.Parent = parent
    btn.Text = name
    btn.Size = UDim2.new(1, 0, 0, 30)
    btn.Position = UDim2.new(0, 0, 0, #parent:GetChildren() * 30 - 30)
    for prop, value in pairs(uiProperties) do
        btn[prop] = value
    end

    function ff()
        oFrm.BackgroundColor3 = oFrm.Visible and Color3.fromRGB(100, 0, 0) or Color3.fromRGB(65, 65, 65)
    end
    
    btn.MouseButton1Click:Connect(function()
        oFrm.Visible = not oFrm.Visible
              btn.BackgroundColor3 = oFrm.Visible and Color3.fromRGB(130, 0, 0) or Color3.fromRGB(65, 65, 65)
            ff()
    end)

    return btn, oFrm
end

function UL:AddText(parent, text, color)
    local label = Instance.new("TextLabel")
    label.Parent = parent
    label.Text = text
    label.Size = UDim2.new(1, 0, 0, 30)
    label.Position = UDim2.new(0, 0, 0, #parent:GetChildren() * 30 - 30)
    label.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    label.BackgroundTransparency = 0.8
    label.TextColor3 = color or Color3.fromRGB(255, 255, 255)
    label.Font = Enum.Font.Ubuntu
    label.TextScaled = true
    label.TextSize = 12
    label.TextWrapped = true

    return label
end

game:GetService('Players').LocalPlayer.Idled:Connect(function()
    game:GetService('VirtualUser'):CaptureController()
    game:GetService('VirtualUser'):ClickButton2(Vector2.new())
end)
print("by: OneCreatorX")
return UL
