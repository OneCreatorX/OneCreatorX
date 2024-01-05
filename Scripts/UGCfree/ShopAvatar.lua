local RS = game:GetService("ReplicatedStorage")
local Plrs = game:GetService("Players")

local p = Plrs.LocalPlayer
local pg = p:WaitForChild("PlayerGui")
local cui = pg.CurrencyUI
local f = cui.Frame.Frame
local tl = f.TextLabel

local targetText = "Free Coins in 00"

local function otc()
    local ct = tl.Text
    if ct == targetText then
        local rf = RS:WaitForChild("RemoteFunctions"):WaitForChild("ClaimReward")
        rf:InvokeServer()
    end
end

tl:GetPropertyChangedSignal("Text"):Connect(otc)

local VU = game:GetService('VirtualUser')
local li = tick()

p.Idled:Connect(function()
    local now = tick()
    if now - li > 300 then
        VU:CaptureController()
        VU:ClickButton2(Vector2.new())
        li = now
    end
end)

local sg = Instance.new("ScreenGui")
sg.Name = "ACGui"
sg.ResetOnSpawn = false
sg.DisplayOrder = 10
sg.Parent = pg

local function cT(t, p, tc, bc)
    local l = Instance.new("TextLabel")
    l.Text = t
    l.Position = UDim2.new(0, 10, 0, p)
    l.Size = UDim2.new(0, 200, 0, 30)
    l.TextSize = 18
    l.Font = Enum.Font.SourceSansBold
    l.TextColor3 = tc or Color3.new(1, 1, 1)
    l.BackgroundColor3 = bc or Color3.new(0, 0, 0)
    l.BorderColor3 = Color3.new(0, 0, 0)
    l.BorderSizePixel = 2
    l.Parent = sg
    l.Active = true
    l.Draggable = true
    return l
end

cT("AutoClaim", 10, Color3.new(0, 1, 0), Color3.new(0, 0, 0))
cT("AntiAFK ON", 50, Color3.new(0, 0, 1), Color3.new(0, 0, 0))
cT("YT:@OneCreatorX", 90, Color3.new(1, 0, 0), Color3.new(0, 0, 0))
