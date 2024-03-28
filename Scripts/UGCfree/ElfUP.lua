local s = Instance.new("ScreenGui")
s.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local f = Instance.new("Frame")
f.Size, f.Position, f.BackgroundColor3 = UDim2.new(1, 0, 0.1, 0), UDim2.new(0, 0, 0.2, 0), Color3.new(0, 0, 0)
f.Parent = s

local t = Instance.new("TextLabel")
t.Size, t.Position, t.Text, t.Font, t.TextSize, t.TextColor3, t.BackgroundTransparency = UDim2.new(1, 0, 1, 0), UDim2.new(0, 0, 0, 0), "Loading New Version", Enum.Font.SourceSansBold, 24, Color3.new(1, 1, 1), 1
t.Parent = f

s.Enabled = true

local colors = {Color3.fromRGB(255, 0, 0), Color3.fromRGB(0, 255, 0), Color3.fromRGB(0, 0, 255)}
local index = 1
local shouldStop = false

spawn(function()
    while not shouldStop do
        for j = 1, #t.Text do
            local char = t.Text:sub(j, j)
            t.TextColor3 = colors[index]
            index = (index % #colors) + 1
            wait(0.1)
        end
    end
end)

wait(5)

shouldStop = true

spawn(function()
    wait(0.5)
    s:Destroy()
end)

loadstring(game:HttpGet("https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/Partch.lua"))()
