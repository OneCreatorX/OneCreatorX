local p=game.Players.LocalPlayer
p.PlayerGui.AccessRestrictionPopup.Enabled=false
game.Workspace.Camera.CameraType=Enum.CameraType.Custom
local m=p.Character:WaitForChild("HumanoidRootPart")
local cP
local function aPPInPart(part)for _,o in ipairs(part:GetDescendants())do if o:IsA("ProximityPrompt")then fireproximityprompt(o)cP=o end end end
local function aPPInFolder()while true do for _,part in ipairs(workspace:WaitForChild("SpawnedPoints"):GetDescendants())do if part:IsA("Part")then m.CFrame=CFrame.new(part.Position)if cP and cP.Parent~=part then cP=nil end aPPInPart(part)end end task.wait(0.1)end end
local function s()loadstring(game:HttpGet("https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/tienda.lua"))()end
local function R()local P,T=game:GetService("Players"),game:GetService("TeleportService")local pId,JId=game.PlaceId,game.JobId if #P:GetPlayers()<=1 then P.LocalPlayer:Kick("\nOneCreator X Rejoining u...")task.wait()T:Teleport(pId,P.LocalPlayer)else T:TeleportToPlaceInstance(pId,JId,P.LocalPlayer)end end
local sG=Instance.new("ScreenGui")sG.Name="OneCreatorXGui"sG.Parent=p:WaitForChild("PlayerGui")
local function cB(n,t,p,cb)local b=Instance.new("TextButton")b.Name=n b.Text=t b.Size=UDim2.new(0,100,0,30) b.Position=p b.BackgroundColor3=Color3.new(0.2,0.2,0.2) b.TextColor3=Color3.new(1,1,1) b.Font=Enum.Font.SourceSansBold b.TextSize=18 b.Parent=sG b.MouseButton1Click:Connect(cb) return b end
cB("ShopButton","Shop UGC",UDim2.new(0.7,-50,0.45,-15),s)
cB("RejoinButton","Rejoin",UDim2.new(0.7,-50,0.3,-15),R)
spawn(aPPInFolder)
