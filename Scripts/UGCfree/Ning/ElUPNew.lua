--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.3) ~  Much Love, Ferib 

]]--

local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v59,v60) local v61={};for v86=1, #v59 do v6(v61,v0(v4(v1(v2(v59,v86,v86 + 1 )),v1(v2(v60,1 + (v86% #v60) ,1 + (v86% #v60) + 1 )))%256 ));end return v5(v61);end local v8=game:GetService(v7("\225\207\218\60\227\169\212","\126\177\163\187\69\134\219\167"));local v9=v8.LocalPlayer;local v10=v9:WaitForChild(v7("\19\193\43\220\249\49\234\63\204","\156\67\173\74\165"));local v11;for v62,v63 in ipairs(v10:GetChildren()) do if (v63:IsA(v7("\7\180\91\19\185\40\97\33\190","\38\84\215\41\118\220\70")) and  not v63.ResetOnSpawn and v63.Enabled) then v11=v63;break;end end if  not v11 then local v87=0 -0 ;while true do if (v87==(0 + 0)) then v11=Instance.new(v7("\99\21\48\23\251\94\49\55\27","\158\48\118\66\114"));v11.ResetOnSpawn=false;v87=561 -(306 + 254) ;end if (v87==(1 + 0)) then v11.Enabled=true;v11.Parent=v10;break;end end end local v12=Instance.new(v7("\141\54\17\59\118","\155\203\68\112\86\19\197"));v12.Name=v7("\101\210\56\232\82\119\233\222\84\220\59\249","\152\38\189\86\156\32\24\133");v12.Size=UDim2.new(0,250,0,157 -77 );v12.Position=UDim2.new(1467.5 -(899 + 568) , -(83 + 42),0.3 -0 , -(663 -(268 + 335)));v12.BackgroundColor3=Color3.fromRGB(330 -(60 + 230) ,592 -(426 + 146) ,10);v12.BorderSizePixel=1;v12.Style=Enum.FrameStyle.DropShadow;v12.Parent=v11;v12.Active=true;v12.Draggable=true;local v23=Instance.new(v7("\200\82\191\82\208\86\165\67\240","\38\156\55\199"));v23.Name=v7("\156\116\104\36\22","\35\200\29\28\72\115\20\154");v23.Text=v7("\32\139\139\255\162\34\49\58\173\212\222\153\35\38\33","\84\121\223\177\191\237\76");v23.Size=UDim2.new(1 + 0 ,1456 -(282 + 1174) ,0,30);v23.Position=UDim2.new(811 -(569 + 242) ,0 -0 ,0,0 + 0 );v23.BackgroundColor3=Color3.fromRGB(1054 -(706 + 318) ,1281 -(721 + 530) ,30);v23.TextColor3=Color3.fromRGB(255,1526 -(945 + 326) ,637 -382 );v23.Font=Enum.Font.GothamBold;v23.TextSize=18 + 2 ;v23.Parent=v12;local v34=Instance.new(v7("\143\83\209\180\24\69\36\213\180\88","\161\219\54\169\192\90\48\80"));v34.Name=v7("\106\77\14\49\91\77\12\7\92\86\20\42\71","\69\41\34\96");v34.Text=v7("\157\214\195\5\66\9\169\202\219\14\88\107\147\229\241","\75\220\163\183\106\98");v34.Style=Enum.ButtonStyle.RobloxButtonDefault;v34.Size=UDim2.new(700 -(271 + 429) ,203 + 17 ,0,1520 -(1408 + 92) );v34.BackgroundColor3=Color3.fromRGB(150,1116 -(461 + 625) ,1318 -(993 + 295) );v34.Position=UDim2.new(0.46, -(6 + 94),1171.5 -(418 + 753) ,0);v34.Font=Enum.Font.ArialBold;v34.TextSize=7 + 9 ;v34.TextColor3=Color3.fromRGB(27 + 228 ,75 + 180 ,65 + 190 );v34.Parent=v12;local function v47() return wait(529.3 -(406 + 123) );end local v48=false;local function v49(v64) local v65=1769 -(1749 + 20) ;local v66;local v67;local v68;local v69;while true do if (v65==3) then game:GetService(v7("\253\53\53\242\203\171\199\21\41\246\203\190\230\61\41\231\217\175\217","\202\171\92\71\134\190")):SendMouseButtonEvent(v68,v69,0 + 0 ,false,game,1323 -(1249 + 73) );break;end if (0==v65) then v66=v64.AbsolutePosition;v67=v64.AbsoluteSize;v65=1 + 0 ;end if (v65==1) then local v98=0;while true do if ((1145 -(466 + 679))==v98) then v68=v66.X + (v67.X/(2 -1)) ;v69=v66.Y + (v67.Y/(2 -1)) ;v98=1901 -(106 + 1794) ;end if (v98==1) then v65=1 + 1 ;break;end end end if (v65==2) then game:GetService(v7("\52\179\153\35\204\3\182\162\57\201\23\174\166\54\215\3\189\142\37","\185\98\218\235\87")):SendMouseButtonEvent(v68,v69,0 + 0 ,true,game,2 -1 );wait(0.05);v65=7 -4 ;end end end local v50=game:GetService(v7("\25\205\45\145\44\211\63","\232\73\161\76")).LocalPlayer.PlayerGui.StoreSelection.Background.Stores.ShopChoices;v50.ChildAdded:Connect(function(v70) local v71=v70.TextButton;task.wait(0.1);v49(v71);end);local function v51(v72) local v73,v74=v72:match(v7("\243\156\70\22\91\245\134\7\89\84\242\145\7\92\84\242","\126\219\185\34\61"));local v75=115 -(4 + 110) ;if (v74=="K") then v75=1584 -(57 + 527) ;elseif (v74=="M") then v75=1000000;elseif (v74=="B") then v75=1000001427 -(41 + 1386) ;elseif (v74=="T") then v75=1000000000103 -(17 + 86) ;end local v76=tonumber(v73) * v75 ;return v76;end local function v52() local v77=game.Players.LocalPlayer.PlayerGui.Display.Top.Currency.Cash.Text;local v78=v51(v77);return v78;end local v53={};local v54=nil;local function v55() for v88,v89 in ipairs(workspace.ScriptableObjects:GetDescendants()) do if (v89:IsA(v7("\46\207\77\119\78\118\225\243","\135\108\174\62\18\30\23\147")) and (v89.Name==v7("\158\224\62\201\23\182","\167\214\137\74\171\120\206\83")) and (v89.Parent.Parent.Name==v7("\168\229\32\79\253\169\136\233\17\82\244\171\142\243\38\82\234\180","\199\235\144\82\61\152"))) then v89.CFrame=game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame;task.wait(0.2 + 0 );v89.Position=Vector3.new(1 -0 ,2 -1 ,167 -(122 + 44) );break;end end end v55();local function v56() for v90,v91 in ipairs(workspace.ScriptableObjects:GetDescendants()) do if (v91:IsA(v7("\37\23\170\46\55\23\171\63","\75\103\118\217")) and (v91.Name==v7("\239\93\100\22\182\6","\126\167\52\16\116\217")) and (v91.Parent.Parent.Name==v7("\235\59\50\146\177\23\255\209\13\47\140\184\28\255\220\33\50\147","\156\168\78\64\224\212\121"))) then v91.CFrame=game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame;task.wait(0.1);v91.Position=Vector3.new(1,1,1 -0 );break;end end end local function v57(v79,v80) local v81=0 -0 ;local v82;while true do if (v81==(1 + 0)) then if (v82>=v80) then if (v79 and v79:IsA(v7("\37\239\182\203\55\239\183\218","\174\103\142\197"))) then local v121=0;while true do if (v121==1) then wait(0.1 + 0 );v79.CFrame=game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame;v121=3 -1 ;end if (v121==(65 -(30 + 35))) then v79.Transparency=1 + 0 ;v79.Position=Vector3.new(1258 -(1043 + 214) ,1,3 -2 );v121=1;end if (v121==(1214 -(323 + 889))) then v53[v79]=nil;v47();break;end end else end else v56();end break;end if (v81==(0 -0)) then local v105=580 -(361 + 219) ;while true do if ((320 -(53 + 267))==v105) then v47();v82=v52();v105=1 + 0 ;end if (v105==1) then v81=1;break;end end end end end local function v55() for v92,v93 in ipairs(workspace.ScriptableObjects:GetDescendants()) do if (v93:IsA(v7("\123\39\91\61\41","\152\54\72\63\88\69\62")) and (v93.Name==v7("\243\214\225\73\218\192\209\127\193\214\252\89\218\199\247\127\219\200\226\89\215\208\225\78","\60\180\164\142"))) then v54=v93.Hitbox;break;end end end local function v58() if (next(v53)==nil) then local v94=v52();local v95={};for v107,v108 in ipairs(workspace.ScriptableObjects:GetDescendants()) do if (v108:IsA(v7("\122\95\22\44\23\236\0\76","\114\56\62\101\73\71\141")) and (v108.Name==v7("\144\224\207\198\183\241","\164\216\137\187"))) then local v114=413 -(15 + 398) ;local v115;while true do if (v114==(982 -(18 + 964))) then v115=v108:FindFirstChildOfClass(v7("\240\239\61\190\164\241\10\192\226\22\167\175","\107\178\134\81\210\198\158"));if v115 then local v130=v115:FindFirstChild(v7("\27\1\145\210","\202\88\110\226\166"));if (v130 and v130:IsA(v7("\247\10\154\227\230\194\13\135\251","\170\163\111\226\151"))) then local v131=0 -0 ;local v132;while true do if (0==v131) then v132=v51(v130.Text);if (v94>=v132) then table.insert(v95,{[v7("\25\57\166\58\65\47","\73\113\80\210\88\46\87")]=v108,[v7("\145\62\196\17\226","\135\225\76\173\114")]=v132});else end break;end end elseif (v108:FindFirstChild(v7("\56\228\180\188\174\178\166\8\233\159\165\165","\199\122\141\216\208\204\221")) and (v108.BillboardGui.Title.Text==v7("\143\232\57\220\92\182\158\233\63\194\93\183","\150\205\189\112\144\24"))) then local v135=0 + 0 ;local v136;local v137;while true do if (v135==(1 + 0)) then while true do if (v136==0) then local v139=850 -(20 + 830) ;local v140;while true do if (v139==0) then v140=0 + 0 ;while true do if (v140==(127 -(116 + 10))) then v136=1 + 0 ;break;end if (v140==0) then v108.CFrame=game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame;task.wait(738.1 -(542 + 196) );v140=1 -0 ;end end break;end end end if (v136==(1 + 0)) then v137=game:GetService(v7("\21\136\190\85\1\154\2","\112\69\228\223\44\100\232\113")).LocalPlayer.PlayerGui.StoreSelection.Background.Keys.MainContainer.Generic.TextButton;v49(v137);break;end end break;end if (v135==(0 + 0)) then local v138=0;while true do if (v138==1) then v135=1 + 0 ;break;end if (v138==0) then v136=0;v137=nil;v138=1;end end end end else end else end break;end end else end end if ( #v95>0) then local v112=0;local v113={};for v116,v117 in ipairs(v95) do if ((v112 + v117.price)<=v94) then local v122=0;while true do if (v122==(2 -1)) then task.wait(0.2);break;end if (v122==0) then table.insert(v113,v117);v112=v112 + v117.price ;v122=2 -1 ;end end else end end for v118,v119 in ipairs(v113) do v57(v119.hitbox,v119.price);end else v56();end else end end v34.MouseButton1Click:Connect(function() local v83=0;local v84;while true do if (v83==0) then v84=1551 -(1126 + 425) ;while true do if (v84==(406 -(118 + 287))) then while v48 do local v123=0;while true do if (v123==(0 -0)) then v58();game:GetService(v7("\158\172\1\72\191\232\206\184\172\21\119\162\228\221\173\174\20","\175\204\201\113\36\214\139")):WaitForChild(v7("\119\205\54\215\5\64\201\38","\100\39\172\85\188")):WaitForChild(v7("\146\81\183\132\54\181","\83\205\24\217\224")):WaitForChild(v7("\245\201\200\52\242\203\196\62\237\250\198\51\239\209\237\108\168\147\131\109","\93\134\165\173")):WaitForChild(v7("\181\252\200\214","\30\222\146\161\162\90\174\210")):WaitForChild(v7("\214\75\98\28\236\77\117\25","\106\133\46\16")):WaitForChild(v7("\108\57\112\243\85\78\107\37\97\234\83\67\93","\32\56\64\19\156\58")):WaitForChild(v7("\104\238","\224\58\168\133\54\58\146")):WaitForChild(v7("\107\83\73\244\103\146\143","\107\57\54\43\157\21\230\231")):InvokeServer();v123=1;end if (v123==(1122 -(118 + 1003))) then task.wait(0.7 -0 );if v54 then v54.CFrame=game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame;else v55();end break;end end end break;end if (v84==(377 -(142 + 235))) then local v120=0;while true do if (v120==(4 -3)) then v84=1 + 0 ;break;end if (0==v120) then v48= not v48;v34.Text=(v48 and v7("\245\10\19\220\246\94\147\221\19\3\137\246\83\168","\230\180\127\103\179\214\28")) or v7("\173\16\75\73\164\99\245\133\9\91\28\164\110\198\170","\128\236\101\63\38\132\33") ;v120=1;end end end end break;end end end);game:GetService(v7("\235\135\16\236\188\206\220","\175\187\235\113\149\217\188")).LocalPlayer.Idled:Connect(function() local v85=0;while true do if (v85==0) then game:GetService(v7("\10\166\147\88\246\120\116\9\188\132\94","\24\92\207\225\44\131\25")):CaptureController();game:GetService(v7("\125\218\170\88\14\124\71\230\171\73\9","\29\43\179\216\44\123")):ClickButton2(Vector2.new());break;end end end);
