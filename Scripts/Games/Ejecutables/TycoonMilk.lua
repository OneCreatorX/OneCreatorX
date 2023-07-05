local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local plr = Players.LocalPlayer
local tycoonButtons = {}
local ownedTycoons = {}

local gui = Instance.new("ScreenGui")
gui.Name = "MilkTycoonGUI"
gui.Parent = plr.PlayerGui

local frame = Instance.new("Frame")
frame.Name = "MainFrame"
frame.Size = UDim2.new(0, 200, 0, 200)
frame.Position = UDim2.new(0.5, -100, 0.5, -100)
frame.BackgroundTransparency = 0.5
frame.BackgroundColor3 = Color3.new(0, 0, 0)
frame.Parent = gui

local function GetTycoon()
    local tycoon = ownedTycoons[plr]
    if tycoon then
        return tycoon
    end

    for _, v in pairs(Workspace.Tycoons:GetChildren()) do
        if v.Owner.Value == plr.Name then
            ownedTycoons[plr] = v
            return v
        end
    end

    return nil
end

local function CreateButton(name, description, callback)
    local button = Instance.new("TextButton")
    button.Name = name
    button.Text = name
    button.Size = UDim2.new(0, 180, 0, 30)
    button.Position = UDim2.new(0, 10, 0, (#tycoonButtons * 40) + 10)
    button.Parent = frame
    button.MouseButton1Click:Connect(callback)

    local buttonDescription = Instance.new("TextLabel")
    buttonDescription.Name = "Description"
    buttonDescription.Text = description
    buttonDescription.Size = UDim2.new(0, 180, 0, 20)
    buttonDescription.Position = UDim2.new(0, 10, 0, (#tycoonButtons * 40) + 40)
    buttonDescription.BackgroundTransparency = 1
    buttonDescription.Parent = frame

    table.insert(tycoonButtons, button)
end

getgenv().AutoCollect = false
CreateButton("Auto Collect Milk", "Auto collects milk", function()
    getgenv().AutoCollect = not getgenv().AutoCollect
    local button = tycoonButtons[1]
    button.Text = "Auto Collect Milk " .. (getgenv().AutoCollect and "[ON]" or "[OFF]")

    local Tycoon = GetTycoon()
    while getgenv().AutoCollect do
        wait(0.1)
        for _, v in pairs(Tycoon.Drops:GetChildren()) do
            if getgenv().AutoCollect then
                pcall(function()
                    v.Part.CFrame = plr.Character.HumanoidRootPart.CFrame
                end)
                wait(0.1)
            else
                break
            end
        end
    end
end)

getgenv().AutoProcess = false
CreateButton("Auto Process Milk", "Auto processes milk", function()
    getgenv().AutoProcess = not getgenv().AutoProcess
    local button = tycoonButtons[2]
    button.Text = "Auto Process Milk " .. (getgenv().AutoProcess and "[ON]" or "[OFF]")

    local Tycoon = GetTycoon()
    while getgenv().AutoProcess do
        wait(0.1)
        firetouchinterest(plr.Character.HumanoidRootPart, Tycoon.Buttons.Process, 0)
        wait(0.1)
        firetouchinterest(plr.Character.HumanoidRootPart, Tycoon.Buttons.Process, 1)
        wait(0.1)
        firetouchinterest(plr.Character.HumanoidRootPart, Tycoon.Buttons.Cow6, 0)
        wait(0.1)
        firetouchinterest(plr.Character.HumanoidRootPart, Tycoon.Buttons.Cow6, 1)
        wait(0.1)
        firetouchinterest(plr.Character.HumanoidRootPart, Tycoon.Buttons.Upgrade, 0)
        wait(0.1)
        firetouchinterest(plr.Character.HumanoidRootPart, Tycoon.Buttons.Upgrade, 1)
        wait(0.1)
    end
end)

local passesButton = Instance.new("TextButton")
passesButton.Name = "PassesButton"
passesButton.Text = "Pases"
passesButton.Size = UDim2.new(0, 180, 0, 30)
passesButton.Position = UDim2.new(0, 10, 0, (#tycoonButtons * 40) + 10)
passesButton.Parent = frame
passesButton.MouseButton1Click:Connect(function()
    local gamepassFolder = plr:FindFirstChild("GamepassFolder")
    if gamepassFolder then
        for _, gamepass in ipairs(gamepassFolder:GetChildren()) do
            if gamepass:IsA("BoolValue") then
                gamepass.Value = true
            end
        end
    end
end)

local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Text = "Close"
closeButton.Size = UDim2.new(0, 180, 0, 30)
closeButton.Position = UDim2.new(0, 10, 1, -40)
closeButton.Parent = frame
closeButton.MouseButton1Click:Connect(function()
    gui:Destroy()
end)
