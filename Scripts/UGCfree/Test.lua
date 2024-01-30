local UIS = game:GetService("UserInputService")
local mouse = game.Players.LocalPlayer:GetMouse()
local clickPosition = Vector2.new(0, 0)
local isClicking = false

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer.PlayerGui

local button = Instance.new("TextButton")
button.Parent = screenGui
button.Size = UDim2.new(0, 0, 0, 0)
button.Position = UDim2.new(0.5, -50, 1, -25)
button.Text = ""

local function onClickDetected()
    mousemoverel(clickPosition.x, clickPosition.y)
    mouse1click()
end

button.MouseButton1Click:Connect(function()
    isClicking = true
    onClickDetected()
end)

UIS.InputBegan:Connect(function(input, gameProcessedEvent)
    if not gameProcessedEvent then
        if input.UserInputType == Enum.UserInputType.Touch then
            clickPosition = Vector2.new(mouse.X, mouse.Y)
            onClickDetected()
        end
    end
end)

game.Players.LocalPlayer.PlayerGui.PointBubbles.ChildAdded:Connect(function(newChild)
    wait(0.93)
    onClickDetected()
    isClicking = false
end)

local i = "https://discord.com/invite/FQ4zwd9FFS"
local n = "Haz clic para copiar la invitación."
game.StarterGui:SetCore("SendNotification", {Title = "YT:@OneCreatorX", Text = n, Duration = 5,})
local s = Instance.new("ScreenGui")
s.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local b = Instance.new("TextButton")
b.Text = "Copy Link Discord"
b.Size = UDim2.new(0, 198, 0, 20)
b.Position = UDim2.new(0.903, -100, 0.91, 0)
b.TextColor3 = Color3.new(1, 1, 1)
b.BackgroundColor3 = Color3.new(0, 0, 0)
b.BackgroundTransparency = 0.6
b.Parent = s
b.MouseButton1Click:Connect(function()
    b.Text = "Ready Copy ✓"
    game.StarterGui:SetCore("SendNotification", {Title = "Discord Link", Text = "Ready Copy Link ✓", Duration = 2,})
    setclipboard(i)
end)

wait(5.2)
s:Destroy()

local UIS = game:GetService("UserInputService")
local mouse1press = mouse1press or function() end
local mouse1release = mouse1release or function() end

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 120, 0, 30)
frame.Position = UDim2.new(0.5, -60, 0.8, -50)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Parent = screenGui

local titleLabel = Instance.new("TextLabel")
titleLabel.Text = "YT:@OneCreatorX"
titleLabel.Size = UDim2.new(1, 0, 0, 20)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
titleLabel.Parent = frame

game.Players.LocalPlayer.PlayerGui.PointBubbles.ChildAdded:Connect(function(newChild)
game.StarterGui:SetCore("SendNotification", {
        Title = "Bubble Detect",
        Text = "Clicking....",
        Duration = 0.3,
    })
    wait(0.85)
local UIScale = newChild:FindFirstChildOfClass("UIScale")
    if UIScale and not clickOnce then
        UIScale.Scale = 90000
end
end)

for _, bubble in pairs(game.Players.LocalPlayer.PlayerGui.PointBubbles:GetChildren()) do
    local UIScale = bubble:FindFirstChildOfClass("UIScale")
    if UIScale then UIScale.Scale = 90000 end
end

local jugadorLocal = game.Players.LocalPlayer
local quests = jugadorLocal.Quests
local clickerRemote = game:GetService("ReplicatedStorage"):WaitForChild("MouseClicked")

local destinations = {
    Vector3.new(0, 8, 30),
    Vector3.new(-32, 8, 0),
    Vector3.new(40, 8, 0),
    Vector3.new(2, 8, -17)
}

function movePlayerTo(destination)
    jugadorLocal.Character:WaitForChild("Humanoid").WalkToPoint = destination
end


function spamBehavior(actionFunction)
    local completed = false

    spawn(function()
        while not completed do
            actionFunction()
         task.wait()
        end
    end)

    return function()
        completed = true
    end
end

function runnerBehavior()
    local currentDestinationIndex = 1
    local distanceThreshold = 5 

    return function()
        local humanoid = jugadorLocal.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            local currentPos = humanoid.Parent and humanoid.Parent.PrimaryPart and humanoid.Parent.PrimaryPart.Position
            if currentPos and (currentPos - destinations[currentDestinationIndex]).Magnitude < distanceThreshold then
                currentDestinationIndex = (currentDestinationIndex % #destinations) + 1
            end
            movePlayerTo(destinations[currentDestinationIndex])
        end
    end
end

function clickerBehavior()
    return function()
        clickerRemote:FireServer()
    end
end

function jumpBehavior()
    local character = jugadorLocal.Character
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")

    return function()
        humanoid.Jump = true
        task.wait(0.001)
        humanoid.Jump = false
    end
end

function afkBehavior()
    return function()
    end
end

quests.ChildAdded:Connect(function(archivo)
game.StarterGui:SetCore("SendNotification", {
        Title = " New Quests Detect",
        Text = "Realizing Quest",
        Duration = 10,
    })

    local completedBool = archivo:WaitForChild("Completed")
    local nombreArchivo = archivo.Name
    local actionFunc

    if nombreArchivo == "Runner" then
        actionFunc = runnerBehavior()
    elseif nombreArchivo == "AFK" then
        actionFunc = afkBehavior()
    elseif nombreArchivo == "Clicker" then
        actionFunc = clickerBehavior()
    elseif nombreArchivo == "Jumper" then  -- Aquí cambió de "Jump" a "Jumper"
        actionFunc = jumpBehavior()
    end

    local stopSpam = spamBehavior(actionFunc)

    completedBool.Changed:Connect(function(newValue)
        if newValue then
            stopSpam() 
            game:GetService("ReplicatedStorage"):WaitForChild("ClaimQuestReward"):FireServer(nombreArchivo)
        end
    end)
end)

game:GetService('Players').LocalPlayer.Idled:Connect(function()
game:GetService('VirtualUser'):CaptureController()   game:GetService('VirtualUser'):ClickButton2(Vector2.new())
end)

