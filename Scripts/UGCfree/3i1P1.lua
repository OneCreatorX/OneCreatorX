local player = game.Players.LocalPlayer
local TeleportService = game:GetService("TeleportService")

local function activateJump()
    player.Character:WaitForChild("Humanoid").Jump = true
end

local function teleportTo(position)
    player.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(position)
    wait(1)
end

local function playSuperpowerSimulator()
    local args = {[1] = "Chakra"}
    local events = game:GetService("ReplicatedStorage"):WaitForChild("Events")

    events:WaitForChild("QuestGiverInteract"):FireServer(unpack(args))

    for i = 1, 10 do
        events:WaitForChild("Training"):FireServer({[1] = "Strength"})
        events:WaitForChild("QuestGiverInteract"):FireServer(args)
        wait(0.3)
    end

    wait(15)
    showFinishNotification("¡Secuencia completada!")
end

local function playTennisBallRain()
    teleportTo(Vector3.new(287, 14, -343))
    wait(1)
    local court = game:GetService("ReplicatedStorage"):WaitForChild("Court")

    court:WaitForChild("ServerStartServe"):InvokeServer()
    wait(0.3)

    court:WaitForChild("ClientHitBall"):InvokeServer({[1] = Vector3.new(254.6953582763672, 0, -313.5354309082031), [2] = false})
    wait(2)

    wait(15)
    showFinishNotification("¡Secuencia completada!")
end

local function playRobloxianHighSchool()
    local modules = game:GetService("ReplicatedStorage"):WaitForChild("Modules")
    local args = {[1] = workspace:WaitForChild("BlingObby"):WaitForChild("Office_Chair_Key"):WaitForChild("Seat")}

    modules:WaitForChild("ObjectCode"):WaitForChild("Seat"):WaitForChild("Sit"):FireServer(unpack(args))

    wait(20)
    activateJump()

    modules:WaitForChild("ObjectCode"):WaitForChild("BlingObby"):WaitForChild("EventClassroomKey"):WaitForChild("PickUp"):InvokeServer()

    teleportTo(Vector3.new(145, 8, -337))
    wait(1)
    teleportTo(Vector3.new(882, -286, 7984))
    wait(2)

    wait(15)
    showFinishNotification("¡Secuencia completada!")
end

local function showFinishNotification(message)
    local screenGui = player.PlayerGui:FindFirstChild("FinishScreenGui")
    if not screenGui then
        screenGui = Instance.new("ScreenGui", player.PlayerGui)
        screenGui.Name = "FinishScreenGui"
    end

    local frame = Instance.new("Frame", screenGui)
    frame.Size = UDim2.new(0, 200, 0, 50)
    frame.Position = UDim2.new(0.5, -100, 0.5, -25)
    frame.BackgroundColor3 = Color3.new(0, 0, 0)
    frame.BorderSizePixel = 0

    local textLabel = Instance.new("TextLabel", frame)
    textLabel.Size = UDim2.new(1, 0, 1, 0)
    textLabel.Text = message
    textLabel.TextColor3 = Color3.new(1, 1, 1)
    textLabel.BackgroundTransparency = 1

    wait(5)
    frame:Destroy()
end

while true do
    local placeId = game.PlaceId
    if placeId == 11696357981 then
        playSuperpowerSimulator()
    elseif placeId == 11268121492 then
        playTennisBallRain()
    elseif placeId == 447452406 then
        playRobloxianHighSchool()
    else
        warn("Script no configurado para el juego actual.")
    end
end
