local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer.PlayerGui

local Frame = Instance.new("Frame")
Frame.Size, Frame.Position, Frame.BackgroundColor3, Frame.Parent, Frame.Active, Frame.Draggable = UDim2.new(0, 200, 0, 300), UDim2.new(0, 10, 0, 10), Color3.new(0.2, 0.2, 0.2), ScreenGui, true, true

local function createTextLabel(name, size, position, color)
    local textLabel = Instance.new("TextLabel")
    textLabel.Text, textLabel.Size, textLabel.Position, textLabel.BackgroundColor3, textLabel.Parent = name, size, position, color, Frame
    return textLabel
end

createTextLabel("Clicker Simulator", UDim2.new(0, 200, 0, 20), UDim2.new(0, 0, 0, 0), Color3.new(0.8, 0.8, 0.8))
createTextLabel("by: OneCreatorX", UDim2.new(0, 200, 0, 15), UDim2.new(0, 0, 0, 280), Color3.new(0.8, 0.8, 0.8)).TextSize = 10

local ActivadoDict = {}

local function createAction(button, action)
    while wait() do
        if ActivadoDict[button] then
            action()
        end
    end
end

local function autoClickFight()
    workspace.Events.AddClick:FireServer()
end

local function run()
    local args = {
        [1] = "Basic",
        [2] = "Single"
    }
    game:GetService("ReplicatedStorage").RemoteEvents.EggOpened:InvokeServer(unpack(args))
end

local function speed()
    local RS = game:GetService("ReplicatedStorage")
    local RE = RS.RemoteEvents
    local PAR = RE.PetActionRequest

    for _, f in pairs(game.Players.LocalPlayer.Pets:GetChildren()) do
        local pIDV = f:FindFirstChild("PetID")
        if pIDV then
            local pID = pIDV.Value
            wait(1)
            local a = {
                [1] = "Mass Delete",
                [2] = {
                    ["Pets"] = {[1] = pID}
                }
            }
            PAR:InvokeServer(unpack(a))
        else
            warn("PetID not found in folder:", f.Name)
        end
    end
end

local yOffset = 50

local function createButton(name, onClick)
    local button = Instance.new("TextButton")
    button.Text, button.Size, button.Position, button.BackgroundColor3, button.Parent = name, UDim2.new(0, 180, 0, 30), UDim2.new(0, 10, 0, yOffset), Color3.new(0.4, 0.4, 0.4), Frame

    yOffset = yOffset + 40

    button.MouseButton1Click:Connect(function()
        ActivadoDict[button] = not (ActivadoDict[button] or false)
        button.BackgroundColor3 = ActivadoDict[button] and Color3.new(0.2, 0.8, 0.2) or Color3.new(0.4, 0.4, 0.4)
    end)

    spawn(function()
        createAction(button, onClick)
    end)

    return button
end

createButton("Auto Click", autoClickFight)
createButton("Auto Egg", run)
createButton("Auto Delet", speed)
