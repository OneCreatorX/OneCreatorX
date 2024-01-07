local function createFrame(assetId, itemValue)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 150, 0, 160)
    frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    frame.BorderSizePixel = 2
    frame.BorderColor3 = Color3.fromRGB(100, 100, 100)
    frame.BackgroundTransparency = 0.7
    frame.LayoutOrder = 1

    local imageLabel = Instance.new("ImageLabel")
    imageLabel.Size = UDim2.new(0, 150, 0, 150)
    imageLabel.Position = UDim2.new(0, 0, 0, 0)
    imageLabel.Image = "rbxthumb://type=Asset&id=" .. assetId .. "&w=150&h=150"
    imageLabel.Parent = frame
    imageLabel.BackgroundColor3 = Color3.fromRGB(139, 0, 0)
    imageLabel.BackgroundTransparency = 0.6

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(0, 150, 0, 20)
    textLabel.Position = UDim2.new(0, 0, 0, 150)
    textLabel.Text = "$" .. itemValue
    textLabel.TextScaled = true
    textLabel.TextColor3 = Color3.fromRGB(0, 128, 255)
    textLabel.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
    textLabel.Parent = frame

    local isTouching = false
    local touchStartPosition = nil

    local function onTouchBegan(position)
        isTouching = true
        touchStartPosition = position
    end

    local function onTouchEnded(position)
        if isTouching then
            local distance = (position - touchStartPosition).Magnitude
            if distance < 5 then
                local args = {[1] = assetId}
                game:GetService("ReplicatedStorage"):WaitForChild("UGCOwnershipComms"):WaitForChild("RE"):WaitForChild("UGCPurchaseRequested"):FireServer(unpack(args))
            end
        end

        isTouching = false
        touchStartPosition = nil
    end

    frame.InputBegan:Connect(function(input, isProcessed)
        if not isProcessed and input.UserInputType == Enum.UserInputType.Touch then
            onTouchBegan(input.Position)
        end
    end)

    frame.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch then
            onTouchEnded(input.Position)
        end
    end)

    return frame
end

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer.PlayerGui

local scrollingFrame = Instance.new("ScrollingFrame")
scrollingFrame.Size = UDim2.new(0, 470, 0, 338)
scrollingFrame.Position = UDim2.new(0, 50, 0, 80)
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollingFrame.BackgroundColor3 = Color3.new(0, 0, 0)
scrollingFrame.Parent = screenGui
scrollingFrame.ScrollBarThickness = 8
scrollingFrame.ScrollBarImageTransparency = 0.2

local linkURL = "https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/Data.txt"
local response = game:HttpGet(linkURL)

local data = {}
for id, value in response:gmatch("(%d+):(%d+)") do
    table.insert(data, {id = id, value = value})
end

local padding, rowSize, xOffset, yOffset = 10, 3, 0, 0

for i, d in ipairs(data) do
    local frame = createFrame(d.id, d.value)
    frame.Parent = scrollingFrame
    frame.Position = UDim2.new(0, xOffset, 0, yOffset)

    xOffset = xOffset + frame.Size.X.Offset + padding

    if i % rowSize == 0 then
        xOffset, yOffset = 0, yOffset + frame.Size.Y.Offset + padding
    end
end

scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, yOffset)

local text = "YT:@OneCreatorX"
local textLength = #text

local function generateRandomColor()
    return Color3.new(math.random(), math.random(), math.random())
end

local letters = {}

for i = 1, textLength do
    local letter = Instance.new("TextLabel")
    letter.Size = UDim2.new(1 / textLength, 0, 1, 0)
    letter.Position = UDim2.new((i - 1) / textLength, 0, -0.4, 0)
    letter.Text = text:sub(i, i)
    letter.TextScaled = true
    letter.BackgroundTransparency = 1
    letter.TextColor3 = generateRandomColor()
    letter.BackgroundColor3 = Color3.fromRGB(128, 0, 128)  -- Mantiene el fondo del texto anterior
    letter.Parent = screenGui

    table.insert(letters, letter)
end

spawn(function()
    while true do
        for _, letter in ipairs(letters) do
            letter.TextColor3 = generateRandomColor()
        end
        wait(0.3)
    end
end)
