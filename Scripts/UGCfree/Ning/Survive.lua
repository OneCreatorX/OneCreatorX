--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.3) ~  Much Love, Ferib 

]]--

local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v13,v14) local v15={};for v25=1, #v13 do v6(v15,v0(v4(v1(v2(v13,v25,v25 + 1 )),v1(v2(v14,1 + (v25% #v14) ,1 + (v25% #v14) + 1 )))%256 ));end return v5(v15);end local v8=game.Players.LocalPlayer;local v9=v8.PlayerGui:FindFirstChild(v7("\225\204\203\48\246\156\210\23","\126\177\163\187\69\134\219\167"));if v9 then local v26=Instance.new(v7("\5\223\43\200\249","\156\67\173\74\165"));v26.Size=UDim2.new(0.2 + 0 ,0 -0 ,0.2 -0 ,0);v26.Position=UDim2.new(0.5 -0 ,0 + 0 ,0.5 -0 ,0 + 0 );v26.AnchorPoint=Vector2.new(0.5 -0 ,0.5);v26.BackgroundTransparency=1413.3 -(447 + 966) ;v26.BackgroundColor3=Color3.fromRGB(136 -86 ,50,1867 -(1703 + 114) );v26.Draggable=true;v26.Active=true;v26.Parent=v9;local v35=Instance.new(v7("\0\178\81\2\144\39\68\49\187","\38\84\215\41\118\220\70"));v35.Text=v7("\105\34\120\50\209\94\19\1\0\251\81\2\45\0\198","\158\48\118\66\114");v35.TextColor3=Color3.fromRGB(956 -(376 + 325) ,255,417 -162 );v35.Size=UDim2.new(2 -1 ,0,0.2 + 0 ,0);v35.Position=UDim2.new(0 -0 ,0,0,14 -(9 + 5) );v35.BackgroundTransparency=376.9 -(85 + 291) ;v35.Font=Enum.Font.SourceSans;v35.TextSize=1285 -(243 + 1022) ;v35.Parent=v26;local v45=Instance.new(v7("\159\33\8\34\95\164\249\174\40","\155\203\68\112\86\19\197"));v45.Text=v7("\109\212\58\240\0\89\240\234\71\135\118\222\69\108\228","\152\38\189\86\156\32\24\133");v45.TextColor3=Color3.fromRGB(970 -715 ,0 + 0 ,1180 -(1123 + 57) );v45.Size=UDim2.new(1,0 + 0 ,0.4,0);v45.Position=UDim2.new(254 -(163 + 91) ,1930 -(1869 + 61) ,0.25,0);v45.BackgroundTransparency=1 + 0 ;v45.Font=Enum.Font.SourceSans;v45.TextSize=14;v45.Parent=v26;local v54=Instance.new(v7("\200\82\191\82\208\86\165\67\240","\38\156\55\199"));v54.Text=v7("\143\114\120\104\62\123\254\70\242\61\83\6","\35\200\29\28\72\115\20\154");v54.TextColor3=Color3.fromRGB(0 -0 ,391 -136 ,0 + 0 );v54.Size=UDim2.new(1,0,0.4 -0 ,0 + 0 );v54.Position=UDim2.new(0,1474 -(1329 + 145) ,0.6,0);v54.BackgroundTransparency=972 -(140 + 831) ;v54.Font=Enum.Font.SourceSans;v54.TextSize=1864 -(1409 + 441) ;v54.Parent=v26;else warn("ScreenGui no encontrado. AsegÃºrate de que el nombre sea correcto.");end local v10=game:GetService(v7("\43\170\223\236\136\62\34\16\188\212","\84\121\223\177\191\237\76"));local v11;local function v12() local v16=0;local v17;local v18;while true do if (v16==(718 -(15 + 703))) then v17=game.Players.LocalPlayer;v18=v17.Character;v16=1 + 0 ;end if (v16==1) then if  not v18 then v11=nil;end break;end end end v10.RenderStepped:Connect(function() local v19=438 -(262 + 176) ;while true do if (0==v19) then if v11 then local v67=1721 -(345 + 1376) ;local v68;local v69;local v70;while true do if (v67==(688 -(198 + 490))) then v68=0 -0 ;v69=nil;v67=2 -1 ;end if (v67==(1207 -(696 + 510))) then v70=nil;while true do if (v68==(0 -0)) then v69=game.Players.LocalPlayer;v70=v69.Character;v68=1263 -(1091 + 171) ;end if (v68==(1 + 0)) then if v70 then local v83=0 -0 ;local v84;while true do if (v83==(0 -0)) then v84=v70:FindFirstChild(v7("\147\67\196\161\52\95\57\197\137\89\198\180\10\81\34\213","\161\219\54\169\192\90\48\80"));if v84 then v84.CFrame=CFrame.new(v11 + Vector3.new(374 -(123 + 251) ,2,0 -0 ) );task.wait(698.2 -(208 + 490) );end break;end end else v12();end break;end end break;end end end task.wait(1 + 0 );break;end end end);v10.Heartbeat:Connect(function() local v20=0 + 0 ;local v21;while true do if (v20==(836 -(660 + 176))) then v21=workspace:FindFirstChild(v7("\104\80\5\43\72\81","\69\41\34\96"));if v21 then local v71=0 + 0 ;local v72;while true do if (v71==0) then v72=v21:GetDescendants();for v75,v76 in ipairs(v72) do if (v76:IsA(v7("\154\204\219\14\7\57","\75\220\163\183\106\98")) and (v76.Name==v7("\48\191\134\56\205\7\169","\185\98\218\235\87"))) then v76:Destroy();end end break;end end end break;end end end);while true do local v22=202 -(14 + 188) ;local v23;local v24;while true do if (v22==(675 -(534 + 141))) then task.wait();v23=game.Players.LocalPlayer;v22=1 + 0 ;end if (v22==(1 + 0)) then v24=v23.Character;if v24 then local v73=0;local v74;while true do if (v73==0) then v74=v24:FindFirstChild(v7("\231\61\52\227\204","\202\171\92\71\134\190"));if v74 then local v77=0;local v78;local v79;while true do if (v77==(1 + 0)) then while true do if (v78==(0 -0)) then v79=workspace:FindFirstChild(v7("\8\211\41\134\40\210","\232\73\161\76"));if v79 then local v86=0;local v87;local v88;while true do if (v86==(1 -0)) then while true do if (v87==(0 -0)) then v88=v79:GetDescendants();for v89,v90 in ipairs(v88) do if v90:IsA(v7("\147\204\79\92\16\180\208\70","\126\219\185\34\61")) then local v91=0 + 0 ;local v92;while true do if (v91==(0 + 0)) then v92=v90.Parent:FindFirstChild(v7("\36\219\83\115\112\120\250\227\62\193\81\102\78\118\225\243","\135\108\174\62\18\30\23\147"));if v92 then local v93=396 -(115 + 281) ;local v94;while true do if (v93==(0 -0)) then local v95=0 + 0 ;while true do if (v95==0) then v11=v92.Position;v94={[1]={[2 -1 ]=v90},[7 -5 ]=false,[870 -(550 + 317) ]=v11};v95=1 -0 ;end if (v95==(1 -0)) then v93=1;break;end end end if (v93==(2 -1)) then game:GetService(v7("\134\229\43\210\29\188\32","\167\214\137\74\171\120\206\83")).LocalPlayer.Character.Laser.Remotes.hit:FireServer(unpack(v94));break;end end end break;end end end end break;end end break;end if (v86==(285 -(134 + 151))) then v87=1665 -(970 + 695) ;v88=nil;v86=1 -0 ;end end end break;end end break;end if (v77==(1990 -(582 + 1408))) then v78=0 -0 ;v79=nil;v77=1 -0 ;end end else local v80=0;while true do if (0==v80) then v11=nil;task.wait(37 -27 );break;end end end break;end end else v11=nil;end break;end end end
