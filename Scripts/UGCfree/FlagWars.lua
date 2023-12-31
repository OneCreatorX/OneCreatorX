local d = game.Workspace.Core.Drops
local p = game.Players.LocalPlayer
local a = {}

local function t(c)
    local h = p.Character and p.Character:FindFirstChild("HumanoidRootPart")
    if h then
        h.CFrame = CFrame.new(c.Position)
    end
end

local function v(hitbox)
    return a[hitbox] ~= nil
end

local function at(hitbox)
    if v(hitbox) then
        t(hitbox.CFrame)
    end
end

local function eq()
    local b = p:FindFirstChild("Backpack")
    local s = b and b:FindFirstChild("Default Sword")

    if s then
        s.Parent = p.Character
        s:SetPrimaryPartCFrame(p.Character:WaitForChild("RightHand").CFrame)
    end
end

local function m(model)
    local h = model:FindFirstChild("Hitbox")

    if h then
        a[h] = true
        at(h)
    end
end

local function ae(model)
    m(model)
    task.wait(3)
    eq()
end

local function disableCollisionExceptFloor()
    local humanoid = p.Character:FindFirstChildOfClass("Humanoid")
    local parts = p.Character:GetDescendants()
    for _, part in ipairs(parts) do
        if part:IsA("BasePart") and part ~= workspace.Terrain then
            part.CanCollide = false
        end
    end
end

local function md()
    while task.wait(0.2) do
        for _, model in ipairs(d:GetChildren()) do
            disableCollisionExceptFloor()
            m(model)
        end
    end
end

d.ChildAdded:Connect(ae)
md()
