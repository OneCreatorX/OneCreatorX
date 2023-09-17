
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")

local functionActivada = false
local botonActivar = nil

local function ShowTeleportControls()

    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = LocalPlayer.PlayerGui


    botonActivar = Instance.new("TextButton")
    botonActivar.Size = UDim2.new(0, 30, 0, 30)
    botonActivar.Position = UDim2.new(0, 10, 0, 10)
    botonActivar.Text = "[ ]"
    botonActivar.Parent = screenGui

    botonActivar.MouseButton1Click:Connect(function()
        if functionActivada then
            functionActivada = false
            botonActivar.Text = " [ ]"
        else
            functionActivada = true
            botonActivar.Text = "[✓]"
        end
    end)
end

ShowTeleportControls()

local zonaDePeligro = Character.PrimaryPart.Position.Y + Character:GetExtentsSize().Y - 1

Humanoid.StateChanged:Connect(function(oldState, newState)
    if newState == Enum.HumanoidStateType.Freefall or newState == Enum.HumanoidStateType.Physics then
        
        zonaDePeligro = Character.PrimaryPart.Position.Y + Character:GetExtentsSize().Y - 15
        functionActivada = true
        botonActivar.Text = "[✓]"
    end
end)

game:GetService("RunService").Heartbeat:Connect(function()
    if functionActivada and Character and Character:IsDescendantOf(game) and Character:FindFirstChild("Humanoid") then
        local playerHeight = Character:GetExtentsSize().Y

        if Character.PrimaryPart.Position.Y <= zonaDePeligro then
            -- Teletransportar al jugador a la posición de teletransporte
            Character:SetPrimaryPartCFrame(CFrame.new(Character.PrimaryPart.Position.X, Character.PrimaryPart.Position.Y + playerHeight, Character.PrimaryPart.Position.Z))
            print("Teletransportado a la posición de teletransporte")
        end
    end
end)
