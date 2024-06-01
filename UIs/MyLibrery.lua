local UL = {}
print("Version UI 0.5")
print("Loading OneLib")

local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui", player.PlayerGui)
screenGui.Name = "LoadingScreen"

local background = Instance.new("Frame", screenGui)
background.Size = UDim2.new(0.5, 0, 0.5, 0)
background.Position = UDim2.new(0.25, 0, 0.3, 0)
background.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

local gradient = Instance.new("UIGradient", background)
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(50, 50, 50))
}

local logo = Instance.new("ImageLabel", background)
logo.Size = UDim2.new(1, 0, 1, 0)
logo.Position = UDim2.new(0, 0, 0, 0)
logo.BackgroundTransparency = 1
logo.Image = "rbxassetid://17690106018"

local columns = 5
local rows = 1
local totalFrames = 5
local currentFrame = 0

local frameWidth = 204
local frameHeight = 280

local function animateSpriteSheet()
    while true do
        currentFrame = (currentFrame + 1) % totalFrames
        local column = currentFrame % columns
        local row = math.floor(currentFrame / columns)

        logo.ImageRectOffset = Vector2.new(column * frameWidth, row * frameHeight)
        wait(0.07)
    end
end

logo.ImageRectSize = Vector2.new(frameWidth, frameHeight)

spawn(animateSpriteSheet)

local loadingFrame = Instance.new("Frame", background)
loadingFrame.Size = UDim2.new(1, 0, 0.1, 0)
loadingFrame.Position = UDim2.new(0, 0, 0.7, 0)
loadingFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
loadingFrame.BorderSizePixel = 0
loadingFrame.BackgroundTransparency = 0.5
loadingFrame.ClipsDescendants = true

local corner = Instance.new("UICorner", loadingFrame)
corner.CornerRadius = UDim.new(0.1, 0)

local loadingBarBackground = Instance.new("Frame", loadingFrame)
loadingBarBackground.Size = UDim2.new(1, 0, 0.5, 0)
loadingBarBackground.Position = UDim2.new(0, 0, 0.5, 0)
loadingBarBackground.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

local loadingBarCorner = Instance.new("UICorner", loadingBarBackground)
loadingBarCorner.CornerRadius = UDim.new(0.1, 0)

local loadingBar = Instance.new("Frame", loadingBarBackground)
loadingBar.Size = UDim2.new(0, 0, 1, 0)
loadingBar.Position = UDim2.new(0, 0, -1, 0)
loadingBar.BackgroundColor3 = Color3.fromRGB(0, 255, 0)

local loadingBarCornerInner = Instance.new("UICorner", loadingBar)
loadingBarCornerInner.CornerRadius = UDim.new(0.1, 0)

local loadingLabel = Instance.new("TextLabel", loadingFrame)
loadingLabel.Size = UDim2.new(1, 0, 1, 0)
loadingLabel.Position = UDim2.new(0, 0, 0, 0)
loadingLabel.Text = "OneLib v0.5"
loadingLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
loadingLabel.Font = Enum.Font.GothamBold
loadingLabel.TextSize = 24
loadingLabel.BackgroundTransparency = 1

local tweenService = game:GetService("TweenService")

local function createTween(instance, size, duration)
    return tweenService:Create(instance, TweenInfo.new(duration, Enum.EasingStyle.Linear), {Size = size})
end

local loadingTween = createTween(loadingBar, UDim2.new(1, 0, 5, 0), 3)
loadingTween:Play()
loadingTween.Completed:Connect(function()
    loadingLabel.Text = "OneLib Loaded v0.3"
    wait(1)
    local fadeOutTween = tweenService:Create(background, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1})
    fadeOutTween:Play()
    fadeOutTween.Completed:Connect(function()
        screenGui:Destroy()
    end)
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
    for _, gui in ipairs(game.Players.LocalPlayer:WaitForChild("PlayerGui"):GetChildren()) do
        if gui:IsA("ScreenGui") and gui:FindFirstChild("ULId") then
            gui:Destroy()
        end
    end

    local sg = Instance.new("ScreenGui")
    sg.Name = name
    sg.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    sg.ResetOnSpawn = false

    local id = Instance.new("BoolValue")
    id.Name = "ULId"
    id.Value = true
    id.Parent = sg

    return sg
