local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local sg

for _, gui in ipairs(playerGui:GetChildren()) do
    if gui:IsA("ScreenGui") and not gui.ResetOnSpawn and gui.Enabled then
        sg = gui
        break
    end
end

if not sg then
    sg = Instance.new("ScreenGui")
    sg.ResetOnSpawn = false
    sg.Enabled = true
    sg.Parent = playerGui
end

local frame = Instance.new("Frame")
frame.Name = "ControlFrame"
frame.Size = UDim2.new(0, 250, 0, 80)
frame.Position = UDim2.new(0.5, -125, 0.3, -60)
frame.BackgroundColor3 = Color3.fromRGB(40, 20, 10)
frame.BorderSizePixel = 1
frame.Style = Enum.FrameStyle.DropShadow
frame.Parent = sg
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel")
title.Name = "Title"
title.Text = "YT:@OneCreatorX"
title.Size = UDim2.new(1, 0, 0, 30)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.GothamBold
title.TextSize = 20
title.Parent = frame

local button = Instance.new("TextButton")
button.Name = "PasswordButton"
button.Text = "Enter Password"
button.Size = UDim2.new(0.8, 0, 0, 30)
button.Position = UDim2.new(0.1, 0, 0.5, -15)
button.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Font = Enum.Font.GothamBold
button.TextSize = 16
button.Parent = frame

local passwordTextbox = Instance.new("TextBox")
passwordTextbox.Name = "PasswordTextbox"
passwordTextbox.PlaceholderText = "Enter Password"
passwordTextbox.Size = UDim2.new(0.8, 0, 0, 30)
passwordTextbox.Position = UDim2.new(0.1, 0, 0.5, -15)
passwordTextbox.BackgroundTransparency = 1
passwordTextbox.Font = Enum.Font.GothamBold
passwordTextbox.TextSize = 16
passwordTextbox.Parent = frame

local notification = Instance.new("TextLabel")
notification.Name = "Notification"
notification.Size = UDim2.new(1, 0, 0, 20)
notification.Position = UDim2.new(0, 0, 1, 0)
notification.BackgroundTransparency = 1
notification.TextColor3 = Color3.fromRGB(255, 0, 0)
notification.Font = Enum.Font.GothamBold
notification.TextSize = 14
notification.Visible = false
notification.Parent = frame

local function gaa(password)
    local userListScript = game:HttpGet("https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/passw.txt")
    local userList = {}
    for name in userListScript:gmatch("%S+") do
        table.insert(userList, name:lower())
    end

    local playerName = password:lower()
    local playerInList = false
    for _, name in ipairs(userList) do
        if playerName == name then
            playerInList = true
            break
        end
    end

    if playerInList then
        notification.Text = "Password accepted"
        notification.TextColor3 = Color3.fromRGB(0, 255, 0)
    else
        notification.Text = "Invalid password"
        notification.TextColor3 = Color3.fromRGB(255, 0, 0)
    end
    notification.Visible = true
end

button.MouseButton1Click:Connect(function()
    gaa(passwordTextbox.Text)
end)
