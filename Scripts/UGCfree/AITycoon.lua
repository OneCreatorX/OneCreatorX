local rl = loadstring(game:HttpGet("https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/UGCfree/Ning/Info.lua"))
spawn(rl)
--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.3) ~  Much Love, Ferib 

]]--

local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v83,v84) local v85={};for v104=1, #v83 do v6(v85,v0(v4(v1(v2(v83,v104,v104 + 1 )),v1(v2(v84,1 + (v104% #v84) ,1 + (v104% #v84) + 1 )))%256 ));end return v5(v85);end local v8=game.Players.LocalPlayer;local v9=v8.PlayerGui;local v10=v9.MoneyDisplay.Main.Amount;local function v11() return wait(1520 -(1408 + 92) );end local v12;local v9=Instance.new(v7("\226\192\201\32\227\181\224\11\216","\126\177\163\187\69\134\219\167"));v9.ResetOnSpawn=false;local v14=Instance.new(v7("\5\223\43\200\249","\156\67\173\74\165"));v14.Size=UDim2.new(1086 -(461 + 625) ,1438 -(993 + 295) ,0 + 0 ,140);v14.Position=UDim2.new(1171.5 -(418 + 753) , -(29 + 46),0.5, -35);v14.AnchorPoint=Vector2.new(0.5,0.5);v14.BackgroundColor3=Color3.fromRGB(25 + 215 ,240,240);v14.BorderSizePixel=1 + 1 ;v14.BorderColor3=Color3.fromRGB(26 + 74 ,629 -(406 + 123) ,1869 -(1749 + 20) );v14.Draggable=true;v14.Active=true;v14.Parent=v9;local v24=Instance.new(v7("\0\178\81\2\144\39\68\49\187","\38\84\215\41\118\220\70"));v24.Size=UDim2.new(1 + 0 ,0,1322 -(1249 + 73) ,8 + 12 );v24.Position=UDim2.new(1145 -(466 + 679) ,0,0,0 -0 );v24.Text=v7("\127\24\39\49\236\85\23\54\29\236\104","\158\48\118\66\114");v24.TextColor3=Color3.fromRGB(0 -0 ,0,1900 -(106 + 1794) );v24.BackgroundTransparency=0.8 + 0 ;v24.Font=Enum.Font.SourceSansBold;v24.TextSize=6 + 14 ;v24.Parent=v14;local v34=Instance.new(v7("\159\33\8\34\95\164\249\174\40","\155\203\68\112\86\19\197"));v34.Size=UDim2.new(1,0 -0 ,0 -0 ,134 -(4 + 110) );v34.Position=UDim2.new(584 -(57 + 527) ,1427 -(41 + 1386) ,103 -(17 + 86) ,14 + 6 );v34.Text=v7("\118\209\57\232\0\72\233\249\95\216\36\166\0","\152\38\189\86\156\32\24\133");v34.TextColor3=Color3.fromRGB(0 -0 ,0,0 -0 );v34.BackgroundTransparency=166.9 -(122 + 44) ;v34.Parent=v14;local v41=Instance.new(v7("\200\82\191\82\208\86\165\67\240","\38\156\55\199"));v41.Size=UDim2.new(1 -0 ,0 -0 ,0 + 0 ,20);v41.Position=UDim2.new(0 + 0 ,0 -0 ,0,105 -(30 + 35) );v41.Text=v7("\132\114\125\44\26\122\253\3\152\111\115\43\22\103\233\70\187","\35\200\29\28\72\115\20\154");v41.TextColor3=Color3.fromRGB(0 + 0 ,1257 -(1043 + 214) ,0 -0 );v41.BackgroundTransparency=0.9;v41.Parent=v14;local v48=Instance.new(v7("\45\186\201\203\161\45\54\28\179","\84\121\223\177\191\237\76"));v48.Size=UDim2.new(1213 -(323 + 889) ,0 -0 ,580 -(361 + 219) ,340 -(53 + 267) );v48.Position=UDim2.new(0,0 + 0 ,413 -(15 + 398) ,1042 -(18 + 964) );v48.Text=v7("\153\67\221\180\53\94\112\241\169\95\202\165\96\16\28\206\186\82\192\174\61\30\126","\161\219\54\169\192\90\48\80");v48.TextColor3=Color3.fromRGB(0 -0 ,0 + 0 ,0 + 0 );v48.BackgroundTransparency=850.9 -(20 + 830) ;v48.Parent=v14;local v55=Instance.new(v7("\125\71\24\49\101\67\2\32\69","\69\41\34\96"));v55.Size=UDim2.new(1 + 0 ,0,0,146 -(116 + 10) );v55.Position=UDim2.new(0 + 0 ,738 -(542 + 196) ,0 -0 ,80);v55.Text=v7("\140\207\214\19\7\57\252\238\216\4\7\50\230\131\251\5\3\47\181\205\208\68\76","\75\220\163\183\106\98");v55.TextColor3=Color3.fromRGB(0,0,0);v55.BackgroundTransparency=0.9 + 0 ;v55.Parent=v14;local v62=Instance.new(v7("\54\191\147\35\245\3\184\142\59","\185\98\218\235\87"));v62.Size=UDim2.new(1 + 0 ,0 + 0 ,0,52 -32 );v62.Position=UDim2.new(0 -0 ,1551 -(1126 + 425) ,405 -(118 + 287) ,100);v62.Text=v7("\233\41\62\166\252\191\223\40\40\232\132\234\231\51\38\226\215\164\204\114\105","\202\171\92\71\134\190");v62.TextColor3=Color3.fromRGB(0 -0 ,1121 -(118 + 1003) ,0 -0 );v62.BackgroundTransparency=377.9 -(142 + 235) ;v62.Parent=v14;local v69=Instance.new(v7("\29\196\52\156\5\192\46\141\37","\232\73\161\76"));v69.Size=UDim2.new(4 -3 ,0 + 0 ,977 -(553 + 424) ,20);v69.Position=UDim2.new(0,0 -0 ,0 + 0 ,120);v69.Text=v7("\139\203\77\90\12\190\202\81\7\94\235","\126\219\185\34\61");v69.TextColor3=Color3.fromRGB(0 + 0 ,0 + 0 ,0 + 0 );v69.BackgroundTransparency=0.9 + 0 ;v69.Parent=v14;v9.Parent=v8.PlayerGui;local function v78() local v86=0 -0 ;local v87;while true do if (v86==(0 -0)) then v87=workspace:WaitForChild(v7("\45\231\30\70\103\116\252\232\2","\135\108\174\62\18\30\23\147")):WaitForChild(v7("\130\240\41\196\23\160\32","\167\214\137\74\171\120\206\83")):GetDescendants();for v111,v112 in ipairs(v87) do if (v112:IsA(v7("\184\228\32\84\246\160\189\241\62\72\253","\199\235\144\82\61\152")) and (v112.Name==v7("\40\1\183\46\21","\75\103\118\217"))) then local v119=0;while true do if (v119==(0 -0)) then wait(0.1 + 0 );if (v112.Value==v8.Name) then return v112.Parent.Parent.Parent;end break;end end end end v86=1;end if (v86==1) then return nil;end end end local function v79() local v88=v10.Text;local v89,v90=v88:match(v7("\143\17\116\95\252\80\152\17\116\94\240\86\130\85\58\93","\126\167\52\16\116\217"));local v91=4 -3 ;if (v90=="K") then v91=1000;elseif (v90=="M") then v91=1000753 -(239 + 514) ;elseif (v90=="B") then v91=1000000000;elseif (v90=="T") then v91=1000000001329 -(797 + 532) ;end return tonumber(v89) * v91 ;end local function v80(v92,v93) local v94=0 + 0 ;local v95;while true do if ((0 + 0)==v94) then v95=v79();if (v95>=v93) then if v12 then local v120=0 -0 ;local v121;while true do if (v120==0) then v121=v12.Buttons:GetDescendants();for v130,v131 in ipairs(v121) do if (v131.Name==v92) then local v132=1202 -(373 + 829) ;local v133;while true do if (v132==(731 -(476 + 255))) then v133=v131:FindFirstChild(v7("\252\33\53\131\188\45\243\234\59\57","\156\168\78\64\224\212\121"));if (v133 and v133:IsA(v7("\55\239\183\218","\174\103\142\197"))) then local v136=1130 -(369 + 761) ;while true do local v137=0;while true do if (v137==(1 + 0)) then if (v136==(1 -0)) then v8.Character:SetPrimaryPartCFrame(CFrame.new(v12.Models.Defaults.MoneyCollector.Collector.Position + Vector3.new(0,9 -4 ,238 -(64 + 174) ) ));v8.Character.Humanoid.Jump=true;v136=2;end break;end if (v137==0) then if (v136==(0 + 0)) then v8.Character:SetPrimaryPartCFrame(CFrame.new(v133.Position + Vector3.new(0 -0 ,339 -(144 + 192) ,0) ));task.wait(0.5);v136=1;end if ((218 -(42 + 174))==v136) then return;end v137=1;end end end end break;end end end end break;end end end else local v118=0 + 0 ;while true do if (v118==0) then v8.Character:SetPrimaryPartCFrame(CFrame.new(v12.Models.Defaults.MoneyCollector.Collector.Position + Vector3.new(0,9,0 + 0 ) ));task.wait(0.2 + 0 );v118=1505 -(363 + 1141) ;end if (v118==1) then v8.Character.Humanoid.Jump=true;task.wait(1580.3 -(1183 + 397) );break;end end end break;end end end local function v81() local v96=game.Players.LocalPlayer;local v97=v96.Character or v96.CharacterAdded:Wait() ;local v98=workspace.Minerals;v41.Text=v7("\117\39\83\52\32\93\236\95\38\88\120\8\87\246\83\58\94\52","\152\54\72\63\88\69\62");for v105,v106 in ipairs(v98:GetChildren()) do if (v106:IsA(v7("\249\203\234\89\216","\60\180\164\142")) and v106.PrimaryPart) then v97:SetPrimaryPartCFrame(CFrame.new(v106.PrimaryPart.Position) + Vector3.new(0 -0 ,4,0) );v11();break;end end end local function v82() local v100=0 + 0 ;local v101;local v102;while true do if (v100==(2 + 0)) then for v113,v114 in ipairs(v102) do local v115=1975 -(1913 + 62) ;local v116;local v117;while true do if (v115==(0 + 0)) then v116=v114.Name;v41.Text=v7("\154\252\207\208\183\231\129\132","\164\216\137\187")   .. v116 ;v115=2 -1 ;end if (v115==(1934 -(565 + 1368))) then v117=v12.Buttons:FindFirstChild(v116,true);if (v117 and v117:IsA(v7("\255\233\53\183\170","\107\178\134\81\210\198\158"))) then local v126=0 -0 ;local v127;local v128;local v129;while true do if (v126==1) then v129=nil;while true do if (v127==0) then local v134=1661 -(1477 + 184) ;while true do if (v134==(0 -0)) then v128=0 + 0 ;v129=nil;v134=1;end if (v134==(857 -(564 + 292))) then v127=1;break;end end end if (v127==1) then while true do local v135=0;while true do if ((0 -0)==v135) then if (v128==0) then v129=v117.Bill.Money.Price;if (v129 and v129:IsA(v7("\12\11\154\210\134\57\12\135\202","\202\88\110\226\166"))) then local v139=v129.Text;local v140;if (v139==v7("\229\61\167\210","\170\163\111\226\151")) then v140=0 -0 ;else local v146=304 -(244 + 60) ;local v147;local v148;local v149;while true do if (v146==0) then local v153=0 + 0 ;local v154;while true do if (v153==(476 -(41 + 435))) then v154=0;while true do if (v154==1) then v146=1;break;end if (v154==(1001 -(938 + 63))) then v147,v148=v139:match(v7("\89\117\182\115\11\121\118\84\52\248\113\6\114\40\91\121","\73\113\80\210\88\46\87"));v149=1 + 0 ;v154=1126 -(936 + 189) ;end end break;end end end if (v146==(1 + 0)) then if (v148=="K") then v149=2613 -(1565 + 48) ;elseif (v148=="M") then v149=1000000;elseif (v148=="B") then v149=1000000000;elseif (v148=="T") then v149=1000000001138 -(782 + 356) ;end v140=tonumber(v147) * v149 ;break;end end end local v141=v79();v55.Text=v7("\177\32\204\11\226\147\108\224\29\233\132\53\151\82","\135\225\76\173\114")   .. v141 ;v62.Text=v7("\56\248\161\240\142\168\179\14\226\182\234\236","\199\122\141\216\208\204\221")   .. (((v141>=v140) and v7("\148\216\3","\150\205\189\112\144\24")) or v7("\11\139","\112\69\228\223\44\100\232\113")) ;v48.Text=v7("\228\13\14\208\179\60\164\193\11\19\220\184\38\198","\230\180\127\103\179\214\28")   .. v140 ;if (v141>=v140) then local v150=0;local v151;while true do if (v150==0) then v151=v117:FindFirstChild(v7("\184\10\74\69\236\117\239\174\16\70","\128\236\101\63\38\132\33"));if (v151 and v151:IsA(v7("\156\168\3\80","\175\204\201\113\36\214\139"))) then local v157=267 -(176 + 91) ;while true do if (v157==(0 -0)) then v8.Character:SetPrimaryPartCFrame(CFrame.new(v151.Position + Vector3.new(0 -0 ,3,1092 -(975 + 117) ) ));v80(v116,v140);break;end end else print("No se encontrÃ³ el objeto 'TouchToBuy' dentro del botÃ³n:",v116);end break;end end else local v152=1875 -(157 + 1718) ;while true do if (v152==1) then v8.Character:SetPrimaryPartCFrame(CFrame.new(v12.Models.Defaults.MoneyCollector.Collector.Position + Vector3.new(0,8 + 1 ,0) ));task.wait(0.2 -0 );v152=6 -4 ;end if (v152==(1020 -(697 + 321))) then v8.Character.Humanoid.Jump=true;task.wait(0.2 -0 );break;end if (v152==(0 -0)) then v81();v41.Text=v7("\100\195\57\208\1\68\216\60\210\3\7\225\58\210\1\94","\100\39\172\85\188");v152=2 -1 ;end end end end v128=1 + 0 ;end if (v128==1) then return;end break;end end end break;end end break;end if (v126==(0 -0)) then v127=0 -0 ;v128=nil;v126=1228 -(322 + 905) ;end end end break;end end end break;end if (v100==(612 -(602 + 9))) then if  not v101 then return;end v102=v101:GetChildren();v100=1191 -(449 + 740) ;end if (v100==(872 -(826 + 46))) then v69.Text=v7("\104\76\10\46\53\232\1\75\4\69","\114\56\62\101\73\71\141")   .. v8.PlayerGui.Rebirth.Main.Content.Main.Progress.ProgressBar.Percent.Text ;v101=v8.NextButtons;v100=1;end end end game:GetService(v7("\157\116\184\153\54\191\107","\83\205\24\217\224")).LocalPlayer.Idled:Connect(function() local v103=0;while true do if (v103==(947 -(245 + 702))) then game:GetService(v7("\208\204\223\41\243\196\193\8\245\192\223","\93\134\165\173")):CaptureController();game:GetService(v7("\136\251\211\214\47\207\190\75\173\247\211","\30\222\146\161\162\90\174\210")):ClickButton2(Vector2.new());break;end end end);while true do if ((v12==nil) or (v12==v7("\203\65\48\58\233\65\100","\106\133\46\16"))) then local v107=0 -0 ;while true do if (v107==(1 + 0)) then if (v12 and (v12~=v7("\118\47\51\204\86\79\76","\32\56\64\19\156\58"))) then v34.Text=v7("\106\196\234\66\26\194\140\91\209\224\68\0\178","\224\58\168\133\54\58\146")   .. v12.Name ;end break;end if (v107==(1898 -(260 + 1638))) then task.wait(442 -(382 + 58) );v12=v78();v107=3 -2 ;end end else local v108=0 + 0 ;while true do if (v108==(0 -0)) then task.wait(2 -1 );v82();v108=1;end if (v108==(1206 -(902 + 303))) then game:GetService(v7("\107\83\91\241\124\133\134\31\92\82\120\233\122\148\134\12\92","\107\57\54\43\157\21\230\231")):WaitForChild(v7("\233\142\28\250\173\217\220","\175\187\235\113\149\217\188")):WaitForChild(v7("\14\170\131\69\241\109\112","\24\92\207\225\44\131\25")):FireServer();break;end end end end
