local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer.PlayerGui

local Frame = Instance.new("Frame")
Frame.Size, Frame.Position, Frame.BackgroundColor3, Frame.Parent, Frame.Active, Frame.Draggable = UDim2.new(0, 120, 0, 160), UDim2.new(0, 10, 0, 10), Color3.new(0.2, 0.2, 0.2), ScreenGui, true, true

local Title = Instance.new("TextLabel")
Title.Text, Title.Size, Title.Position, Title.BackgroundColor3, Title.Parent = "Empire Simulator", UDim2.new(0, 120, 0, 20), UDim2.new(0, 0, 0, 0), Color3.new(0.8, 0.8, 0.8), Frame -- Cambié el color y corregí el texto

local Author = Instance.new("TextLabel")
Author.Text, Author.Size, Author.Position, Author.BackgroundColor3, Author.TextSize, Author.TextColor3, Author.Parent = "by: OneCreatorX", UDim2.new(0, 120, 0, 15), UDim2.new(0, 0, 0, 140), Color3.new(0.8, 0.8, 0.8), 10, Color3.new(1, 1, 1), Frame

local ActivadoDict = {}

local function autoClickFight(button)
    while wait(0.2) do
        if ActivadoDict[button] then
            game:GetService("ReplicatedStorage").Remotes.GuiEvent:FireServer({Action = "Sold"})
            
        end
    end
end

local function autoCraftPet(button)
    while task.wait(0.05) do
        if ActivadoDict[button] then
            game:GetService("ReplicatedStorage").Remotes.GuiEvent:FireServer({Type = "OakLog", Action = "InstanceCollected", Count = 100})
            
        end
    end
end

local function autoRebirth(button)
    while wait(0.3) do
        if ActivadoDict[button] then
            game:GetService("ReplicatedStorage").Remotes.ToolEvent:FireServer({workspace.Map.Ores.Trees.OakTree}, "Axe", 5, "Wood Axe")
            
        end
    end
end

local function autoEgg(button)
    while wait(1) do
        if ActivadoDict[button] then
game:GetService("ReplicatedStorage").PetsFolder.Remotes.HatchPet:FireServer(workspace:WaitForChild("Incubators"):WaitForChild("Basic"), 1)
            
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

createButton("Auto Sell", autoClickFight)
createButton("Auto Collect", autoCraftPet)
createButton("Auto Farm", autoRebirth)
createButton("Auto Egg", autoEgg)
