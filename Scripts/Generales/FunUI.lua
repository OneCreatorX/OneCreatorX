local UserInputService = game:GetService("UserInputService")
local HttpService = game:GetService("HttpService")
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "GameButtons"
screenGui.ResetOnSpawn = false
screenGui.Parent = game.Players.LocalPlayer.PlayerGui

local function fadeOutButton(button)
    local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local properties = {
        BackgroundTransparency = 1,
        TextTransparency = 1,
    }

    local tween = game:GetService("TweenService"):Create(button, tweenInfo, properties)
    tween:Play()
    tween.Completed:Connect(function()
        button:Destroy()
    end)
end

local function createButton(name, filename, id)
    local button = Instance.new("TextButton")
    button.Name = name
    button.Size = UDim2.new(0, 200, 0, 50)
    button.Position = UDim2.new(0.5, -100, 0, 50)
    button.Text = "Play " .. name
    button.Font = Enum.Font.SourceSans
    button.TextSize = 24
    button.TextColor3 = Color3.new(1, 1, 1)
    button.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    button.Parent = screenGui

    local scriptUrl = "https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/Games/Fun/" .. filename .. ".lua"

    button.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet(scriptUrl))()
        fadeOutButton(button)
    end)

    return button
end

local linkURL = "https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/UIs/FunUI/Links.lua"
local response = game:HttpGet(linkURL)

local yOffset = 0

for line in response:gmatch("[^\r\n]+") do
    local name, filename, id = line:match("([^:]+):([^:]+):([^:]+)")

    if name and filename and id and tonumber(id) == game.GameId then
        createButton(name, filename, id)
        yOffset = yOffset + 60
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
