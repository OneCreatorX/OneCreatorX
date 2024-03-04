local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")

local sg = Instance.new("ScreenGui")
sg.ResetOnSpawn = false

local fr = Instance.new("Frame")
fr.Size = UDim2.new(0, 200, 0, 150)
fr.Position = UDim2.new(0.5, -100, 0.5, -75)
fr.AnchorPoint = Vector2.new(0.5, 0.5)
fr.Draggable = true
fr.Active = true
fr.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

local title = Instance.new("TextLabel")
title.Text = "YT OneCreatorX"
title.Size = UDim2.new(1, 0, 0, 30)
title.TextSize = 18
title.TextColor3 = Color3.fromRGB(255, 0, 0)
title.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
title.Parent = fr

local clickBtn = Instance.new("TextButton")
clickBtn.Text = "Instant Plants"
clickBtn.Size = UDim2.new(0, 180, 0, 40)
clickBtn.Position = UDim2.new(0.5, -90, 0.5, -20)
clickBtn.Parent = fr
clickBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
clickBtn.TextSize = 14
clickBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

local isLooping = false

local function clickDetectorAction()
    isLooping = not isLooping
    clickBtn.BackgroundColor3 = isLooping and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(100, 100, 100)

    for i = 1, 30 do
        local args = {
            [1] = "Marshmallowrose",
            [2] = i,
            [3] = "SweetGarden"
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Plant"):WaitForChild("Events"):WaitForChild("RemoteEventPlantSeed"):FireServer(unpack(args))
    end 
end

clickBtn.MouseButton1Click:Connect(clickDetectorAction)

fr.Parent = sg
sg.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")

local args = {
        [1] = "Marshmallowrose",
        [2] = 15
    }

    game:GetService("ReplicatedStorage"):WaitForChild("Common"):WaitForChild("Upgrade"):FireServer(unpack(args))

while true do wait(0.1)
game:GetService("ReplicatedStorage"):WaitForChild("Common"):WaitForChild("ClaimSeeds"):FireServer()
end
