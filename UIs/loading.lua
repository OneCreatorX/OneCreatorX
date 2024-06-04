local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui", player.PlayerGui)
screenGui.Name = "LoadingScreen"

local background = Instance.new("Frame", screenGui)
background.Size = UDim2.new(0.6, 0, 0.8, 0)
background.Position = UDim2.new(0.2, 0, 0.1, 0)
background.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

local gradient = Instance.new("UIGradient", background)
gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 0, 0)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(50, 50, 50))
}

-- Imagen de logo (animada)
local logo = Instance.new("ImageLabel", background)
logo.Size = UDim2.new(1, 0, 1, 0)
logo.Position = UDim2.new(0, 0, 0, 0)
logo.BackgroundTransparency = 1
logo.Image = "rbxassetid://17696175496"

local columns = 4
local rows = 1
local totalFrames = 4
local currentFrame = 0

local frameWidth = 258
local frameHeight = 1200

local function animateSpriteSheet()
    while true do
        currentFrame = (currentFrame + 1) % totalFrames
        local column = currentFrame % columns
        local row = math.floor(currentFrame / columns)

        logo.ImageRectOffset = Vector2.new(column * frameWidth, row * frameHeight)
        wait(0.075)
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

local loadingTween = createTween(loadingBar, UDim2.new(1, 0, 5, 0), 2)
loadingTween:Play()
loadingTween.Completed:Connect(function()
    loadingLabel.Text = "OneLib Loaded v0.3"
    wait(0.5)
    local fadeOutTween = tweenService:Create(background, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1})
    fadeOutTween:Play()
    fadeOutTween.Completed:Connect(function()
        screenGui:Destroy()
    end)
end)
