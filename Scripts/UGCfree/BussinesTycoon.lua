local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")

local sg = Instance.new("ScreenGui")
sg.ResetOnSpawn = false
sg.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")

local fr = Instance.new("Frame")
fr.Size = UDim2.new(0, 220, 0, 190) 
fr.Position = UDim2.new(0.5, -110, 0.5, -100)
fr.AnchorPoint = Vector2.new(0.5, 0.5)
fr.Draggable = true
fr.Active = true
fr.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

local title = Instance.new("TextLabel")
title.Text = "YT:@OneCreatorX"
title.Size = UDim2.new(1, 0, 0, 30)
title.TextSize = 17
title.TextColor3 = Color3.fromRGB(255, 0, 0)
title.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
title.Parent = fr

local subtitle = Instance.new("TextLabel")
subtitle.Text = "Anti AFK - Auto Buttons: ON"
subtitle.Size = UDim2.new(1, 0, 0, 30)
subtitle.TextSize = 12
subtitle.TextColor3 = Color3.fromRGB(255, 0, 0)
subtitle.BackgroundColor3 = Color3.fromRGB(75, 75, 75)
subtitle.Position = UDim2.new(0, 0, 0, 155) 
subtitle.Parent = fr

local clickBtn = Instance.new("TextButton")
clickBtn.Text = "Auto Money"
clickBtn.Size = UDim2.new(0, 180, 0, 40)
clickBtn.Position = UDim2.new(0.5, -90, 0, 100) 
clickBtn.Parent = fr
clickBtn.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
clickBtn.TextSize = 14
clickBtn.TextColor3 = Color3.fromRGB(255, 255, 255)

local clickBt = Instance.new("TextButton")
clickBt.Text = "Auto Working"
clickBt.Size = UDim2.new(0, 180, 0, 40)
clickBt.Position = UDim2.new(0.5, -90, 0, 45)
clickBt.Parent = fr
clickBt.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
clickBt.TextSize = 14
clickBt.TextColor3 = Color3.fromRGB(255, 255, 255)

local isLooping = false
local sLooping = false

local player = game.Players.LocalPlayer
local gamepassesFolder = player.PlayerData.Gamepasses

if gamepassesFolder then
    for _, boolValue in pairs(gamepassesFolder:GetChildren()) do
        pcall(function()
            if boolValue:IsA("BoolValue") then
                boolValue.Value = true
            end
        end)
    end
else
    warn("No se encontró la carpeta de Gamepasses en PlayerData.")
end

local player = game.Players.LocalPlayer
local playerName = player.DisplayName .. "'s Business"
local tycoonPlots = game.Workspace.TycoonPlots
local playerPlot = nil

pcall(function()
    for _, plot in pairs(tycoonPlots:GetDescendants()) do
        if plot:IsA("Part") and plot.Name == "Board" then
            local sign = plot:FindFirstChild("Sign")
            local title = sign and sign:FindFirstChild("Title")

            if title and title:IsA("TextLabel") then
                local titleText = title.Text
                print("Buscando:", playerName)
                print("Encontrado:", titleText)

                if titleText and titleText == playerName then
                    playerPlot = plot.Parent.Parent.Parent
                    print("El jugador local está en el Plot", playerPlot.Name)
                    break
                end
            end
        end
    end
end)

if not playerPlot then
    warn("No se encontró el Plot del jugador local.")
end

local playerPlot = playerPlot

local function sendRemote(floorNumber, conveyorNumber, workerNumber, dropperNumber)
    pcall(function()
        local floor = playerPlot:FindFirstChild("Tycoon"):FindFirstChild("Tycoons"):FindFirstChild("Floor" .. floorNumber)
        local conveyorSystem = floor:FindFirstChild("ConveyorSystem" .. conveyorNumber)
        local workerStation = conveyorSystem:FindFirstChild("WorkerStations"):FindFirstChild("Worker" .. workerNumber)
        local dropper = workerStation:FindFirstChild("Dropper_" .. dropperNumber)

        if floor and conveyorSystem and workerStation and dropper then
            local args = {
                game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Machines"):WaitForChild("Dropper"):WaitForChild("Upgrade"),
                dropper
            }

            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("Machines"):WaitForChild("Dropper"):FireServer(unpack(args))
        else
            print("Algunos objetos no fueron encontrados, no se envió el Remote.")
        end
    end)
end

local function workerr()
    sLooping = not sLooping
    clickBt.BackgroundColor3 = sLooping and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(100, 100, 100)

    while sLooping do
        pcall(function()
            for floor = 1, 5 do
                for conveyor = 1, 6 do
                    for worker = 1, 30 do
                        sendRemote(floor, conveyor, worker, worker)
                        wait(0.1)
                    end
                end
            end
        end)
        task.wait(10)
    end
end

local playerPlot = playerPlot

local function moneyy()
    isLooping = not isLooping
    clickBtn.BackgroundColor3 = isLooping and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(100, 100, 100)

    while isLooping do
    local moneyCollectorInput = playerPlot:FindFirstChild("Tycoon"):FindFirstChild("Tycoons"):FindFirstChild("Floor1"):FindFirstChild("CashCollector1"):FindFirstChild("MoneyCollector"):FindFirstChild("Input")

    if moneyCollectorInput then
        firetouchinterest(moneyCollectorInput, player.Character:WaitForChild("HumanoidRootPart"), 1)
        wait(0.1)
        firetouchinterest(moneyCollectorInput, player.Character:WaitForChild("HumanoidRootPart"), 0)
    else
        print("MoneyCollector.Input no encontrado en el Plot actual.")
task.wait(5)
    end
end
end

clickBtn.MouseButton1Click:Connect(moneyy)
clickBt.MouseButton1Click:Connect(workerr)
fr.Parent = sg
sg.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")
game:GetService('Players').LocalPlayer.Idled:Connect(function()
game:GetService('VirtualUser'):CaptureController()   game:GetService('VirtualUser'):ClickButton2(Vector2.new())
end)
