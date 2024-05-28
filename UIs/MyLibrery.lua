local UILib = {}

function UILib:CreateSG(name)
    local sg = Instance.new("ScreenGui")
    sg.Name = name
    sg.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    return sg
end

function UILib:CreateFrm(sg, title)
    local mf = Instance.new("Frame")
    mf.Size = UDim2.new(0, 250, 0, 400)
    mf.Position = UDim2.new(0.5, -125, 0.5, -200)
    mf.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    mf.Parent = sg

    local tl = Instance.new("TextLabel")
    tl.Size = UDim2.new(1, 0, 0, 30)
    tl.Text = title
    tl.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    tl.TextColor3 = Color3.fromRGB(255, 255, 255)
    tl.Parent = mf

    local mcf = Instance.new("Frame")
    mcf.Size = UDim2.new(1, 0, 1, -60)
    mcf.Position = UDim2.new(0, 0, 0, 30)
    mcf.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    mcf.Parent = mf

    local cf = Instance.new("Frame")
    cf.Size = UDim2.new(1, 0, 0, 30)
    cf.Position = UDim2.new(0, 0, 1, -30)
    cf.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    cf.Parent = mf

    local cl = Instance.new("TextLabel")
    cl.Size = UDim2.new(1, 0, 1, 0)
    cl.Text = "Credits: OneCreatorX"
    cl.TextColor3 = Color3.fromRGB(255, 255, 255)
    cl.Parent = cf

    return mf, mcf, cf
end

function UILib:AddElem(p, type, text, cb, props)
    local e = Instance.new(type)
    e.Size = UDim2.new(1, -10, 0, 30)
    e.Position = UDim2.new(0, 5, 0, (#p:GetChildren() - 1) * 35 + 5)
    e.Text = text
    e.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    e.TextColor3 = Color3.fromRGB(255, 255, 255)
    e.Parent = p

    if props then
        for k, v in pairs(props) do
            e[k] = v
        end
    end

    if cb then
        if type == "TextButton" then
            e.MouseButton1Click:Connect(cb)
        elseif type == "TextBox" then
            e.FocusLost:Connect(function(ep)
                if ep then
                    cb(e.Text)
                end
            end)
        end
    end

    return e
end

function UILib:AddBtn(p, text, cb)
    self:AddElem(p, "TextButton", text, cb)
end

function UILib:AddOptsBtn(p, text)
    local btn = self:AddElem(p, "TextButton", text)
    local of = Instance.new("Frame")
    of.Size = UDim2.new(1, -10, 0, 0)
    of.Position = UDim2.new(0, 5, 0, (#p:GetChildren()) * 35 + 5)
    of.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    of.ClipsDescendants = true
    of.Parent = p

    btn.MouseButton1Click:Connect(function()
        of.Size = of.Size == UDim2.new(1, -10, 0, 0) and UDim2.new(1, -10, 0, (#of:GetChildren() * 35)) or UDim2.new(1, -10, 0, 0)
    end)

    return btn, of
end

function UILib:AddTglBtn(p, text, defState, cb)
    local state = defState
    local btn = self:AddElem(p, "TextButton", text .. " (" .. (state and "On" or "Off") .. ")")
    btn.MouseButton1Click:Connect(function()
        state = not state
        btn.Text = text .. " (" .. (state and "On" or "Off") .. ")"
        cb(state)
    end)
end

function UILib:AddTB(p, text, ph, cb)
    local frm = Instance.new("Frame")
    frm.Size = UDim2.new(1, -10, 0, 30)
    frm.Position = UDim2.new(0, 5, 0, (#p:GetChildren() - 1) * 35 + 5)
    frm.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    frm.Parent = p

    local lbl = self:AddElem(frm, "TextLabel", text, nil, {Size = UDim2.new(0.4, 0, 1, 0), Position = UDim2.new(0, 0, 0, 0)})
    local tb = self:AddElem(frm, "TextBox", "", cb, {Size = UDim2.new(0.6, 0, 1, 0), Position = UDim2.new(0.4, 0, 0, 0), PlaceholderText = ph})
end

return UILib
