local UL = {}

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

function UL:CrSG(name)
    local sg = Instance.new("ScreenGui")
    sg.Name = name
    sg.Parent = LocalPlayer:WaitForChild("PlayerGui")
    return sg
end

function UL:CrFrm(parent, name)
    local frm = Instance.new("Frame")
    frm.Parent = parent
    frm.Name = name
    frm.Size = UDim2.new(0.3, 0, 0.4, 0)
    frm.Position = UDim2.new(0.35, 0, 0.3, 0)
    frm.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    frm.BorderSizePixel = 2

    local lbl = Instance.new("TextLabel")
    lbl.Parent = frm
    lbl.Text = name
    lbl.Size = UDim2.new(1, 0, 0, 30)
    lbl.Position = UDim2.new(0, 0, 0, 0)
    lbl.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    lbl.TextColor3 = Color3.fromRGB(255, 255, 255)
    lbl.Font = Enum.Font.SourceSans
    lbl.TextSize = 18

    local cfrm = Instance.new("Frame")
    cfrm.Parent = frm
    cfrm.Size = UDim2.new(1, 0, 1, -30)
    cfrm.Position = UDim2.new(0, 0, 0, 30)
    cfrm.BackgroundTransparency = 1

    return frm, cfrm
end

function UL:AddBtn(parent, name, callback)
    local btn = Instance.new("TextButton")
    btn.Parent = parent
    btn.Text = name
    btn.Size = UDim2.new(1, 0, 0, 30)
    btn.Position = UDim2.new(0, 0, 0, #parent:GetChildren() * 30 - 30)
    btn.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.SourceSans
    btn.TextSize = 18

    btn.MouseButton1Click:Connect(callback)

    parent.Size = UDim2.new(parent.Size.X.Scale, parent.Size.X.Offset, 0, #parent:GetChildren() * 30)

    return btn
end

function UL:AddTBtn(parent, name, state, callback)
    local tbtn = Instance.new("TextButton")
    tbtn.Parent = parent
    tbtn.Text = name
    tbtn.Size = UDim2.new(1, 0, 0, 30)
    tbtn.Position = UDim2.new(0, 0, 0, #parent:GetChildren() * 30 - 30)
    tbtn.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    tbtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    tbtn.Font = Enum.Font.SourceSans
    tbtn.TextSize = 18

    local function toggle()
        state = not state
        tbtn.BackgroundColor3 = state and Color3.fromRGB(85, 170, 85) or Color3.fromRGB(65, 65, 65)
        callback(state)
    end

    tbtn.MouseButton1Click:Connect(toggle)

    parent.Size = UDim2.new(parent.Size.X.Scale, parent.Size.X.Offset, 0, #parent:GetChildren() * 30)

    return tbtn
end

function UL:AddTBox(parent, placeholder, callback)
    local tbox = Instance.new("TextBox")
    tbox.Parent = parent
    tbox.PlaceholderText = placeholder
    tbox.Size = UDim2.new(1, 0, 0, 30)
    tbox.Position = UDim2.new(0, 0, 0, #parent:GetChildren() * 30 - 30)
    tbox.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    tbox.TextColor3 = Color3.fromRGB(255, 255, 255)
    tbox.Font = Enum.Font.SourceSans
    tbox.TextSize = 18

    tbox.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            callback(tbox.Text)
        end
    end)

    parent.Size = UDim2.new(parent.Size.X.Scale, parent.Size.X.Offset, 0, #parent:GetChildren() * 30)

    return tbox
end

function UL:AddOBtn(parent, name)
    local oFrm = Instance.new("Frame")
    oFrm.Parent = parent.Parent
    oFrm.Size = UDim2.new(0.35, 0, 0.4, 0)
    oFrm.Position = UDim2.new(parent.Position.X.Scale + 0.35, 0, parent.Position.Y.Scale, parent.Position.Y.Offset)
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

    parent.Parent.Size = UDim2.new(0.35, 0, 0, 60 + #parent:GetChildren() * 30)

    return btn, oFrm
end

function UL:AddCredits(parent, creditsText)
    local creditsBtn = Instance.new("TextButton")
    creditsBtn.Parent = parent
    creditsBtn.Text = creditsText
    creditsBtn.Size = UDim2.new(1, 0, 0, 30)
    creditsBtn.Position = UDim2.new(0, 0, 0, #parent:GetChildren() * 30 - 30)
    creditsBtn.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    creditsBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    creditsBtn.Font = Enum.Font.SourceSans
    creditsBtn.TextSize = 18

    creditsBtn.MouseButton1Click:Connect(function()
        setclipboard(creditsText)
    end)

    parent.Size = UDim2.new(parent.Size.X.Scale, parent.Size.X.Offset, 0, #parent:GetChildren() * 30)
    
    return creditsBtn
end

return UL
