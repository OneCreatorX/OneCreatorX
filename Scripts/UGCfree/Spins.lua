
local player = game.Players.LocalPlayer

local Threads = {}
local isEnabled = true

local function spinAndClaim(threadId)
    while isEnabled do
game:GetService("ReplicatedStorage"):WaitForChild("SpinnerContents"):WaitForChild("RemoteFunction"):InvokeServer()
        wait(2)
    end
end

local function stopAllThreads()
    isEnabled = false
end

local function destroyAllThreads()
    for _, thread in pairs(Threads) do
        coroutine.wrap(function()
            coroutine.yield(thread, "stop")
        end)()
    end
end

local gui = Instance.new("ScreenGui")
gui.Parent = player.PlayerGui

local buttonStop = Instance.new("TextButton")
buttonStop.Text = "Stop Spin"
buttonStop.Parent = gui
buttonStop.Position = UDim2.new(0.5, 0, 0.9, 0)
buttonStop.Size = UDim2.new(0, 200, 0, 50)
buttonStop.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
buttonStop.TextColor3 = Color3.fromRGB(255, 255, 255)
buttonStop.Font = Enum.Font.SourceSans
buttonStop.TextSize = 20

buttonStop.MouseButton1Click:Connect(function()
    stopAllThreads()
    destroyAllThreads()
end)

for i = 1, 2 do
    Threads[i] = coroutine.create(function()
        spinAndClaim(i)
    end)
    coroutine.resume(Threads[i])
end

game:GetService("RunService").Stepped:Connect(function()
    for i = #Threads, 1, -1 do
        coroutine.resume(Threads[i])
    end
end)

game:GetService('Players').LocalPlayer.Idled:Connect(function()
    game:GetService('VirtualUser'):CaptureController()
    game:GetService('VirtualUser'):ClickButton2(Vector2.new())
end)
