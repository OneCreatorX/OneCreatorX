local s = Instance.new("ScreenGui", game.Players.LocalPlayer.PlayerGui)
local f = Instance.new("Frame", s)
local tl = Instance.new("TextLabel", f)

tl.Size, tl.Position = UDim2.new(0, 200, 0, 50), UDim2.new(0.5, -100, 0.5, -25)
tl.Text, tl.TextSize, tl.TextColor3, tl.BackgroundTransparency = "Anti AFK - No Kick - AutoWin - by: OneCreatorX", 20, Color3.new(1, 1, 1), 1

local p = Instance.new("Part", game.Workspace)
p.Size, p.Position, p.Anchored, p.Transparency = Vector3.new(90000, 3, 900000), Vector3.new(10, 1, 49), true, 1

local function t(o)
    local h = o.Parent:FindFirstChildOfClass("Humanoid")
    if h then
        h.WalkToPoint, h.WalkSpeed = Vector3.new(15.8500156, 19.8999958, -794.150024), 14
    end
end

p.Touched:Connect(t)

local function afk()
    while true do
        task.wait(300)
        local vu = game:GetService('VirtualUser')
        vu:CaptureController()
        vu:ClickButton2(Vector2.new())
    end
end

spawn(afk)
