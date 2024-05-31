local UL = {}

local plr = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", plr.PlayerGui)
gui.Name = "LoadScr"

local mainFrm = Instance.new("Frame", gui)
mainFrm.Size = UDim2.new(0.25, 0, 0.6, 0)
mainFrm.Position = UDim2.new(0.375, 0, 0.2, 0)
mainFrm.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
mainFrm.BackgroundTransparency = 0.4
mainFrm.BorderSizePixel = 1
mainFrm.Active = true
mainFrm.Draggable = true

local function createBtn(parent, txt)
    local btn = Instance.new("TextButton", parent)
    btn.Text = txt
    btn.Size = UDim2.new(1, 0, 0, 30)
    btn.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
    btn.BackgroundTransparency = 0.8
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Font = Enum.Font.LuckiestGuy
    btn.TextSize = 13
    return btn
end

function UL:Button(txt)
    createBtn(mainFrm, txt)
end

local opcFrm
local opcBtn

function UL:Opc(txt)
    opcBtn = createBtn(mainFrm, txt .. " <")
    opcFrm = Instance.new("Frame", mainFrm)
    opcFrm.Size = UDim2.new(1, 0, 0, 0)
    opcFrm.Position = UDim2.new(0, 0, 0, #mainFrm:GetChildren() * 30)
    opcFrm.BackgroundTransparency = 1
    opcFrm.Visible = false

    opcBtn.MouseButton1Click:Connect(function()
        opcFrm.Visible = not opcFrm.Visible
        opcBtn.Text = opcFrm.Visible and txt .. " >" or txt .. " <"
        mainFrm.Size = UDim2.new(0.25, 0, 0, #mainFrm:GetChildren() * 30)
    end)

    local obj = {}
    function obj:Button(txt)
        createBtn(opcFrm, txt)
        opcFrm.Size = UDim2.new(1, 0, 0, #opcFrm:GetChildren() * 30)
        mainFrm.Size = UDim2.new(0.25, 0, 0, #mainFrm:GetChildren() * 30)
    end
    return obj
end

local infoFrm = Instance.new("Frame", mainFrm)
infoFrm.Size = UDim2.new(1, 0, 0, 0)
infoFrm.Position = UDim2.new(0, 0, 1, 0)
infoFrm.BackgroundTransparency = 1

local infoBtn = createBtn(mainFrm, "Info <")
infoBtn.MouseButton1Click:Connect(function()
    infoFrm.Visible = not infoFrm.Visible
    infoBtn.Text = infoFrm.Visible and "Info >" or "Info <"
    mainFrm.Size = UDim2.new(0.25, 0, 0, #mainFrm:GetChildren() * 30)
end)

function UL:Info(txt)
    createBtn(infoFrm, txt)
    infoFrm.Size = UDim2.new(1, 0, 0, #infoFrm:GetChildren() * 30)
    mainFrm.Size = UDim2.new(0.25, 0, 0, #mainFrm:GetChildren() * 30)
end

return UL
