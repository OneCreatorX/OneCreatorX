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
    while task.wait(5) do
        if ActivadoDict[button] then
            for i = 1, 10 do
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("GuiEvent"):FireServer({
        ["GateName"] = "GateNum" .. i,
        ["Action"] = "OpenedGate",
        ["PricePaid"] = 1200
    })
            end
            
        end
    end
end

local function autoCraftPet(button)
    while task.wait(5) do
        if ActivadoDict[button] then
            local mobsDirectory = workspace:WaitForChild("Map"):WaitForChild("Mobs")
local localPlayerName = game.Players.LocalPlayer.Name

for _, mob in pairs(mobsDirectory:GetChildren()) do
    local args = {
        Dmg = 1,
        Character = workspace:WaitForChild(localPlayerName),
        Action = "m1",
        Combo = 5,
        Target = mob,
        Id = "Wood Sword"
    }

    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ToolEvent"):FireServer(args)
            end
            
        end
    end
end

local function autoEgg(button)
    while task.wait(3) do
        if ActivadoDict[button] then
game:GetService("ReplicatedStorage").PetsFolder.Remotes.HatchPet:FireServer(workspace:WaitForChild("Incubators"):WaitForChild("Basic"), 10)
            
        end
    end
end

local function giveItem(giveWhat, giveNum)
    local args = {
        [1] = {
            ["GiveWhat"] = giveWhat,
            ["Num"] = 4,
            ["Action"] = "PrSpun",
            ["GiveNum"] = giveNum
        }
    }

    game:GetService("ReplicatedStorage").Remotes.GuiEvent:FireServer(unpack(args))
end

local function autoCoin(button) 
giveItem("Coins", 99999999999999999)
giveItem("Emeralds", 99999999999999)  
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

createButton("Auto buy World", autoClickFight)
createButton("Auto XP(Lvles)", autoCraftPet)
createButton("Auto Egg", autoEgg)
createButton("Resources", autoCoin)
