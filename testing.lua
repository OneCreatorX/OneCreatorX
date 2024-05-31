local UL = {}
print("Version UI 0.1")
print("Loading OneLib")

local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui", player.PlayerGui)
screenGui.Name = "OneLibScreen"

local function createInstance(class, properties, parent)
    local instance = Instance.new(class)
    for prop, value in pairs(properties) do
        instance[prop] = value
    end
    instance.Parent = parent
    return instance
end

local function createTween(instance, properties, duration)
    local tweenService = game:GetService("TweenService")
    return tweenService:Create(instance, TweenInfo.new(duration, Enum.EasingStyle.Linear), properties)
end

local function createFrame(parent, properties)
    return createInstance("Frame", properties, parent)
end

local function createLabel(parent, properties)
    return createInstance("TextLabel", properties, parent)
end

local function createButton(parent, properties, callback)
    local button = createInstance("TextButton", properties, parent)
    button.MouseButton1Click:Connect(callback)
    return button
end

local function createBox(parent, properties)
    return createInstance("TextBox", properties, parent)
end

local function createToggle(parent, properties, callback)
    local toggle = createInstance("TextButton", properties, parent)
    toggle.MouseButton1Click:Connect(callback)
    return toggle
end

local loadingFrame = createFrame(screenGui, {Size = UDim2.new(0.3, 0, 0.1, 0), Position = UDim2.new(0.35, 0, 0.45, 0), BackgroundColor3 = Color3.fromRGB(0, 0, 0), BackgroundTransparency = 0, BorderSizePixel = 0})
local loadingLabel = createLabel(loadingFrame, {Size = UDim2.new(1, 0, 0.5, 0), Position = UDim2.new(0, 0, 0, 0), Text = "Loading OneLib...", TextColor3 = Color3.fromRGB(255, 255, 255), Font = Enum.Font.GothamBold, TextSize = 24, BackgroundTransparency = 1})
local loadingBar = createFrame(loadingFrame, {Size = UDim2.new(0, 0, 0.5, 0), Position = UDim2.new(0, 0, 0.5, 0), BackgroundColor3 = Color3.fromRGB(0, 255, 0), BackgroundTransparency = 0, BorderSizePixel = 0})

local loadingTween = createTween(loadingBar, {Size = UDim2.new(1, 0, 0.5, 0)}, 2)
loadingTween:Play()
loadingTween.Completed:Connect(function()
    loadingLabel.Text = "OneLib v0.1"
    wait(1)
    screenGui:Destroy()
end)
wait(3)

local uiProperties = {
    Button = {
        BackgroundColor3 = Color3.fromRGB(70, 130, 180),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Font = Enum.Font.GothamBold,
        TextSize = 14
    },
    Box = {
        BackgroundColor3 = Color3.fromRGB(245, 245, 245),
        TextColor3 = Color3.fromRGB(0, 0, 0),
        Font = Enum.Font.Gotham,
        TextSize = 14
    },
    Toggle = {
        BackgroundColor3 = Color3.fromRGB(34, 139, 34),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Font = Enum.Font.GothamBold,
        TextSize = 14
    },
    Text = {
        BackgroundTransparency = 1,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Font = Enum.Font.Gotham,
        TextSize = 14
    }
}

function UL:Scg(name)
    local sg = createInstance("ScreenGui", {Name = name, ResetOnSpawn = false}, player.PlayerGui)
    return sg
end

function UL:Opc(name)
    local frame = createFrame(screenGui, {Size = UDim2.new(0.25, 0, 0, 60), Position = UDim2.new(0.2, 0, 0.2, 0), BackgroundColor3 = Color3.fromRGB(45, 45, 45), BackgroundTransparency = 0.4, BorderSizePixel = 1, Active = true, Draggable = true})
    local label = createLabel(frame, {Size = UDim2.new(1, 0, 0, 33), Position = UDim2.new(0, 0, -0.02, 0), Text = name, TextColor3 = Color3.fromRGB(350, 250, 23), Font = Enum.Font.GothamBold, TextSize = 18, BackgroundTransparency = 1})
    createInstance("UICorner", {CornerRadius = UDim.new(0, 4)}, label)
    createInstance("UIPadding", {PaddingLeft = UDim.new(0, 5), PaddingRight = UDim.new(0, 5), PaddingTop = UDim.new(0, 5), PaddingBottom = UDim.new(0, 5)}, label)

    local optionsContainer = createFrame(frame, {Size = UDim2.new(1, 0, 1, -30), Position = UDim2.new(0, 0, 0, 30), BackgroundTransparency = 0.6, BackgroundColor3 = Color3.fromRGB(0, 0, 0)})
    optionsContainer.Visible = true

    return optionsContainer
end

function UL:Button(parent, text, callback)
    return createButton(parent, {Text = text, Size = UDim2.new(1, 0, 0, 30), Position = UDim2.new(0, 0, #parent:GetChildren() * 30 - 30)}, callback)
end

function UL:Box(parent, placeholderText)
    return createBox(parent, {PlaceholderText = placeholderText, Size = UDim2.new(1, 0, 0, 30), Position = UDim2.new(0, 0, #parent:GetChildren() * 30 - 30)})
end

function UL:Toggle(parent, text, callback)
    return createToggle(parent, {Text = text, Size = UDim2.new(1, 0, 0, 30), Position = UDim2.new(0, 0, #parent:GetChildren() * 30 - 30)}, callback)
end

function UL:Text(parent, text)
    return createLabel(parent, {Text = text, Size = UDim2.new(1, 0, 0, 30), Position = UDim2.new(0, 0, #parent:GetChildren() * 30 - 30)})
end


return UL
