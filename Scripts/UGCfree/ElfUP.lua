local gui = game.Players.Dryzter.PlayerGui:WaitForChild("StoreSelection")
gui:WaitForChild("Background"):WaitForChild("Keys"):WaitForChild("MainContainer").Position = UDim2.new(0, 0, 0.4, 0)
gui:WaitForChild("Background"):WaitForChild("Stores"):WaitForChild("ShopChoices").Position = UDim2.new(0, 0, 0.4, 0)

local w=game:GetService("Workspace")local p=game:GetService("Players")local sg=Instance.new("ScreenGui")sg.Name="AutoScript"sg.Parent=p.LocalPlayer.PlayerGui local t1=Instance.new("TextLabel",sg)t1.Name="OneCreatorX"t1.Text="OneCreatorX"t1.BackgroundTransparency=1 t1.Position=UDim2.new(0.5,-50,0.5,-12.5)t1.Size=UDim2.new(0,100,0,25) t1.TextSize = 25 local t2=Instance.new("TextLabel",sg)t2.Name="ElfUPv1"t2.Text="Elf UP v1.3"t2.BackgroundTransparency=1 t2.Position=UDim2.new(0.5,-50,0.5,12.5)t2.Size=UDim2.new(0,100,0,25) t2.TextSize = 25
local s=w.ScriptableObjects.Tycoons.PrimaryPart.Tycoon local function f(p)local h={}local function r(o)if o:IsA("Part")and o.Name=="Hitbox"then table.insert(h,o)end for _,c in pairs(o:GetChildren())do r(c)end end r(p) return h end
local function t(b)firetouchinterest(b,p.LocalPlayer.Character.HumanoidRootPart,0)wait(0.1)firetouchinterest(b,p.LocalPlayer.Character.HumanoidRootPart,1)end
for _,b in ipairs(f(s))do t(b)end
while wait(0.9) do
  game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.6.0"):WaitForChild("knit"):WaitForChild("Services"):WaitForChild("TycoonService"):WaitForChild("RF"):WaitForChild("Rebirth"):InvokeServer()
    for _,part in pairs(w:GetDescendants()) do
        if part:IsA("Part")and part.Name:match("Hitbox")then
            local pm=part.Parent
            if pm and pm:IsA("Model")then
                local gp=pm.Parent
                if gp and gp:IsA("Model")and gp.Name:match("Store%d*")then
                    p.LocalPlayer.Character:MoveTo(part.Position)
                end
            end
        end
  end   
    for _,hb in ipairs(f(s))do
        t(hb)
    end
end

LocalPlayer.Idled:Connect(function()
    local VirtualUser = game:GetService('VirtualUser')
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)
