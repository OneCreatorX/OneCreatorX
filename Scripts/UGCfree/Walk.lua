local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer.PlayerGui

local Frame = Instance.new("Frame")
Frame.Size, Frame.Position, Frame.BackgroundColor3, Frame.Parent, Frame.Active, Frame.Draggable = UDim2.new(0, 120, 0, 160), UDim2.new(0, 10, 0, 10), Color3.new(0.2, 0.2, 0.2), ScreenGui, true, true

local Title = Instance.new("TextLabel")
Title.Text, Title.Size, Title.Position, Title.BackgroundColor3, Title.Parent = "Charity Walk Simulator", UDim2.new(0, 120, 0, 20), UDim2.new(0, 0, 0, 0), Color3.new(0.8, 0.8, 0.8), Frame

local Author = Instance.new("TextLabel")
Author.Text, Author.Size, Author.Position, Author.BackgroundColor3, Author.TextSize, Author.TextColor3, Author.Parent = "by: OneCreatorX", UDim2.new(0, 120, 0, 15), UDim2.new(0, 0, 0, 140), Color3.new(0.8, 0.8, 0.8), 10, Color3.new(1, 1, 1), Frame

local ActivadoDict = {}

local rs = game:GetService("ReplicatedStorage")
local re = rs:WaitForChild("RemoteEvent")

local function autoClickFight(button)
    while wait() do
        if ActivadoDict[button] then
            
            re:FireServer("StartTrivia")
           
            re:FireServer("FinishTrivia", true)
        end
    end
end

local function run(button)
    while wait() do
        if ActivadoDict[button] then
            local args = {
                [1] = "UpgradeAutoRun",
                [2] = math.random(1, 5)
            }

            rs:WaitForChild("RemoteEvent"):FireServer(unpack(args))

            local args2 = {
                [1] = "PurchaseSprintUpgrade",
                [2] = math.random(1, 5)
            }

            rs:WaitForChild("RemoteEvent"):FireServer(unpack(args2))
        end
    end
end

local function speed(button)
    while wait() do
        if ActivadoDict[button] then
            game.Players.LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = 60
        end
    end
end

local yOffset = 33

local function createButton(name, onClick)
    local button = Instance.new("TextButton")
    button.Text, button.Size, button.Position, button.BackgroundColor3, button.Parent = name, UDim2.new(0, 100, 0, 20), UDim2.new(0, 10, 0, yOffset), Color3.new(0.4, 0.4, 0.4), Frame

    yOffset = yOffset + 25

    button.MouseButton1Click:Connect(function()
        ActivadoDict[button] = not (ActivadoDict[button] or false)
        button.BackgroundColor3 = ActivadoDict[button] and Color3.new(0.2, 0.8, 0.2) or Color3.new(0.4, 0.4, 0.4)
    end)

    spawn(function()
        onClick(button)
    end)

    return button
end

local autoHeartsButton = createButton("Auto Hearts", autoClickFight)
local autoRunButton = createButton("Auto  Upgrades", run)
local speedButton = createButton("Increase Speed", speed)
