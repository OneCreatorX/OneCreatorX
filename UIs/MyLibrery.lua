local UL = {}
print("Version UI 0.4")
local p = game.Players.LocalPlayer

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
    frm.Size = UDim2.new(0.25, 0, 0, 30)
    frm.Position = UDim2.new(0.325, 0, 0.3, 0)
    frm.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    frm.BackgroundTransparency = 0.1
    frm.BorderSizePixel = 2
    frm.Active = true
    frm.Draggable = true

    local lbl = Instance.new("TextLabel")
    lbl.Parent = frm
    lbl.Text = title
    lbl.Size = UDim2.new(1, 0, 0, 30)
    lbl.Position = UDim2.new(0, 0, 0, 0)
    lbl.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    lbl.BackgroundTransparency = 0.2
    lbl.TextColor3 = Color3.fromRGB(255, 255, 255)
    lbl.Font = Enum.Font.SourceSans
    lbl.TextSize = 18

    local tbtn = Instance.new("TextButton")
    tbtn.Parent = frm
    tbtn.Text = "-"
    tbtn.Size = UDim2.new(0, 30, 0, 30)
    tbtn.Position = UDim2.new(1, -30, 0, 0)
    tbtn.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    tbtn.BackgroundTransparency = 0.2
    tbtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    tbtn.Font = Enum.Font.SourceSans
    tbtn.TextSize = 18

    local cfrm = Instance.new("Frame")
    cfrm.Parent = frm
    cfrm.Size = UDim2.new(1, 0, 1, -60)
    cfrm.Position = UDim2.new(0, 0, 0, 30)
    cfrm.BackgroundTransparency = 1

    local crBtn = Instance.new("TextButton")
    crBtn.Parent = frm
    crBtn.Text = "Info Script"
    crBtn.Size = UDim2.new(1, 0, 0, 30)
    crBtn.Position = UDim2.new(0, 0, 1, -30)
    crBtn.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    crBtn.BackgroundTransparency = 0.2
    crBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    crBtn.Font = Enum.Font.SourceSans
    crBtn.TextSize = 18

    local crFrm = Instance.new("Frame")
    crFrm.Parent = parent
    crFrm.Size = UDim2.new(0.25, 0, 0.4, 0)
    crFrm.Position = UDim2.new(0.685, 0, 0.3, 0)
    crFrm.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    crFrm.BackgroundTransparency = 0.1
    crFrm.BorderSizePixel = 1
    crFrm.Visible = false

    local crLbl = Instance.new("TextLabel")
    crLbl.Parent = crFrm
    crLbl.Text = "Info/Updats/Credits"
    crLbl.Size = UDim2.new(1, 0, 0, 30)
    crLbl.Position = UDim2.new(0, 0, 0, 0)
    crLbl.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    crLbl.BackgroundTransparency = 0.2
    crLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
    crLbl.Font = Enum.Font.SourceSans
    crLbl.TextSize = 18
    
    -- Actualiza el tamaño del frame info al agregar elementos
    crFrm.Size = UDim2.new(0.25, 0, 0, 30 + #crFrm:GetChildren() * 30) 

    local minimized = false
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

    crBtn.MouseButton1Click:Connect(function()
        crFrm.Visible = not crFrm.Visible
    end)

    local function syncFrames()
        crFrm.Position = UDim2.new(frm.Position.X.Scale + frm.Size.X.Scale, frm.Position.X.Offset, frm.Position.Y.Scale, frm.Position.Y.Offset)
    end

    frm:GetPropertyChangedSignal("Position"):Connect(syncFrames)
    frm:GetPropertyChangedSignal("Size"):Connect(syncFrames)

    return frm, cfrm, crFrm
end

function UL:AddBtn(parent, text, callback)
    local btn = Instance.new("TextButton")
    btn.Parent = parent
    btn.Text = text
    btn.Size = UDim2.new(1, 0, 0, 30)
    -- Ajusta la posición del botón en función del número de hijos del frame info
    btn.Position = UDim2.new(0, 0, 0, #parent:GetChildren() * 30 - 30) 
    btn.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    btn.BackgroundTransparency = 0.2
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.SourceSans
    btn.TextSize = 18

    btn.MouseButton1Click:Connect(callback)

    -- Actualiza el tamaño del frame info solo si se está agregando un botón a crFrm
    if parent.Parent == crFrm then 
        parent.Parent.Size = UDim2.new(0.25, 0, 0, 30 + #crFrm:GetChildren() * 30)
    else
        parent.Parent.Size = UDim2.new(0.25, 0, 0, 60 + #parent:GetChildren() * 30)
    end

    return btn
end

function UL:AddTBtn(parent, text, state, callback)
    local btn = Instance.new("TextButton")
    btn.Parent = parent
    btn.Text = text .. " (" .. (state and "✓" or "X") .. ")"
    btn.Size = UDim2.new(1, 0, 0, 30)
    btn.Position = UDim2.new(0, 0, 0, #parent:GetChildren() * 30 - 30)
    btn.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    btn.BackgroundTransparency = 0.2
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.SourceSans
    btn.TextSize = 18

    btn.MouseButton1Click:Connect(function()
        state = not state
        btn.Text = text .. " (" .. (state and "✓" or "X") .. ")"
            btn.BackgroundColor3 = state and Color3.fromRGB(85, 170, 85) or Color3.fromRGB(65, 65, 65)
        callback(state)
    end)

    parent.Parent.Size = UDim2.new(0.25, 0, 0, 60 + #parent:GetChildren() * 30)

    return btn
end

function UL:AddTBox(parent, placeholder, callback)
    local box = Instance.new("TextBox")
    box.Parent = parent
    box.PlaceholderText = placeholder
    box.Text = placeholder
    box.Size = UDim2.new(1, 0, 0, 30)
    box.Position = UDim2.new(0, 0, 0, #parent:GetChildren() * 30 - 30)
    box.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    box.BackgroundTransparency = 0.2
    box.TextColor3 = Color3.fromRGB(255, 255, 255)
    box.Font = Enum.Font.SourceSans
    box.TextSize = 18

    box.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            callback(box.Text)
        end
    end)

    parent.Parent.Size = UDim2.new(0.35, 0, 0, 60 + #parent:GetChildren() * 30)

    return box
end

function UL:AddOBtn(parent, name)
    local oFrm = Instance.new("Frame")
    oFrm.Parent = parent.Parent
    oFrm.Size = UDim2.new(0.7, 0, 0.9, 0) 
    oFrm.Position = UDim2.new(parent.Position.X.Scale + 1, 0, parent.Position.Y.Scale, parent.Position.Y.Offset)
    oFrm.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    oFrm.BackgroundTransparency = 0.1
    oFrm.BorderSizePixel = 1
    oFrm.Visible = false

    local lbl = Instance.new("TextLabel")
    lbl.Parent = oFrm
    lbl.Text = name
    lbl.Size = UDim2.new(1, 0, 0, 30)
    lbl.Position = UDim2.new(0, 0, 0, 0)
    lbl.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    lbl.BackgroundTransparency = 0.2
    lbl.TextColor3 = Color3.fromRGB(255, 255, 255)
    lbl.Font = Enum.Font.SourceSans
    lbl.TextSize = 18

    local btn = Instance.new("TextButton")
    btn.Parent = parent
    btn.Text = name
    btn.Size = UDim2.new(1, 0, 0, 30)
    btn.Position = UDim2.new(0, 0, 0, #parent:GetChildren() * 30 - 30)
    btn.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    btn.BackgroundTransparency = 0.2
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.SourceSans
    btn.TextSize = 18

    btn.MouseButton1Click:Connect(function()
        oFrm.Visible = not oFrm.Visible
    end)

    parent.Parent.Size = UDim2.new(0.25, 0, 0, 60 + #parent:GetChildren() * 30)

    return btn, oFrm
end

game:GetService('Players').LocalPlayer.Idled:Connect(function()
game:GetService('VirtualUser'):CaptureController()   game:GetService('VirtualUser'):ClickButton2(Vector2.new())
end)
print("Anti AFK including")
print("by: OneCreatorX")
return UL
