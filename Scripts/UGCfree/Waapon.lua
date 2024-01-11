
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer.PlayerGui

local Frame = Instance.new("Frame")
Frame.Size, Frame.Position, Frame.BackgroundColor3, Frame.Parent, Frame.Active, Frame.Draggable = UDim2.new(0, 120, 0, 170), UDim2.new(0, 10, 0, 10), Color3.new(0.2, 0.2, 0.2), ScreenGui, true, true

local Title = Instance.new("TextLabel")
Title.Text, Title.Size, Title.Position, Title.BackgroundColor3, Title.Parent = "Empire Simulator", UDim2.new(0, 120, 0, 20), UDim2.new(0, 0, 0, 0), Color3.new(0.8, 0.8, 0.8), Frame

local Author = Instance.new("TextLabel")
Author.Text, Author.Size, Author.Position, Author.BackgroundColor3, Author.TextSize, Author.TextColor3, Author.Parent = "by: OneCreatorX", UDim2.new(0, 120, 0, 15), UDim2.new(0, 0, 0, 160), Color3.new(0.8, 0.8, 0.8), 10, Color3.new(1, 1, 1), Frame

local ActivadoDict = {}

local function autoClickFight(button)
    while wait() do
        if ActivadoDict[button] then
            local attackValues = {"1_17", "1_16", "1_19", "1_14", "1_4", "1_21", "1_13", "1_23", "1_11"}

            for _, value in ipairs(attackValues) do
                local args = {
                    [1] = 0,
                    [2] = value
                }

                workspace.Fight.Events.FightAttack:InvokeServer(unpack(args))
                wait()
            end
        end
    end
end

local function sell(button)
    while wait() do
        if ActivadoDict[button] then
local args = {
    [1] = "SettingSetAutoSellListChannel",
    [2] = {
        [1] = 1,
        [2] = 2,
        [3] = 3,
        [4] = 4,
        [5] = 5,
        [6] = 6,
        [7] = 7,
        [8] = 8,
        [9] = 9,
        [10] = 13
    },
    [3] = 1
}

game:GetService("ReplicatedStorage"):WaitForChild("CommonLibrary"):WaitForChild("Tool"):WaitForChild("RemoteManager"):WaitForChild("Funcs"):WaitForChild("DataPullFunc"):InvokeServer(unpack(args))
end
end 
end

local function autoCraftPet(button)
    while wait() do
        if ActivadoDict[button] then
            local maxNumber = 3
            local startNumber = 1

            local args = {
                [1] = "GambleJustDoItChannel",
                [2] = "GB_1",
                [3] = 1,
                [4] = 1,
                [5] = startNumber,
                [6] = false
            }

            game.ReplicatedStorage.CommonLibrary.Tool.RemoteManager.Funcs.DataPullFunc:InvokeServer(unpack(args))
            wait()

            startNumber = startNumber + 1

            if startNumber > maxNumber then
                startNumber = 1
            end
        end
    end
end

local function giveItem(button)
while wait() do
 if ActivadoDict[button] then
   P,T=game:GetService("Players"),game:GetService("TeleportService")local pId,JId=game.PlaceId,game.JobId if #P:GetPlayers()<=1 then P.LocalPlayer:Kick("\nwait/Espera 1s rejoin")task.wait()T:Teleport(pId,P.LocalPlayer)else T:TeleportToPlaceInstance(pId,JId,P.LocalPlayer)end end
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

createButton("Auto Atack", autoClickFight)
createButton("Auto Egg", autoCraftPet)
createButton("AutoSell", sell)
createButton("Rejoin", giveItem)


game.Players.LocalPlayer.Idled:Connect(function()
    local VirtualUser = game:GetService('VirtualUser')
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)
