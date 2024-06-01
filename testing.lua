local UL = {}

local plr = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", plr.PlayerGui)
gui.Name = "LoadScr"

local mainFrm = Instance.new("Frame", gui)
mainFrm.Size = UDim2.new(0.25, 0, 0, 0)
mainFrm.Position = UDim2.new(0.375, 0, 0.2, 0)
mainFrm.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
mainFrm.BackgroundTransparency = 0.4
mainFrm.BorderSizePixel = 1
mainFrm.Active = true
mainFrm.Draggable = true

local function createBtn(parent, txt, yPos)
    local btn = Instance.new("TextButton", parent)
    btn.Text = txt
    btn.Size = UDim2.new(1, 0, 0, 30)
    btn.Position = UDim2.new(0, 0, 0, yPos)
    btn.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    btn.BackgroundTransparency = 0.8
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.LuckiestGuy
    btn.TextSize = 13
    return btn
end

local mainBtnsCount = 0

function UL:Button(txt)
    local yPos = 30 + mainBtnsCount * 30
    createBtn(mainFrm, txt, yPos)
    mainBtnsCount = mainBtnsCount + 1
    mainFrm.Size = UDim2.new(0.25, 0, 0, 30 + mainBtnsCount * 30)
end

function UL:Text(txt)
    local yPos = 30 + mainBtnsCount * 30
    local txtLabel = Instance.new("TextLabel", mainFrm)
    txtLabel.Text = txt
    txtLabel.Size = UDim2.new(1, 0, 0, 30)
    txtLabel.Position = UDim2.new(0, 0, 0, yPos)
    txtLabel.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    txtLabel.BackgroundTransparency = 0.8
    txtLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    txtLabel.Font = Enum.Font.LuckiestGuy
    txtLabel.TextSize = 13
    mainBtnsCount = mainBtnsCount + 1
    mainFrm.Size = UDim2.new(0.25, 0, 0, 30 + mainBtnsCount * 30)
end

function UL:Opc(txt)
    local yPos = 30 + mainBtnsCount * 30
    local opcBtn = createBtn(mainFrm, txt .. " <", yPos)
    mainBtnsCount = mainBtnsCount + 1
    mainFrm.Size = UDim2.new(0.25, 0, 0, 30 + mainBtnsCount * 30)

    local opcFrm = Instance.new("Frame", gui)
    opcFrm.Size = UDim2.new(0.25, 0, 0, 0)
    opcFrm.BackgroundTransparency = 1
    opcFrm.Visible = false

    opcBtn.MouseButton1Click:Connect(function()
        opcFrm.Visible = not opcFrm.Visible
        opcBtn.Text = opcFrm.Visible and txt .. " >" or txt .. " <"
    end)

    local opcBtnsCount = 0
    local obj = {}

    function obj:Button(txt)
        createBtn(opcFrm, txt, opcBtnsCount * 30)
        opcBtnsCount = opcBtnsCount + 1
        opcFrm.Size = UDim2.new(0.25, 0, 0, opcBtnsCount * 30)
    end

    return obj
end

local infoFrm = Instance.new("Frame", gui)
infoFrm.Size = UDim2.new(0.25, 0, 0, 0)
infoFrm.BackgroundTransparency = 1
infoFrm.Visible = false

local infoBtnsCount = 0

function UL:Info(txt)
    local yPos = 30 + mainBtnsCount * 30
    local infoBtn = createBtn(mainFrm, "Info <", yPos)
    mainBtnsCount = mainBtnsCount + 1
    mainFrm.Size = UDim2.new(0.25, 0, 0, 30 + mainBtnsCount * 30)

    infoBtn.MouseButton1Click:Connect(function()
        infoFrm.Visible = not infoFrm.Visible
        infoBtn.Text = infoFrm.Visible and "Info >" or "Info <"
    end)

    local obj = {}

    function obj:Button(txt)
        local btn = createBtn(infoFrm, txt, infoBtnsCount * 30)
        infoBtnsCount = infoBtnsCount + 1
        infoFrm.Size = UDim2.new(0.25, 0, 0, infoBtnsCount * 30)
        return btn
    end

    function obj:Text(txt)
        local txtLabel = Instance.new("TextLabel", infoFrm)
        txtLabel.Text = txt
        txtLabel.Size = UDim2.new(1, 0, 0, 30)
        txtLabel.Position = UDim2.new(0, 0, 0, infoBtnsCount * 30)
        txtLabel.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
        txtLabel.BackgroundTransparency = 0.8
        txtLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        txtLabel.Font = Enum.Font.LuckiestGuy
        txtLabel.TextSize = 13
        infoBtnsCount = infoBtnsCount + 1
        infoFrm.Size = UDim2.new(0.25, 0, 0, infoBtnsCount * 30)
        return txtLabel
    end

    return obj
end

function UL:SetTitle(txt)
    titleLbl.Text = txt
end

print("Versión")

return UL
