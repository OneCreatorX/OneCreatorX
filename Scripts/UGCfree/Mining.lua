local P,W=game:GetService("Players"),game:GetService("Workspace")

local function R(parent)
    for _, c in ipairs(parent:GetChildren()) do
        if c:IsA("BoolValue") then
            c.Value = true
        elseif c:IsA("Instance") then
            R(c)
        end
    end
end

while task.wait(1.5) do
    local LP = P.LocalPlayer
    if LP then R(LP) local H = LP.Character and LP.Character:FindFirstChildOfClass("Humanoid") if H then H.WalkSpeed = 60 end end

    local p, e = {"LandPlots", "Red", "Tycoon", "Unloader", "Input", "touched"}, W
    for _, n in ipairs(p) do
        e = e[n]
        if not e then break end
    end

    if e then e:FireServer() end
end
