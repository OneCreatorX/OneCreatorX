wait(1)
local ba = Instance.new("ScreenGui")
local ca = Instance.new("Frame")
local ab = Instance.new("TextLabel")

ba.Parent = game.CoreGui
ba.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ca.Parent = ba
ca.Draggable = true
ca.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
ca.Position = UDim2.new(0.6, 0, -0.1, 0)
ca.Size = UDim2.new(0, 150, 0, 30)
ca.Active = true

ab.Parent = ca
ab.BackgroundColor3 = Color3.new(0.176471, 0.176471, 0.176471)
ab.Position = UDim2.new(0, 0, 0, 0)
ab.Size = UDim2.new(0, 150, 0, 30)
ab.Font = Enum.Font.ArialBold
ab.Draggable = true
ab.Text = "AntiAFK: Active"
ab.TextColor3 = Color3.new(0, 1, 1)

ab.TextSize = 14

local bb = game:service'VirtualUser'
game:service'Players'.LocalPlayer.Idled:connect(function()
    bb:CaptureController()
    bb:ClickButton2(Vector2.new())
    ab.Text = "Roblox trató de Sacarte :P el mamón"
    wait(2)
    ab.Text = "AntiAFK: Active"
end)
