local Lib = {}

-- Colores
Lib.C = {
    BG = Color3.fromRGB(30, 30, 30),
    Txt = Color3.fromRGB(255, 255, 255),
    Btn = Color3.fromRGB(50, 150, 255),
    TglBtn = Color3.fromRGB(255, 100, 100),
}

-- Fuentes
Lib.F = {
    Main = Enum.Font.SourceSans,
}

-- Tamaños predefinidos
Lib.S = {
    Wnd = UDim2.new(0.4, 0, 0.5, 0),
    Btn = UDim2.new(0.8, 0, 0.1, 0),
    TglBtn = UDim2.new(0.8, 0, 0.1, 0),
    TxtBox = UDim2.new(0.8, 0, 0.1, 0),
}

-- Transparencias
Lib.T = {
    BG = 0.9,
    Btn = 0.8,
    TglBtn = 0.8,
}

-- Espaciado
Lib.P = {
    Elem = 5,
    Fr = 10,
}

function Lib:S(parent, txt, cb)
    local b = self:_CBtn(parent, txt, cb, self.S.Btn, self.T.Btn)
    self:_P(parent, b)
    return b
end

function Lib:T(parent, txt, cb)
    local b = self:_CBtn(parent, txt, cb, self.S.TglBtn, self.T.TglBtn)
    self:_P(parent, b)
    return b
end

function Lib:_CBtn(parent, txt, cb, bg, hover)
    local b = Instance.new("TextButton")
    b.Parent = parent
    b.Text = txt
    b.Size = self.S.Btn
    b.BackgroundColor3 = bg
    b.TextColor3 = self.C.Txt
    b.Font = self.F.Main
    b.TextScaled = true
    b.BackgroundTransparency = self.T.Btn

    b.MouseButton1Click:Connect(cb)

    b.MouseEnter:Connect(function()
        b.BackgroundColor3 = hover
    end)

    b.MouseLeave:Connect(function()
        b.BackgroundColor3 = bg
    end)

    return b
end

function Lib:_P(parent, elem)
    local yPos = parent.AbsoluteSize.Y + self.P.Fr
    elem.Position = UDim2.new(0.5, 0, 0, yPos)
end

function Lib:CreateTextBox(parent, placeholder, cb)
    local tb = Instance.new("TextBox")
    tb.Parent = parent
    tb.PlaceholderText = placeholder
    tb.Size = self.S.TxtBox
    tb.BackgroundColor3 = self.C.Btn
    tb.TextColor3 = self.C.Txt
    tb.Font = self.F.Main
    tb.TextScaled = true
    tb.BackgroundTransparency = self.T.Btn

    tb.FocusLost:Connect(function(enter)
        if enter then
            cb(tb.Text)
        end
    end)

    self:_P(parent, tb)

    return tb
end

return Lib
