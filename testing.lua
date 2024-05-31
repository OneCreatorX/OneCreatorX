local UL = {}
print("Version UI 0.1")
print("Loading OneLib")

local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui", player.PlayerGui)
screenGui.Name = "LoadingScreen"

local function createFrame(parent, size, position, bgColor, bgTransparency)
    local frame = Instance.new("Frame", parent)
    frame.Size = size
    frame.Position = position
    frame.BackgroundColor3 = bgColor or Color3.fromRGB(0, 0, 0)
    frame.BackgroundTransparency = bgTransparency or 0
    frame.BorderSizePixel = 0
    return frame
end

local function createLabel(parent, size, position, text, textColor, fontSize, font)
    local label = Instance.new("TextLabel", parent)
    label.Size = size
    label.Position = position
    label.Text = text
    label.TextColor3 = textColor or Color3.fromRGB(255, 255, 255)
    label.Font = font or Enum.Font.GothamBold
    label.TextSize = fontSize or 24
    label.BackgroundTransparency = 1
    return label
end

local loadingFrame = createFrame(screenGui, UDim2.new(0.3, 0, 0.1, 0), UDim2.new(0.35, 0, 0.45, 0))
local loadingLabel = createLabel(loadingFrame, UDim2.new(1, 0, 0.5, 0), UDim2.new(0, 0, 0, 0), "Loading OneLib...")

local loadingBar = createFrame(loadingFrame, UDim2.new(0, 0, 0.5, 0), UDim2.new(0, 0, 0.5, 0), Color3.fromRGB(0, 255, 0))

local tweenService = game:GetService("TweenService")

local function createTween(instance, size, duration)
    return tweenService:Create(instance, TweenInfo.new(duration, Enum.EasingStyle.Linear), {Size = size})
end

local loadingTween = createTween(loadingBar, UDim2.new(1, 0, 0.5, 0), 2)
loadingTween:Play()
loadingTween.Completed:Connect(function()
    loadingLabel.Text = "OneLib v0.1"
    wait(1)
    screenGui:Destroy()
end)
wait(3)

local uiProperties = {
    BackgroundColor3 = Color3.fromRGB(65, 65, 65),
    BackgroundTransparency = 0.8,
    TextColor3 = Color3.fromRGB(255, 255, 255),
    Font = Enum.Font.LuckiestGuy,
    TextSize = 13
}

function UL:CrSG(name)
    for _, gui in ipairs(player:WaitForChild("PlayerGui"):GetChildren()) do
        if gui:IsA("ScreenGui") and gui:FindFirstChild("ULId") then
            gui:Destroy()
        end
    end

    local sg = Instance.new("ScreenGui")
    sg.Name = name
    sg.Parent = player:WaitForChild("PlayerGui")
    sg.ResetOnSpawn = false

    local id = Instance.new("BoolValue")
    id.Name = "ULId"
    id.Value = true
    id.Parent = sg

    return sg
end

