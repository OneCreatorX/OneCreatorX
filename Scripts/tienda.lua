local function createFrame(assetId, itemValue)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 150, 0, 160)
    frame.BackgroundColor3 = Color3.fromRGB(200, 200, 200)
    frame.BorderSizePixel = 2
    frame.BorderColor3 = Color3.fromRGB(100, 100, 100)
    frame.BackgroundTransparency = 0.5
    frame.LayoutOrder = 1

    local imageLabel = Instance.new("ImageLabel")
    imageLabel.Size = UDim2.new(0, 150, 0, 150)
    imageLabel.Position = UDim2.new(0, 0, 0, 0)
    imageLabel.Image = "rbxthumb://type=Asset&id=" .. assetId .. "&w=150&h=150"
    imageLabel.Parent = frame
    imageLabel.BackgroundTransparency = 1

    local textLabel = Instance.new("TextLabel")
    textLabel.Size = UDim2.new(0, 150, 0, 20)
    textLabel.Position = UDim2.new(0, 0, 0, 150)
    textLabel.Text = "$" .. itemValue
    textLabel.TextScaled = true
    textLabel.TextColor3 = Color3.fromRGB(50, 50, 50)
    textLabel.Parent = frame

    -- Agregar colores
    frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)  -- Color de fondo del frame
    textLabel.TextColor3 = Color3.fromRGB(0, 128, 255)  -- Color del texto

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
scrollingFrame.Size = UDim2.new(0, 470, 0, 300)
scrollingFrame.Position = UDim2.new(0, 50, 0, 80)
scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
scrollingFrame.Parent = screenGui
scrollingFrame.ScrollBarThickness = 8
scrollingFrame.ScrollBarImageTransparency = 0.2

local titleTextLabel = Instance.new("TextLabel")
titleTextLabel.Size = UDim2.new(0.4, 0, 0, 30)
titleTextLabel.Position = UDim2.new(0.09, 0, 0.08, 10)
titleTextLabel.Text = "YT:@OneCreatorX"
titleTextLabel.TextScaled = true
titleTextLabel.TextColor3 = Color3.fromRGB(50, 50, 50)
titleTextLabel.Parent = screenGui

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
