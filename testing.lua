local UL = {}

local plr = game.Players.LocalPlayer
local guiId = "LoadScr"
local existingGui = plr.PlayerGui:FindFirstChild(guiId)

if existingGui then
    existingGui:Destroy()
end

local gui = Instance.new("ScreenGui", plr.PlayerGui)
gui.Name = guiId

local mainFrm = Instance.new("Frame", gui)
mainFrm.Size, mainFrm.Position = UDim2.new(0.25, 0, 0, 0), UDim2.new(0.375, 0, 0.2, 0)
mainFrm.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
mainFrm.BackgroundTransparency, mainFrm.BorderSizePixel = 0.4, 1
mainFrm.Active, mainFrm.Draggable = true, true

local gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
gameName = gameName:gsub("%b[]", ""):match("^[^:]*"):match("^%s*(.-)%s*$")

local titleLbl = Instance.new("TextLabel", mainFrm)
titleLbl.Text, titleLbl.Size = gameName, UDim2.new(1, 0, 0, 30)
titleLbl.BackgroundColor3, titleLbl.TextColor3 = Color3.fromRGB(35, 35, 35), Color3.fromRGB(255, 255, 255)
titleLbl.Font, titleLbl.TextSize = Enum.Font.LuckiestGuy, 14

local function createBtn(parent, txt, yPos, callback)
    local btn = Instance.new("TextButton", parent)
    btn.Text, btn.Size, btn.Position = txt, UDim2.new(1, 0, 0, 30), UDim2.new(0, 0, 0, yPos)
    btn.BackgroundColor3, btn.BackgroundTransparency = Color3.fromRGB(65, 65, 65), 0.8
    btn.TextColor3, btn.Font, btn.TextSize = Color3.fromRGB(255, 255, 255), Enum.Font.LuckiestGuy, 13
    if callback then
        btn.MouseButton1Click:Connect(callback)
    end
    return btn
end

local mainBtnsCount = 0

function UL:Button(txt, callback)
    local yPos = 30 + mainBtnsCount * 30
    local btn = createBtn(mainFrm, txt, yPos, callback)
    mainBtnsCount = mainBtnsCount + 1
    mainFrm.Size = UDim2.new(0.25, 0, 0, 30 + mainBtnsCount * 30)
end

local opcBtns = {}

function UL:Opc(txt)
    local yPos = 30 + mainBtnsCount * 30
    local btn = createBtn(mainFrm, txt .. " <", yPos)
    mainBtnsCount = mainBtnsCount + 1
    mainFrm.Size = UDim2.new(0.25, 0, 0, 30 + mainBtnsCount * 30)

    local opcFrm = Instance.new("Frame", gui)
    opcFrm.Size, opcFrm.BackgroundTransparency = UDim2.new(0.25, 0, 0, 0), 1
    opcFrm.Visible = false

    local function adjustOpcFrmPosition()
        local mainFrmAbsolutePos = mainFrm.AbsolutePosition
        opcFrm.Position = UDim2.new(0, mainFrmAbsolutePos.X + mainFrm.AbsoluteSize.X, 0, mainFrmAbsolutePos.Y)
    end

    btn.MouseButton1Click:Connect(function()
        opcFrm.Visible = not opcFrm.Visible
        btn.Text = opcFrm.Visible and txt .. " >" or txt .. " <"
        if opcFrm.Visible then
            adjustOpcFrmPosition()
        end
    end)

    local opcBtnsCount = 0
    local obj = {}

    function obj:Button(txt, callback)
        local subBtn = createBtn(opcFrm, txt, opcBtnsCount * 30, callback)
        opcBtnsCount = opcBtnsCount + 1
        opcFrm.Size = UDim2.new(0.25, 0, 0, opcBtnsCount * 30)
        table.insert(opcBtns, {btn = subBtn, frame = opcFrm})
    end

    return obj
end

local infoFrm = Instance.new("Frame", gui)
infoFrm.Size, infoFrm.BackgroundTransparency = UDim2.new(0.25, 0, 0, 0), 1
infoFrm.Visible = false

local function adjustInfoFrmPosition()
    local mainFrmAbsolutePos = mainFrm.AbsolutePosition
    infoFrm.Position = UDim2.new(0, mainFrmAbsolutePos.X + mainFrm.AbsoluteSize.X + 5, 0, mainFrmAbsolutePos.Y)
end

local function adjustFramesPosition()
    adjustInfoFrmPosition()
    for _, option in ipairs(opcBtns) do
        local mainFrmAbsolutePos = mainFrm.AbsolutePosition
        option.frame.Position = UDim2.new(0, mainFrmAbsolutePos.X + mainFrm.AbsoluteSize.X, 0, mainFrmAbsolutePos.Y)
    end
end

mainFrm:GetPropertyChangedSignal("Position"):Connect(adjustFramesPosition)

local infoBtnsCount = 0

function UL:Info(txt, callback)
    local yPos = 30 + mainBtnsCount * 30
    local btn = createBtn(infoFrm, txt, yPos, callback)
    mainBtnsCount = mainBtnsCount + 1
    infoFrm.Size = UDim2.new(0.25, 0, 0, mainBtnsCount * 30)
end

function UL:TextLabel(txt)
    local yPos = 30 + mainBtnsCount * 30
    local textLabel = Instance.new("TextLabel", mainFrm)
    textLabel.Text, textLabel.Size, textLabel.Position = txt, UDim2.new(1, 0, 0, 30), UDim2.new(0, 0, 0, yPos)
    textLabel.BackgroundColor3, textLabel.BackgroundTransparency = Color3.fromRGB(65, 65, 65), 0.8
    textLabel.TextColor3, textLabel.Font, textLabel.TextSize = Color3.fromRGB(255, 255, 255), Enum.Font.LuckiestGuy, 13
    mainBtnsCount = mainBtnsCount + 1
    mainFrm.Size = UDim2.new(0.25, 0, 0, 30 + mainBtnsCount * 30)
end

function UL:SetTitle(txt)
    titleLbl.Text = txt
end

print("Versión j2")

return UL
