local UL = {}
print("Version UI 0.1")
print("Loading OneLib")

local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui", player.PlayerGui)
screenGui.Name = "LoadingScreen"

local loadingFrame = Instance.new("Frame", screenGui)
loadingFrame.Size = UDim2.new(0.3, 0, 0.1, 0)
loadingFrame.Position = UDim2.new(0.35, 0, 0.45, 0)
loadingFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
loadingFrame.BorderSizePixel = 0

local loadingLabel = Instance.new("TextLabel", loadingFrame)
loadingLabel.Size = UDim2.new(1, 0, 0.5, 0)
loadingLabel.Position = UDim2.new(0, 0, 0, 0)
loadingLabel.Text = "Loading OneLib..."
loadingLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
loadingLabel.Font = Enum.Font.GothamBold
loadingLabel.TextSize = 24
loadingLabel.BackgroundTransparency = 1

local loadingBar = Instance.new("Frame", loadingFrame)
loadingBar.Size = UDim2.new(0, 0, 0.5, 0)
loadingBar.Position = UDim2.new(0, 0, 0.5, 0)
loadingBar.BackgroundColor3 = Color3.fromRGB(0, 255, 0)

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

function UL:CreateScreenGui(name)
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

function UL:CreateFrame(parent, title)
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

    local minimized = true
    tbtn.MouseButton1Click:Connect(function()
        minimized = not minimized
        cfrm.Visible = not minimized
        tbtn.Text = minimized and "+" or "-"
        frm.Size = UDim2.new(0.25, 0, 0, minimized and 60 or 60 + #cfrm:GetChildren() * 30)
    end)

    return frm, cfrm
end

function UL:AddButton(parent, text, callback)
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

function UL:AddToggleButton(parent, text, state, callback)
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

function UL:AddTextBox(parent, placeholder, callback)
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


function UL:AddOptionButton(parent, name)
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

    btn.MouseButton1Click:Connect(function()
        oFrm.Visible = not oFrm.Visible
        btn.BackgroundColor3 = oFrm.Visible and Color3.fromRGB(130, 0, 0) or Color3.fromRGB(65, 65, 65)
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
    label.TextColor3 = color or Color3.fromRGB(0, 0, 0)
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
