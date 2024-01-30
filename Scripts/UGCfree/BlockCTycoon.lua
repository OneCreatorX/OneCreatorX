local p=game.Players.LocalPlayer
local t=workspace:WaitForChild("Tycoons")
local c
local iD
local sG=Instance.new("ScreenGui")sG.ResetOnSpawn=false sG.Name="YT_OneCreatorX" sG.Parent=p.PlayerGui
local f=Instance.new("Frame")f.Name="Drsgglabe"f.Active=true f.Size=UDim2.new(0,120,0,70) f.Position=UDim2.new(0.5,-60,0.5,-35) f.BackgroundColor3=Color3.fromRGB(30,30,30) f.Draggable=true f.Parent=sG
local tL=Instance.new("TextLabel")tL.Name="TitleLabel"tL.Size=UDim2.new(1,0,0,15)tL.Position=UDim2.new(0,0,0,0)tL.BackgroundColor3=Color3.fromRGB(50,50,50)tL.TextColor3=Color3.fromRGB(200,200,200)tL.Text="YT: OneCreatorX"tL.Parent=f
local aTL=Instance.new("TextLabel")aTL.Name="AllTasksLabel"aTL.Size=UDim2.new(1,0,0,15)aTL.Position=UDim2.new(0,0,0,20)aTL.BackgroundColor3=Color3.fromRGB(50,50,50)aTL.TextColor3=Color3.fromRGB(200,200,200)aTL.Text="AllTasks ON"aTL.Parent=f

local function fPT()
    for i=1,8 do
        local tI=t:WaitForChild(tostring(i)):WaitForChild("TycoonInfo")
        local oV=tI:WaitForChild("Owner").Value 
        if oV==p then 
            c=t:WaitForChild(tostring(i))
            iD=c:WaitForChild("ItemDebris")
            break 
        end 
    end 
end 

local function sIToS()
    if c then
        for _, file in ipairs(iD:GetChildren()) do
            file.CanCollide = false
            file.Position = p.Character.HumanoidRootPart.Position
        end
    else
        warn("Jugador no encontrado en ningún Tycoon.")
    end
end

local function aTI(plr)
    local hP=c:WaitForChild("SellPad"):WaitForChild("Main") 
    firetouchinterest(hP,plr.Character.HumanoidRootPart,0) 
    task.wait(0.1) 
    firetouchinterest(hP,plr.Character.HumanoidRootPart,1) 
end 

local function aDB()
    local dButtons=c:WaitForChild("DropperButtons") 
    for i=1,80 do 
        local dButton=dButtons:WaitForChild(tostring(i)) 
        local bValue=dButton:WaitForChild("Active") 
        local hP=dButton:WaitForChild("Main") 
        if bValue.Value==true then 
            firetouchinterest(hP,p.Character.HumanoidRootPart,0) 
            task.wait(0.1) 
            firetouchinterest(hP,p.Character.HumanoidRootPart,1) 
        end 
    end 
end 

local function aORB() 
    local oButtons = workspace:WaitForChild("ObbyRewardButtons") 
    for _, oButtonName in ipairs({"Easy Obby", "Medium Obby", "Hard Obby"}) do 
        local oButton = oButtons:WaitForChild(oButtonName) 
        local hP = oButton 
        firetouchinterest(hP, p.Character.HumanoidRootPart, 0) 
        task.wait(0.1) 
        firetouchinterest(hP, p.Character.HumanoidRootPart, 1) 
    end 
end 

p.PlayerGui.FDN.ShopFrame:GetPropertyChangedSignal("Visible"):Connect(function()
    if p.PlayerGui.FDN.ShopFrame.Visible then
        p.PlayerGui.FDN.ShopFrame.Visible = false
    end
end)

game.Lighting.UIBlur:Destroy()
fPT() 
iD.ChildAdded:Connect(function() 
    sIToS()
    aTI(p) 
    aDB() 
    aORB()
end)

game:GetService('Players').LocalPlayer.Idled:Connect(function()
game:GetService('VirtualUser'):CaptureController()   game:GetService('VirtualUser'):ClickButton2(Vector2.new())
end)
