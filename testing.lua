local UL = {}

local plr = game.Players.LocalPlayer
local guiId = "LS"
local existingGui = plr.PlayerGui:FindFirstChild(guiId)

if existingGui then
    existingGui:Destroy()
end

local gui = Instance.new("ScreenGui", plr.PlayerGui)
gui.Name = guiId

local mainFrm = Instance.new("Frame", gui)
mainFrm.Size, mainFrm.Position = UDim2.new(0.25, 0, 0, 0), UDim2.new(0.375, 0, 0.2, 0)
mainFrm.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
mainFrm.BackgroundTransparency, mainFrm.BorderSizePixel = 1, 1
mainFrm.Active, mainFrm.Draggable = true, true

local gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name:gsub("%b[]", ""):match("^[^:]*"):match("^%s*(.-)%s*$")

local titleLbl = Instance.new("TextLabel", mainFrm)
titleLbl.Text, titleLbl.Size, titleLbl.Position = gameName, UDim2.new(1, 0, 0, 30), UDim2.new(0, 0, 0, 0)
titleLbl.BackgroundColor3, titleLbl.TextColor3 = Color3.fromRGB(35, 35, 35), Color3.fromRGB(255, 255, 255)
titleLbl.Font, titleLbl.TextSize = Enum.Font.LuckiestGuy, 14

local minBtn = Instance.new("TextButton", mainFrm)
minBtn.Text, minBtn.Size, minBtn.Position = "-", UDim2.new(0, 30, 0, 30), UDim2.new(1, -30, 0, 0)
minBtn.BackgroundColor3, minBtn.BackgroundTransparency = Color3.fromRGB(35, 35, 35), 0
minBtn.TextColor3, minBtn.Font, minBtn.TextSize = Color3.fromRGB(255, 255, 255), Enum.Font.LuckiestGuy, 14

local function toggleVisibility(visible)
    for _, child in ipairs(mainFrm:GetChildren()) do
        if child ~= titleLbl and child ~= minBtn then
            child.Visible = visible
        end
    end
    for _, option in ipairs(opcBtns) do
        option.frame.Visible = visible
        option.btn.Text = visible and option.txt .. " >" or option.txt .. " <"
    end
end

local minimized = false
minBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    minBtn.Text = minimized and "+" or "-"
    toggleVisibility(not minimized)
end)

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

local function getChildCount(parent)
    local count = 0
    for _ in pairs(parent:GetChildren()) do
        count = count + 1
    end
    return count
end

function UL:Btn(txt, callback)
    local yPos = 30 + getChildCount(mainFrm) * 30
    local btn = createBtn(mainFrm, txt, yPos, callback)
    mainFrm.Size = UDim2.new(0.25, 0, 0, yPos + 30)
end

local opcBtns = {}

function UL:Opt(txt)
    local yPos = 30 + getChildCount(mainFrm) * 30
    local btn = createBtn(mainFrm, txt .. " <", yPos)
    local opcFrm = Instance.new("Frame", gui)
    opcFrm.Size = UDim2.new(0.25, 0, 0, 0)
    opcFrm.BackgroundTransparency = 1
    opcFrm.Visible = false

    local function adjustOpcFrmPosition()
        opcFrm.Position = UDim2.new(0, mainFrm.AbsolutePosition.X + mainFrm.AbsoluteSize.X, 0, mainFrm.AbsolutePosition.Y)
    end

    btn.MouseButton1Click:Connect(function()
        opcFrm.Visible = not opcFrm.Visible
        adjustOpcFrmPosition()
    end)

    local opcBtnsCount = 0
    local obj = {}

    function obj:Btn(txt, callback)
        local subBtn = createBtn(opcFrm, txt, opcBtnsCount * 30, callback)
        opcBtnsCount = opcBtnsCount + 1
        opcFrm.Size = UDim2.new(0.25, 0, 0, opcBtnsCount * 30)
        table.insert(opcBtns, {btn = subBtn, frame = opcFrm, txt = txt})
    end

    adjustOpcFrmPosition()

    return obj
end

function UL:TxtLbl(txt)
    local yPos = 30 + getChildCount(mainFrm) * 30
    local lbl = Instance.new("TextLabel", mainFrm)
    lbl.Text, lbl.Size, lbl.Position = txt, UDim2.new(1, 0, 0, 30), UDim2.new(0, 0, 0, yPos)
    lbl.BackgroundColor3, lbl.BackgroundTransparency = Color3.fromRGB(65, 65, 65), 0.8
    lbl.TextColor3, lbl.Font, lbl.TextSize = Color3.fromRGB(255, 255, 255), Enum.Font.LuckiestGuy, 13
    mainFrm.Size = UDim2.new(0.25, 0, 0, yPos + 30)
end

function UL:SetT(txt)
    titleLbl.Text = txt
end

return UL
