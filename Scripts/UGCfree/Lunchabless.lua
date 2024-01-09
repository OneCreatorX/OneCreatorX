local p=game.Players.LocalPlayer
local function s()local h=p.Character:FindFirstChildOfClass("Humanoid")if h then h.Jump=true end end
local tG=p.PlayerGui:WaitForChild("TouchGui")
local jB=tG:WaitForChild("TouchControlFrame"):WaitForChild("JumpButton")
jB.MouseButton1Click:Connect(s)
local cTF=Instance.new("Frame")cTF.Size=UDim2.new(0.3,0,0.5,0)cTF.Position=UDim2.new(0,0,0.5,0)cTF.BackgroundTransparency=0.9 cTF.Parent=tG
local mS=0.1 local mSp=30 local iT=false local tSP=Vector2.new(0,0)
local function m(d)local h=p.Character:FindFirstChildOfClass("Humanoid")if h then local cF=workspace.CurrentCamera.CFrame local fV=cF.lookVector local rV=cF.rightVector local mV=(rV*d.x+fV*d.y).unit*mS if mV.Magnitude>mSp then mV=mV.Unit*mSp end mV=Vector3.new(mV.x,0,-mV.z)h:Move(mV)end end
cTF.InputBegan:Connect(function(input)if input.UserInputType==Enum.UserInputType.Touch then iT=true tSP=input.Position end end)
cTF.InputChanged:Connect(function(input)if iT and input.UserInputType==Enum.UserInputType.Touch then local tD=input.Position-tSP local d=tD.unit m(d)tSP=input.Position end end)
cTF.InputEnded:Connect(function(input)if input.UserInputType==Enum.UserInputType.Touch then iT=false local h=p.Character:FindFirstChildOfClass("Humanoid")if h then h:Move(Vector3.new())end end end)
p.PlayerGui.AccessRestrictionPopup.Enabled=false
local b=game.Lighting:FindFirstChildOfClass("BlurEffect")if b then b.Size=0 end
game.Workspace.Camera.CameraType=Enum.CameraType.Custom
local m=p.Character:WaitForChild("HumanoidRootPart")
local cP
local function aPPInPart(part)for _,o in ipairs(part:GetDescendants())do if o:IsA("ProximityPrompt")then fireproximityprompt(o)cP=o end end end
local function aPPInFolder()while true do for _,part in ipairs(workspace:WaitForChild("SpawnedPoints"):GetDescendants())do if part:IsA("Part")then m.CFrame=CFrame.new(part.Position)if cP and cP.Parent~=part then cP=nil end aPPInPart(part)end end task.wait(0.1) local h = game.Players.LocalPlayer.Character:WaitForChild("Humanoid")
h.WalkSpeed = 100 end end
local function s()loadstring(game:HttpGet("https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/tienda.lua"))()end
local function R()local P,T=game:GetService("Players"),game:GetService("TeleportService")local pId,JId=game.PlaceId,game.JobId if #P:GetPlayers()<=1 then P.LocalPlayer:Kick("\nwait/Espera 1s rejoin")task.wait()T:Teleport(pId,P.LocalPlayer)else T:TeleportToPlaceInstance(pId,JId,P.LocalPlayer)end end
local sG=Instance.new("ScreenGui")sG.Name="OneCreatorXGui"sG.Parent=p:WaitForChild("PlayerGui")
local function cB(n,t,p,cb)local b=Instance.new("TextButton")b.Name=n b.Text=t b.Size=UDim2.new(0,100,0,30) b.Position=p b.BackgroundColor3=Color3.new(0.2,0.2,0.2) b.TextColor3=Color3.new(1,1,1) b.Font=Enum.Font.SourceSansBold b.TextSize=18 b.Parent=sG b.MouseButton1Click:Connect(cb) return b end
cB("ShopButton","Shop UGC",UDim2.new(0.7,-50,0.45,-15),s)
cB("RejoinButton","Rejoin",UDim2.new(0.7,-50,0.3,-15),R)
spawn(aPPInFolder)
