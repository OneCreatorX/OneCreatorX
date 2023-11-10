local antiafkExecutado = false
local gui = Instance.new("ScreenGui")
gui.Name = "OneCreatorX_GUI"
gui.ResetOnSpawn = false
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- Crear el Frame principal
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 80)
frame.Position = UDim2.new(0, 10, 0.5, -40)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Parent = gui

-- Crear el título
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
title.BorderSizePixel = 0
title.Font = Enum.Font.GothamBold
title.Text = "OneCreatorX"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 18
title.Parent = frame

-- Crear el estado del AntiAFK
local antiafkStatus = Instance.new("TextLabel")
antiafkStatus.Size = UDim2.new(1, 0, 0, 30)
antiafkStatus.Position = UDim2.new(0, 0, 0, 30)
antiafkStatus.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
antiafkStatus.BorderSizePixel = 0
antiafkStatus.Font = Enum.Font.Gotham
antiafkStatus.Text = ". AntiAFK: On"
antiafkStatus.TextColor3 = Color3.fromRGB(0, 255, 0)
antiafkStatus.TextSize = 16
antiafkStatus.Parent = frame

-- Crear el texto "Automatic All UGC"
local ugcText = Instance.new("TextLabel")
ugcText.Size = UDim2.new(1, 0, 0, 20)
ugcText.Position = UDim2.new(0, 0, 1, -20)
ugcText.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ugcText.BorderSizePixel = 0
ugcText.Font = Enum.Font.Gotham
ugcText.Text = "Automatic All Tasks UGC"
ugcText.TextColor3 = Color3.fromRGB(255, 255, 255)
ugcText.TextSize = 14
ugcText.Parent = frame

-- Crear el TextBox para ajustar el tiempo de espera
local waitTimeTextBox = Instance.new("TextBox")
waitTimeTextBox.Size = UDim2.new(0, 30, 0, 20)
waitTimeTextBox.Position = UDim2.new(1.2, -210, 0, 30)
waitTimeTextBox.AnchorPoint = Vector2.new(0.5, 0)
waitTimeTextBox.BackgroundColor3 = Color3.fromRGB(240, 240, 240) -- Color de fondo claro
waitTimeTextBox.BorderSizePixel = 0
waitTimeTextBox.Font = Enum.Font.Gotham
waitTimeTextBox.Text = "1.5"
waitTimeTextBox.TextColor3 = Color3.fromRGB(40, 40, 40) -- Color de texto oscuro
waitTimeTextBox.TextSize = 12
waitTimeTextBox.Parent = frame


-- Ejecutar el antiafk solo una vez
if not antiafkExecutado then
    game.Players.LocalPlayer.Idled:Connect(function()
        local VirtualUser = game:GetService('VirtualUser')
        VirtualUser:CaptureController()
        VirtualUser:ClickButton2(Vector2.new())
    end)
    antiafkExecutado = true
end

local function claimRewards()
    for i = 1, 12 do
        local args = {
            [1] = "SessionClaim",
            [2] = i
        }

        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ReplicateGui"):FireServer(unpack(args))
        wait()
    end
end

while true do 
    if not antiafkExecutado then
        LocalPlayer.Idled:Connect(function()
            local VirtualUser = game:GetService('VirtualUser')
            VirtualUser:CaptureController()
            VirtualUser:ClickButton2(Vector2.new())
        end)
        antiafkExecutado = true
    end

    local function flecha(position, targetName)
        local args = {
            [1] = Vector3.new(position),
            [2] = targetName
        }

        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Fire"):FireServer(unpack(args))
    end

    local function teleportToWinsHitbox()
        local winsHitbox = Workspace.Levels.Level1.WinsHitbox
        local player = game.Players.LocalPlayer

        player.Character.HumanoidRootPart.CFrame = winsHitbox.CFrame
    end

    local function huevos()
        local args = {
            [1] = "DestroyPet",
            [2] = {
                [1] = "Baby Default Dog",
                [2] = "Baby Default Cat",
                [3] = "Baby Default Mail Cat",
                [4] = "Baby Default Royal Pig",
                [5] = "Baby Default Dragon"
            }
        }

        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ReplicateGui"):FireServer(unpack(args))

        args = {
            [1] = "Rebirth"
        }

        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ReplicateGui"):FireServer(unpack(args))

        for i = 1, 2 do
            args = {
                [1] = "Single",
                [2] = "Forest Egg"
            }

            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ReplicateEgg"):FireServer(unpack(args))
            wait()
        end
    end


