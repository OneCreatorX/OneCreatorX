local UI = {
    BackgroundColor3 = Color3.fromRGB(65, 65, 65),
    Transparency = 0.8,
    TextColor3 = Color3.fromRGB(255, 255, 255),
    Font = Enum.Font.LuckiestGuy,
    TextSize = 13
}

local function CreateSG(name)
    for _, gui in ipairs(game.Players.LocalPlayer:WaitForChild("PlayerGui"):GetChildren()) do
        if gui:IsA("ScreenGui") and gui:FindFirstChild("ID") then
            gui:Destroy()
        end
    end

    local sg = Instance.new("ScreenGui")
    sg.Name = name
    sg.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    sg.ResetOnSpawn = false

    local id = Instance.new("BoolValue")
    id.Name = "ID"
    id.Value = true
    id.Parent = sg

    return sg
end

local function CreateFrm(parent, title)
    local f = Instance.new("Frame")
    f.Parent = parent
    f.Size = UDim2.new(0.25, 0, 0, 60)
    f.Position = UDim2.new(0.2, 0, 0.2, 0)
    f.BackgroundColor3 = UI.BackgroundColor3
    f.BackgroundTransparency = UI.Transparency
    f.BorderSizePixel = 1
    f.Active = true
    f.Draggable = true

    return f
end

local function AddBtn(parent, text, callback)
    local b = Instance.new("TextButton")
    b.Parent = parent
    b.Text = text
    b.Size = UDim2.new(1, 0, 0, 30)
    b.Position = UDim2.new(0, 0, 0, #parent:GetChildren() * 30 - 30)
    for prop, value in pairs(UI) do
        b[prop] = value
    end

    b.MouseButton1Click:Connect(callback)
    
    return b
end

local function AddTBtn(parent, text, state, callback)
    local tb = Instance.new("TextButton")
    tb.Parent = parent
    tb.Text = text .. " [" .. (state and "ON" or "OFF") .. "]"
    tb.Size = UDim2.new(1, 0, 0, 30)
    tb.Position = UDim2.new(0, 0, 0, #parent:GetChildren() * 30 - 30)
    for prop, value in pairs(UI) do
        tb[prop] = value
    end

    tb.MouseButton1Click:Connect(function()
        state = not state
        tb.Text = text .. " [" .. (state and "ON" or "OFF") .. "]"
        tb.BackgroundColor3 = state and Color3.fromRGB(85, 170, 85) or UI.BackgroundColor3
        callback(state)
    end)

    return tb
end

local function AddTBox(parent, placeholder, callback)
    local tb = Instance.new("TextBox")
    tb.Parent = parent
    tb.PlaceholderText = placeholder
    tb.Text = ""
    tb.BorderSizePixel = 1
    tb.Size = UDim2.new(1, 0, 0, 30)
    tb.Position = UDim2.new(0, 0, 0, #parent:GetChildren() * 30 - 30)

    for prop, value in pairs(UI) do
        if prop ~= "TextColor3" then
            tb[prop] = value
        end
    end
    
    tb.TextColor3 = UI.TextColor3

    tb.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            callback(tb.Text)
        end
    end)

    return tb
end

local function AddOBtn(parent, name)
    local oFrm = Instance.new("Frame")
    oFrm.Parent = parent.Parent
    oFrm.Size = UDim2.new(0.9, 0, 1, 0) 
    oFrm.Position = UDim2.new(parent.Position.X.Scale + 1, 0, parent.Position.Y.Scale - 0.184, parent.Position.Y.Offset)
    oFrm.BackgroundColor3 = UI.BackgroundColor3
    oFrm.BackgroundTransparency = UI.Transparency
    oFrm.BorderSizePixel = 1
    oFrm.Visible = false

    local lbl = Instance.new("TextLabel")
    lbl.Parent = oFrm
    lbl.Text = name
    lbl.Size = UDim2.new(1, 0, 0, 30)
    lbl.Position = UDim2.new(0, 0, 0, 0)
    for prop, value in pairs(UI) do
        lbl[prop] = value
    end

    local btn = Instance.new("TextButton")
    btn.Parent = parent
    btn.Text = name
    btn.Size = UDim2.new(1, 0, 0, 30)
    btn.Position = UDim2.new(0, 0, 0, #parent:GetChildren() * 30 - 30)
    for prop, value in pairs(UI) do
        btn[prop] = value
    end

    btn.MouseButton1Click:Connect(function()
        oFrm.Visible = not oFrm.Visible
        btn.BackgroundColor3 = oFrm.Visible and Color3.fromRGB(130, 0, 0) or UI.BackgroundColor3
    end)

    return btn, oFrm
end

game:GetService('Players').LocalPlayer.Idled:Connect(function()
    game:GetService('VirtualUser'):CaptureController()
    game:GetService('VirtualUser'):ClickButton2(Vector2.new())
end)

print("Version UI 0.1")
print("Loading OneLib")

local player = game.Players.LocalPlayer
local screenGui = CreateSG("LoadingScreen")

local loadingFrame = CreateFrm(screenGui, "Loading OneLib...")
local loadingBar = AddBtn(loadingFrame, "+", function() end)

local function OnLoadFinish()
    wait(3)
    screenGui:Destroy()
end

OnLoadFinish()

print("Loading Finish")
print("by: OneCreatorX")

return {
    CreateSG = CreateSG,
    CreateFrm = CreateFrm,
    AddBtn = AddBtn,
    AddTBtn = AddTBtn,
    AddTBox = AddTBox,
    AddOBtn = AddOBtn
}
