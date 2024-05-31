local UL = {}
print("Version UI 0.1")
print("Loading OneLib")

local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui", player.PlayerGui)
screenGui.Name = "LoadingScreen"

local function createInstance(className, properties, parent)
    local instance = Instance.new(className)
    for prop, value in pairs(properties) do
        instance[prop] = value
    end
    instance.Parent = parent
    return instance
end

local function createTween(instance, size, duration)
    local tweenService = game:GetService("TweenService")
    return tweenService:Create(instance, TweenInfo.new(duration, Enum.EasingStyle.Linear), {Size = size})
end

local loadingFrame = createInstance("Frame", {
    Size = UDim2.new(0.3, 0, 0.1, 0),
    Position = UDim2.new(0.35, 0, 0.45, 0),
    BackgroundColor3 = Color3.fromRGB(0, 0, 0),
    BorderSizePixel = 0
}, screenGui)

local loadingLabel = createInstance("TextLabel", {
    Size = UDim2.new(1, 0, 0.5, 0),
    Position = UDim2.new(0, 0, 0, 0),
    Text = "Loading OneLib...",
    TextColor3 = Color3.fromRGB(255, 255, 255),
    Font = Enum.Font.GothamBold,
    TextSize = 24,
    BackgroundTransparency = 1
}, loadingFrame)

local loadingBar = createInstance("Frame", {
    Size = UDim2.new(0, 0, 0.5, 0),
    Position = UDim2.new(0, 0, 0.5, 0),
    BackgroundColor3 = Color3.fromRGB(0, 255, 0)
}, loadingFrame)

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

    local sg = createInstance("ScreenGui", {
        Name = name,
        ResetOnSpawn = false
    }, player:WaitForChild("PlayerGui"))

    createInstance("BoolValue", {
        Name = "ULId",
        Value = true
    }, sg)

    return sg
end

function UL:CrFrm(parent, title)
    local frm = createInstance("Frame", {
        Size = UDim2.new(0.25, 0, 0, 60),
        Position = UDim2.new(0.2, 0, 0.2, 0),
        BackgroundColor3 = Color3.fromRGB(45, 45, 45),
        BackgroundTransparency = 0.4,
        BorderSizePixel = 1,
        Active = true,
        Draggable = true
    }, parent)

    local lbl = createInstance("TextLabel", {
        Text = title,
        Size = UDim2.new(1, 0, 0, 33),
        Position = UDim2.new(0, 0, -0.02, 0),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = 0.2,
        TextColor3 = Color3.fromRGB(350, 250, 23),
        Font = Enum.Font.GothamBold,
        TextSize = 18,
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Center,
        TextYAlignment = Enum.TextYAlignment.Center
    }, frm)

    createInstance("UICorner", {CornerRadius = UDim.new(0, 4)}, lbl)
    createInstance("UIPadding", {
        PaddingLeft = UDim.new(0, 5),
        PaddingRight = UDim.new(0, 5),
        PaddingTop = UDim.new(0, 5),
        PaddingBottom = UDim.new(0, 5)
    }, lbl)

    local tbtn = createInstance("TextButton", {
        Text = "+",
        Size = UDim2.new(0, 30, 0, 30),
        Position = UDim2.new(1, -30, 0, 0)
    }, frm)
    for prop, value in pairs(uiProperties) do
        tbtn[prop] = value
    end

    local cfrm = createInstance("Frame", {
        Size = UDim2.new(1, 0, 1, -30),
        Position = UDim2.new(0, 0, 0, 30),
        BackgroundTransparency = 0.6,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Visible = false
    }, frm)

    local crBtn = createInstance("TextButton", {
        Text = "Info Script",
        Size = UDim2.new(1, 0, 0, 30),
        Position = UDim2.new(0, 0, 1, -30)
    }, frm)
    for prop, value in pairs(uiProperties) do
        crBtn[prop] = value
    end

