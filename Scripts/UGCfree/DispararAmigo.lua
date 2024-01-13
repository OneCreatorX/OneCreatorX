local antiafkExecutado = false
local gui = Instance.new("ScreenGui")
gui.Name = "OneCreatorX_GUI"
gui.ResetOnSpawn = false
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame", gui)
frame.Size, frame.Position, frame.BackgroundColor3, frame.BorderSizePixel = UDim2.new(0, 200, 0, 80), UDim2.new(0, 10, 0.5, -40), Color3.fromRGB(30, 30, 30), 0

local title = Instance.new("TextLabel", frame)
title.Size, title.BackgroundColor3, title.BorderSizePixel, title.Font, title.Text, title.TextColor3, title.TextSize = UDim2.new(1, 0, 0, 30), Color3.fromRGB(50, 50, 50), 0, Enum.Font.GothamBold, "OneCreatorX", Color3.fromRGB(255, 255, 255), 18

local antiafkStatus = Instance.new("TextLabel", frame)
antiafkStatus.Size, antiafkStatus.Position, antiafkStatus.BackgroundColor3, antiafkStatus.BorderSizePixel, antiafkStatus.Font, antiafkStatus.Text, antiafkStatus.TextColor3, antiafkStatus.TextSize = UDim2.new(1, 0, 0, 30), UDim2.new(0, 0, 0, 30), Color3.fromRGB(40, 40, 40), 0, Enum.Font.Gotham, ". AntiAFK: On", Color3.fromRGB(0, 255, 0), 16

local ugcText = Instance.new("TextLabel", frame)
ugcText.Size, ugcText.Position, ugcText.BackgroundColor3, ugcText.BorderSizePixel, ugcText.Font, ugcText.Text, ugcText.TextColor3, ugcText.TextSize = UDim2.new(1, 0, 0, 20), UDim2.new(0, 0, 1, -20), Color3.fromRGB(30, 30, 30), 0, Enum.Font.Gotham, "Automatic All Tasks UGC", Color3.fromRGB(255, 255, 255), 14

local waitTimeTextBox = Instance.new("TextBox", frame)
waitTimeTextBox.Size, waitTimeTextBox.Position, waitTimeTextBox.AnchorPoint, waitTimeTextBox.BackgroundColor3, waitTimeTextBox.BorderSizePixel, waitTimeTextBox.Font, waitTimeTextBox.Text, waitTimeTextBox.TextColor3, waitTimeTextBox.TextSize = UDim2.new(0, 30, 0, 20), UDim2.new(1.2, -210, 0, 30), Vector2.new(0.5, 0), Color3.fromRGB(240, 240, 240), 0, Enum.Font.Gotham, "1.5", Color3.fromRGB(40, 40, 40), 12

if not antiafkExecutado then
    game.Players.LocalPlayer.Idled:Connect(function()
        game:GetService('VirtualUser'):CaptureController():ClickButton2(Vector2.new())
    end)
    antiafkExecutado = true
end

local function claimRewards()
    for i = 1, 12 do
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ReplicateGui"):FireServer("SessionClaim", i)
        wait()
    end
end

while true do
    if not antiafkExecutado then
        game.Players.LocalPlayer.Idled:Connect(function()
            game:GetService('VirtualUser'):CaptureController():ClickButton2(Vector2.new())
        end)
        antiafkExecutado = true
    end

    local function flecha(position, targetName)
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Fire"):FireServer(Vector3.new(position), targetName)
    end

    local function teleportToWinsHitbox()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.Levels.Level1.WinsHitbox.CFrame
    end

    local function huevos()
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ReplicateGui"):FireServer("DestroyPet", {
            "Baby Default Dog", "Baby Default Cat", "Baby Default Mail Cat", "Baby Default Royal Pig", "Baby Default Dragon"
        })

        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ReplicateGui"):FireServer("Rebirth")

        for i = 1, 2 do
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ReplicateEgg"):FireServer("Single", "Forest Egg")
            wait()
        end
    end

    local waitTime = tonumber(waitTimeTextBox.Text) or 1.5

    for _ = 1, 24 do
        flecha(Vector3.new(106.27, 8.9, -1129.85), "Target15_4")
        wait(waitTime)
    end

    flecha(Vector3.new(-72.47, 8.99, -11.88), "Level1Wall1")
    wait(waitTime)
    flecha(Vector3.new(-89.97, 8.35, -14.12), "Level1Wall5")
    wait(waitTime)
    flecha(Vector3.new(-106.97, 8.91, -14.93), "Level1Wall6")
    wait(waitTime)
    flecha(Vector3.new(-123.97, 9.26, -13.51), "Level1Wall7")
    wait(waitTime)
    flecha(Vector3.new(-142.97, 8.86, -17.31), "Level1Wall8")
    wait(waitTime)
    flecha(Vector3.new(-160.23, 8.81, -14.73), "Level1Wall11")

    huevos()
    teleportToWinsHitbox()
    wait()
    claimRewards()
    wait()
end