local waitTime = tonumber(waitTimeTextBox.Text) or 1.5

    flecha(Vector3.new(106.26567840576172, 8.903579711914062, -1129.845458984375), "Target15_4")
    wait(waitTime)
    flecha(Vector3.new(106.26567840576172, 8.903579711914062, -1129.845458984375), "Target15_4")
    wait(waitTime)
    flecha(Vector3.new(106.26567840576172, 8.903579711914062, -1129.845458984375), "Target15_4")
    wait(waitTime)
    flecha(Vector3.new(106.26567840576172, 8.903579711914062, -1129.845458984375), "Target15_4")
    wait(waitTime)
    flecha(Vector3.new(106.26567840576172, 8.903579711914062, -1129.845458984375), "Target15_4")
    wait(waitTime)
    flecha(Vector3.new(106.26567840576172, 8.903579711914062, -1129.845458984375), "Target15_4")
    wait(waitTime)
    flecha(Vector3.new(106.26567840576172, 8.903579711914062, -1129.845458984375), "Target15_4")
    wait(waitTime)
    flecha(Vector3.new(106.26567840576172, 8.903579711914062, -1129.845458984375), "Target15_4")
    wait(waitTime)
    flecha(Vector3.new(106.26567840576172, 8.903579711914062, -1129.845458984375), "Target15_4")
    wait(waitTime)
    flecha(Vector3.new(106.26567840576172, 8.903579711914062, -1129.845458984375), "Target15_4")
    wait(waitTime)
    flecha(Vector3.new(106.26567840576172, 8.903579711914062, -1129.845458984375), "Target15_4")
    wait(waitTime)
    flecha(Vector3.new(106.26567840576172, 8.903579711914062, -1129.845458984375), "Target15_4")
    wait(waitTime)
    flecha(Vector3.new(106.26567840576172, 8.903579711914062, -1129.845458984375), "Target15_4")
    wait(waitTime)
    flecha(Vector3.new(106.26567840576172, 8.903579711914062, -1129.845458984375), "Target15_4")
    wait(waitTime)
    flecha(Vector3.new(106.26567840576172, 8.903579711914062, -1129.845458984375), "Target15_4")
    wait(waitTime)
    flecha(Vector3.new(106.26567840576172, 8.903579711914062, -1129.845458984375), "Target15_4")
    wait(waitTime)
    flecha(Vector3.new(106.26567840576172, 8.903579711914062, -1129.845458984375), "Target15_4")
    wait(waitTime)
    flecha(Vector3.new(106.26567840576172, 8.903579711914062, -1129.845458984375), "Target15_4")
    wait(waitTime)
    flecha(Vector3.new(106.26567840576172, 8.903579711914062, -1129.845458984375), "Target15_4")
    wait(waitTime)
    flecha(Vector3.new(106.26567840576172, 8.903579711914062, -1129.845458984375), "Target15_4")
    wait(waitTime)
    flecha(Vector3.new(106.26567840576172, 8.903579711914062, -1129.845458984375), "Target15_4")
    wait(waitTime)
    flecha(Vector3.new(106.26567840576172, 8.903579711914062, -1129.845458984375), "Target15_4")
    wait(waitTime)
    flecha(Vector3.new(106.26567840576172, 8.903579711914062, -1129.845458984375), "Target15_4")
    wait(waitTime)
    flecha(Vector3.new(106.26567840576172, 8.903579711914062, -1129.845458984375), "Target15_4")
    wait(waitTime)
    flecha(Vector3.new(106.26567840576172, 8.903579711914062, -1129.845458984375), "Target15_4")
    wait(waitTime)
    flecha(Vector3.new(-72.46856689453125, 8.990387916564941, -11.881105422973633), "Level1Wall1")
    wait(waitTime)
    flecha(Vector3.new(-89.96856689453125, 8.352636337280273, -14.12462329864502), "Level1Wall5")
    wait(waitTime)
    flecha(Vector3.new(-106.96856689453125, 8.91164779663086, -14.930907249450684), "Level1Wall6")
    wait(waitTime)
    flecha(Vector3.new(-123.96856689453125, 9.261276245117188, -13.509053230285645), "Level1Wall7")
    wait(waitTime)
    flecha(Vector3.new(-142.96856689453125, 8.859756469726562, -17.305110931396484), "Level1Wall8")
    wait(waitTime)
    flecha(Vector3.new(-160.23095703125, 8.81210708618164, -14.728170394897461), "Level1Wall11")
    wait(waitTime)
    flecha(Vector3.new(-160.23095703125, 8.81210708618164, -14.728170394897461), "Level1Wall11")
    huevos()
    teleportToWinsHitbox()
    wait()

    claimRewards()
wait()
end
