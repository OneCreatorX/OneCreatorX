local UL = {}

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

function UL:CrFrm(p, title)
    local frm = Instance.new("Frame")
    frm.Parent = p
    frm.Size = UDim2.new(0.35, 0, 0, 60)
    frm.Position = UDim2.new(0.325, 0, 0.3, 0)
    frm.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    frm.BackgroundTransparency = 0.1
    frm.BorderSizePixel = 0
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

    local cbtn = Instance.new("TextButton")
    cbtn.Parent = frm
    cbtn.Text = "Crédits: OneCreatorX"
    cbtn.Size = UDim2.new(1, 0, 0, 30)
    cbtn.Position = UDim2.new(0, 0, 1, -30)
    cbtn.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    cbtn.BackgroundTransparency = 0.2
    cbtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    cbtn.Font = Enum.Font.SourceSans
    cbtn.TextSize = 18

    local crFrm = Instance.new("Frame")
    crFrm.Parent = p
    crFrm.Size = UDim2.new(0.2, 0, 0.4, 0)
    crFrm.Position = UDim2.new(0.635, 0, 0.3, 0)
    crFrm.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    crFrm.BackgroundTransparency = 0.1
    crFrm.BorderSizePixel = 1
    crFrm.Visible = false

    local crLbl = Instance.new("TextLabel")
    crLbl.Parent = crFrm
    crLbl.Text = "Créditos"
    crLbl.Size = UDim2.new(1, 0, 0, 30)
    crLbl.Position = UDim2.new(0, 0, 0, 0)
    crLbl.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    crLbl.BackgroundTransparency = 0.2
    crLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
    crLbl.Font = Enum.Font.SourceSans
    crLbl.TextSize = 18

    local isMin = false
    tbtn.MouseButton1Click:Connect(function()
        isMin = not isMin
        cfrm.Visible = not isMin
        tbtn.Text = isMin and "+" or "-"
        frm.Size = UDim2.new(0.35, 0, 0, isMin and 60 or 60 + #cfrm:GetChildren() * 30)
    end)

    cbtn.MouseButton1Click:Connect(function()
        crFrm.Visible = not crFrm.Visible
    end)

    local function syncFrames()
        crFrm.Position = UDim2.new(frm.Position.X.Scale + frm.Size.X.Scale, frm.Position.X.Offset, frm.Position.Y.Scale, frm.Position.Y.Offset)
    end

    frm:GetPropertyChangedSignal("Position"):Connect(syncFrames)
    frm:GetPropertyChangedSignal("Size"):Connect(syncFrames)

    return frm, cfrm, crFrm
end

function UL:CrBtn(p, txt, cb)
    local btn = Instance.new("TextButton")
    btn.Parent = p
    btn.Text = txt
    btn.Size = UDim2.new(1, 0, 0, 30)
    btn.Position = UDim2.new(0, 0, 0, #p:GetChildren() * 30 - 30)
    btn.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    btn.BackgroundTransparency = 0.2
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.SourceSans
    btn.TextSize = 18
    btn.MouseButton1Click:Connect(cb)
    p.Parent.Size = UDim2.new(0.35, 0, 0, 60 + #p:GetChildren() * 30)
    return btn
end

function UL:AddBtn(p, txt, cb)
    return self:CrBtn(p, txt, cb)
end

function UL:AddTBtn(p, txt, state, cb)
    local btn = self:CrBtn(p, txt .. " (" .. (state and "On" or "Off") .. ")", function()
        state = not state
        btn.Text = txt .. " (" .. (state and "Off" or "On") .. ")"
        cb(state)
    end)
    return btn
end

function UL:AddTBox(p, placeholder, cb)
    local box = Instance.new("TextBox")
    box.Parent = p
    box.Text = ""
    box.PlaceholderText = placeholder
    box.Size = UDim2.new(1, 0, 0, 30)
    box.Position = UDim2.new(0, 0, 0, #p:GetChildren() * 30 - 30)
    box.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    box.BackgroundTransparency = 0.2
    box.TextColor3 = Color3.fromRGB(255, 255, 255)
    box.Font = Enum.Font.SourceSans
    box.TextSize = 18

    box.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            cb(box.Text)
        end
    end)

    p.Parent.Size = UDim2.new(0.35, 0, 0, 60 + #p:GetChildren() * 30)
    return box
end

function UL:AddOBtn(p, txt)
    local btn = self:CrBtn(p, txt, function() end)
    local oFrm = Instance.new("Frame")
    oFrm.Parent = p.Parent
    oFrm.Size = UDim2.new(0.25, 0, 0.4, 0)
    oFrm.Position = UDim2.new(1.02, 0, 0, 0)
    oFrm.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    oFrm.BackgroundTransparency = 0.1
    oFrm.BorderSizePixel = 0
    oFrm.Visible = false

    local oLbl = Instance.new("TextLabel")
    oLbl.Parent = oFrm
    oLbl.Text = txt
    oLbl.Size = UDim2.new(1, 0, 0, 30)
    oLbl.Position = UDim2.new(0, 0, 0, 0)
    oLbl.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    oLbl.BackgroundTransparency = 0.2
    oLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
    oLbl.Font = Enum.Font.SourceSans
    oLbl.TextSize = 18

    btn.MouseButton1Click:Connect(function()
        oFrm.Visible = not oFrm.Visible
