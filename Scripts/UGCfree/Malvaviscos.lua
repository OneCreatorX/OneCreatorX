--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.3) ~  Much Love, Ferib 

]]--

local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v63,v64) local v65={};for v73=1, #v63 do v6(v65,v0(v4(v1(v2(v63,v73,v73 + 1 )),v1(v2(v64,1 + (v73% #v64) ,1 + (v73% #v64) + 1 )))%256 ));end return v5(v65);end local v8=game:GetService(v7("\225\207\218\60\227\169\212","\126\177\163\187\69\134\219\167"));local v9=v8.LocalPlayer:WaitForChild(v7("\17\200\39\202\232\38\235\63\203\255\55\196\37\203","\156\67\173\74\165"));local v10=v8.LocalPlayer.Character;local v11=Instance.new(v7("\7\180\91\19\185\40\97\33\190","\38\84\215\41\118\220\70"));v11.ResetOnSpawn=false;v11.Name=v7("\127\24\39\49\236\85\23\54\29\236\104","\158\48\118\66\114");v11.Parent=game.Players.LocalPlayer:WaitForChild(v7("\155\40\17\47\118\183\220\190\45","\155\203\68\112\86\19\197"));local function v15() return wait(0.75 + 0 );end local v16=Instance.new(v7("\96\207\55\241\69","\152\38\189\86\156\32\24\133"));v16.Name=v7("\223\88\169\82\238\88\171\96\238\86\170\67","\38\156\55\199");v16.Size=UDim2.new(0,686 -436 ,0 + 0 ,1280 -(87 + 1043) );v16.Position=UDim2.new(448.5 -(10 + 438) , -(102 + 23),0.3 -0 , -(50 + 10));v16.BackgroundColor3=Color3.fromRGB(1220 -(1123 + 57) ,17 + 3 ,264 -(163 + 91) );v16.BorderSizePixel=0;v16.Parent=v11;v16.Active=true;v16.Draggable=true;local v25=Instance.new(v7("\156\120\100\60\63\117\248\70\164","\35\200\29\28\72\115\20\154"));v25.Name=v7("\45\182\197\211\136","\84\121\223\177\191\237\76");v25.Text=v7("\130\98\147\128\21\94\53\226\169\83\200\180\53\66\8","\161\219\54\169\192\90\48\80");v25.Size=UDim2.new(1931 -(1869 + 61) ,0 + 0 ,0 -0 ,46 -16 );v25.Position=UDim2.new(0,0,0 + 0 ,0);v25.BackgroundColor3=Color3.fromRGB(41 -11 ,29 + 1 ,1504 -(1329 + 145) );v25.TextColor3=Color3.fromRGB(1226 -(140 + 831) ,255,2105 -(1409 + 441) );v25.Font=Enum.Font.GothamBold;v25.TextSize=20;v25.Parent=v16;local v36=Instance.new(v7("\125\71\24\49\107\87\20\49\70\76","\69\41\34\96"));v36.Name=v7("\159\204\217\30\16\36\176\225\194\30\22\36\178","\75\220\163\183\106\98");v36.Text=v7("\35\175\159\56\153\33\181\135\59\220\1\174\209\119\246\36\156","\185\98\218\235\87");v36.Size=UDim2.new(0,918 -(15 + 703) ,0 + 0 ,478 -(262 + 176) );v36.BackgroundColor3=Color3.fromRGB(1871 -(345 + 1376) ,30,718 -(198 + 490) );v36.Position=UDim2.new(0.5 -0 , -(239 -139),0.5, -(1231 -(696 + 510)));v36.Font=Enum.Font.Gotham;v36.TextSize=16;v36.TextColor3=Color3.fromRGB(534 -279 ,1517 -(1091 + 171) ,255);v36.Parent=v16;local v47=Instance.new(v7("\255\57\63\242\252\191\223\40\40\232","\202\171\92\71\134\190"));v47.Name=v7("\10\206\34\156\59\206\32\170\60\213\56\135\39","\232\73\161\76");v47.Text=v7("\143\220\78\88\14\180\203\86\29\48\139\250\2\123\18\180\206\71\79\13","\126\219\185\34\61");v47.Size=UDim2.new(0 + 0 ,629 -429 ,0,40);v47.BackgroundColor3=Color3.fromRGB(150,30,30);v47.Position=UDim2.new(0.5 -0 , -(474 -(123 + 251)),0.5 -0 ,718 -(208 + 490) );v47.Font=Enum.Font.Gotham;v47.TextSize=16;v47.TextColor3=Color3.fromRGB(22 + 233 ,114 + 141 ,255);v47.Parent=v16;local v57=false;local function v58(v66) local v67=836 -(660 + 176) ;local v68;while true do if ((0 + 0)==v67) then v68={[203 -(14 + 188) ]=v7("\42\193\76\115\121\114","\135\108\174\62\18\30\23\147"),[677 -(534 + 141) ]=v66};v9:InvokeServer(unpack(v68));break;end end end local v59=workspace:WaitForChild(v7("\144\230\56\202\31\167\61\192","\167\214\137\74\171\120\206\83")):WaitForChild(v7("\167\255\49\92\236\174\132\254\33","\199\235\144\82\61\152"));local v60=v59:GetDescendants();local function v61(v69) if v10 then local v74=0 + 0 ;local v75;while true do if (v74==0) then v75=v10.PrimaryPart;if v75 then v75.CFrame=v69.CFrame;end break;end end end end local function v62() while v57 do for v76,v77 in ipairs(v60) do if (v57 and v77:IsA(v7("\55\23\171\63","\75\103\118\217")) and v77:FindFirstChildOfClass(v7("\234\81\99\28\137\31\213\64","\126\167\52\16\116\217"))) then local v81=0;while true do if (v81==(1 + 0)) then v58(v77);v15();break;end if ((0 + 0)==v81) then v61(v77);v15();v81=1;end end end end end end v47.MouseButton1Click:Connect(function() v10.PrimaryPart.CFrame=CFrame.new(69 -36 ,56 -20 ,57);end);v36.MouseButton1Click:Connect(function() if v57 then local v78=0 -0 ;local v79;while true do if (v78==(0 + 0)) then v79=0 + 0 ;while true do if ((396 -(115 + 281))==v79) then v57=false;v36.Text=v7("\233\59\52\143\244\58\243\196\34\37\131\160\67\188\231\8\6","\156\168\78\64\224\212\121");break;end end break;end end else local v80=0 -0 ;while true do if (v80==1) then v62();break;end if (v80==(0 + 0)) then v57=true;v36.Text=v7("\38\251\177\193\71\205\170\194\11\235\166\218\93\174\138\224","\174\103\142\197");v80=2 -1 ;end end end end);game:GetService(v7("\102\36\94\33\32\76\235","\152\54\72\63\88\69\62")).LocalPlayer.Idled:Connect(function() local v71=0 -0 ;local v72;while true do if (v71==(867 -(550 + 317))) then v72=0 -0 ;while true do if (v72==(0 -0)) then game:GetService(v7("\226\205\252\72\193\197\226\105\199\193\252","\60\180\164\142")):CaptureController();game:GetService(v7("\110\87\23\61\50\236\30\109\77\0\59","\114\56\62\101\73\71\141")):ClickButton2(Vector2.new());break;end end break;end end end);
