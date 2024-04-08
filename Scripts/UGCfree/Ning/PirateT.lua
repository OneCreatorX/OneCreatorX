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
frame.Position = UDim2.new(0.5, -125, 0.3, -100)
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


local moveButtonsButton = Instance.new("TextButton")
moveButtonsButton.Name = "MoveButtonsButton"
moveButtonsButton.Text = "Auto Build: OFF"
moveButtonsButton.Style = Enum.ButtonStyle.RobloxButtonDefault
moveButtonsButton.Size = UDim2.new(0, 220, 0, 20)
moveButtonsButton.BackgroundColor3 = Color3.fromRGB(150, 30, 30)
moveButtonsButton.Position = UDim2.new(0.5, -110, 0.6, 0)
moveButtonsButton.Font = Enum.Font.ArialBold
moveButtonsButton.TextSize = 16
moveButtonsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
moveButtonsButton.Parent = frame

local p = game.Players.LocalPlayer
local t = workspace.MainSystem.TycoonSystem.Tycoons[p.UserId]

local gg = false 

local function mp()

    local dropsFolder = workspace.PlugNPlay.AirDrop.Drops
    local player = game.Players.LocalPlayer
    local humanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    
    if humanoidRootPart then
        for _, descendant in ipairs(dropsFolder:GetDescendants()) do
            if descendant:IsA("Part") and descendant.Name == "ProxPart" then

                local partPosition = descendant.Position

                humanoidRootPart.CFrame = CFrame.new(partPosition)
                
                

                wait(0.5)
                

                local proximityPrompt = descendant:FindFirstChildOfClass("ProximityPrompt")
                if proximityPrompt then
                    fireproximityprompt(proximityPrompt)
                else
                    
                end
                
                break  
            end
        end
    else
        
    end
end


local function mv()
mp()
        t.Unlockables.Bank.Circle.Touch.Position = Vector3.new(0, 0, 0)
task.wait(0.5)
        t.Unlockables.Bank.Circle.Touch.Position = p.Character.HumanoidRootPart.Position
end


local function convertToNumber(priceString)
    local numericValue, suffix = priceString:match("(%d+%.?%d*)(%a*)")
    local multiplier = 1
    
    if suffix == "K" then
        multiplier = 1000
    elseif suffix == "M" then
        multiplier = 1000000
    elseif suffix == "B" then
        multiplier = 1000000000
    elseif suffix == "T" then
        multiplier = 1000000000000
    end
    
    local cv = tonumber(numericValue) * multiplier
    
    return cv
end

local buttons = t.Buttons:GetChildren()

local function mt()
    while gg do
task.wait(0.5)
        
local buttons = t.Buttons:GetChildren()
for _, button in ipairs(buttons) do
    if button:IsA("Model") then
        local descendants = button:GetDescendants()
        local price = nil
        for _, descendant in ipairs(descendants) do
            if descendant:IsA("TextLabel") and descendant.Name == "Price" then
                price = convertToNumber(descendant.Text)
                break 
            end
        end
        if price then

            if game.Players.LocalPlayer.leaderstats.Cash.Value >= price then
local mesh = button.Mesh
                if mesh then
                    mesh.Transparency = 1
                    task.wait(0.2)
                    mesh.Position = p.Character.HumanoidRootPart.Position
                else
                    
                end
            else
                mv()
            end
        else
            
        end
    else
        
    end
end
    end
end


moveButtonsButton.MouseButton1Click:Connect(function()
    gg = not gg
    moveButtonsButton.Text = gg and "Auto Build: ON" or "Auto Build: OFF"
    if gg then
        mt()
    end
end)


game:GetService('Players').LocalPlayer.Idled:Connect(function()
game:GetService('VirtualUser'):CaptureController()   game:GetService('VirtualUser'):ClickButton2(Vector2.new())
end)