end

function UL:CrFrm(parent, title)
    local frm = Instance.new("Frame")
    frm.Parent = parent
    frm.Size = UDim2.new(0.25, 0, 0, 60)
    frm.Position = UDim2.new(0.2, 0, 0.2, 0)
    frm.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    frm.BackgroundTransparency = 0.4
    frm.BorderSizePixel = 1
    frm.Active = true
    frm.Draggable = true

    local lbl = Instance.new("TextLabel")
lbl.Parent = frm
lbl.Text = title
lbl.Size = UDim2.new(1, 0, 0, 33)
lbl.Position = UDim2.new(0, 0, -0.02, 0)
lbl.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
lbl.BackgroundTransparency = 0.2
lbl.TextColor3 = Color3.fromRGB(350, 250, 23)
lbl.Font = Enum.Font.GothamBold 
lbl.TextSize = 18
lbl.TextWrapped = true
lbl.TextXAlignment = Enum.TextXAlignment.Center
lbl.TextYAlignment = Enum.TextYAlignment.Center

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

    local cfrm = Instance.new("Frame")
    cfrm.Parent = frm
    cfrm.Size = UDim2.new(1, 0, 1, -30)
    cfrm.Position = UDim2.new(0, 0, 0, 30)
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

    local crFrm = Instance.new("Frame")
    crFrm.Parent = parent
    crFrm.Size = UDim2.new(0.25, 0, 0.4, 60)
    crFrm.Position = UDim2.new(0.685, 0, 0.3, 0)
    crFrm.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    crFrm.BackgroundTransparency = 1
    crFrm.BorderSizePixel = 1
    crFrm.Visible = false

    local crLbl = Instance.new("TextLabel")
    crLbl.Parent = crFrm
    crLbl.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    crLbl.BackgroundTransparency = 0.2
    crLbl.TextColor3 = Color3.fromRGB(350, 250, 23)
    crLbl.Text = "Info/Updats/Credits"
    crLbl.Size = UDim2.new(1, 0, 0, 30)
    crLbl.Position = UDim2.new(0, 0, 0, 0)
    crLbl.Font = Enum.Font.GothamBold 
    crLbl.TextSize = 18
    crLbl.TextWrapped = true
    crLbl.TextXAlignment = Enum.TextXAlignment.Center
    crLbl.TextYAlignment = Enum.TextYAlignment.Center

    local corner = Instance.new("UICorner")
corner.Parent = crLbl
corner.CornerRadius = UDim.new(0, 4)


