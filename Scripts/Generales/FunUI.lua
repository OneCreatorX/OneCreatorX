local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local TweenService = game:GetService("TweenService")
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "GameButtons"
screenGui.ResetOnSpawn = false
screenGui.Parent = game.Players.LocalPlayer.PlayerGui

local function fadeOutButton(button, closeButton)
    local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local properties = {
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 0, 0, button.AbsolutePosition.Y - closeButton.Size.Y.Offset),
    }

    local tween = TweenService:Create(button, tweenInfo, properties)
    tween:Play()
    tween.Completed:Connect(function()
        button.Visible = false  -- Ocultar el botón en lugar de destruirlo
    end)

    closeButton.Visible = false  -- Ocultar el botón "X"
end

local function createButton(name, filename, id, yOffset)
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, 60)
    frame.Position = UDim2.new(0, 0, 0, 50 + yOffset)
    frame.BackgroundColor3 = Color3.new(0, 0, 0)
    frame.BackgroundTransparency = 0.5
    frame.Parent = screenGui

    local button = Instance.new("TextButton")
    button.Name = name
    button.Size = UDim2.new(0, 200, 0, 50)
    button.Position = UDim2.new(0.5, -100, 0, 5)
    button.Text = "Play " .. name
    button.Font = Enum.Font.SourceSans
    button.TextSize = 24
    button.TextColor3 = Color3.new(1, 1, 1)
    button.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    button.Parent = frame

    local closeButton = Instance.new("TextButton")
    closeButton.Size = UDim2.new(0, 20, 0, 20)
    closeButton.Position = UDim2.new(1, -20, 0, 5)
    closeButton.Text = "X"
    closeButton.Font = Enum.Font.SourceSans
    closeButton.TextSize = 18
    closeButton.TextColor3 = Color3.new(1, 0, 0)
    closeButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    closeButton.Parent = frame

    local scriptUrl = "https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/Games/Fun/" .. filename .. ".lua"

    button.MouseButton1Click:Connect(function()
        loadstring(HttpService:GetAsync(scriptUrl))()
        fadeOutButton(frame, closeButton)
    end)

    closeButton.MouseButton1Click:Connect(function()
        fadeOutButton(frame, closeButton)
    end)

    return frame
end

local linkURL = "https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/UIs/FunUI/Links.lua"
local response = game:HttpGet(linkURL)

local yOffset = 0

for line in response:gmatch("[^\r\n]+") do
    local name, filename, id = line:match("([^:]+):([^:]+):([^:]+)")

    if name and filename and id and tonumber(id) == game.GameId then
        createButton(name, filename, id, yOffset)
        yOffset = yOffset + 70
    end
end

UserInputService.InputBegan:Connect(function(input, isProcessed)
    if input.UserInputType == Enum.UserInputType.Touch and not isProcessed then
        local button = input.UserInputObject.Parent
        if button:IsA("TextButton") then
            button:Activate()
        end
    end
end)
