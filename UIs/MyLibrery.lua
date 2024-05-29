local UL = {}

function UL:CrSG(name)
    for _, gui in ipairs(game.Players.LocalPlayer:WaitForChild("PlayerGui"):GetChildren()) do
        if gui:IsA("ScreenGui") and gui:FindFirstChild("ULIdentifier") then
            gui:Destroy()
        end
    end

    local sg = Instance.new("ScreenGui")
    sg.Name = name
    sg.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    sg.ResetOnSpawn = false

    local id = Instance.new("BoolValue")
    id.Name = "ULIdentifier"
    id.Value = true
    id.Parent = sg

    return sg
end

function UL:CrFrm(parent, title)
    local frm = Instance.new("Frame")
    frm.Parent = parent
    frm.Size = UDim2.new(0.30, 0, 0, 30)
    frm.Position = UDim2.new(0.325, 0, 0.3, 0)
    frm.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    frm.BackgroundTransparency = 0.1
    frm.BorderSizePixel = 0
    frm.Active = true
    frm.Draggable = true

    local tLbl = Instance.new("TextLabel")
    tLbl.Parent = frm
    tLbl.Text = title
    tLbl.Size = UDim2.new(1, 0, 0, 30)
    tLbl.Position = UDim2.new(0, 0, 0, 0)
    tLbl.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    tLbl.BackgroundTransparency = 0.2
    tLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
    tLbl.Font = Enum.Font.SourceSans
    tLbl.TextSize = 18

    local tBtn = Instance.new("TextButton")
    tBtn.Parent = frm
    tBtn.Text = "-"
    tBtn.Size = UDim2.new(0, 30, 0, 30)
    tBtn.Position = UDim2.new(1, -30, 0, 0)
    tBtn.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    tBtn.BackgroundTransparency = 0.2
    tBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    tBtn.Font = Enum.Font.SourceSans
    tBtn.TextSize = 18

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
    crFrm.Size = UDim2.new(0.2, 0, 0.4, 0)
    crFrm.Position = UDim2.new(0.635, 0, 0.3, 0)
    crFrm.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    crFrm.BackgroundTransparency = 0.1
    crFrm.BorderSizePixel = 1
    crFrm.Visible = false

    local crTLbl = Instance.new("TextLabel")
    crTLbl.Parent = crFrm
    crTLbl.Text = "Créditos"
    crTLbl.Size = UDim2.new(1, 0, 0, 30)
    crTLbl.Position = UDim2.new(0, 0, 0, 0)
    crTLbl.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    crTLbl.BackgroundTransparency = 0.2
    crTLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
    crTLbl.Font = Enum.Font.SourceSans
    crTLbl.TextSize = 18
    
    local isMin = false
    tBtn.MouseButton1Click:Connect(function()
        isMin = not isMin
        if isMin then
            cfrm.Visible = false
            tBtn.Text = "+"
            frm.Size = UDim2.new(0.35, 0, 0, 60)
        else
            cfrm.Visible = true
            tBtn.Text = "-"
            frm.Size = UDim2.new(0.35, 0, 0, 60 + #cfrm:GetChildren() * 30)
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

function UL:AddBtn(parent, text, cb)
    local btn = Instance.new("TextButton")
    btn.Parent = parent
    btn.Text = text
    btn.Size = UDim2.new(1, 0, 0, 30)
    btn.Position = UDim2.new(0, 0, 0, #parent:GetChildren() * 30 - 30)
    btn.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    btn.BackgroundTransparency = 0.2
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.SourceSans
    btn.TextSize = 18

    btn.MouseButton1Click:Connect(cb)

    parent.Parent.Size = UDim2.new(0.35, 0, 0, 60 + #parent:GetChildren() * 30)

    return btn
end

function UL:AddTBtn(parent, text, default, cb)
    local btn = Instance.new("TextButton")
    btn.Parent = parent
    btn.Text = text .. " (" .. (default and "✓" or "X") .. ")"
    btn.Size = UDim2.new(1, 0, 0, 30)
    btn.Position = UDim2.new(0, 0, 0, #parent:GetChildren() * 30 - 30)
    btn.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    btn.BackgroundTransparency = 0.2
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.SourceSans
    btn.TextSize = 18

    local state = default

    btn.MouseButton1Click:Connect(function()
        state = not state
        btn.Text = text .. " (" .. (state and "X" or "✓") .. ")"
        cb(state)
    end)

    parent.Parent.Size = UDim2.new(0.35, 0, 0, 60 + #parent:GetChildren() * 30)

    return btn
end

function UL:AddTBox(parent, placeholder, cb)
    local tbox = Instance.new("TextBox")
    tbox.Parent = parent
    tbox.PlaceholderText = placeholder
    tbox.Size = UDim2.new(1, 0, 0, 30)
    tbox.Position = UDim2.new(0, 0, 0, #parent:GetChildren() * 30 - 30)
    tbox.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    tbox.BackgroundTransparency = 0.2
    tbox.TextColor3 = Color3.fromRGB(255, 255, 255)
    tbox.Font = Enum.Font.SourceSans
    tbox.TextSize = 18

    tbox.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            cb(tbox.Text)
        end
    end)

    parent.Parent.Size = UDim2.new(0.35, 0, 0, 60 + #parent:GetChildren() * 30)

    return tbox
end

function UL:AddOBtn(parent, name)
    local oFrm = Instance.new("Frame")
    oFrm.Parent = parent.Parent
    oFrm.Size = UDim2.new(0.8, 0, 0.8, 0)
    oFrm.Position = UDim2.new(parent.Position.X.Scale + 0.75, 0, parent.Position.Y.Scale, parent.Position.Y.Offset)
    oFrm.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    oFrm.BackgroundTransparency = 0.1
    oFrm.BorderSizePixel = 1
    oFrm.Visible = false

    local oLbl = Instance.new("TextLabel")
    oLbl.Parent = oFrm
    oLbl.Text = name
    oLbl.Size = UDim2.new(1, 0, 0, 30)
    oLbl.Position = UDim2.new(0, 0, 0, 0)
    oLbl.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    oLbl.BackgroundTransparency = 0.2
    oLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
    oLbl.Font = Enum.Font.SourceSans
    oLbl.TextSize = 18

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

    parent.Parent.Size = UDim2.new(0.35, 0, 0, 60 + #parent:GetChildren() * 30)

    return btn, oFrm
end

return UL