local crFrm = createInstance("Frame", {
        Size = UDim2.new(0.25, 0, 0.4, 60),
        Position = UDim2.new(0.685, 0, 0.3, 0),
        BackgroundColor3 = Color3.fromRGB(45, 45, 45),
        BackgroundTransparency = 1,
        BorderSizePixel = 1,
        Visible = false
    }, parent)

    local crLbl = createInstance("TextLabel", {
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = 0.2,
        TextColor3 = Color3.fromRGB(350, 250, 23),
        Text = "Info/Updates/Credits",
        Size = UDim2.new(1, 0, 0, 30),
        Position = UDim2.new(0, 0, 0, 0),
        Font = Enum.Font.GothamBold,
        TextSize = 18,
        TextWrapped = true,
        TextXAlignment = Enum.TextXAlignment.Center,
        TextYAlignment = Enum.TextYAlignment.Center
    }, crFrm)

    createInstance("UICorner", {CornerRadius = UDim.new(0, 4)}, crLbl)
    createInstance("UIPadding", {
        PaddingLeft = UDim.new(0, 5),
        PaddingRight = UDim.new(0, 5),
        PaddingTop = UDim.new(0, 5),
        PaddingBottom = UDim.new(0, 5)
    }, crLbl)

    crFrm.Size = UDim2.new(0.25, 0, 0, 60 + #crFrm:GetChildren() * 60)

    local minimized = true
    tbtn.MouseButton1Click:Connect(function()
        minimized = not minimized
        cfrm.Visible = not minimized
        tbtn.Text = minimized and "+" or "-"
        frm.Size = UDim2.new(0.25, 0, 0, 60 + (minimized and 0 or #cfrm:GetChildren() * 30))
    end)

    local function syncFrames()
        crFrm.Position = UDim2.new(frm.Position.X.Scale + frm.Size.X.Scale, frm.Position.X.Offset, frm.Position.Y.Scale, frm.Position.Y.Offset)
    end

    frm:GetPropertyChangedSignal("Position"):Connect(syncFrames)
    frm:GetPropertyChangedSignal("Size"):Connect(syncFrames)

    crBtn.MouseButton1Click:Connect(function()
        crFrm.Visible = not crFrm.Visible
        crBtn.BackgroundColor3 = crFrm.Visible and Color3.fromRGB(150, 0, 150) or Color3.fromRGB(65, 65, 65)
    end)

    return frm, cfrm, crFrm
end

function UL:AddBtn(parent, text, callback)
    local btn = createInstance("TextButton", {
        Text = text,
        Size = UDim2.new(1, 0, 0, 30),
        Position = UDim2.new(0, 0, 0, #parent:GetChildren() * 30 - 30)
    }, parent)
    for prop, value in pairs(uiProperties) do
        btn[prop] = value
    end

    btn.MouseButton1Click:Connect(callback)
    return btn
end


function UL:AddTBtn(parent, text, state, callback)
    local btn = createInstance("TextButton", {
        Text = text .. " [" .. (state and "ON" or "OFF") .. "]",
        Size = UDim2.new(1, 0, 0, 30),
        Position = UDim2.new(0, 0, 0, #parent:GetChildren() * 30 - 30)
    }, parent)
    for prop, value in pairs(uiProperties) do
        btn[prop] = value
    end

    btn.MouseButton1Click:Connect(function()
        state = not state
        btn.Text = text .. " [" .. (state and "ON" or "OFF") .. "]"
        btn.BackgroundColor3 = state and Color3.fromRGB(85, 170, 85) or Color3.fromRGB(65, 65, 65)
        callback(state)
    end)

    return btn
end

function UL:AddTBox(parent, placeholder, callback)
    local box = createInstance("TextBox", {
        PlaceholderText = placeholder,
        Text = "",
        BorderSizePixel = 1,
        Size = UDim2.new(1, 0, 0, 30),
        Position = UDim2.new(0, 0, 0, #parent:GetChildren() * 30 - 30),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        TextColor3 = Color3.fromRGB(250, 250, 250),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Font = Enum.Font.SourceSans,
        TextSize = 18,
        ClearTextOnFocus = false,
        TextXAlignment = Enum.TextXAlignment.Left
    }, parent)

    createInstance("UIPadding", {PaddingLeft = UDim.new(0, 5)}, box)
    createInstance("UICorner", {CornerRadius = UDim.new(0, 6)}, box)
    createInstance("ImageLabel", {
        BackgroundTransparency = 0.95,
        Image = "rbxassetid://1316045217",
        Size = UDim2.new(1, 6, 1, 6),
        Position = UDim2.new(0, -3, 0, -3),
        ImageTransparency = 0.5,
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(10, 10, 118, 118)
    }, box)

    box.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            callback(box.Text)
        end
    end)

    return box
end



function UL:AddOBtn(parent, name)
    local oFrm = createInstance("Frame", {
        Size = UDim2.new(0.9, 0, 1, 0),
        Position = UDim2.new(parent.Position.X.Scale + 1, 0, parent.Position.Y.Scale - 0.184, parent.Position.Y.Offset),
        BackgroundColor3 = Color3.fromRGB(45, 45, 45),
        BackgroundTransparency = 0.4,
        BorderSizePixel = 1,
        Visible = false
    }, parent.Parent)

    local lbl = createInstance("TextLabel", {
        Text = name,
        Size = UDim2.new(1, 0, 0, 30),
        Position = UDim2.new(0, 0, 0, 0)
    }, oFrm)
    for prop, value in pairs(uiProperties) do
        lbl[prop] = value
    end

    local btn = createInstance("TextButton", {
        Text = name,
        Size = UDim2.new(1, 0, 0, 30),
        Position = UDim2.new(0, 0, 0, #parent:GetChildren() * 30 - 30)
    }, parent)
    for prop, value in pairs(uiProperties) do
        btn[prop] = value
    end

    btn.MouseButton1Click:Connect(function()
        oFrm.Visible = not oFrm.Visible
        btn.BackgroundColor3 = oFrm.Visible and Color3.fromRGB(130, 0, 0) or Color3.fromRGB(65, 65, 65)
    end)

    return btn, oFrm
end

function UL:AddText(parent, text, color)
    local label = createInstance("TextLabel", {
        Text = text,
        Size = UDim2.new(1, 0, 0, 30),
        Position = UDim2.new(0, 0, 0, #parent:GetChildren() * 30 - 30),
        BackgroundColor3 = Color3.fromRGB(250, 250, 250),
        BackgroundTransparency = 0.6,
        TextColor3 = color or Color3.fromRGB(0, 0, 0),
        Font = Enum.Font.ArimoBold,
        TextSize = 13,
        TextWrapped = true
    }, parent)

    return label
end

game:GetService('Players').LocalPlayer.Idled:Connect(function()
    game:GetService('VirtualUser'):CaptureController()
    game:GetService('VirtualUser'):ClickButton2(Vector2.new())
end)

print("Loading Finish")
print("by: OneCreatorX")

return UL
