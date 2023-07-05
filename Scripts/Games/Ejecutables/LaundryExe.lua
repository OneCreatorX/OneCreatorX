-- Crear la GUI
local gui = Instance.new("ScreenGui")
gui.Name = "BotonesGUI"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.DisplayOrder = 999
gui.Parent = game.Players.LocalPlayer.PlayerGui

-- Crear el marco principal
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 300, 0, 360)
frame.Position = UDim2.new(0.5, -150, 0.5, -180)
frame.BackgroundColor3 = Color3.fromRGB(240, 240, 240)
frame.BorderSizePixel = 0
frame.Parent = gui

-- Crear el título
local title = Instance.new("TextLabel")
title.Parent = frame
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
title.BorderSizePixel = 0
title.Font = Enum.Font.GothamBold
title.Text = "Laundry X"
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 30

-- Crear los botones
local button1 = Instance.new("TextButton")
button1.Name = "Button1"
button1.Parent = frame
button1.Position = UDim2.new(0, 50, 0, 80)
button1.Size = UDim2.new(0, 200, 0, 50)
button1.BackgroundColor3 = Color3.fromRGB(128, 187, 219)
button1.BorderSizePixel = 0
button1.Font = Enum.Font.GothamSemibold
button1.Text = "0neCreatorX->"
button1.TextColor3 = Color3.fromRGB(255, 255, 255)
button1.TextSize = 18
button1.AutoButtonColor = false

local button2 = Instance.new("TextButton")
button2.Name = "Button2"
button2.Parent = frame
button2.Position = UDim2.new(0, 50, 0, 150)
button2.Size = UDim2.new(0, 200, 0, 50)
button2.BackgroundColor3 = Color3.fromRGB(196, 185, 255)
button2.BorderSizePixel = 0
button2.Font = Enum.Font.GothamSemibold
button2.Text = "0neCreatorX->"
button2.TextColor3 = Color3.fromRGB(255, 255, 255)
button2.TextSize = 18
button2.AutoButtonColor = false

local button3 = Instance.new("TextButton")
button3.Name = "Button3"
button3.Parent = frame
button3.Position = UDim2.new(0, 50, 0, 220)
button3.Size = UDim2.new(0, 200, 0, 50)
button3.BackgroundColor3 = Color3.fromRGB(91, 93, 105)
button3.BorderSizePixel = 0
button3.Font = Enum.Font.GothamSemibold
button3.Text = "<-0neCreatorX"
button3.TextColor3 = Color3.fromRGB(255, 255, 255)
button3.TextSize = 18
button3.AutoButtonColor = false

local button4 = Instance.new("TextButton")
button4.Name = "Button4"
button4.Parent = frame
button4.Position = UDim2.new(0, 50, 0, 290)
button4.Size = UDim2.new(0, 200, 0, 50)
button4.BackgroundColor3 = Color3.fromRGB(236, 153, 70)
button4.BorderSizePixel = 0
button4.Font = Enum.Font.GothamSemibold
button4.Text = "<-0neCreatorX"
button4.TextColor3 = Color3.fromRGB(255, 255, 255)
button4.TextSize = 18
button4.AutoButtonColor = false

-- Funciones para resaltar los botones
local function highlightButton(button)
    button.BackgroundColor3 = button.BackgroundColor3:Lighten(0.1)
end

local function unhighlightButton(button)
    button.BackgroundColor3 = button.BackgroundColor3:Darken(0.1)
end

-- Resaltar los botones al pasar el cursor sobre ellos
button1.MouseEnter:Connect(function()
    highlightButton(button1)
end)

button1.MouseLeave:Connect(function()
    unhighlightButton(button1)
end)

button2.MouseEnter:Connect(function()
    highlightButton(button2)
end)

button2.MouseLeave:Connect(function()
    unhighlightButton(button2)
end)

button3.MouseEnter:Connect(function()
    highlightButton(button3)
end)

button3.MouseLeave:Connect(function()
    unhighlightButton(button3)
end)

button4.MouseEnter:Connect(function()
    highlightButton(button4)
end)

button4.MouseLeave:Connect(function()
    unhighlightButton(button4)
end)

-- Acciones al hacer clic en los botones
button1.MouseButton1Click:Connect(function()
    gui:Destroy()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AnonyProArg/ScriptsRobloz/main/Pasteler%C3%ADa/Laundry3.lua"))()
end)

button2.MouseButton1Click:Connect(function()
    gui:Destroy()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AnonyProArg/ScriptsRobloz/main/Pasteler%C3%ADa/Laundry4.lua"))()
end)

button3.MouseButton1Click:Connect(function()
    gui:Destroy()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AnonyProArg/ScriptsRobloz/main/Pasteler%C3%ADa/Laundry5.lua"))()
end)

button4.MouseButton1Click:Connect(function()
    gui:Destroy()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/AnonyProArg/ScriptsRobloz/main/Pasteler%C3%ADa/Laundry6.lua"))()
end)

