local function changeColor()
    local colors = {
        Color3.fromRGB(255, 0, 0),   
        Color3.fromRGB(0, 255, 0),   
        Color3.fromRGB(0, 0, 255)    
    }
    local index = 1
    while true do
        text.TextColor3 = colors[index]
        index = math.random(1, #colors)
        wait(0.5)
    end
end

local sg = Instance.new("ScreenGui")
sg.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local f = Instance.new("Frame")
f.Size = UDim2.new(1, 0, 0.1, 0)
f.Position = UDim2.new(0, 0, 0.45, 0)
f.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
f.Parent = sg

local text = Instance.new("TextLabel")
text.Size = UDim2.new(1, 0, 1, 0)
text.Position = UDim2.new(0, 0, 0, 0)
text.Text = "Loading New Version"
text.Font = Enum.Font.SourceSansBold
text.TextSize = 24
text.TextColor3 = Color3.new(1, 1, 1)
text.BackgroundTransparency = 1
text.Parent = f

coroutine.wrap(changeColor)()

wait(5)

text.TextColor3 = Color3.new(1, 1, 1)

sg:Destroy()

loadstring(game:HttpGet("https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/Partch.lua"))()