function UL:CrFrm(parent, title)
    local frm = createFrame(parent, UDim2.new(0.25, 0, 0, 60), UDim2.new(0.2, 0, 0.2, 0), Color3.fromRGB(45, 45, 45), 0.4)
    frm.BorderSizePixel = 1
    frm.Active = true
    frm.Draggable = true

    local lbl = createLabel(frm, UDim2.new(1, 0, 0, 33), UDim2.new(0, 0, -0.02, 0), title, Color3.fromRGB(350, 250, 23), 18)
    local corner = Instance.new("UICorner")
    corner.Parent = lbl
    corner.CornerRadius = UDim.new(0, 4)

    local padding = Instance.new("UIPadding")
    padding.Parent = lbl
    padding.PaddingLeft = UDim.new(0, 5)
    padding.PaddingRight = UDim.new(0, 5)
    padding.PaddingTop = UDim.new(0, 5)
    padding.PaddingBottom = UDim.new(0, 5)
    
    local tbtn = Instance.new("TextButton")
    tbtn.Parent = frm
    tbtn.Text = "+"
    tbtn.Size = UDim2.new(0, 30, 0, 30)
    tbtn.Position = UDim2.new(1, -30, 0, 0)
    for prop, value in pairs(uiProperties) do
        tbtn[prop] = value
    end

    local cfrm = createFrame(frm, UDim2.new(1, 0, 1, -30), UDim2.new(0, 0, 0, 30))
    cfrm.BackgroundTransparency = 0.6
    cfrm.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    cfrm.Visible = false

    local crBtn = Instance.new("TextButton")
    crBtn.Parent = frm
    crBtn.Text = "Info Script"
    crBtn.Size = UDim2.new(1, 0, 0, 30)
    crBtn.Position = UDim2.new(0, 0, 1, -30)
    for prop, value in pairs(uiProperties) do
        crBtn[prop] = value
    end

    local crFrm = createFrame(parent, UDim2.new(0.25, 0, 0.4, 60), UDim2.new(0.685, 0, 0.3, 0), Color3.fromRGB(45, 45, 45), 1)
    crFrm.Visible = false

    local crLbl = createLabel(crFrm, UDim2.new(1, 0, 0, 30), UDim2.new(0, 0, 0, 0), "Info/Updates/Credits", Color3.fromRGB(350, 250, 23), 18)
    local corner = Instance.new("UICorner")
    corner.Parent = crLbl
    corner.CornerRadius = UDim.new(0, 4)

    local padding = Instance.new("UIPadding")
    padding.Parent = crLbl
    padding.PaddingLeft = UDim.new(0, 5)
    padding.PaddingRight = UDim.new(0, 5)
    padding.PaddingTop = UDim.new(0, 5)
    padding.PaddingBottom = UDim.new(0, 5)
    
    local minimized = true
    tbtn.MouseButton1Click:Connect(function()
        minimized = not minimized
        if minimized then
            cfrm.Visible = false
            tbtn.Text = "+"
            frm.Size = UDim2.new(0.25, 0, 0, 60)
        else
            cfrm.Visible = true
            tbtn.Text = "-"
            frm.Size = UDim2.new(0.25, 0, 0, 60 + #cfrm:GetChildren() * 30)
        end
    end)

    crBtn.MouseButton1Click:Connect(function()
        crFrm.Visible = not crFrm.Visible
        crBtn.BackgroundColor3 = crFrm.Visible and Color3.fromRGB(150, 0, 150) or Color3.fromRGB(65, 65, 65)
        crFrm.BackgroundColor3 = crFrm.Visible and Color3.fromRGB(120, 0, 120) or Color3.fromRGB(65, 65, 65)
    end)

    local function syncFrames()
        crFrm.Position = UDim2.new(frm.Position.X.Scale + frm.Size.X.Scale, frm.Position.X.Offset, frm.Position.Y.Scale, frm.Position.Y.Offset)
    end

    frm:GetPropertyChangedSignal("Position"):Connect(syncFrames)
    frm:GetPropertyChangedSignal("Size"):Connect(syncFrames)

    frm.Size = UDim2.new(0.25, 0, 0, 60 + #cfrm:GetChildren() * 30)
    crFrm.Size = UDim2.new(0.25, 0, 0, 60 + #crFrm:GetChildren() * 30)

    return frm, cfrm, crFrm
end

local function applyProperties(instance, properties)
    for prop, value in pairs(properties) do
        instance[prop] = value
    end
end

function UL:AddBtn(parent, text, callback)
    local btn = Instance.new("TextButton")
    btn.Parent = parent
    btn.Text = text
    btn.Size = UDim2.new(1, 0, 0, 30)
    btn.Position = UDim2.new(0, 0, 0, #parent:GetChildren() * 30 - 30)
    applyProperties(btn, uiProperties)

    btn.MouseButton1Click:Connect(callback)
    
    return btn
end

function UL:AddTBtn
