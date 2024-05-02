local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local Win = Lib:NewWindow("K-Pop Obby")
local Sec = Win:NewSection("Options")
local Sec2 = Win:NewSection("Credits: OneCreatorX")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local h = false
local fy = false
local gy = false
local go = false
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")


local points = {
    Vector3.new(1, 28, -191),
    Vector3.new(-35, 77, -284),
    Vector3.new(-42, 116, -374),
    Vector3.new(78, 123, -366),
    Vector3.new(81, 42, -367),
    Vector3.new(84, -1, -365)
    
}

local totalTime = 35
local timePerSegment = totalTime / (#points - 1)

local function goo()
    for i = 1, #points - 1 do
        local startTime = tick()
        local endTime = startTime + timePerSegment
        local startPosition = points[i]
        local endPosition = points[i + 1]

        while tick() < endTime do
            local currentTime = tick()
            local alpha = (currentTime - startTime) / timePerSegment
            local newPosition = startPosition:Lerp(endPosition, alpha)
            humanoidRootPart.CFrame = CFrame.new(newPosition)
            RunService.RenderStepped:Wait()
        end


        humanoidRootPart.CFrame = CFrame.new(endPosition)
    end
end

function too()
go = not go
while go do
goo()
local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("SendNotification", {
            Title = "Auto Start in 5s",
            Text = "Inicia Automáticamente en 5s",
            Duration = 8,
        })

wait(5)
end
end



local points = {
    Vector3.new(122, 28, -52),
    Vector3.new(164, 44, -62),
    Vector3.new(246, 44, -62),
    Vector3.new(296, 45, -62),
    Vector3.new(328, 74, -73),
    Vector3.new(316, 139, 30),
    Vector3.new(318, 137, 76)
}

local totalTime = 35
local timePerSegment = totalTime / (#points - 1)

local function gi()
    for i = 1, #points - 1 do
        local startTime = tick()
        local endTime = startTime + timePerSegment
        local startPosition = points[i]
        local endPosition = points[i + 1]

        while tick() < endTime do
            local currentTime = tick()
            local alpha = (currentTime - startTime) / timePerSegment
            local newPosition = startPosition:Lerp(endPosition, alpha)
            humanoidRootPart.CFrame = CFrame.new(newPosition)
            RunService.RenderStepped:Wait()
        end


        humanoidRootPart.CFrame = CFrame.new(endPosition)
    end
end

function ti()
gy = not gy
while gy do
gi()
local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("SendNotification", {
            Title = "Auto Start in 5s",
            Text = "Inicia Automáticamente en 5s",
            Duration = 8,
        })

wait(5)
end
end

local points = {
    Vector3.new(-110, 30, -45),
    Vector3.new(-150, 49, -42),
    Vector3.new(-254, 45, -45),
    Vector3.new(-336, 44, -46),
    Vector3.new(-391, 40, -41),
    Vector3.new(-425, 81, 12),
    Vector3.new(-423, 76, 25)
}

local totalTime = 36
local timePerSegment = totalTime / (#points - 1)

local function ga()
    for i = 1, #points - 1 do
        local startTime = tick()
        local endTime = startTime + timePerSegment
        local startPosition = points[i]
        local endPosition = points[i + 1]

        while tick() < endTime do
            local currentTime = tick()
            local alpha = (currentTime - startTime) / timePerSegment
            local newPosition = startPosition:Lerp(endPosition, alpha)
            humanoidRootPart.CFrame = CFrame.new(newPosition)
            RunService.RenderStepped:Wait()
        end


        humanoidRootPart.CFrame = CFrame.new(endPosition)
    end
end

function ta()
h = not h
while h do
ga()
local StarterGui = game:GetService("StarterGui")
StarterGui:SetCore("SendNotification", {
            Title = "Auto Start in 5s",
            Text = "Inicia Automáticamente en 5s",
            Duration = 8,
        })

wait(5)
end
end

function dance()
fy = not fy
while fy do 
        task.wait(0.1)
for _, a in ipairs(workspace:GetDescendants()) do
            task.wait(0.1)
    if a:IsA("Model") then
        local modelName = a.Name
        local collectibleNumber = modelName:match("Collectible(%d+)")
        if collectibleNumber and a:FindFirstChild("Hitbox") then
            a.Hitbox.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
        end
    end
        end
end
end



local function copyToClipboard(text)
    if syn then
        syn.write_clipboard(text)
    else
        setclipboard(text)
    end
end

function copyd()
    copyToClipboard("https://discord.com/invite/23kFrRBSfD")
end

function copyy()
    copyToClipboard("https://youtube.com/@OneCreatorX")
end


Sec:CreateToggle("Auto Obby 1", ta)
Sec:CreateToggle("Auto Obby 2", ti)
Sec:CreateToggle("Auto Obby 3", too)
Sec:CreateToggle("Auto Collect", dance)
Sec2:CreateButton("Copy Link YouTube", copyy)
Sec2:CreateButton("Copy Link Discord", copyd)

game:GetService('Players').LocalPlayer.Idled:Connect(function()
game:GetService('VirtualUser'):CaptureController()   game:GetService('VirtualUser'):ClickButton2(Vector2.new())
end)
