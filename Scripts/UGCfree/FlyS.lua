--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.9.19) ~  Much Love, Ferib 

]]--

local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v46,v47)local v48={};for v56=1, #v46 do v6(v48,v0(v4(v1(v2(v46,v56,v56 + 1 )),v1(v2(v47,1 + (v56% #v47) ,1 + (v56% #v47) + 1 )))%256 ));end return v5(v48);end local v8=game.Players.LocalPlayer;local v9=Instance.new(v7("\226\192\201\32\227\181\224\11\216","\126\177\163\187\69\134\219\167"));v9.ResetOnSpawn=false;v9.Parent=v8.PlayerGui;local v13=Instance.new(v7("\5\223\43\200\249","\156\67\173\74\165"));v13.Size=UDim2.new(0 + 0 ,89 + 61 ,0 -0 ,355 -255 );v13.Position=UDim2.new(0,869 -(814 + 45) ,0 -0 ,10);v13.BackgroundColor3=Color3.fromRGB(3 + 47 ,18 + 32 ,935 -(261 + 624) );v13.BorderColor3=Color3.fromRGB(100,177 -77 ,1180 -(1020 + 60) );v13.Parent=v9;v13.Draggable=true;v13.Active=true;local v21=Instance.new(v7("\0\178\81\2\144\39\68\49\187","\38\84\215\41\118\220\70"));v21.Text=v7("\105\34\120\50\209\94\19\1\0\251\81\2\45\0\198","\158\48\118\66\114");v21.Size=UDim2.new(1,0,1423 -(630 + 793) ,101 -71 );v21.BackgroundColor3=Color3.fromRGB(142 -112 ,12 + 18 ,103 -73 );v21.TextColor3=Color3.fromRGB(2002 -(760 + 987) ,2168 -(1789 + 124) ,1021 -(745 + 21) );v21.TextSize=4 + 6 ;v21.Parent=v13;local v28=Instance.new(v7("\159\33\8\34\81\176\239\191\43\30","\155\203\68\112\86\19\197"));v28.Text=v7("\111\211\63\255\73\121\247","\152\38\189\86\156\32\24\133");v28.Size=UDim2.new(0 -0 ,274 -204 ,0 + 0 ,20 + 5 );v28.Position=UDim2.new(1055.25 -(87 + 968) ,1,0.5, -(88 -68));v28.BackgroundColor3=Color3.fromRGB(64 + 6 ,271 -151 ,1483 -(447 + 966) );v28.TextColor3=Color3.fromRGB(698 -443 ,255,2072 -(1703 + 114) );v28.Parent=v13;local v35=Instance.new(v7("\200\82\191\82\222\88\191","\38\156\55\199"));v35.Text=v7("\248\51\47","\35\200\29\28\72\115\20\154");v35.Size=UDim2.new(701 -(376 + 325) ,60,0 -0 ,92 -62 );v35.Position=UDim2.new(0.5 + 0 , -30,0.75, -15);v35.BackgroundColor3=Color3.fromRGB(88 -48 ,54 -(9 + 5) ,416 -(85 + 291) );v35.TextColor3=Color3.fromRGB(255,1520 -(243 + 1022) ,970 -715 );v35.Parent=v13;local v42=false;local function v43(v49)local v50=nil;local v51=math.huge;local v52=v8.Character.HumanoidRootPart.Position;for v57,v58 in ipairs(v49) do if (v58:IsA(v7("\52\186\194\215\189\45\38\13","\84\121\223\177\191\237\76")) and (v58.Transparency==(0 + 0))) then local v63=(v58.Position-v52).Magnitude;if (v63<v51) then local v68=1180 -(1123 + 57) ;while true do if (v68==0) then v50=v58;v51=v63;break;end end end end end return v50;end local function v44()while v42 do local v59=workspace:WaitForChild(v7("\149\83\222\224\18\95\60\206\168","\161\219\54\169\192\90\48\80")):GetDescendants();local v60=v43(v59);if v60 then local v64=0 + 0 ;local v65;local v66;while true do if (v64==(254 -(163 + 91))) then v65=v60.Position.Y-10 ;v66=Vector3.new(v60.Position.X,v65,v60.Position.Z);v64=1;end if (v64==1) then v8.Character:MoveTo(v66);v60.Transparency=1;break;end end end wait(tonumber(v35.Text) or 0.3 );end end local function v45()for v61,v62 in pairs(workspace:WaitForChild(v7("\103\71\23\101\97\77\12\42\90","\69\41\34\96")):GetDescendants()) do if v62:IsA(v7("\145\198\196\2\50\42\174\215","\75\220\163\183\106\98")) then v62.Transparency=1930 -(1869 + 61) ;end end end v28.MouseButton1Click:Connect(function()local v53=0;local v54;local v55;while true do if (v53==(0 + 0)) then v54=0 -0 ;v55=nil;v53=1 -0 ;end if (v53==1) then while true do if (v54==0) then v55=0;while true do if (v55==1) then v28.BackgroundColor3=(v42 and Color3.fromRGB(17 + 103 ,82 -22 ,60)) or Color3.fromRGB(66 + 4 ,1594 -(1329 + 145) ,1041 -(140 + 831) ) ;if v42 then coroutine.wrap(v44)();end break;end if (v55==(1850 -(1409 + 441))) then v42= not v42;v28.Text=(v42 and v7("\38\191\159\50\215\7\168","\185\98\218\235\87")) or v7("\226\50\46\229\215\171\217","\202\171\92\71\134\190") ;v55=1;end end break;end end break;end end end);resetButton.MouseButton1Click:Connect(function()v45();end);
