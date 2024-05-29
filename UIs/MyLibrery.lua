local UI = {}

-- Función base para botones (mantenemos esta versión por ahora)
local function b(p, t, f)
    local btn = Instance.new("TextButton", p)
    btn.Text = t
    btn.Size = UDim2.new(1, 0, 0, 30)
    btn.Position = UDim2.new(0, 0, 0, #p:GetChildren() * 30 - 30)
    btn.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    btn.BackgroundTransparency = 0.2
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.SourceSans
    btn.TextSize = 18
    btn.MouseButton1Click:Connect(f)
    return btn
end

function UI:CreateScr(n)
    for _, gui in ipairs(game.Players.LocalPlayer:WaitForChild("PlayerGui"):GetChildren()) do
        if gui:IsA("ScreenGui") and gui:FindFirstChild("UIid") then
            gui:Destroy()
        end
    end
    local scr = Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui"))
    scr.Name = n
    scr.ResetOnSpawn = false
    Instance.new("BoolValue", scr).Name = "UIid"
    return scr
end

function UI:CreateFrm(p, tit)
    local frm = Instance.new("Frame", p)
    frm.Size = UDim2.new(0.35, 0, 0, 60)
    frm.Position = UDim2.new(0.325, 0, 0.3, 0)
    frm.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    frm.BackgroundTransparency = 0.1
    frm.BorderSizePixel = 0
    frm.Active = true
    frm.Draggable = true

    local titLbl = Instance.new("TextLabel", frm)
    titLbl.Text = tit
    titLbl.Size = UDim2.new(1, 0, 0, 30)
    titLbl.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    titLbl.BackgroundTransparency = 0.2
    titLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
    titLbl.Font = Enum.Font.SourceSans
    titLbl.TextSize = 18

    local tBtn = b(frm, "-", function()
        isMinimized = not isMinimized
        if isMinimized then
            cntFrm.Visible = false
            tBtn.Text = "+"
            frm.Size = UDim2.new(0.35, 0, 0, 60)
        else
            cntFrm.Visible = true
            tBtn.Text = "-"
            -- Calcular tamaño después de hacer visible el contenido
            frm.Size = UDim2.new(0.35, 0, 0, 60 + cntFrm.AbsoluteContentSize.Y) 
        end
    end)
    tBtn.Size = UDim2.new(0, 30, 0, 30)
    tBtn.Position = UDim2.new(1, -30, 0, 0)

    local cntFrm = Instance.new("Frame", frm)
    cntFrm.Size = UDim2.new(1, 0, 1, -60)
    cntFrm.Position = UDim2.new(0, 0, 0, 30)
    cntFrm.BackgroundTransparency = 1

    local cBtn = b(frm, "Créditos: OneCreatorX", function()
        cFrm.Visible = not cFrm.Visible
    end)
    cBtn.Size = UDim2.new(1, 0, 0, 30)
    cBtn.Position = UDim2.new(0, 0, 1, -30)

    local cFrm = Instance.new("Frame", p)
    cFrm.Size = UDim2.new(0.2, 0, 0.4, 0)
    cFrm.Position = UDim2.new(0.635, 0, 0.3, 0)
    cFrm.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    cFrm.BackgroundTransparency = 0.1
    cFrm.BorderSizePixel = 1
    cFrm.Visible = false

    local cTitLbl = Instance.new("TextLabel", cFrm)
    cTitLbl.Text = "Créditos"
    cTitLbl.Size = UDim2.new(1, 0, 0, 30)
    cTitLbl.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    cTitLbl.BackgroundTransparency = 0.2
    cTitLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
    cTitLbl.Font = Enum.Font.SourceSans
    cTitLbl.TextSize = 18

    local isMinimized = false

    local function syncFrm()
        cFrm.Position = UDim2.new(frm.Position.X.Scale + frm.Size.X.Scale, frm.Position.X.Offset, frm.Position.Y.Scale, frm.Position.Y.Offset)
    end
    frm:GetPropertyChangedSignal("Position"):Connect(syncFrm)

    return frm, cntFrm, cFrm
end

function UI:AddBtn(p, txt, f)
    local btn = b(p, txt, f)
    -- Forzar actualización del tamaño del padre
    p.Parent.Size = UDim2.new(0.35, 0, 0, 60 + p.AbsoluteContentSize.Y) 
    return btn
end

function UI:AddOptBtn(p, optName)
    local optFrm = Instance.new("Frame", p.Parent)
    optFrm.Size = UDim2.new(0.25, 0, 0.4, 0)
    optFrm.Position = UDim2.new(1.02, 0, 0, 0)
    optFrm.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    optFrm.BackgroundTransparency = 0.1
    optFrm.BorderSizePixel = 0
    optFrm.Visible = false

    local optTitLbl = Instance.new("TextLabel", optFrm)
    optTitLbl.Text = optName
    optTitLbl.Size = UDim2.new(1, 0, 0, 30)
    optTitLbl.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    optTitLbl.BackgroundTransparency = 0.2
    optTitLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
    optTitLbl.Font = Enum.Font.SourceSans
    optTitLbl.TextSize = 18

    local btn = b(p, optName, function()
        optFrm.Visible = not optFrm.Visible
    end)

    return btn, optFrm
end

function UI:AddTBtn(p, tTxt, dState, f)
    local state = dState
    local btn = b(p, tTxt .. " (" .. (state and "On" or "Off") .. ")", function()
        state = not state
        btn.Text = tTxt .. " (" .. (state and "On" or "Off") .. ")"
        f(state)
    end)
    p.Parent.Size = UDim2.new(0.35, 0, 0, 60 + p.AbsoluteContentSize.Y) 
    return btn
end

function UI:AddTxtbox(p, txt, dTxt, f)
    local frm = Instance.new("Frame", p)
    frm.Size = UDim2.new(1, 0, 0, 30)
    frm.Position = UDim2.new(0, 0, 0, #p:GetChildren() * 30 - 30)
    frm.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    frm.BackgroundTransparency = 0.2

    local lbl = Instance.new("TextLabel", frm)
    lbl.Text = txt
    lbl.Size = UDim2.new(0.4, 0, 1, 0)
    lbl.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    lbl.BackgroundTransparency = 0.2
    lbl.TextColor3 = Color3.fromRGB(255, 255, 255)
    lbl.Font = Enum.Font.SourceSans
    lbl.TextSize = 18

    local txtbox = Instance.new("TextBox", frm)
    txtbox.Text = dTxt or ""
    txtbox.Size = UDim2.new(0.6, 0, 1, 0)
    txtbox.Position = UDim2.new(0.4, 0, 0, 0)
    txtbox.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    txtbox.BackgroundTransparency = 0.2
    txtbox.TextColor3 = Color3.fromRGB(255, 255, 255)
    txtbox.Font = Enum.Font.SourceSans
    txtbox.TextSize = 18
    txtbox.FocusLost:Connect(function(enterPressed)
        if enterPressed then f(txtbox.Text) end
    end)

    p.Parent.Size = UDim2.new(0.35, 0, 0, 60 + p.AbsoluteContentSize.Y)

    return frm, txtbox
end

return UI
