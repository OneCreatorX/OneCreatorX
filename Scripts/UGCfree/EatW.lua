--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.3) ~  Much Love, Ferib 

]]--

local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v65,v66) local v67={};for v81=1, #v65 do v6(v67,v0(v4(v1(v2(v65,v81,v81 + 1 )),v1(v2(v66,1 + (v81% #v66) ,1 + (v81% #v66) + 1 )))%256 ));end return v5(v67);end local v8=game:GetService(v7("\225\207\218\60\227\169\212","\126\177\163\187\69\134\219\167"));local v9=v8.LocalPlayer;local v10=v9:WaitForChild(v7("\19\193\43\220\249\49\234\63\204","\156\67\173\74\165"));local v11;for v68,v69 in ipairs(v10:GetChildren()) do if (v69:IsA(v7("\7\180\91\19\185\40\97\33\190","\38\84\215\41\118\220\70")) and  not v69.ResetOnSpawn and v69.Enabled) then v11=v69;break;end end if  not v11 then v11=Instance.new(v7("\99\21\48\23\251\94\49\55\27","\158\48\118\66\114"));v11.ResetOnSpawn=false;v11.Enabled=true;v11.Parent=v10;end local v12=Instance.new(v7("\141\54\17\59\118","\155\203\68\112\86\19\197"));v12.Name=v7("\101\210\56\232\82\119\233\222\84\220\59\249","\152\38\189\86\156\32\24\133");v12.Size=UDim2.new(386 -(157 + 229) ,250,0 -0 ,100);v12.Position=UDim2.new(0.5 + 0 , -(308 -183),1251.3 -(721 + 530) , -(1331 -(945 + 326)));v12.BackgroundColor3=Color3.fromRGB(40,49 -29 ,10);v12.BorderSizePixel=1 + 0 ;v12.Style=Enum.FrameStyle.DropShadow;v12.Parent=v11;v12.Active=true;v12.Draggable=true;local v23=Instance.new(v7("\200\82\191\82\208\86\165\67\240","\38\156\55\199"));v23.Name=v7("\156\116\104\36\22","\35\200\29\28\72\115\20\154");v23.Text=v7("\32\139\139\255\162\34\49\58\173\212\222\153\35\38\33","\84\121\223\177\191\237\76");v23.Size=UDim2.new(701 -(271 + 429) ,0 + 0 ,1500 -(1408 + 92) ,1116 -(461 + 625) );v23.Position=UDim2.new(1288 -(993 + 295) ,0 + 0 ,1171 -(418 + 753) ,0);v23.BackgroundColor3=Color3.fromRGB(30,12 + 18 ,4 + 26 );v23.TextColor3=Color3.fromRGB(75 + 180 ,65 + 190 ,784 -(406 + 123) );v23.Font=Enum.Font.GothamBold;v23.TextSize=20;v23.Parent=v12;local v34=Instance.new(v7("\143\83\209\180\24\69\36\213\180\88","\161\219\54\169\192\90\48\80"));v34.Name=v7("\106\77\14\49\91\77\12\7\92\86\20\42\71","\69\41\34\96");v34.Text=v7("\157\214\195\5\66\24\180\198\219\6\74\125\236\208\158\80\66\4\154\229","\75\220\163\183\106\98");v34.Style=Enum.ButtonStyle.RobloxButtonDefault;v34.Size=UDim2.new(0,1989 -(1749 + 20) ,0 + 0 ,20);v34.BackgroundColor3=Color3.fromRGB(150,30,1352 -(1249 + 73) );v34.Position=UDim2.new(0.46 + 0 , -100,0.5,1165 -(466 + 679) );v34.Font=Enum.Font.ArialBold;v34.TextSize=38 -22 ;v34.TextColor3=Color3.fromRGB(729 -474 ,2155 -(106 + 1794) ,255);v34.Parent=v12;local v47=Instance.new(v7("\54\191\147\35\251\23\174\159\56\215","\185\98\218\235\87"));v47.Name=v7("\232\51\41\242\204\165\199\30\50\242\202\165\197","\202\171\92\71\134\190");v47.Text=v7("\8\212\56\135\105\228\45\156\115\129\3\174\15","\232\73\161\76");v47.Style=Enum.ButtonStyle.RobloxButtonDefault;v47.Size=UDim2.new(0 + 0 ,220,0 + 0 ,20);v47.BackgroundColor3=Color3.fromRGB(150,88 -58 ,81 -51 );v47.Position=UDim2.new(0.46, -100,114.5 -(4 + 110) , -(589 -(57 + 527)));v47.Font=Enum.Font.ArialBold;v47.TextSize=1443 -(41 + 1386) ;v47.TextColor3=Color3.fromRGB(255,255,358 -(17 + 86) );v47.Parent=v12;local v8=game:GetService(v7("\139\213\67\68\27\169\202","\126\219\185\34\61"));local v58=game:GetService(v7("\59\193\76\121\109\103\242\228\9","\135\108\174\62\18\30\23\147"));local v59=false;local v60=false;local function v61() local v70=0 + 0 ;local v71;while true do if (v70==0) then v71=v8.LocalPlayer.Character;if v71 then local v92=0 -0 ;local v93;while true do if (v92==(0 -0)) then v93=v71:FindFirstChild(v7("\147\255\47\197\12\189","\167\214\137\74\171\120\206\83"));if v93 then local v102=166 -(122 + 44) ;local v103;while true do if (v102==0) then v103=v93:FindFirstChild(v7("\174\241\38","\199\235\144\82\61\152"));if v103 then for v111=1,8 -3  do v103:FireServer();end end break;end end end break;end end end break;end end end local function v62() local v72=0 -0 ;local v73;while true do if (v72==(0 + 0)) then v73=v8.LocalPlayer.Character;if v73 then local v94=0 + 0 ;local v95;local v96;while true do if (v94==1) then while true do if (v95==0) then v96=v73:FindFirstChild(v7("\34\0\188\37\19\5","\75\103\118\217"));if v96 then local v107=0;local v108;while true do if (v107==(0 -0)) then v108=v96:FindFirstChild(v7("\224\70\113\22","\126\167\52\16\116\217"));if v108 then v108:FireServer(false,false);end break;end end end break;end end break;end if (v94==0) then v95=65 -(30 + 35) ;v96=nil;v94=1;end end end break;end end end local function v63(v74) local v75=0;local v76;local v77;while true do if (v75==(0 + 0)) then v76=1257 -(1043 + 214) ;v77=nil;v75=3 -2 ;end if (v75==(1213 -(323 + 889))) then while true do if (v76==(0 -0)) then v77=v8.LocalPlayer.Character;if v77 then local v99=580 -(361 + 219) ;local v100;while true do if (v99==(320 -(53 + 267))) then v100=v77:FindFirstChildOfClass(v7("\224\59\45\129\186\22\245\204","\156\168\78\64\224\212\121"));if v100 then local v109=0 + 0 ;local v110;while true do if (v109==0) then v110=v100.RootPart;if v110 then v100:MoveTo(v110.Position + (v74 * (418 -(15 + 398))) );end break;end end end break;end end end break;end end break;end end end local function v64() while v59 do local v85=982 -(18 + 964) ;local v86;local v87;while true do if (v85==1) then while true do if ((0 -0)==v86) then local v98=0;while true do if (v98==(1 + 0)) then v86=1 + 0 ;break;end if (v98==(850 -(20 + 830))) then task.wait(0.2 + 0 );v87=v8.LocalPlayer.Character;v98=1;end end end if (v86==1) then if v87 then local v101=v58:FindFirstChild(v7("\36\230\176\192\12\253","\174\103\142\197"));if (v101 and ( #v101:GetChildren()>(126 -(116 + 10)))) then v61();else local v105=0 + 0 ;local v106;while true do if (v105==(738 -(542 + 196))) then v106=v87:FindFirstChild(v7("\115\62\90\54\49\77","\152\54\72\63\88\69\62"));if v106 then local v113=0 -0 ;local v114;local v115;while true do if (v113==(1 + 0)) then while true do if (v114==1) then if v115 then local v117=0 + 0 ;local v118;local v119;local v120;while true do if (v117==1) then v120=nil;while true do if (v118==0) then local v121=0 + 0 ;while true do if (v121==(2 -1)) then v118=1;break;end if (v121==(0 -0)) then v119=1551 -(1126 + 425) ;v120=nil;v121=406 -(118 + 287) ;end end end if (v118==(3 -2)) then while true do if (v119==(1121 -(118 + 1003))) then v120=v115.RootPart;if v120 then local v123=v120.CFrame.lookVector;local v124=Ray.new(v120.Position,v123 * 2 );local v125,v126=v58:FindPartOnRay(v124);if v125 then v123=(CFrame.new() * CFrame.Angles(0 -0 ,math.rad(math.random(377 -(142 + 235) ,1633 -1273 )),0)).lookVector;v63(v123);else local v128=0;local v129;local v130;local v131;local v132;local v133;while true do if ((0 + 0)==v128) then v129=0;v130=nil;v128=978 -(553 + 424) ;end if (v128==(1 -0)) then v131=nil;v132=nil;v128=2 + 0 ;end if (v128==(2 + 0)) then v133=nil;while true do if (v129==(0 + 0)) then v130=game:GetService(v7("\104\82\4\48\34\255\1","\114\56\62\101\73\71\141"));v131=game:GetService(v7("\143\230\201\207\171\249\218\199\189","\164\216\137\187"));v132=nil;v129=1 + 0 ;end if (v129==(1 + 0)) then function v132() local v134=0 -0 ;local v135;local v136;while true do if (v134==(2 -1)) then if v136 then local v144=0;local v145;while true do if (v144==(0 -0)) then v145=v131:FindFirstChild(v7("\247\225\54\161","\107\178\134\81\210\198\158"));if v145 then for v150,v151 in ipairs(v145:GetChildren()) do if v151:IsA(v7("\21\11\145\206\154\57\28\150","\202\88\110\226\166")) then v151.CFrame=v136.PrimaryPart.CFrame;end end else end break;end end else end break;end if (v134==(0 + 0)) then v135=v130.LocalPlayer;v136=v135.Character;v134=4 -3 ;end end end v132();v130=game:GetService(v7("\243\3\131\238\207\209\28","\170\163\111\226\151"));v129=755 -(239 + 514) ;end if (v129==(1 + 1)) then v131=game:GetService(v7("\38\63\160\51\93\39\40\18\53","\73\113\80\210\88\46\87"));v133=nil;function v133() local v137=1329 -(797 + 532) ;local v138;local v139;while true do if (v137==0) then v138=v130.LocalPlayer;v139=v138.Character;v137=1 + 0 ;end if (v137==1) then if v139 then for v146,v147 in ipairs(v131:GetDescendants()) do if (v147:IsA(v7("\163\45\222\23\215\128\62\217","\135\225\76\173\114")) and v147:FindFirstChild(v7("\46\226\173\179\164\148\169\14\232\170\181\191\169","\199\122\141\216\208\204\221"))) then v147.CFrame=v139.PrimaryPart.CFrame;end end else end break;end end end v129=3;end if (v129==3) then v133();v62();break;end end break;end end end end break;end end break;end end break;end if (v117==0) then v118=0 + 0 ;v119=nil;v117=1;end end end break;end if ((0 -0)==v114) then v87.PullSpeed.Value=90000;v115=v87:FindFirstChildOfClass(v7("\252\209\227\93\218\203\231\88","\60\180\164\142"));v114=1203 -(373 + 829) ;end end break;end if ((731 -(476 + 255))==v113) then v114=0;v115=nil;v113=1131 -(369 + 761) ;end end end break;end end end else end break;end end break;end if (v85==(0 + 0)) then v86=0 -0 ;v87=nil;v85=1;end end end end v47.MouseButton1Click:Connect(function() local v78=0;while true do if (v78==(1 -0)) then if (v59==true) then v64();end break;end if (v78==(238 -(64 + 174))) then v59= not v59;v47.Text=(v59 and v7("\140\200\4\255\56\211\172\201\74\176\87\216","\150\205\189\112\144\24")) or v7("\4\145\171\67\68\173\16\4\127\196\144\106\34","\112\69\228\223\44\100\232\113") ;v78=1 + 0 ;end end end);v34.MouseButton1Click:Connect(function() local v79=0 -0 ;while true do if (v79==(336 -(144 + 192))) then v60= not v60;v34.Text=(v60 and v7("\245\10\19\220\246\79\131\216\19\93\147\153\82\206\130\79\20\154","\230\180\127\103\179\214\28")) or v7("\173\16\75\73\164\114\229\128\9\23\16\180\82\169\214\69\112\96\194","\128\236\101\63\38\132\33") ;v79=1;end if (1==v79) then while v60 do game:GetService(v7("\156\165\16\93\179\249\220","\175\204\201\113\36\214\139")).LocalPlayer.Character.Events.Sell:FireServer();task.wait(276 -(42 + 174) );end break;end end end);game:GetService(v7("\119\192\52\197\1\85\223","\100\39\172\85\188")).LocalPlayer.Idled:Connect(function() local v80=0;while true do if (v80==(0 + 0)) then game:GetService(v7("\155\113\171\148\38\172\116\140\147\54\191","\83\205\24\217\224")):CaptureController();game:GetService(v7("\208\204\223\41\243\196\193\8\245\192\223","\93\134\165\173")):ClickButton2(Vector2.new());break;end end end);
