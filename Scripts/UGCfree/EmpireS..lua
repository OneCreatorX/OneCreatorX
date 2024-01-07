local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer.PlayerGui

local Frame = Instance.new("Frame")
Frame.Size, Frame.Position, Frame.BackgroundColor3, Frame.Parent, Frame.Active, Frame.Draggable = UDim2.new(0, 120, 0, 170), UDim2.new(0, 10, 0, 10), Color3.new(0.2, 0.2, 0.2), ScreenGui, true, true

local Title = Instance.new("TextLabel")
Title.Text, Title.Size, Title.Position, Title.BackgroundColor3, Title.Parent = "Empire Simulator", UDim2.new(0, 120, 0, 20), UDim2.new(0, 0, 0, 0), Color3.new(0.8, 0.8, 0.8), Frame -- Cambié el color y corregí el texto

local Author = Instance.new("TextLabel")
Author.Text, Author.Size, Author.Position, Author.BackgroundColor3, Author.TextSize, Author.TextColor3, Author.Parent = "by: OneCreatorX", UDim2.new(0, 120, 0, 15), UDim2.new(0, 0, 0, 160), Color3.new(0.8, 0.8, 0.8), 10, Color3.new(1, 1, 1), Frame

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
local mobs = mobsDirectory:GetChildren()
local playerName = game.Players.LocalPlayer.Name

for _, mob in ipairs(mobs) do
    local args = {
        [1] = {
            ["Dmg"] = 90000000000000,
            ["Character"] = workspace:WaitForChild(playerName),
            ["Action"] = "m1",
            ["Combo"] = 5,
            ["Target"] = mobsDirectory:WaitForChild(mob.Name),
            ["Id"] = "Wood Sword"
        },
        [2] = "Sword"
    }

    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ToolEvent"):FireServer(unpack(args))
            end
            
            
        end
    end
end

local function autoEgg(button)
    while task.wait(3) do
        if ActivadoDict[button] then
game:GetService("ReplicatedStorage").PetsFolder.Remotes.HatchPet:FireServer(workspace:WaitForChild("Incubators"):WaitForChild("Basic"), 20)
            
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

local function autodelete(button)
    while task.wait() do
        if ActivadoDict[button] then
local petNames = {"Dog", "Cat", "Pig", "Bear"}

for _, name in ipairs(petNames) do
    local args = {[1] = name}
    game:GetService("ReplicatedStorage"):WaitForChild("PetsFolder"):WaitForChild("Remotes"):WaitForChild("DeletePet"):FireServer(unpack(args))
            end       
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

createButton("Auto buy World", autoClickFight)
createButton("Auto XP(Lvles)", autoCraftPet)
createButton("Auto Egg", autoEgg)
createButton("Resources", autoCoin)
createButton("Auto Delet Pets", autodelete)

LocalPlayer.Idled:Connect(function()
    local VirtualUser = game:GetService('VirtualUser')
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)
