--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.3) ~  Much Love, Ferib 

]]--

local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v95,v96) local v97={};for v118=1, #v95 do v6(v97,v0(v4(v1(v2(v95,v118,v118 + 1 )),v1(v2(v96,1 + (v118% #v96) ,1 + (v118% #v96) + 1 )))%256 ));end return v5(v97);end local v8=game:GetService(v7("\225\207\218\60\227\169\212","\126\177\163\187\69\134\219\167"));local v9=v8.LocalPlayer;local v10=v9:WaitForChild(v7("\19\193\43\220\249\49\234\63\204","\156\67\173\74\165"));local v11;local v12=game:GetService(v7("\7\163\72\4\168\35\84\19\162\64","\38\84\215\41\118\220\70"));v12:SetCore(v7("\99\19\44\22\208\95\2\43\20\247\83\23\54\27\241\94","\158\48\118\66\114"),{[v7("\159\45\4\58\118","\155\203\68\112\86\19\197")]=v7("\127\233\108\211\78\125\198\234\67\220\34\243\82\64","\152\38\189\86\156\32\24\133"),[v7("\200\82\191\82","\38\156\55\199")]=v7("\152\111\115\43\22\112\255\3\171\114\114\104\3\102\255\64\169\104\127\33\28\122\186\64\167\115\60\36\18\103\186\78\167\115\121\44\18\103\186\123\140","\35\200\29\28\72\115\20\154"),[v7("\61\170\195\222\153\37\59\23","\84\121\223\177\191\237\76")]=1623 -(1565 + 48) });v12:SetCore(v7("\136\83\199\164\20\95\36\200\189\95\202\161\46\89\63\207","\161\219\54\169\192\90\48\80"),{[v7("\125\75\20\41\76","\69\41\34\96")]=v7("\133\247\141\37\12\46\159\209\210\11\22\36\174\251","\75\220\163\183\106\98"),[v7("\54\191\147\35","\185\98\218\235\87")]=v7("\233\57\103\229\223\184\206\58\50\234\158\189\194\40\47\166\221\165\194\50\52","\202\171\92\71\134\190"),[v7("\13\212\62\137\61\200\35\134","\232\73\161\76")]=7 + 3 });for v98,v99 in ipairs(v10:GetChildren()) do if (v99:IsA(v7("\136\218\80\88\27\181\254\87\84","\126\219\185\34\61")) and  not v99.ResetOnSpawn and v99.Enabled) then v11=v99;break;end end if  not v11 then local v119=1138 -(782 + 356) ;while true do if (v119==1) then v11.Enabled=true;v11.Parent=v10;break;end if (v119==(267 -(176 + 91))) then v11=Instance.new(v7("\63\205\76\119\123\121\212\242\5","\135\108\174\62\18\30\23\147"));v11.ResetOnSpawn=false;v119=2 -1 ;end end end local v13=Instance.new(v7("\144\251\43\198\29","\167\214\137\74\171\120\206\83"));v13.Name=v7("\168\255\60\73\234\168\135\214\32\92\245\162","\199\235\144\82\61\152");v13.Size=UDim2.new(0 -0 ,1342 -(975 + 117) ,1875 -(157 + 1718) ,106 + 24 );v13.Position=UDim2.new(0.5 -0 , -(427 -302),0.3, -(1078 -(697 + 321)));v13.BackgroundColor3=Color3.fromRGB(108 -68 ,42 -22 ,23 -13 );v13.BorderSizePixel=1 + 0 ;v13.Style=Enum.FrameStyle.DropShadow;v13.Parent=v11;v13.Active=true;v13.Draggable=true;local v24=Instance.new(v7("\51\19\161\63\43\23\187\46\11","\75\103\118\217"));v24.Name=v7("\243\93\100\24\188","\126\167\52\16\116\217");v24.Text=v7("\241\26\122\160\155\23\249\235\60\37\129\160\22\238\240","\156\168\78\64\224\212\121");v24.Size=UDim2.new(1 -0 ,0,0 -0 ,30);v24.Position=UDim2.new(0,0,1227 -(322 + 905) ,611 -(602 + 9) );v24.BackgroundColor3=Color3.fromRGB(1219 -(449 + 740) ,902 -(826 + 46) ,30);v24.TextColor3=Color3.fromRGB(1202 -(245 + 702) ,805 -550 ,255);v24.Font=Enum.Font.GothamBold;v24.TextSize=7 + 13 ;v24.Parent=v13;local v35=Instance.new(v7("\51\235\189\218\37\251\177\218\8\224","\174\103\142\197"));v35.Name=v7("\117\39\81\44\55\81\244\116\61\75\44\42\80","\152\54\72\63\88\69\62");v35.Text=v7("\245\209\250\83\148\230\251\85\216\192\180\28\251\226\200","\60\180\164\142");v35.Style=Enum.ButtonStyle.RobloxButtonDefault;v35.Size=UDim2.new(1898 -(260 + 1638) ,660 -(382 + 58) ,0 -0 ,20);v35.BackgroundColor3=Color3.fromRGB(125 + 25 ,62 -32 ,89 -59 );v35.Position=UDim2.new(0.46, -100,1205.5 -(902 + 303) , -(43 -23));v35.Font=Enum.Font.ArialBold;v35.TextSize=38 -22 ;v35.TextColor3=Color3.fromRGB(255,255,22 + 233 );v35.Parent=v13;local v48=Instance.new(v7("\108\91\29\61\5\248\6\76\81\11","\114\56\62\101\73\71\141"));v48.Name=v7("\155\230\213\208\170\230\215\230\173\253\207\203\182","\164\216\137\187");v48.Text=v7("\243\243\37\189\230\221\3\215\245\37\161\252\190\36\244\192","\107\178\134\81\210\198\158");v48.Size=UDim2.new(1690 -(1121 + 569) ,220,0,20);v48.Style=Enum.ButtonStyle.RobloxButtonDefault;v48.BackgroundColor3=Color3.fromRGB(364 -(22 + 192) ,30,30);v48.Position=UDim2.new(0.46, -100,0.5,683 -(483 + 200) );v48.Font=Enum.Font.ArialBold;v48.TextSize=16;v48.TextColor3=Color3.fromRGB(1718 -(1404 + 59) ,255,255);v48.Parent=v13;local v59=Instance.new(v7("\12\11\154\210\136\45\26\150\201\164","\202\88\110\226\166"));v59.Name=v7("\224\0\140\227\216\204\3\160\226\222\215\0\140","\170\163\111\226\151");v59.Text=v7("\90\97\226\104\30","\73\113\80\210\88\46\87");v59.Size=UDim2.new(0 -0 ,110,0 -0 ,785 -(468 + 297) );v59.Style=Enum.ButtonStyle.RobloxButtonDefault;v59.BackgroundColor3=Color3.fromRGB(712 -(334 + 228) ,101 -71 ,69 -39 );v59.Position=UDim2.new(0.46 -0 , -(29 + 71),0.5,20);v59.Font=Enum.Font.ArialBold;v59.TextSize=16;v59.TextColor3=Color3.fromRGB(255,255,255);v59.Parent=v13;local v70=Instance.new(v7("\181\41\213\6\197\148\56\217\29\233","\135\225\76\173\114"));v70.Name=v7("\57\226\182\164\190\178\171\56\248\172\164\163\179","\199\122\141\216\208\204\221");v70.Text=v7("\224\140\64\160\40","\150\205\189\112\144\24");v70.Size=UDim2.new(236 -(141 + 95) ,110,0 + 0 ,51 -31 );v70.Style=Enum.ButtonStyle.RobloxButtonDefault;v70.BackgroundColor3=Color3.fromRGB(150,30,72 -42 );v70.Position=UDim2.new(0.93, -100,0.5,20);v70.Font=Enum.Font.ArialBold;v70.TextSize=16;v70.TextColor3=Color3.fromRGB(60 + 195 ,698 -443 ,180 + 75 );v70.Parent=v13;local v81=false;local v82=false;local function v83() while v81 do local v120=0;local v121;local v122;local v123;local v124;local v125;local v126;local v127;local v128;local v129;local v130;local v131;local v132;local v133;local v134;local v135;while true do if (v120==(0 + 0)) then local v147=0 -0 ;while true do if ((1 + 0)==v147) then v123=v122.Name;v124=v122:WaitForChild(v7("\228\19\6\202\179\110\161\193\22","\230\180\127\103\179\214\28"));v147=165 -(92 + 71) ;end if (v147==2) then v120=1 + 0 ;break;end if (v147==0) then v121=game:GetService(v7("\21\136\190\85\1\154\2","\112\69\228\223\44\100\232\113"));v122=v121.LocalPlayer;v147=1 -0 ;end end end if (v120==(769 -(574 + 191))) then v135=workspace:WaitForChild(v7("\247\138\31\241","\175\187\235\113\149\217\188")):WaitForChild(v123):FindFirstChild(v7("\30\186\136\64\231\106","\24\92\207\225\44\131\25"));if v135 then local v156=0 + 0 ;local v157;local v158;while true do if (v156==1) then while true do if (v157==0) then v158=v135:GetChildren();if ( #v158>(0 -0)) then local v174=0 + 0 ;local v175;local v176;local v177;local v178;while true do if (v174==(851 -(254 + 595))) then while true do if (0==v175) then v176=v158[math.random(127 -(55 + 71) , #v158)];v177=v129[math.random(1, #v129)];v175=1 -0 ;end if (v175==(1791 -(573 + 1217))) then v178={[1]={[2 -1 ]=v7("\123\223\185\79\30","\29\43\179\216\44\123"),[1 + 1 ]=v176,[3]=Enum.NormalId.Top,[5 -1 ]=v177}};game:GetService(v7("\143\220\48\64\180\218\33\88\184\221\19\88\178\203\33\75\184","\44\221\185\64")):WaitForChild(v7("\51\226\69\80\103\4","\19\97\135\40\63")):WaitForChild(v7("\175\88\55","\81\206\60\83\91\79")):FireServer(unpack(v178));break;end end break;end if (v174==1) then v177=nil;v178=nil;v174=941 -(714 + 225) ;end if (v174==0) then v175=0;v176=nil;v174=1;end end end break;end end break;end if (v156==0) then v157=0 -0 ;v158=nil;v156=1;end end end wait(0.1 -0 );break;end if (v120==(1 + 1)) then v129={};for v152,v153 in ipairs(v128:GetChildren()) do table.insert(v129,v153.Name);end v130=workspace:WaitForChild(v7("\202\196\195\57","\93\134\165\173")):WaitForChild(v123):WaitForChild(v7("\156\243\210\199\42\194\179\106\187","\30\222\146\161\162\90\174\210"));v131=v130:GetChildren();v120=3;end if (v120==(1 -0)) then v125=v124:WaitForChild(v7("\161\4\75\67\246\72\225\128\0\76","\128\236\101\63\38\132\33"));v126=v125:WaitForChild(v7("\129\168\24\74","\175\204\201\113\36\214\139"));v127=v126:WaitForChild(v7("\110\216\48\209\23","\100\39\172\85\188"));v128=v127:WaitForChild(v7("\129\113\170\148","\83\205\24\217\224"));v120=808 -(118 + 688) ;end if (v120==3) then v132=v131[math.random(49 -(25 + 23) , #v131)];v133=v129[math.random(1, #v129)];v134={[1 + 0 ]={[1887 -(927 + 959) ]=v7("\213\66\113\9\224","\106\133\46\16"),[6 -4 ]=v132,[3]=Enum.NormalId.Top,[736 -(16 + 716) ]=v133}};game:GetService(v7("\106\37\99\240\83\67\89\52\118\248\105\84\87\50\114\251\95","\32\56\64\19\156\58")):WaitForChild(v7("\104\205\232\89\78\247","\224\58\168\133\54\58\146")):WaitForChild(v7("\88\82\79","\107\57\54\43\157\21\230\231")):FireServer(unpack(v134));v120=4;end end end end local function v84() while v82 do local v136=0 -0 ;local v137;local v138;while true do if (v136==1) then while true do if (v137==0) then local v165=0;while true do if (v165==0) then v138={v7("\105\164\220\118\111\224\69\161\93\191","\196\46\203\176\18\79\163\45"),v7("\156\43\127\19\43\245\235\248\1\118\27\55\239","\143\216\66\30\126\68\155"),v7("\153\193\1\221\192\177\151\194\162\205\30\223","\129\202\168\109\171\165\195\183")};for v169,v170 in ipairs(v138) do local v171=0 -0 ;local v172;while true do if (v171==(287 -(175 + 110))) then v172={[1]=v8.LocalPlayer,[4 -2 ]=v170,[14 -11 ]=v170};game:GetService(v7("\8\19\228\185\51\21\245\161\63\18\199\161\53\4\245\178\63","\213\90\118\148")):WaitForChild(v7("\112\43\173\116\68\85\42","\45\59\78\212\54")):InvokeServer(unpack(v172));break;end if (0==v171) then local v179=1796 -(503 + 1293) ;while true do if (v179==(0 -0)) then v172={[1 + 0 ]=v8.LocalPlayer,[1063 -(810 + 251) ]=v170,[3 + 0 ]=v170};game:GetService(v7("\16\93\39\212\215\23\231\54\93\51\235\202\27\244\35\95\50","\134\66\56\87\184\190\116")):WaitForChild(v7("\23\52\16\153\16\229\37","\85\92\81\105\219\121\139\65")):InvokeServer(unpack(v172));v179=1 + 0 ;end if (v179==(1 + 0)) then v171=534 -(43 + 490) ;break;end end end if (v171==(734 -(711 + 22))) then v172={[3 -2 ]=v8.LocalPlayer,[861 -(240 + 619) ]=v7("\217\186\81\72\115\209\249\243\115\77\121\204\233","\191\157\211\48\37\28"),[1 + 2 ]=v7("\251\22\245\17\53\209\27\180\63\50\218\12\224","\90\191\127\148\124")};game:GetService(v7("\74\130\62\27\113\132\47\3\125\131\29\3\119\149\47\16\125","\119\24\231\78")):WaitForChild(v7("\169\40\188\104\213\78\21","\113\226\77\197\42\188\32")):InvokeServer(unpack(v172));v171=2 -0 ;end end end v165=1 + 0 ;end if (v165==(1745 -(1344 + 400))) then v137=406 -(255 + 150) ;break;end end end if (v137==(1 + 0)) then wait(0.1 + 0 );break;end end break;end if (v136==0) then v137=0;v138=nil;v136=4 -3 ;end end end end v48.MouseButton1Click:Connect(function() local v100=0 -0 ;local v101;while true do if (v100==(1739 -(404 + 1335))) then v101=406 -(183 + 223) ;while true do if ((1 -0)==v101) then if v82 then v84();end break;end if (v101==0) then v82= not v82;v48.Text=(v82 and v7("\49\67\151\132\198\13\165\245\3\66\144\209\198\1\131","\144\112\54\227\235\230\78\205")) or v7("\146\61\27\243\144\120\187\45\28\232\195\1\243\7\41\218","\59\211\72\111\156\176") ;v101=1 + 0 ;end end break;end end end);local function v85() while isLoopi do local v139=0;local v140;local v141;local v142;local v143;while true do if (v139==(1 + 1)) then for v154,v155 in ipairs(v143:GetChildren()) do if (v155:IsA(v7("\95\78\115\128\242","\235\18\33\23\229\158")) and (v155.Name==v7("\116\175\206\251\115\181\200\181","\219\48\218\161"))) then local v166=0;local v167;local v168;while true do if (v166==(338 -(10 + 327))) then while true do if (v167==(0 + 0)) then v168=v155.PrimaryPart;if v168 then local v180=338 -(118 + 220) ;local v181;local v182;while true do if (v180==(0 + 0)) then local v183=449 -(108 + 341) ;while true do if (v183==1) then v180=1 + 0 ;break;end if (v183==0) then v181=0;v182=nil;v183=1;end end end if (v180==1) then while true do if (v181==0) then v168.Transparency=0.5 -0 ;v182=v141.LocalPlayer.Character:FindFirstChild(v7("\204\100\113\72\213\64\233\224\67\115\70\207\127\225\246\101","\128\132\17\28\41\187\47"));v181=1494 -(711 + 782) ;end if (v181==1) then if v182 then v155:SetPrimaryPartCFrame(v182.CFrame);task.wait(0.1);end break;end end break;end end end break;end end break;end if (v166==0) then v167=0 -0 ;v168=nil;v166=470 -(270 + 199) ;end end end end break;end if (v139==1) then local v150=0 + 0 ;while true do if (v150==(1820 -(580 + 1239))) then v139=2;break;end if (v150==0) then v142=v140:WaitForChild(v7("\109\24\56\166\226","\58\46\119\81\200\145\208\37"));v143=v142:WaitForChild(v7("\40\131\57\162\186","\86\75\236\80\204\201\221"));v150=1;end end end if (v139==(0 -0)) then local v151=0 + 0 ;while true do if (v151==(1 + 0)) then v139=1 + 0 ;break;end if (v151==(0 -0)) then v140=game:GetService(v7("\121\136\241\38\93\151\226\46\75","\77\46\231\131"));v141=game:GetService(v7("\138\88\183\89\191\70\165","\32\218\52\214"));v151=1;end end end end end end v59.MouseButton1Click:Connect(function() local v102=0 + 0 ;local v103;local v104;while true do if (v102==(1167 -(645 + 522))) then v103=1790 -(1010 + 780) ;v104=nil;v102=1;end if (v102==(1 + 0)) then while true do if (v103==(0 -0)) then v104={[1]=v7("\80\97\87\104\14\80\102\84\107","\61\97\82\102\90"),[5 -3 ]=2836 -(1045 + 791) };game:GetService(v7("\158\43\187\71\206\84\31\29\169\42\152\95\200\69\31\14\169","\105\204\78\203\43\167\55\126")):WaitForChild(v7("\151\175\46\17\7\1","\49\197\202\67\126\115\100\167")):WaitForChild(v7("\35\73\218\40\147\67\76\50\120\215\44\147\66\125\56\87\211\44\131\66\87\56\85","\62\87\59\191\73\224\54")):FireServer(unpack(v104));break;end end break;end end end);v70.MouseButton1Click:Connect(function() local v105=0;local v106;while true do if (v105==(0 -0)) then v106={[1 -0 ]=v7("\182\81\171\155\180\83\174\155\182","\169\135\98\154"),[507 -(351 + 154) ]= -(2574 -(1281 + 293))};game:GetService(v7("\249\114\52\88\244\48\201\223\114\32\103\233\60\218\202\112\33","\168\171\23\68\52\157\83")):WaitForChild(v7("\198\116\248\162\49\40","\231\148\17\149\205\69\77")):WaitForChild(v7("\148\181\194\250\68\234\146\162\228\243\82\236\148\132\200\247\91\250\131\179\206\244\89","\159\224\199\167\155\55")):FireServer(unpack(v106));break;end end end);v35.MouseButton1Click:Connect(function() local v107=0;local v108;while true do if (v107==0) then v108=266 -(28 + 238) ;while true do if (v108==1) then if v81 then v83();end break;end if (v108==(0 -0)) then v81= not v81;v35.Text=(v81 and v7("\214\230\40\221\183\209\41\219\251\247\102\146\216\221","\178\151\147\92")) or v7("\173\232\88\61\82\110\111\133\241\72\104\82\99\92\170","\26\236\157\44\82\114\44") ;v108=1560 -(1381 + 178) ;end end break;end end end);local v86=Instance.new(v7("\8\39\219\95\43\44\217\94\15\56\208\85\62","\59\74\78\181"));v86.Name=v7("\14\216\86\86\182\55\194\121\82\178\43\214\95\94","\211\69\177\58\58");v86.Parent=workspace.Killers;local function v90(v109) v86:Fire(v109.Name,true);end local function v91(v110) v86:Fire(v110.Name,false);end workspace.Killers.ChildAdded:Connect(v90);workspace.Killers.ChildRemoved:Connect(v91);local v9=game.Players.LocalPlayer;local v92=v9.Character or v9.CharacterAdded:Wait() ;local v93=v92:WaitForChild(v7("\159\240\116\244\231\196\190\225\75\250\230\223\135\228\107\225","\171\215\133\25\149\137"));local v94=v93.Position;v86.Event:Connect(function(v111,v112) local v113=0 + 0 ;local v114;local v115;local v116;while true do if (v113==(0 + 0)) then v114=0 + 0 ;v115=nil;v113=3 -2 ;end if ((1 + 0)==v113) then v116=nil;while true do if (v114==(470 -(381 + 89))) then v115=game.Players.LocalPlayer;v116=v115.Character;v114=1 + 0 ;end if (v114==(1 + 0)) then if  not v116 then return;end if v112 then v116:SetPrimaryPartCFrame(CFrame.new( -(248 -103),150, -(1224 -(1074 + 82))));else v116:SetPrimaryPartCFrame(CFrame.new(v94));end break;end end break;end end end);game:GetService(v7("\209\196\51\227\234\34\239","\34\129\168\82\154\143\80\156")).LocalPlayer.Idled:Connect(function() local v117=0 -0 ;while true do if (v117==(1784 -(214 + 1570))) then game:GetService(v7("\179\187\33\31\93\79\133\176\161\54\25","\233\229\210\83\107\40\46")):CaptureController();game:GetService(v7("\247\75\32\194\16\192\78\7\197\0\211","\101\161\34\82\182")):ClickButton2(Vector2.new());break;end end end);
