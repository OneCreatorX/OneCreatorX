local P, LP, W, RS = game:GetService("Players"), game.Players.LocalPlayer, game:GetService("Workspace"), game:GetService("RunService")
local SG = Instance.new("ScreenGui", LP:WaitForChild("PlayerGui"))

local RunBtn = Instance.new("TextButton", SG) RunBtn.Size, RunBtn.Position, RunBtn.Text = UDim2.new(0, 100, 0, 50), UDim2.new(0, 10, 0, 10), "Run"
local AnclarBtn = Instance.new("TextButton", SG) AnclarBtn.Size, AnclarBtn.Position, AnclarBtn.Text = UDim2.new(0, 100, 0, 50), UDim2.new(0, 120, 0, 10), "Anclar"
local DesactivarBtn = Instance.new("TextButton", SG) DesactivarBtn.Size, DesactivarBtn.Position, DesactivarBtn.Text, DesactivarBtn.Visible = UDim2.new(0, 100, 0, 50), UDim2.new(0, 10, 0, 70), "Desactivar", false

local Pl, AG, AA = nil, 0, false

local function Run()
    if Pl then
        Pl:Destroy()
        Pl, AG = nil, nil

        LP.Character.Humanoid.WalkSpeed = 16
        RunBtn.Visible, DesactivarBtn.Visible = true, false
    else
        AG = LP.Character.HumanoidRootPart.Position.Y

        Pl = Instance.new("Part")
        Pl.Size, Pl.BrickColor, Pl.Anchored, Pl.Position = Vector3.new(5, 1, 5), BrickColor.new("Sand blue"), true, Vector3.new(LP.Character.HumanoidRootPart.Position.X, AG + 900 - 3.5, LP.Character.HumanoidRootPart.Position.Z)
        Pl.Parent = W

        LP.Character:SetPrimaryPartCFrame(CFrame.new(LP.Character.HumanoidRootPart.Position + Vector3.new(0, 900, 0)))
        LP.Character.Humanoid.WalkSpeed = LP.Character.Humanoid.WalkSpeed + 300

        RS.Heartbeat:Connect(function()
            if Pl and LP.Character then
                Pl.Position = Vector3.new(LP.Character.HumanoidRootPart.Position.X, AG + 900 - 3.5, LP.Character.HumanoidRootPart.Position.Z)
            end
        end)

        LP.Character.Humanoid.Jumping:Connect(function()
            if Pl then
                Pl:Destroy()
                Pl, DesactivarBtn.Visible, RunBtn.Visible, AG = nil, false, true, nil
                LP.Character.Humanoid.WalkSpeed = 16
            end
        end)

        RunBtn.Visible, DesactivarBtn.Visible = false, true
    end
end

local function Anclar()
    if LP.Character then
        for _, P in pairs(LP.Character:GetDescendants()) do
            if P:IsA("BasePart") then
                P.Anchored = not AA
            end
        end

        AA = not AA
        AnclarBtn.Text = AA and "Desanclar" or "Anclar"
    end
end

RunBtn.MouseButton1Down:Connect(Run)
AnclarBtn.MouseButton1Down:Connect(Anclar)
DesactivarBtn.MouseButton1Down:Connect(Run) -- Desactivar también activa Run

LocalPlayer.Idled:Connect(function()
    local VirtualUser = game:GetService('VirtualUser')
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)
