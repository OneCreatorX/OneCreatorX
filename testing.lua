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
titleLbl.Text, titleLbl.Size, titleLbl.Position = gameName, UDim2.new(1, 0, 0, 30), UDim2.new(0, 0, 0, 0)
titleLbl.BackgroundColor3, titleLbl.TextColor3 = Color3.fromRGB(35, 35, 35), Color3.fromRGB(255, 255, 255)
titleLbl.Font, titleLbl.TextSize = Enum.Font.LuckiestGuy, 14

local minimizeBtn = Instance.new("TextButton", mainFrm)
minimizeBtn.Text, minimizeBtn.Size, minimizeBtn.Position = "-", UDim2.new(0, 30, 0, 30), UDim2.new(1, -30, 0, 0)
minimizeBtn.BackgroundColor3, minimizeBtn.BackgroundTransparency = Color3.fromRGB(35, 35, 35), 0
minimizeBtn.TextColor3, minimizeBtn.Font, minimizeBtn.TextSize = Color3.fromRGB(255, 255, 255), Enum.Font.LuckiestGuy, 14

local function toggleVisibility(visible)
    for _, child in ipairs(mainFrm:GetChildren()) do
        if child ~= titleLbl and child ~= minimizeBtn then
            child.Visible = visible
        end
    end
end

local minimized = false
minimizeBtn.MouseButton1Click:Connect(function()
    minimized = not minimized
    minimizeBtn.Text = minimized and "+" or "-"
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

function UL:Button(txt, callback)
    local yPos = 30 + getChildCount(mainFrm) * 30
    local btn = createBtn(mainFrm, txt, yPos, callback)
    mainFrm.Size = UDim2.new(0.25, 0, 0, yPos + 30)
end

local opcBtns = {}

function UL:Opc(txt)
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

print("Versión 3")

return UL
