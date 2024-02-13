-- Auto Spin GUI

local player = game.Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ugcAssetIds = ReplicatedStorage:WaitForChild("ugcAssetIds")
local Remotes = ReplicatedStorage:WaitForChild("Remotes")

local gui = Instance.new("ScreenGui")
gui.Parent = player.PlayerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 100)
frame.Position = UDim2.new(0.8, 0, 0.1, 0)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.Parent = gui

local title = Instance.new("TextLabel")
title.Text = "Auto Spin"
title.Parent = frame
title.Position = UDim2.new(0, 0, -0.4, 0)
title.Size = UDim2.new(1, 0, 0, 30)
title.TextSize = 18
title.Font = Enum.Font.SourceSansBold
title.TextColor3 = Color3.fromRGB(255, 255, 255)

local assetButtons = {}
local selectedButton = nil
local loopInterval = 1

local function createAssetButton(image, value)
    local button = Instance.new("ImageButton")
    button.Name = "AssetButton"
    button.Parent = frame
    button.Size = UDim2.new(1, 0, 0, 50)
    button.Position = UDim2.new(0, 0, 0, #assetButtons * 50)
    button.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
    button.Image = image
    button.MouseButton1Click:Connect(function()
        if selectedButton == button then
            selectedButton = nil
            button.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
        else
            if selectedButton then
                selectedButton.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
            end
            selectedButton = button
            button.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
            spawn(function()
                while selectedButton == button do
                    local args = {
                        [1] = value
                    }
                    Remotes:WaitForChild("Spin"):InvokeServer(unpack(args))
                    Remotes:WaitForChild("UpdateSelected"):InvokeServer(unpack(args))
                    wait(loopInterval)
                end
            end)
        end
    end)
    table.insert(assetButtons, button)
    frame.Size = UDim2.new(0, 100, 0, #assetButtons * 35)
end

local function buildGUI()
    local descendants = ugcAssetIds:GetDescendants()

    for _, descendant in pairs(descendants) do
        if descendant:IsA("ImageButton") then
            local value = descendant.Parent
            local image = descendant.Image
            if value and image and type(image) == "string" and image ~= "" then
                createAssetButton(image, value)
            end
        end
    end
end

buildGUI()
game:GetService('Players').LocalPlayer.Idled:Connect(function()
    game:GetService('VirtualUser'):CaptureController()
    game:GetService('VirtualUser'):ClickButton2(Vector2.new())
end)
