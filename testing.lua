local UL = {}
print("Version UI 0.2")
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
    loadingLabel.Text = "OneLib v0.2"
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
    for _, gui in ipairs(player.PlayerGui:GetChildren()) do
        if gui:IsA("ScreenGui") and gui:FindFirstChild("ULId") then
            gui:Destroy()
        end
    end

    local sg = Instance.new("ScreenGui")
    sg.Name = name
    sg.Parent = player.PlayerGui
    sg.ResetOnSpawn = false

    local id = Instance.new("BoolValue")
    id.Name = "ULId"
    id.Value = true
    id.Parent = sg

    return sg
end

local function createLabel(parent, text, size, position, color)
    local lbl = Instance.new("TextLabel")
    lbl.Parent = parent
    lbl.Size = size
    lbl.Position = position
    lbl.Text = text
    lbl.TextColor3 = color or Color3.fromRGB(255, 255, 255)
    lbl.Font = Enum.Font.GothamBold
    lbl.TextSize = 18
    lbl.BackgroundTransparency = 1
    lbl.TextWrapped = true
    lbl.TextXAlignment = Enum.TextXAlignment.Center
    lbl.TextYAlignment = Enum.TextYAlignment.Center
    return lbl
end

local function createButton(parent, text, size, position, properties)
    local btn = Instance.new("TextButton")
    btn.Parent = parent
    btn.Size = size
    btn.Position = position
    btn.Text = text
    for prop, value in pairs(properties or uiProperties) do
        btn[prop] = value
    end
    return btn
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

    createLabel(frm, title, UDim2.new(1, 0, 0, 33), UDim2.new(0, 0, -0.02, 0), Color3.fromRGB(350, 250, 23))

    local toggleBtn = createButton(frm, "+", UDim2.new(0, 30, 0, 30), UDim2.new(1, -30, 0, 0))

    local contentFrame = Instance.new("Frame")
    contentFrame.Parent = frm
    contentFrame.Size = UDim2.new(1, 0, 1, -30)
    contentFrame.Position = UDim2.new(0, 0, 0, 30)
    contentFrame.BackgroundTransparency = 0.6
    contentFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    contentFrame.Visible = false

    local minimized = true
    toggleBtn.MouseButton1Click:Connect(function()
        minimized = not minimized
        contentFrame.Visible = not minimized
        toggleBtn.Text = minimized and "+" or "-"
        frm.Size = UDim2.new(0.25, 0, 0, 60 + (minimized and 0 or #contentFrame:GetChildren() * 30))
    end)

    return frm, contentFrame
end

function UL:AddButton(parent, text, callback)
    local btn = createButton(parent, text, UDim2.new(1, 0, 0, 30), UDim2.new(0, 0, 0, #parent:GetChildren() * 30 - 30))
    btn.MouseButton1Click:Connect(callback)
    return btn
end

function UL:AddToggleButton(parent, text, state, callback)
    local btn = createButton(parent, text .. " [" .. (state and "ON" or "OFF") .. "]", UDim2.new(1, 0, 0, 30), UDim2.new(0, 0, 0, #parent:GetChildren() * 30 - 30))
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
    box.Size = UDim2.new(1, 0, 0, 30)
    box.Position = UDim2.new(0, 0, 0, #parent:GetChildren() * 30 - 30)
    box.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    box.TextColor3 = Color3.fromRGB(250, 250, 250)
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

    box.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            callback(box.Text)
        end
    end)

    return box
end

function UL:AddOptionsButton(parent, name)
    local optionsFrame = Instance.new("Frame")
    optionsFrame.Parent = parent.Parent
    optionsFrame.Size = UDim2.new(0.9, 0, 1, 0)
    optionsFrame.Position = UDim2.new(parent.Position.X.Scale + 1, 0, parent.Position.Y.Scale - 0.184, 0)
    optionsFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    optionsFrame.BackgroundTransparency = 0.4
    optionsFrame.BorderSizePixel = 1
    optionsFrame.Visible = false

    createLabel(optionsFrame, name, UDim2.new(1, 0, 0, 30), UDim2.new(0, 0, 0, 0))

    local btn = createButton(parent, name, UDim2.new(1, 0, 0, 30), UDim2.new(0, 0, 0, #parent:GetChildren() * 30 - 30))
    btn.MouseButton1Click:Connect(function()
        optionsFrame.Visible = not optionsFrame.Visible
        btn.BackgroundColor3 = optionsFrame.Visible and Color3.fromRGB(130, 0, 0) or Color3.fromRGB(65, 65, 65)
    end)

    return optionsFrame
end

function UL:AddDropDown(parent, name, options, callback)
    local dropDownBtn = createButton(parent, name, UDim2.new(1, 0, 0, 30), UDim2.new(0, 0, 0, #parent:GetChildren() * 30 - 30))
    local dropDownFrame = Instance.new("Frame")
    dropDownFrame.Parent = parent.Parent
    dropDownFrame.Size = UDim2.new(0.9, 0, 0, #options * 30)
    dropDownFrame.Position = UDim2.new(parent.Position.X.Scale + 1, 0, parent.Position.Y.Scale + dropDownBtn.Position.Y.Scale, 0)
    dropDownFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    dropDownFrame.BackgroundTransparency = 0.4
    dropDownFrame.BorderSizePixel = 1
    dropDownFrame.Visible = false

    for i, option in ipairs(options) do
        local optionBtn = createButton(dropDownFrame, option, UDim2.new(1, 0, 0, 30), UDim2.new(0, 0, 0, (i - 1) * 30))
        optionBtn.MouseButton1Click:Connect(function()
            dropDownBtn.Text = name .. ": " .. option
            dropDownFrame.Visible = false
            dropDownBtn.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
            callback(option)
        end)
    end

    dropDownBtn.MouseButton1Click:Connect(function()
        dropDownFrame.Visible = not dropDownFrame.Visible
        dropDownBtn.BackgroundColor3 = dropDownFrame.Visible and Color3.fromRGB(130, 0, 0) or Color3.fromRGB(65, 65, 65)
    end)

    return dropDownBtn, dropDownFrame
end

function UL:CreateUI(name)
    local screenGui = self:CreateScreenGui(name)
    local mainFrame, contentFrame = self:CreateFrame(screenGui, name)
    
    return {
        ScreenGui = screenGui,
        MainFrame = mainFrame,
        ContentFrame = contentFrame
    }
end

return UL
