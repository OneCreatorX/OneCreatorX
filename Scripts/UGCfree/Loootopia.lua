local sg = Instance.new("ScreenGui")
sg.Name = "Day1Gui"
sg.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local fr = Instance.new("Frame")
fr.Name = "MainFrame"
fr.Size = UDim2.new(0, 250, 0, 200)
fr.Position = UDim2.new(0.5, -125, 0.5, -100)
fr.BackgroundColor3 = Color3.new(0.4, 0.4, 0.4)
fr.BorderSizePixel = 2
fr.BorderColor3 = Color3.new(0, 0, 0)
fr.Active = true
fr.Draggable = true
fr.Parent = sg

local title = Instance.new("TextLabel")
title.Text = "YouTube: @OneCreatorX"
title.Size = UDim2.new(1, 0, 0, 30)
title.Position = UDim2.new(0, 0, 0, 10)
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1
title.Font = Enum.Font.SourceSansBold
title.TextSize = 20
title.Parent = fr

local function btn(text, pos, func)
    local btn = Instance.new("TextButton")
    btn.Text = text
    btn.Size = UDim2.new(0, 220, 0, 40)
    btn.Position = pos
    btn.BackgroundColor3 = Color3.new(0.2, 0.6, 1)
    btn.BorderSizePixel = 2
    btn.BorderColor3 = Color3.new(0, 0, 0)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.Font = Enum.Font.SourceSans
    btn.TextSize = 18
    btn.Parent = fr
    btn.MouseButton1Click:Connect(func)
end

btn("Day 1", UDim2.new(0.5, -110, 0.30, -20), function()
    game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.5.1"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("SquishmallowsService"):WaitForChild("RE"):WaitForChild("OnSquishmallowCollected"):FireServer(1)
end)

btn("Próx. 2", UDim2.new(0.5, -110, 0.55, -20), function() end)
btn("Próx. 3", UDim2.new(0.5, -110, 0.80, -20), function() end)
