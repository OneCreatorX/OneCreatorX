--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.3) ~  Much Love, Ferib 

]]--

local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v95,v96) local v97={};for v108=1, #v95 do v6(v97,v0(v4(v1(v2(v95,v108,v108 + 1 )),v1(v2(v96,1 + (v108% #v96) ,1 + (v108% #v96) + 1 )))%256 ));end return v5(v97);end local v8=game:GetService(v7("\225\207\218\60\227\169\212","\126\177\163\187\69\134\219\167"));local v9=v8.LocalPlayer;local v10=v9:WaitForChild(v7("\19\193\43\220\249\49\234\63\204","\156\67\173\74\165"));local v11;local v12=game:GetService(v7("\7\163\72\4\168\35\84\19\162\64","\38\84\215\41\118\220\70"));v12:SetCore(v7("\99\19\44\22\208\95\2\43\20\247\83\23\54\27\241\94","\158\48\118\66\114"),{[v7("\159\45\4\58\118","\155\203\68\112\86\19\197")]=v7("\127\233\108\211\78\125\198\234\67\220\34\243\82\64","\152\38\189\86\156\32\24\133"),[v7("\200\82\191\82","\38\156\55\199")]=v7("\152\111\115\43\22\112\255\3\171\114\114\104\3\102\255\64\169\104\127\33\28\122\186\64\167\115\60\36\18\103\186\78\167\115\121\44\18\103\186\123\140","\35\200\29\28\72\115\20\154"),[v7("\61\170\195\222\153\37\59\23","\84\121\223\177\191\237\76")]=3 + 7 });v12:SetCore(v7("\136\83\199\164\20\95\36\200\189\95\202\161\46\89\63\207","\161\219\54\169\192\90\48\80"),{[v7("\125\75\20\41\76","\69\41\34\96")]=v7("\133\247\141\37\12\46\159\209\210\11\22\36\174\251","\75\220\163\183\106\98"),[v7("\54\191\147\35","\185\98\218\235\87")]=v7("\233\57\103\229\223\184\206\58\50\234\158\189\194\40\47\166\221\165\194\50\52","\202\171\92\71\134\190"),[v7("\13\212\62\137\61\200\35\134","\232\73\161\76")]=10});for v98,v99 in ipairs(v10:GetChildren()) do if (v99:IsA(v7("\136\218\80\88\27\181\254\87\84","\126\219\185\34\61")) and  not v99.ResetOnSpawn and v99.Enabled) then v11=v99;break;end end if  not v11 then local v109=964 -(683 + 281) ;while true do if ((1 + 0)==v109) then v11.Enabled=true;v11.Parent=v10;break;end if (v109==0) then v11=Instance.new(v7("\63\205\76\119\123\121\212\242\5","\135\108\174\62\18\30\23\147"));v11.ResetOnSpawn=false;v109=1 + 0 ;end end end local v13=Instance.new(v7("\144\251\43\198\29","\167\214\137\74\171\120\206\83"));v13.Name=v7("\168\255\60\73\234\168\135\214\32\92\245\162","\199\235\144\82\61\152");v13.Size=UDim2.new(0,658 -408 ,0,333 -203 );v13.Position=UDim2.new(1551.5 -(1126 + 425) , -(530 -(118 + 287)),0.3 -0 , -(1181 -(118 + 1003)));v13.BackgroundColor3=Color3.fromRGB(40,20,29 -19 );v13.BorderSizePixel=378 -(142 + 235) ;v13.Style=Enum.FrameStyle.DropShadow;v13.Parent=v11;v13.Active=true;v13.Draggable=true;local v24=Instance.new(v7("\51\19\161\63\43\23\187\46\11","\75\103\118\217"));v24.Name=v7("\243\93\100\24\188","\126\167\52\16\116\217");v24.Text=v7("\241\26\122\160\155\23\249\235\60\37\129\160\22\238\240","\156\168\78\64\224\212\121");v24.Size=UDim2.new(4 -3 ,0 + 0 ,977 -(553 + 424) ,30);v24.Position=UDim2.new(0 -0 ,0 + 0 ,0,0);v24.BackgroundColor3=Color3.fromRGB(30,30 + 0 ,18 + 12 );v24.TextColor3=Color3.fromRGB(255,255,109 + 146 );v24.Font=Enum.Font.GothamBold;v24.TextSize=12 + 8 ;v24.Parent=v13;local v35=Instance.new(v7("\51\235\189\218\37\251\177\218\8\224","\174\103\142\197"));v35.Name=v7("\117\39\81\44\55\81\244\116\61\75\44\42\80","\152\54\72\63\88\69\62");v35.Text=v7("\245\209\250\83\148\230\251\85\216\192\180\28\251\226\200","\60\180\164\142");v35.Style=Enum.ButtonStyle.RobloxButtonDefault;v35.Size=UDim2.new(0,476 -256 ,0 -0 ,44 -24 );v35.BackgroundColor3=Color3.fromRGB(44 + 106 ,30,30);v35.Position=UDim2.new(0.46, -(483 -383),753.5 -(239 + 514) , -(8 + 12));v35.Font=Enum.Font.ArialBold;v35.TextSize=16;v35.TextColor3=Color3.fromRGB(1584 -(797 + 532) ,186 + 69 ,87 + 168 );v35.Parent=v13;local v48=Instance.new(v7("\108\91\29\61\5\248\6\76\81\11","\114\56\62\101\73\71\141"));v48.Name=v7("\155\230\213\208\170\230\215\230\173\253\207\203\182","\164\216\137\187");v48.Text=v7("\243\243\37\189\230\221\3\215\245\37\161\252\190\36\244\192","\107\178\134\81\210\198\158");v48.Size=UDim2.new(0 -0 ,1422 -(373 + 829) ,0,751 -(476 + 255) );v48.Style=Enum.ButtonStyle.RobloxButtonDefault;v48.BackgroundColor3=Color3.fromRGB(1280 -(369 + 761) ,18 + 12 ,54 -24 );v48.Position=UDim2.new(0.46 -0 , -100,238.5 -(64 + 174) ,0);v48.Font=Enum.Font.ArialBold;v48.TextSize=16;v48.TextColor3=Color3.fromRGB(37 + 218 ,255,377 -122 );v48.Parent=v13;local v59=Instance.new(v7("\12\11\154\210\136\45\26\150\201\164","\202\88\110\226\166"));v59.Name=v7("\224\0\140\227\216\204\3\160\226\222\215\0\140","\170\163\111\226\151");v59.Text=v7("\90\97\226\104\30","\73\113\80\210\88\46\87");v59.Size=UDim2.new(0,446 -(144 + 192) ,216 -(42 + 174) ,16 + 4 );v59.Style=Enum.ButtonStyle.RobloxButtonDefault;v59.BackgroundColor3=Color3.fromRGB(125 + 25 ,13 + 17 ,1534 -(363 + 1141) );v59.Position=UDim2.new(1580.46 -(1183 + 397) , -(304 -204),0.5 + 0 ,20);v59.Font=Enum.Font.ArialBold;v59.TextSize=16;v59.TextColor3=Color3.fromRGB(191 + 64 ,255,255);v59.Parent=v13;local v70=Instance.new(v7("\181\41\213\6\197\148\56\217\29\233","\135\225\76\173\114"));v70.Name=v7("\57\226\182\164\190\178\171\56\248\172\164\163\179","\199\122\141\216\208\204\221");v70.Text=v7("\224\140\64\160\40","\150\205\189\112\144\24");v70.Style=Enum.ButtonStyle.RobloxButtonDefault;v70.Size=UDim2.new(1975 -(1913 + 62) ,70 + 40 ,0 -0 ,20);v70.BackgroundColor3=Color3.fromRGB(150,30,1963 -(565 + 1368) );v70.Position=UDim2.new(0.93 -0 , -(1761 -(1477 + 184)),0.5 -0 ,19 + 1 );v70.Font=Enum.Font.ArialBold;v70.TextSize=16;v70.TextColor3=Color3.fromRGB(255,1111 -(564 + 292) ,439 -184 );v70.Parent=v13;local v81=false;local v82=false;local function v83() while v81 do local v110=0;local v111;local v112;local v113;local v114;local v115;local v116;local v117;local v118;local v119;local v120;local v121;local v122;local v123;local v124;local v125;local v126;while true do if (v110==(11 -7)) then while true do if (v111==(306 -(244 + 60))) then v120={};for v146,v147 in ipairs(v119:GetChildren()) do table.insert(v120,v147.Name);end v121=workspace:WaitForChild(v7("\202\196\195\57","\93\134\165\173")):WaitForChild(v114):WaitForChild(v7("\156\243\210\199\42\194\179\106\187","\30\222\146\161\162\90\174\210"));v122=v121:GetChildren();v111=3 + 0 ;end if (v111==0) then v112=game:GetService(v7("\21\136\190\85\1\154\2","\112\69\228\223\44\100\232\113"));v113=v112.LocalPlayer;v114=v113.Name;v115=v113:WaitForChild(v7("\228\19\6\202\179\110\161\193\22","\230\180\127\103\179\214\28"));v111=477 -(41 + 435) ;end if (3==v111) then local v143=1001 -(938 + 63) ;while true do if ((1 + 0)==v143) then v125={[1]={[1126 -(936 + 189) ]=v7("\213\66\113\9\224","\106\133\46\16"),[1 + 1 ]=v123,[3]=Enum.NormalId.Top,[4]=v124}};game:GetService(v7("\106\37\99\240\83\67\89\52\118\248\105\84\87\50\114\251\95","\32\56\64\19\156\58")):WaitForChild(v7("\104\205\232\89\78\247","\224\58\168\133\54\58\146")):WaitForChild(v7("\88\82\79","\107\57\54\43\157\21\230\231")):FireServer(unpack(v125));v143=2;end if (v143==(1615 -(1565 + 48))) then v111=3 + 1 ;break;end if (v143==0) then v123=v122[math.random(1139 -(782 + 356) , #v122)];v124=v120[math.random(268 -(176 + 91) , #v120)];v143=2 -1 ;end end end if (v111==(1 -0)) then local v144=1092 -(975 + 117) ;while true do if (0==v144) then v116=v115:WaitForChild(v7("\161\4\75\67\246\72\225\128\0\76","\128\236\101\63\38\132\33"));v117=v116:WaitForChild(v7("\129\168\24\74","\175\204\201\113\36\214\139"));v144=1876 -(157 + 1718) ;end if (v144==1) then v118=v117:WaitForChild(v7("\110\216\48\209\23","\100\39\172\85\188"));v119=v118:WaitForChild(v7("\129\113\170\148","\83\205\24\217\224"));v144=2 + 0 ;end if ((6 -4)==v144) then v111=2;break;end end end if (v111==4) then v126=workspace:WaitForChild(v7("\247\138\31\241","\175\187\235\113\149\217\188")):WaitForChild(v114):FindFirstChild(v7("\30\186\136\64\231\106","\24\92\207\225\44\131\25"));if v126 then local v148=v126:GetChildren();if ( #v148>(0 -0)) then local v153=1018 -(697 + 321) ;local v154;local v155;local v156;local v157;while true do if (v153==(0 -0)) then v154=0;v155=nil;v153=1 -0 ;end if (v153==(4 -2)) then while true do if (v154==0) then local v161=0 + 0 ;while true do if (v161==(0 -0)) then local v162=0;while true do if (v162==(2 -1)) then v161=1;break;end if (v162==0) then v155=v148[math.random(1, #v148)];v156=v120[math.random(1, #v120)];v162=1228 -(322 + 905) ;end end end if (v161==(612 -(602 + 9))) then v154=1190 -(449 + 740) ;break;end end end if ((873 -(826 + 46))==v154) then v157={[948 -(245 + 702) ]={[3 -2 ]=v7("\123\223\185\79\30","\29\43\179\216\44\123"),[2]=v155,[1 + 2 ]=Enum.NormalId.Top,[4]=v156}};game:GetService(v7("\143\220\48\64\180\218\33\88\184\221\19\88\178\203\33\75\184","\44\221\185\64")):WaitForChild(v7("\51\226\69\80\103\4","\19\97\135\40\63")):WaitForChild(v7("\175\88\55","\81\206\60\83\91\79")):FireServer(unpack(v157));break;end end break;end if (v153==(1899 -(260 + 1638))) then v156=nil;v157=nil;v153=442 -(382 + 58) ;end end end end wait(0.1 -0 );break;end end break;end if (v110==(1 + 0)) then v115=nil;v116=nil;v117=nil;v118=nil;v110=2;end if (v110==(3 -1)) then v119=nil;v120=nil;v121=nil;v122=nil;v110=8 -5 ;end if (3==v110) then v123=nil;v124=nil;v125=nil;v126=nil;v110=1209 -(902 + 303) ;end if (v110==(0 -0)) then v111=0 -0 ;v112=nil;v113=nil;v114=nil;v110=1;end end end end local function v84() while v82 do local v127={v7("\105\164\220\118\111\224\69\161\93\191","\196\46\203\176\18\79\163\45"),v7("\156\43\127\19\43\245\235\248\1\118\27\55\239","\143\216\66\30\126\68\155"),v7("\153\193\1\221\192\177\151\194\162\205\30\223","\129\202\168\109\171\165\195\183")};for v133,v134 in ipairs(v127) do local v135={[1]=v8.LocalPlayer,[685 -(483 + 200) ]=v134,[3]=v134};game:GetService(v7("\16\93\39\212\215\23\231\54\93\51\235\202\27\244\35\95\50","\134\66\56\87\184\190\116")):WaitForChild(v7("\23\52\16\153\16\229\37","\85\92\81\105\219\121\139\65")):InvokeServer(unpack(v135));local v135={[1]=v8.LocalPlayer,[1465 -(1404 + 59) ]=v7("\217\186\81\72\115\209\249\243\115\77\121\204\233","\191\157\211\48\37\28"),[3]=v7("\251\22\245\17\53\209\27\180\63\50\218\12\224","\90\191\127\148\124")};game:GetService(v7("\74\130\62\27\113\132\47\3\125\131\29\3\119\149\47\16\125","\119\24\231\78")):WaitForChild(v7("\169\40\188\104\213\78\21","\113\226\77\197\42\188\32")):InvokeServer(unpack(v135));local v135={[1]=v8.LocalPlayer,[5 -3 ]=v134,[3 -0 ]=v134};game:GetService(v7("\8\19\228\185\51\21\245\161\63\18\199\161\53\4\245\178\63","\213\90\118\148")):WaitForChild(v7("\112\43\173\116\68\85\42","\45\59\78\212\54")):InvokeServer(unpack(v135));end wait(765.1 -(468 + 297) );end end v48.MouseButton1Click:Connect(function() v82= not v82;v48.Text=(v82 and v7("\49\67\151\132\198\13\165\245\3\66\144\209\198\1\131","\144\112\54\227\235\230\78\205")) or v7("\146\61\27\243\144\120\187\45\28\232\195\1\243\7\41\218","\59\211\72\111\156\176") ;if v82 then v84();end end);local function v85() while isLoopi do local v128=562 -(334 + 228) ;local v129;local v130;local v131;local v132;while true do if ((0 -0)==v128) then v129=game:GetService(v7("\121\136\241\38\93\151\226\46\75","\77\46\231\131"));v130=game:GetService(v7("\138\88\183\89\191\70\165","\32\218\52\214"));v128=2 -1 ;end if (v128==(2 -0)) then for v139,v140 in ipairs(v132:GetChildren()) do if (v140:IsA(v7("\95\78\115\128\242","\235\18\33\23\229\158")) and (v140.Name==v7("\116\175\206\251\115\181\200\181","\219\48\218\161"))) then local v145=v140.PrimaryPart;if v145 then local v149=0;local v150;while true do if (v149==0) then v145.Transparency=0.5;v150=v130.LocalPlayer.Character:FindFirstChild(v7("\204\100\113\72\213\64\233\224\67\115\70\207\127\225\246\101","\128\132\17\28\41\187\47"));v149=1 + 0 ;end if (v149==(237 -(141 + 95))) then if v150 then local v159=0 + 0 ;local v160;while true do if (v159==(0 -0)) then v160=0 -0 ;while true do if (v160==0) then v140:SetPrimaryPartCFrame(v150.CFrame);task.wait(0.1 + 0 );break;end end break;end end end break;end end end end end break;end if (v128==1) then v131=v129:WaitForChild(v7("\109\24\56\166\226","\58\46\119\81\200\145\208\37"));v132=v131:WaitForChild(v7("\40\131\57\162\186","\86\75\236\80\204\201\221"));v128=5 -3 ;end end end end v59.MouseButton1Click:Connect(function() game.ReplicatedStorage.Remote.treasureChestCollection:FireServer(703 + 297 );end);v70.MouseButton1Click:Connect(function() game.ReplicatedStorage.Remote.treasureChestCollection:FireServer( -(521 + 479));end);v35.MouseButton1Click:Connect(function() v81= not v81;v35.Text=(v81 and v7("\32\39\18\53\29\35\39\15\54\89\91\114\41\20","\61\97\82\102\90")) or v7("\141\59\191\68\135\117\11\0\160\42\241\11\232\113\56","\105\204\78\203\43\167\55\126") ;if v81 then v83();end end);local v86=Instance.new(v7("\135\163\45\26\18\6\203\84\128\188\38\16\7","\49\197\202\67\126\115\100\167"));v86.Name=v7("\28\82\211\37\133\68\77\20\83\222\39\135\83\90","\62\87\59\191\73\224\54");v86.Parent=workspace.Killers;local function v90(v102) v86:Fire(v102.Name,true);end local function v91(v103) v86:Fire(v103.Name,false);end workspace.Killers.ChildAdded:Connect(v90);workspace.Killers.ChildRemoved:Connect(v91);local v9=game.Players.LocalPlayer;local v92=v9.Character or v9.CharacterAdded:Wait() ;local v93=v92:WaitForChild(v7("\207\23\247\200\233\13\243\205\213\13\245\221\215\3\232\221","\169\135\98\154"));local v94=v93.Position;v86.Event:Connect(function(v104,v105) local v106=game.Players.LocalPlayer;local v107=v106.Character;if  not v107 then return;end if v105 then v107:SetPrimaryPartCFrame(CFrame.new( -(204 -59),150, -(41 + 27)));else v107:SetPrimaryPartCFrame(CFrame.new(v94));end end);game:GetService(v7("\251\123\37\77\248\33\219","\168\171\23\68\52\157\83")).LocalPlayer.Idled:Connect(function() game:GetService(v7("\194\120\231\185\48\44\139\193\98\240\191","\231\148\17\149\205\69\77")):CaptureController();game:GetService(v7("\182\174\213\239\66\254\140\146\212\254\69","\159\224\199\167\155\55")):ClickButton2(Vector2.new());end);
