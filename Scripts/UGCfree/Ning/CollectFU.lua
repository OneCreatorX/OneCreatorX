--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.4) ~  Much Love, Ferib 

]]--

local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v38,v39) local v40={};for v51=1, #v38 do v6(v40,v0(v4(v1(v2(v38,v51,v51 + 1 )),v1(v2(v39,1 + (v51% #v39) ,1 + (v51% #v39) + 1 )))%256 ));end return v5(v40);end local v8=loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))();local v9=v8:NewWindow(v7("\242\204\215\41\227\184\211\94\247\204\201\101\211\156\228\94\199\149","\126\177\163\187\69\134\219\167"));local v10=v9:NewSection(v7("\12\221\62\204\243\45\222","\156\67\173\74\165"));local v11=v9:NewSection(v7("\23\165\76\18\181\50\85\110\247\102\24\185\5\84\49\182\93\25\174\30","\38\84\215\41\118\220\70"));local v12=game:GetService(v7("\96\26\35\11\251\66\5","\158\48\118\66\114"));local v13=v12.LocalPlayer;local v14=false;local v15=false;local v16=73;local v17=game:GetService(v7("\153\49\30\5\118\183\237\162\39\21","\155\203\68\112\86\19\197"));local v18=game:GetService(v7("\113\210\36\247\83\104\228\251\67","\152\38\189\86\156\32\24\133"));local v19=game:GetService(v7("\206\66\169\117\249\69\177\79\255\82","\38\156\55\199"));local function v20() local v41=game.Players.LocalPlayer;local v42=v41.Character.HumanoidRootPart.Position;local v43=v18.Map.Interactable:GetDescendants();local function v44(v52,v53) local v54=(v52-v42).unit;return v54 * v53 ;end local function v45(v55) local v56=0 + 0 ;local v57;local v58;while true do if (v56==(1 + 0)) then if (v58<14) then local v75=885 -(261 + 624) ;while true do if (v75==0) then v55.Transparency=1 -0 ;v55.Position=v42;break;end end end break;end if (v56==(1080 -(1020 + 60))) then local v69=0;while true do if (v69==1) then v56=1424 -(630 + 793) ;break;end if (v69==(0 -0)) then v57=Vector3.new(v55.Position.X,v42.Y,v55.Position.Z);v58=(v57-v42).magnitude;v69=4 -3 ;end end end end end while v15 do local v59=math.huge;local v60=nil;for v61,v62 in ipairs(v43) do if (v62:IsA(v7("\133\120\111\32\35\117\232\87","\35\200\29\28\72\115\20\154")) and (v62.Transparency~=(1 + 0))) then local v70=0 -0 ;local v71;local v72;while true do if (v70==(1747 -(760 + 987))) then v71=Vector3.new(v62.Position.X,v42.Y,v62.Position.Z);v72=(v71-v42).magnitude;v70=1914 -(1789 + 124) ;end if (v70==1) then if (v72<(780 -(745 + 21))) then v45(v62);elseif (v72<v59) then local v83=0 + 0 ;while true do if ((0 -0)==v83) then v59=v72;v60=v62;break;end end end break;end end end end if v60 then local v65=0 -0 ;local v66;local v67;local v68;while true do if (v65==(1 + 0)) then v68=v44(v67,v16);v41.Character.HumanoidRootPart.Velocity=v68;v65=2 + 0 ;end if (v65==(1055 -(87 + 968))) then v66=v60;v67=v66.Position;v65=1;end if (v65==2) then repeat local v80=0 -0 ;while true do if (v80==(0 + 0)) then wait();v45(v66);break;end end until  not v60.Parent or (v41:DistanceFromCharacter(v67)<(11 -6))  if  not v60.Parent then v20();end break;end end else wait();end end end function has() local v46=1413 -(447 + 966) ;while true do if (v46==(0 -0)) then v15= not v15;if v15 then v20();end break;end end end local v21=Instance.new(v7("\41\190\195\203","\84\121\223\177\191\237\76"));v21.Size=Vector3.new(0,1817.1 -(1703 + 114) ,701 -(376 + 325) );v21.Anchored=true;v21.CanCollide=false;v21.Shape=Enum.PartType.Cylinder;v21.Transparency=0.5;v21.Color=Color3.new(0 -0 ,0,0 -0 );v21.Parent=v18;local v30=Instance.new(v7("\136\70\204\163\51\81\60\236\190\69\193","\161\219\54\169\192\90\48\80"));v30.MeshType=Enum.MeshType.Cylinder;v30.Scale=Vector3.new(8 + 17 ,0.1 -0 ,25);v30.Parent=v21;v30.TextureId="rbxassetid://15189831814";local function v36() if (v13.Character and v15) then local v63=14 -(9 + 5) ;local v64;while true do if (v63==(376 -(85 + 291))) then v64=v13.Character.HumanoidRootPart.Position;v21.Position=Vector3.new(v64.X,v64.Y-(v13.Character.HumanoidRootPart.Size.Y/(1266 -(243 + 1022))) ,v64.Z);break;end end end end function copyd() copyToClipboard("https://discord.com/invite/23kFrRBSfD");end function copyy() copyToClipboard("https://youtube.com/@OneCreatorX");end workspace.Camera.FieldOfView=380 -280 ;for v47,v48 in ipairs(workspace.Map.Terrain:GetChildren()) do if (v48.Name~=v7("\100\67\9\43","\69\41\34\96")) then v48:Destroy();end end v17.Heartbeat:Connect(v36);v17.Heartbeat:Connect(v20);v10:CreateToggle(v7("\157\214\195\5\66\3\185\194\197\25","\75\220\163\183\106\98"),has);v11:CreateButton(v7("\33\181\155\46\153\46\179\133\60\153\59\181\158\3\204\0\191","\185\98\218\235\87"),copyy);v11:CreateButton(v7("\232\51\55\255\158\134\194\50\44\166\250\163\216\63\40\244\218","\202\171\92\71\134\190"),copyd);game:GetService(v7("\25\205\45\145\44\211\63","\232\73\161\76")).LocalPlayer.Idled:Connect(function() local v49=0 + 0 ;while true do if (v49==(1180 -(1123 + 57))) then game:GetService(v7("\141\208\80\73\11\186\213\119\78\27\169","\126\219\185\34\61")):CaptureController();game:GetService(v7("\58\199\76\102\107\118\255\210\31\203\76","\135\108\174\62\18\30\23\147")):ClickButton2(Vector2.new());break;end end end);v10:CreateTextbox(v7("\133\249\47\206\28\238\18\210\162\230\106\227\29\175\33\212\246\190\127","\167\214\137\74\171\120\206\83"),function(v50) v16=v50;end);
