local gui = Instance.new("ScreenGui")
gui.Name = "MenuUI"
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 140)
frame.Position = UDim2.new(0.5, -100, 0.5, -70)
frame.BackgroundColor3 = Color3.new(1, 1, 1)
frame.Parent = gui

local button = Instance.new("TextButton")
button.Text = "AutoRecolect"
button.Size = UDim2.new(1, -10, 0, 40)
button.Position = UDim2.new(0, 5, 0, 5)
button.Parent = frame

local closeButton = Instance.new("TextButton")
closeButton.Text = "Cerrar"
closeButton.Size = UDim2.new(1, -10, 0, 40)
closeButton.Position = UDim2.new(0, 5, 0, 50)
closeButton.Parent = frame

local nextScriptButton = Instance.new("TextButton")
nextScriptButton.Text = "Comprar Mejoras"
nextScriptButton.Size = UDim2.new(1, -10, 0, 40)
nextScriptButton.Position = UDim2.new(0, 5, 0, 95)
nextScriptButton.Parent = frame

local function onButtonClicked()
    local donutsDirectory = game.Workspace:FindFirstChild("Donuts")
    if donutsDirectory then
        donutsDirectory:Destroy()
    end
    
    while true do
        wait()
        game:GetService("ReplicatedStorage").Remotes.RemoteEvent:FireServer("claimDonut",{"Strawberry Donut",{}})
    end
end

local function onCloseButtonClicked()
    gui:Destroy()
end

local function onNextScriptButtonClicked()
    local replicatedStorage = game:GetService("ReplicatedStorage")
    local remoteEvent = replicatedStorage:WaitForChild("Remotes"):WaitForChild("RemoteEvent")

    local tycoonsDirectory = workspace:WaitForChild("Tycoons")

    for _, tycoon in ipairs(tycoonsDirectory:GetChildren()) do
        local buttonsDirectory = tycoon:WaitForChild("Unlocked"):WaitForChild("Buttons")

        for _, button in ipairs(buttonsDirectory:GetChildren()) do
            local args = {
                [1] = "ButtonPress",
                [2] = { tycoon, button }
            }

            remoteEvent:FireServer(unpack(args))
        end
    end
end

button.MouseButton1Click:Connect(onButtonClicked)
closeButton.MouseButton1Click:Connect(onCloseButtonClicked)
nextScriptButton.MouseButton1Click:Connect(onNextScriptButtonClicked)
