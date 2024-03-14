local y = false
local p

local G = Instance.new("ScreenGui")
G.Parent = game.Players.LocalPlayer.PlayerGui
G.ResetOnSpawn = false

local F = Instance.new("Frame")
F.Parent = G
F.Position = UDim2.new(0, 10, 0, 50)
F.Size = UDim2.new(0, 200, 0, 90)
F.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
F.BorderSizePixel = 0
F.Active = true
F.Draggable = true

local L = Instance.new("TextLabel")
L.Parent = F
L.Size = UDim2.new(1, 0, 0, 30)
L.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
L.TextColor3 = Color3.fromRGB(255, 255, 255)
L.Text = "YT:@OneCreatorX"
L.Font = Enum.Font.SourceSansBold
L.TextSize = 18

local y = false

local SB = Instance.new("TextButton")
SB.Parent = F
SB.Position = UDim2.new(0.24, 5, 0, 40)
SB.Size = UDim2.new(0, 100, 0, 30)
SB.Text = "Auto Tycoon: OFF"
SB.BackgroundColor3 = Color3.fromRGB(30, 144, 255)
SB.TextColor3 = Color3.fromRGB(255, 255, 255)
SB.MouseButton1Click:Connect(function()
    y = not y
    if y then
        SB.Text = "Auto Tycoon: ON"
    else
        SB.Text = "Auto Tycoon: OFF"
    end
end)

local p

local function f()
    local player = game.Players.LocalPlayer
    local playerName = player.Name:lower()  

    for _, plot in ipairs(workspace.Plots:GetDescendants()) do
        if plot:IsA("ObjectValue") and plot.Name == "OwnerPlayer" then
            local plotValue = plot.Value
            if type(plotValue) == "userdata" and plotValue:IsA("Player") then
                local plotPlayerName = plotValue.Name:lower()
                if plotPlayerName == playerName then
                    p = plot.Parent
                    break
                end
            end
        end
    end
end

f()

local function g()
    if p then
        for _, GP in ipairs(p:GetDescendants()) do
            if GP:IsA("Model") and GP.Name == "GamePasses" then
                GP:Destroy()
            end
        end

        local maxDistance = 900000

        for _, plot in ipairs(p:GetDescendants()) do
            if plot:IsA("Part") or plot:IsA("MeshPart") then
                if plot.Parent and (plot.Parent:IsA("Part") or plot.Parent:IsA("MeshPart")) and plot:FindFirstChild("TouchInterest") then
                    local character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
                    local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
                    local distance = (plot.Position - humanoidRootPart.Position).magnitude
                    if distance <= maxDistance then
                        if plot.Parent.Transparency == 0 then
                            if plot.Parent.BrickColor == BrickColor.new("Bright bluish green") or plot.Parent.BrickColor == BrickColor.new("Br. yellowish green") then
                                character:SetPrimaryPartCFrame(plot.CFrame)
                                wait(1)
                                character.Humanoid.Jump = true
                                wait(0.5)
                            end
                        end
                    end
                end
            end
        end

        for _, coinModel in ipairs(p:GetDescendants()) do
            if coinModel:IsA("Model") and coinModel.Name:sub(1, 4) == "Coin" then
                local primaryPart = coinModel.PrimaryPart
                if primaryPart.Transparency == 0 then
                    local humanoidRootPart = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
                    primaryPart.CFrame = humanoidRootPart.CFrame
                    wait(0.1)
                end
            end
        end
    else
    warn("No se encontró el Plot del jugador local.")
  SB.Text = "No Player Tycoon"
  wait(3)
  y = not y
    if y then
        SB.Text = "Auto Tycoon: ON"
    else
        SB.Text = "Auto Tycoon: OFF"
  end
    G:Destroy()
 end
end

local function fii()
    if p then
        for _, button in ipairs(p:GetDescendants()) do
            if button.Name == "ATM_Button" then
                for _, part in ipairs(button:GetDescendants()) do
                    if part:FindFirstChild("TouchInterest") then
                        local character = game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait()
                        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
                        humanoidRootPart.CFrame = part.CFrame
                        return
                    end
                end
            end
        end
    else
        warn("No se encontró el Plot del jugador local.")
    end
end

while true do
    if y then
        g()
       fii()
        wait(2)
    else
        wait(0.1)
    end
end

game:GetService('Players').LocalPlayer.Idled:Connect(function()
    game:GetService('VirtualUser'):CaptureController()
    game:GetService('VirtualUser'):ClickButton2(Vector2.new())
end)