local padding = Instance.new("UIPadding")
padding.Parent = crLbl
padding.PaddingLeft = UDim.new(0, 5)
padding.PaddingRight = UDim.new(0, 5)
padding.PaddingTop = UDim.new(0, 5)
padding.PaddingBottom = UDim.new(0, 5)
    
    crFrm.Size = UDim2.new(0.25, 0, 0, 60 + #crFrm:GetChildren() * 60) 

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

    function jaaaaa()
        crFrm.BackgroundColor3 = crFrm.Visible and Color3.fromRGB(120, 0, 120) or Color3.fromRGB(65, 65, 65)
    end
    
    crBtn.MouseButton1Click:Connect(function()
        crFrm.Visible = not crFrm.Visible
            
             crBtn.BackgroundColor3 = crFrm.Visible and Color3.fromRGB(150, 0, 150) or Color3.fromRGB(65, 65, 65)
            jaaaaa()
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

function UL:AddBtn(parent, text, callback)
    local btn = Instance.new("TextButton")
    btn.Parent = parent
    btn.Text = text
    btn.Size = UDim2.new(1, 0, 0, 30)
    btn.Position = UDim2.new(0, 0, 0, #parent:GetChildren() * 30 - 30)
    for prop, value in pairs(uiProperties) do
        btn[prop] = value
    end

    btn.MouseButton1Click:Connect(callback)
    
    return btn
end

function UL:AddTBtn(parent, text, state, callback)
    local btn = Instance.new("TextButton")
    btn.Parent = parent
    btn.Text = text .. " [" .. (state and "ON" or "OFF") .. "]"
    btn.Size = UDim2.new(1, 0, 0, 30)
    btn.Position = UDim2.new(0, 0, 0, #parent:GetChildren() * 30 - 30)
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
    local box = Instance.new("TextBox")
    box.Parent = parent
    box.PlaceholderText = placeholder
    box.Text = ""
    box.BorderSizePixel = 1
    box.Size = UDim2.new(1, 0, 0, 30)
    box.Position = UDim2.new(0, 0, 0, #parent:GetChildren() * 30 - 30)

    box.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    box.TextColor3 = Color3.fromRGB(250, 250, 250)
    box.BorderColor3 = Color3.fromRGB(0, 0, 0) 
    box.Font = Enum.Font.SourceSans
    box.TextSize = 18
    box.ClearTextOnFocus = false
    box.TextXAlignment = Enum.TextXAlignment.Left
    
    local padding = Instance.new("UIPadding")
    padding.Parent = box
    padding.PaddingLeft = UDim.new(0, 5)
    local corner = Instance.new("UICorner")
    corner.Parent = box
    corner.CornerRadius = UDim.new(0, 6)
    
    local shadow = Instance.new("ImageLabel")
    shadow.Parent = box
    shadow.BackgroundTransparency = 0.95
    shadow.Image = "rbxassetid://1316045217"
    shadow.Size = UDim2.new(1, 6, 1, 6)
    shadow.Position = UDim2.new(0, -3, 0, -3)
    shadow.ImageTransparency = 0.5
    shadow.ScaleType = Enum.ScaleType.Slice
    shadow.SliceCenter = Rect.new(10, 10, 118, 118)

    box.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            callback(box.Text)
        end
    end)

    return box
end

function UL:AddOBtn(parent, name)
    local oFrm = Instance.new("Frame")
    oFrm.Parent = parent.Parent
    oFrm.Size = UDim2.new(0.9, 0, 1, 0) 
    oFrm.Position = UDim2.new(parent.Position.X.Scale + 1, 0, parent.Position.Y.Scale - 0.184, parent.Position.Y.Offset)
    oFrm.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    oFrm.BackgroundTransparency = 0.4
    oFrm.BorderSizePixel = 1
    oFrm.Visible = false

    local lbl = Instance.new("TextLabel")
    lbl.Parent = oFrm
    lbl.Text = name
    lbl.Size = UDim2.new(1, 0, 0, 30)
    lbl.Position = UDim2.new(0, 0, 0, 0)
    for prop, value in pairs(uiProperties) do
        lbl[prop] = value
    end

    local btn = Instance.new("TextButton")
    btn.Parent = parent
    btn.Text = name
    btn.Size = UDim2.new(1, 0, 0, 30)
    btn.Position = UDim2.new(0, 0, 0, #parent:GetChildren() * 30 - 30)
    for prop, value in pairs(uiProperties) do
        btn[prop] = value
    end

    function jaaaa()
        oFrm.BackgroundColor3 = oFrm.Visible and Color3.fromRGB(100, 0, 0) or Color3.fromRGB(65, 65, 65)
    end
    
    btn.MouseButton1Click:Connect(function()
        oFrm.Visible = not oFrm.Visible
              btn.BackgroundColor3 = oFrm.Visible and Color3.fromRGB(130, 0, 0) or Color3.fromRGB(65, 65, 65)
            jaaaa()
    end)

    return btn, oFrm
end

function UL:AddText(parent, text, color)
    local label = Instance.new("TextLabel")
    label.Parent = parent
    label.Text = text
    label.Size = UDim2.new(1, 0, 0, 30)
    label.Position = UDim2.new(0, 0, 0, #parent:GetChildren() * 30 - 30)
    label.BackgroundColor3 = Color3.fromRGB(250, 250, 250)
    label.BackgroundTransparency = 0.6
    label.TextColor3 = Color3.fromRGB(0, 0, 0)
    label.Font = Enum.Font.ArimoBold 
    
    label.TextSize = 13
    label.TextWrapped = true

    return label
end

game:GetService('Players').LocalPlayer.Idled:Connect(function()
    game:GetService('VirtualUser'):CaptureController()
    game:GetService('VirtualUser'):ClickButton2(Vector2.new())
end)
print("Loading Finish")
print("by: OneCreatorX")
        

return UL
