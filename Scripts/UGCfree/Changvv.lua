--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.3) ~  Much Love, Ferib 

]]--

local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v75,v76) local v77={};for v85=1, #v75 do v6(v77,v0(v4(v1(v2(v75,v85,v85 + 1 )),v1(v2(v76,1 + (v85% #v76) ,1 + (v85% #v76) + 1 )))%256 ));end return v5(v77);end local v8=game:GetService(v7("\225\207\218\60\227\169\212","\126\177\163\187\69\134\219\167"));local v9=v8.LocalPlayer;local v10=v9:WaitForChild(v7("\19\193\43\220\249\49\234\63\204","\156\67\173\74\165"));local v11=Instance.new(v7("\7\180\91\19\185\40\97\33\190","\38\84\215\41\118\220\70"));v11.ResetOnSpawn=false;v11.Enabled=true;v11.Parent=v10;local v15=Instance.new(v7("\118\4\35\31\251","\158\48\118\66\114"));v15.Name=v7("\136\43\30\34\97\170\247\141\54\17\59\118","\155\203\68\112\86\19\197");v15.Size=UDim2.new(0 + 0 ,250,0 -0 ,1701 -(1126 + 425) );v15.Position=UDim2.new(405.5 -(118 + 287) , -125,0.3 -0 , -60);v15.BackgroundColor3=Color3.fromRGB(1161 -(118 + 1003) ,20,29 -19 );v15.BorderSizePixel=378 -(142 + 235) ;v15.Style=Enum.FrameStyle.DropShadow;v15.Parent=v11;v15.Active=true;v15.Draggable=true;local v26=Instance.new(v7("\114\216\46\232\108\121\231\253\74","\152\38\189\86\156\32\24\133"));v26.Name=v7("\200\94\179\74\249","\38\156\55\199");v26.Text=v7("\145\73\38\8\60\122\255\96\186\120\125\60\28\102\194","\35\200\29\28\72\115\20\154");v26.Size=UDim2.new(4 -3 ,0 + 0 ,977 -(553 + 424) ,56 -26 );v26.Position=UDim2.new(0,0 + 0 ,0 + 0 ,0 + 0 );v26.BackgroundColor3=Color3.fromRGB(13 + 17 ,18 + 12 ,65 -35 );v26.TextColor3=Color3.fromRGB(710 -455 ,255,570 -315 );v26.Font=Enum.Font.GothamBold;v26.TextSize=6 + 14 ;v26.Parent=v15;local v37=Instance.new(v7("\45\186\201\203\175\57\32\13\176\223","\84\121\223\177\191\237\76"));v37.Name=v7("\152\89\199\180\40\95\60\227\174\66\221\175\52","\161\219\54\169\192\90\48\80");v37.Text=v7("\96\76\6\101\122\71\5\33\90\24\64\10\111\100","\69\41\34\96");v37.Style=Enum.ButtonStyle.RobloxButtonDefault;v37.Size=UDim2.new(0 -0 ,973 -(239 + 514) ,0 + 0 ,20);v37.BackgroundColor3=Color3.fromRGB(150,1359 -(797 + 532) ,22 + 8 );v37.Position=UDim2.new(0.46 + 0 , -(235 -135),0.5, -20);v37.Font=Enum.Font.ArialBold;v37.TextSize=1218 -(373 + 829) ;v37.TextColor3=Color3.fromRGB(255,986 -(476 + 255) ,255);v37.Parent=v15;local v50=v37:Clone();v50.Name=v7("\159\204\217\30\16\36\176\225\194\30\22\36\178","\75\220\163\183\106\98");v50.Text=v7("\35\175\159\56\153\32\175\146\119\233\14\187\133\35\202\74\181\155\35\208\13\180\138\59\144\88\250\164\17\255","\185\98\218\235\87");v50.Position=UDim2.new(1130.46 -(369 + 761) , -(58 + 42),0.5 -0 ,0 -0 );v50.Parent=v15;local v55=v37:Clone();v55.Name=v7("\232\51\41\242\204\165\199\30\50\242\202\165\197","\202\171\92\71\134\190");v55.Text=v7("\8\212\56\135\105\230\45\154\45\196\34\155\105\231\57\132\37\129\10\137\58\213\118\200\6\231\10","\232\73\161\76");v55.Position=UDim2.new(0.46, -(338 -(64 + 174)),0.5,3 + 17 );v55.Parent=v15;local v60=v37:Clone();v60.Name=v7("\152\214\76\73\12\180\213\96\72\10\175\214\76","\126\219\185\34\61");v60.Text=v7("\45\219\74\125\62\84\255\230\5\195\30\64\123\96\242\245\8\221\4\50\81\81\213","\135\108\174\62\18\30\23\147");v60.Position=UDim2.new(0.46 -0 , -(436 -(144 + 192)),216.5 -(42 + 174) ,31 + 9 );v60.Parent=v15;local v65=false;local v66=false;local v67=false;local v68=false;local function v69() while v65 do local v86=0;local v87;while true do if ((0 + 0)==v86) then v87=0 + 0 ;while true do if (v87==0) then game.ReplicatedStorage.Quests.RemoteEventQuestFinished:FireServer(1654 -(363 + 1141) );wait();break;end end break;end end end end local v70=false;local function v71() while v66 do local v88=1580 -(1183 + 397) ;local v89;local v90;while true do if (v88==0) then v89,v90=pcall(function() local v110=0 -0 ;local v111;local v112;local v113;while true do if ((1 + 0)==v110) then v113=nil;while true do if (v111==(1 + 0)) then if v113 then for v128,v129 in ipairs(v113:GetChildren()) do local v130=1975 -(1913 + 62) ;local v131;while true do if (v130==0) then v131={v129.Name,1};v112.Common.Upgrade:FireServer(unpack(v131));v130=1934 -(565 + 1368) ;end if (v130==(3 -2)) then wait(0.1);break;end end end else end break;end if ((1661 -(1477 + 184))==v111) then v112=game:GetService(v7("\132\236\58\199\17\173\50\211\179\237\25\223\23\188\50\192\179","\167\214\137\74\171\120\206\83"));v113=v112:FindFirstChild(v7("\187\252\51\83\236\180","\199\235\144\82\61\152"));v111=1;end end break;end if (0==v110) then v111=0 -0 ;v112=nil;v110=1 + 0 ;end end end);if  not v89 then end break;end end end end v50.MouseButton1Click:Connect(function() local v78=856 -(564 + 292) ;while true do if (v78==1) then if v66 then v71();end break;end if (v78==(0 -0)) then local v99=0;while true do if (v99==(0 -0)) then v66= not v66;v50.Text=(v66 and v7("\38\3\173\36\71\52\172\50\71\38\181\42\9\2\170\99\8\6\173\34\8\24\184\39\78\76\249\4\41","\75\103\118\217")) or v7("\230\65\100\27\249\60\210\77\48\36\181\31\201\64\99\92\182\14\211\93\127\26\184\18\142\14\48\59\159\56","\126\167\52\16\116\217") ;v99=305 -(244 + 60) ;end if (v99==(1 + 0)) then v78=477 -(41 + 435) ;break;end end end end end);v37.MouseButton1Click:Connect(function() local v79=1001 -(938 + 63) ;while true do if (v79==1) then if v65 then v69();end break;end if (v79==(0 + 0)) then v65= not v65;v37.Text=(v65 and v7("\225\32\38\192\135\28\249\204\61\122\192\155\55","\156\168\78\64\224\212\121")) or v7("\46\224\163\142\52\235\160\202\20\180\229\225\33\200","\174\103\142\197") ;v79=1126 -(936 + 189) ;end end end);local function v72() local v80=0 + 0 ;while true do if (0==v80) then v50.Text=(v66 and v7("\119\61\75\55\101\124\237\79\101\106\60\53\30\200\90\41\81\44\54\4\184\121\6","\152\54\72\63\88\69\62")) or v7("\245\209\250\83\148\230\251\69\153\241\234\76\148\244\226\93\218\208\253\6\148\235\200\122","\60\180\164\142") ;task.wait(5);v80=1;end if (v80==(1614 -(1565 + 48))) then game:GetService(v7("\106\91\21\37\46\238\19\76\91\1\26\51\226\0\89\89\0","\114\56\62\101\73\71\141")):WaitForChild(v7("\136\229\218\202\172","\164\216\137\187")):WaitForChild(v7("\247\240\52\188\178\237","\107\178\134\81\210\198\158")):WaitForChild(v7("\10\11\143\201\190\61\43\148\195\164\44\61\138\201\189\12\23\129\201\165\54\45\141\203\186\52\11\150\195\174\13\39","\202\88\110\226\166")):FireServer();v70=false;v80=2 + 0 ;end if (v80==(1140 -(782 + 356))) then v55.Text=(v67 and v7("\226\26\150\248\138\228\14\144\243\207\205\28\194\209\223\207\3\194\209\203\208\27\216\183\229\237","\170\163\111\226\151")) or v7("\48\37\166\55\14\16\40\3\52\183\54\93\119\15\4\60\190\120\104\54\58\5\106\242\23\104\17","\73\113\80\210\88\46\87") ;break;end end end local function v73() local v81=267 -(176 + 91) ;local v82;while true do if (v81==(7 -4)) then v72();break;end if (v81==1) then v82={{v7("\172\45\223\1\239\140\45\193\30\232\150\62\194\1\226","\135\225\76\173\114"),v7("\41\250\189\181\184\154\166\8\233\189\190","\199\122\141\216\208\204\221")},{v7("\158\210\5\226\107\247\189\209\25\254\127","\150\205\189\112\144\24"),v7("\22\139\170\94\35\137\3\20\32\138","\112\69\228\223\44\100\232\113")},{v7("\224\26\4\219\184\115\150\209\11\6\223","\230\180\127\103\179\214\28"),v7("\190\4\86\72\230\78\247\171\4\77\66\225\79","\128\236\101\63\38\132\33")},{v7("\159\185\30\75\189\242\220\188\187\30\81\162","\175\204\201\113\36\214\139"),v7("\125\195\56\222\13\66\235\52\206\0\66\194","\100\39\172\85\188")},{v7("\136\117\187\133\33\175\116\182\143\62","\83\205\24\217\224"),v7("\192\204\223\56\193\196\223\57\227\203","\93\134\165\173")},{v7("\156\254\192\216\63\222\160\119\189\254\196","\30\222\146\161\162\90\174\210"),v7("\193\75\99\15\247\90\87\11\247\74\117\4","\106\133\46\16")},{v7("\126\50\124\239\78\70\84\47\97\253","\32\56\64\19\156\58"),v7("\115\203\224\113\91\224\132\95\198","\224\58\168\133\54\58\146")},{v7("\109\83\72\245\123\137\151\14\77\87\71","\107\57\54\43\157\21\230\231"),v7("\248\146\19\240\171\251\206\201\143\20\251","\175\187\235\113\149\217\188")},{v7("\24\166\143\67\229\124\106\50","\24\92\207\225\44\131\25"),v7("\97\198\170\77\8\110\66\208\159\77\9\121\78\221","\29\43\179\216\44\123")},{v7("\152\212\37\94\188\213\36\90\180\215\37","\44\221\185\64"),v7("\43\242\70\88\127\4\192\73\77\119\4\233","\19\97\135\40\63")}};for v106,v107 in ipairs(v82) do local v108,v109=unpack(v107);for v114=0,42 + 88  do local v115=0;local v116;while true do if ((1899 -(260 + 1638))==v115) then task.wait();break;end if (v115==(440 -(382 + 58))) then v116={v108,v114,v109};game:GetService(v7("\156\89\35\55\38\50\175\72\54\63\28\37\161\78\50\60\42","\81\206\60\83\91\79")):WaitForChild(v7("\126\167\209\124\59","\196\46\203\176\18\79\163\45")):WaitForChild(v7("\157\52\123\16\48\232","\143\216\66\30\126\68\155")):WaitForChild(v7("\152\205\0\196\209\166\242\247\175\198\25\251\201\162\217\245\153\205\8\207","\129\202\168\109\171\165\195\183")):FireServer(unpack(v116));v115=1 -0 ;end end end end v81=5 -3 ;end if (v81==(1205 -(902 + 303))) then local v103=0 -0 ;while true do if (v103==(2 -1)) then v81=1;break;end if ((0 + 0)==v103) then if v70 then return;end v70=true;v103=1691 -(1121 + 569) ;end end end if (v81==2) then v66=false;v67= not v67;v81=3;end end end v55.MouseButton1Click:Connect(function() if  not v70 then local v93=0;while true do if (v93==0) then local v117=214 -(22 + 192) ;while true do if ((683 -(483 + 200))==v117) then v67= not v67;v55.Text=(v67 and v7("\3\77\35\215\158\51\231\48\92\50\214\205\84\192\55\84\59\152\248\21\245\54\2\119\247\240","\134\66\56\87\184\190\116")) or v7("\29\36\29\180\89\204\32\39\56\52\7\168\89\205\52\57\48\113\47\186\10\255\123\117\19\23\47","\85\92\81\105\219\121\139\65") ;v117=1464 -(1404 + 59) ;end if (v117==(2 -1)) then v93=1 -0 ;break;end end end if (v93==(766 -(468 + 297))) then v73();break;end end else local v94=562 -(334 + 228) ;local v95;while true do if (v94==(0 -0)) then v95=0 -0 ;while true do if (v95==(1 -0)) then v55.Text=(v67 and v7("\254\10\224\19\122\248\30\230\24\63\209\12\180\58\47\211\19\180\58\59\204\11\174\92\21\241","\90\191\127\148\124")) or v7("\89\146\58\24\56\160\47\5\124\130\32\4\56\161\59\27\116\199\8\22\107\147\116\87\87\161\8","\119\24\231\78") ;break;end if (v95==(0 + 0)) then v55.Text=v7("\220\166\68\74\60\248\252\161\84\64\114\204\189\186\94\5\110\202\243\189\89\75\123\147\189\164\81\76\104","\191\157\211\48\37\28");task.wait(241 -(141 + 95) );v95=1 + 0 ;end end break;end end end end);local function v74() while v68 do local v91,v92=pcall(function() local v96=0 -0 ;local v97;local v98;while true do if (v96==(2 -1)) then if v98 then local v120=0 + 0 ;local v121;local v122;local v123;while true do if (v120==(2 -1)) then v123=nil;while true do if (v121==0) then v122=0;v123=nil;v121=1;end if (v121==(1 + 0)) then while true do if (v122==(0 + 0)) then v123=v98:FindFirstChild(v7("\126\56\177\88\89\72","\45\59\78\212\54"));if v123 then local v132=0 -0 ;local v133;local v134;while true do if ((0 + 0)==v132) then v133=0;v134=nil;v132=164 -(92 + 71) ;end if (v132==(1 + 0)) then while true do if (v133==0) then v134=v123:FindFirstChild(v7("\34\83\135\142\131\35\159\245\7\87\145\143","\144\112\54\227\235\230\78\205"));if v134 then v134:InvokeServer();else end break;end end break;end end else end break;end end break;end end break;end if (v120==(0 -0)) then v121=765 -(574 + 191) ;v122=nil;v120=1 + 0 ;end end else end break;end if (v96==(0 -0)) then local v118=0 + 0 ;while true do if (v118==1) then v96=1;break;end if (v118==(849 -(254 + 595))) then v97=game:GetService(v7("\176\40\181\70\213\67\16\150\40\161\121\200\79\3\131\42\160","\113\226\77\197\42\188\32"));v98=v97:FindFirstChild(v7("\15\49\215\135\63\18\241\184\42\2\253\186\52","\213\90\118\148"));v118=127 -(55 + 71) ;end end end end end);if  not v91 then end end end v60.MouseButton1Click:Connect(function() local v83=0;while true do if (v83==1) then if v68 then v74();end break;end if ((0 -0)==v83) then local v104=0;local v105;while true do if (v104==(1790 -(573 + 1217))) then v105=0;while true do if (v105==(0 -0)) then v68= not v68;v60.Text=(v68 and v7("\146\61\27\243\144\120\191\41\6\241\144\105\182\63\14\238\212\72\233\104\32\210","\59\211\72\111\156\176")) or v7("\111\146\247\34\14\164\239\44\71\138\163\31\75\144\226\63\74\148\185\109\97\161\197","\77\46\231\131") ;v105=1 + 0 ;end if (v105==(1 -0)) then v83=940 -(714 + 225) ;break;end end break;end end end end end);game:GetService(v7("\138\88\183\89\191\70\165","\32\218\52\214")).LocalPlayer.Idled:Connect(function() local v84=0 -0 ;while true do if (v84==(0 -0)) then game:GetService(v7("\120\30\35\188\228\177\73\111\93\18\35","\58\46\119\81\200\145\208\37")):CaptureController();game:GetService(v7("\29\133\34\184\188\188\58\30\159\53\190","\86\75\236\80\204\201\221")):ClickButton2(Vector2.new());break;end end end);
