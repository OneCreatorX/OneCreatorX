local P=game:GetService("Players")local p=P.LocalPlayer local g=p:WaitForChild("PlayerGui")local sg for _,gui in ipairs(g:GetChildren())do if gui:IsA("ScreenGui")and not gui.ResetOnSpawn and gui.Enabled then sg=gui break end end if not sg then sg=Instance.new("ScreenGui")sg.ResetOnSpawn=false sg.Enabled=true sg.Parent=g end local f=Instance.new("Frame")f.Name="ControlFrame"f.Size=UDim2.new(0,250,0,80)f.Position=UDim2.new(0.5,-125,0.3,-100)f.BackgroundColor3=Color3.fromRGB(40,20,10)f.BorderSizePixel=1 f.Style=Enum.FrameStyle.DropShadow f.Parent=sg f.Active=true f.Draggable=true local t=Instance.new("TextLabel")t.Name="Title"t.Text="YT:@OneCreatorX"t.Size=UDim2.new(1,0,0,30)t.Position=UDim2.new(0,0,0,0)t.BackgroundColor3=Color3.fromRGB(30,30,30)t.TextColor3=Color3.fromRGB(255,255,255)t.Font=Enum.Font.GothamBold t.TextSize=20 t.Parent=f local mbb=Instance.new("TextButton")mbb.Name="MoveButtonsButton"mbb.Text="Auto Build: OFF"mbb.Style=Enum.ButtonStyle.RobloxButtonDefault mbb.Size=UDim2.new(0,220,0,20)mbb.BackgroundColor3=Color3.fromRGB(150,30,30)mbb.Position=UDim2.new(0.5,-110,0.6,0)mbb.Font=Enum.Font.ArialBold mbb.TextSize=16 mbb.TextColor3=Color3.fromRGB(255,255,255)mbb.Parent=f local p=P.LocalPlayer local t=workspace.MainSystem.TycoonSystem.Tycoons[p.UserId] local gg=false local function mp()local df=workspace.PlugNPlay.AirDrop.Drops local p=game.Players.LocalPlayer local hrp=p.Character and p.Character:FindFirstChild("HumanoidRootPart") if hrp then for _,d in ipairs(df:GetDescendants())do if d:IsA("Part")and d.Name=="ProxPart"then local pp=d.Position hrp.CFrame=CFrame.new(pp) wait(0.2)local pp=d:FindFirstChildOfClass("ProximityPrompt")if pp then fireproximityprompt(pp)end break end end end end local function mv()mp()t.Unlockables.Bank.Circle.Touch.Position=Vector3.new(0,0,0) task.wait(0.2)t.Unlockables.Bank.Circle.Touch.Position=p.Character.HumanoidRootPart.Position end local function ctn(priceString)local nv,suf=priceString:match("(%d+%.?%d*)(%a*)")local mul=1 if suf=="K"then mul=1000 elseif suf=="M"then mul=1000000 elseif suf=="B"then mul=1000000000 elseif suf=="T"then mul=1000000000000 end return tonumber(nv)*mul end local buttons=t.Buttons:GetChildren() local function mt()while gg do task.wait(0.5)local buttons=t.Buttons:GetChildren()for _,b in ipairs(buttons)do if b:IsA("Model")then local des=b:GetDescendants()local pr=nil for _,d in ipairs(des)do if d:IsA("TextLabel")and d.Name=="Price"then pr=ctn(d.Text)break end end if pr then if game.Players.LocalPlayer.leaderstats.Cash.Value>=pr then local m=b.Mesh if m then m.Transparency=1 task.wait(0.2)m.Position=p.Character.HumanoidRootPart.Position end else mv()end end end end end end mbb.MouseButton1Click:Connect(function()gg=not gg mbb.Text=gg and"Auto Build: ON"or"Auto Build: OFF"if gg then mt()end end) game:GetService('Players').LocalPlayer.Idled:Connect(function()game:GetService('VirtualUser'):CaptureController()game:GetService('VirtualUser'):ClickButton2(Vector2.new())end)
