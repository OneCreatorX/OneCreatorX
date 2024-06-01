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

local gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name

local function cleanGameName(name)
    name = name:gsub("%b[]", "")
    name = name:match("^[^:]*")
    return name:match("^%s*(.-)%s*$")
end

gameName = cleanGameName(gameName)

local titleLbl = Instance.new("TextLabel", mainFrm)
titleLbl.Text = gameName
titleLbl.Size = UDim2.new(1, 0, 0, 30)
titleLbl.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
titleLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLbl.Font = Enum.Font.LuckiestGuy
titleLbl.TextSize = 14

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

local opcBtn
local opcFrm

function UL:Opc(txt)
    local yPos = 30 + mainBtnsCount * 30
    opcBtn = createBtn(mainFrm, txt .. " <", yPos)
    mainBtnsCount = mainBtnsCount + 1
    mainFrm.Size = UDim2.new(0.25, 0, 0, 30 + mainBtnsCount * 30)

    opcFrm = Instance.new("Frame", gui)
    opcFrm.Size = UDim2.new(0.25, 0, 0, 0)
    opcFrm.BackgroundTransparency = 1
    opcFrm.Visible = false

    local function adjustOpcFrmPosition()
        local mainFrmAbsolutePos = mainFrm.AbsolutePosition
        opcFrm.Position = UDim2.new(0, mainFrmAbsolutePos.X + mainFrm.AbsoluteSize.X, 0, mainFrmAbsolutePos.Y)
    end

    opcBtn.MouseButton1Click:Connect(function()
        opcFrm.Visible = not opcFrm.Visible
        opcBtn.Text = opcFrm.Visible and txt .. " >" or txt .. " <"
        if opcFrm.Visible then
            adjustOpcFrmPosition()
        end
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

local function adjustInfoFrmPosition()
    local mainFrmAbsolutePos = mainFrm.AbsolutePosition
    infoFrm.Position = UDim2.new(0, mainFrmAbsolutePos.X + mainFrm.AbsoluteSize.X + 5, 0, mainFrmAbsolutePos.Y)
end

local function adjustOpcFrmPosition()
    local mainFrmAbsolutePos = mainFrm.AbsolutePosition
    opcFrm.Position = UDim2.new(0, mainFrmAbsolutePos.X + mainFrm.AbsoluteSize.X, 0, mainFrmAbsolutePos.Y)
end

local function adjustFramesPosition()
    adjustInfoFrmPosition()
    adjustOpcFrmPosition()
end

mainFrm:GetPropertyChangedSignal("Position"):Connect(adjustFramesPosition)

local infoBtn = createBtn(mainFrm, "Info <", 30 + mainBtnsCount * 30)
mainBtnsCount = mainBtnsCount + 1
mainFrm.Size = UDim2.new(0.25, 0, 0, 30 + mainBtnsCount * 30)

infoBtn.MouseButton1Click:Connect(function()
    infoFrm.Visible = not infoFrm.Visible
    infoBtn.Text = infoFrm.Visible and "Info >" or "Info <"
    if infoFrm.Visible then
        adjustInfoFrmPosition()
    end
end)

local infoBtnsCount = 0

function UL:Info(txt)
    createBtn(infoFrm, txt, infoBtnsCount * 30)
    infoBtnsCount = infoBtnsCount + 1
    infoFrm.Size = UDim2.new(0.25, 0, 0, infoBtnsCount * 30)
end

function UL:SetTitle(txt)
    titleLbl.Text = txt
end

print("Versión 31")

return UL
