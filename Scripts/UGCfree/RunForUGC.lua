local P,LP,W,RS = game:GetService("Players"), game.Players.LocalPlayer, game:GetService("Workspace"), game:GetService("RunService")
local SG = Instance.new("ScreenGui", LP:WaitForChild("PlayerGui"))

local AB = Instance.new("TextButton", SG) AB.Size, AB.Position, AB.Text = UDim2.new(0,100,0,50), UDim2.new(0,10,0,10), "Activar"
local AnB = Instance.new("TextButton", SG) AnB.Size, AnB.Position, AnB.Text = UDim2.new(0,100,0,50), UDim2.new(0,120,0,10), "Anclar"
local DB = Instance.new("TextButton", SG) DB.Size, DB.Position, DB.Text, DB.Visible = UDim2.new(0,100,0,50), UDim2.new(0,10,0,70), "Desactivar", false

local Pl,AG,AA = nil,0,false

local function AP()
    if not Pl then
        AG = LP.Character.HumanoidRootPart.Position.Y

        Pl = Instance.new("Part")
        Pl.Size, Pl.BrickColor, Pl.Anchored, Pl.Position = Vector3.new(5, 1, 5), BrickColor.new("Sand blue"), true, Vector3.new(LP.Character.HumanoidRootPart.Position.X,AG + 900 - 3.5,LP.Character.HumanoidRootPart.Position.Z)
        Pl.Parent = W

        LP.Character:SetPrimaryPartCFrame(CFrame.new(LP.Character.HumanoidRootPart.Position + Vector3.new(0, 900, 0)))
        LP.Character.Humanoid.WalkSpeed = LP.Character.Humanoid.WalkSpeed + 300

        RS.Heartbeat:Connect(function()
            if Pl and LP.Character then
                Pl.Position = Vector3.new(LP.Character.HumanoidRootPart.Position.X,AG + 900 - 3.5,LP.Character.HumanoidRootPart.Position.Z)
            end
        end)

        LP.Character.Humanoid.Jumping:Connect(function()
            if Pl then
                Pl:Destroy()
                Pl, DB.Visible, AB.Visible, AG = nil, false, true, nil
                LP.Character.Humanoid.WalkSpeed = 16
            end
        end)

        AB.Visible, DB.Visible = false, true
    end
end

local function AP()
    if LP.Character then
        for _, P in pairs(LP.Character:GetDescendants()) do
            if P:IsA("BasePart") then
                P.Anchored = not AA
            end
        end

        AA = not AA
        AnB.Text = AA and "Desanclar" or "Anclar"
    end
end

local function DP()
    if Pl then
        Pl:Destroy()
        Pl, AG = nil, nil

        LP.Character.Humanoid.WalkSpeed = 16
        AB.Visible, DB.Visible = true, false
    end
end

AB.MouseButton1Down:Connect(AP)
AnB.MouseButton1Down:Connect(AP)
DB.MouseButton1Down:Connect(DP)
