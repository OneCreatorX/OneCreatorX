local plr = game.Players.LocalPlayer

plr.Character.PrimaryPart.CFrame = CFrame.new(2597, 89, -1567)
task.wait(1)
plr.Character.HumanoidRootPart.Anchored = true 
task.wait(18)
plr.Character.PrimaryPart.CFrame = CFrame.new(-3653, 58, -196)
wait(3)
plr.Character.HumanoidRootPart.Anchored = false

local sg = Instance.new("ScreenGui")
sg.Name = "O"
sg.ResetOnSpawn = false

local f = Instance.new("Frame")
f.Size = UDim2.new(0, 250, 0, 130)
f.Position = UDim2.new(0.5, -125, 0.5, -65)
f.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
f.BorderSizePixel = 5
f.BorderColor3 = Color3.fromRGB(255, 255, 255)
f.Active = true
f.Draggable = true
f.Parent = sg

local t = Instance.new("TextLabel")
t.Text = "YT:@OneCreatorX"
t.TextSize = 18
t.Size = UDim2.new(1, 0, 0, 30)
t.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
t.BorderSizePixel = 2
t.TextColor3 = Color3.fromRGB(255, 255, 255)
t.Parent = f

local ac = Instance.new("TextLabel")
ac.Text = "Auto Collect: ON"
ac.TextSize = 14
ac.Size = UDim2.new(1, 0, 0, 30)
ac.Position = UDim2.new(0, 0, 0, 30)
ac.BackgroundColor3 = Color3.fromRGB(120, 20, 71) 
ac.BorderSizePixel = 2
ac.TextColor3 = Color3.fromRGB(255, 255, 255) 
ac.Parent = f

local afk = Instance.new("TextLabel")
afk.Text = "Rejoin Automatic"
afk.TextSize = 14
afk.Size = UDim2.new(1, 0, 0, 30)
afk.Position = UDim2.new(0, 0, 0, 60)
afk.BackgroundColor3 = Color3.fromRGB(120, 20, 71) 
afk.BorderSizePixel = 1
afk.TextColor3 = Color3.fromRGB(255, 255, 255)  
afk.Parent = f

local rj = Instance.new("TextButton")
rj.Text = "Rejoin Manual"
rj.Size = UDim2.new(1, 0, 0, 30)
rj.Position = UDim2.new(0, 0, 0, 95)
rj.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
rj.BorderSizePixel = 1
rj.TextColor3 = Color3.fromRGB(255, 255, 255)
rj.Parent = f
rj.MouseButton1Click:Connect(function()
    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId)
end)

sg.Parent = plr:WaitForChild("PlayerGui")

local wp = workspace.Temp.ItemPickups
local wt = 0.2
local tt = 0.3
local s = 2 / tt
local cm = true

local function dd(pickup)
    local pp = pickup.PrimaryPart
    return pp and (plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:WaitForChild("HumanoidRootPart").Position - pp.Position).Magnitude or math.huge
end

local function mm()
    local l = {}

    for _, pickup in ipairs(wp:GetChildren()) do
        if pickup:IsA("Model") and pickup.Name ~= "Model" then
            table.insert(l, {pickup = pickup, distance = dd(pickup)})
        end
    end

    table.sort(l, function(a, b)
        return a.distance < b.distance
    end)

    if #l > 0 then
        local c = l[1].pickup
        local r = plr.Character:WaitForChild("HumanoidRootPart")
        local tp = c.PrimaryPart and c.PrimaryPart.Position or c.Position

        local st = tick()

        while (tick() - st) < tt do
            r.CFrame = r.CFrame:Lerp(CFrame.new(tp), (tick() - st) / tt)
            wait()
        end

        pcall(function() c:Destroy() end)

        wait(wt)
    else
        cm = false
game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId)
    end
end


while cm do
    pcall(mm)
end

game:GetService('Players').LocalPlayer.Idled:Connect(function()
    game:GetService('VirtualUser'):CaptureController()
    game:GetService('VirtualUser'):ClickButton2(Vector2.new())
end)
