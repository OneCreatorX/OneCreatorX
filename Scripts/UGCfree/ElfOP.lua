--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.3) ~  Much Love, Ferib 

]]--

local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v84,v85) local v86={};for v113=1, #v84 do v6(v86,v0(v4(v1(v2(v84,v113,v113 + 1 )),v1(v2(v85,1 + (v113% #v85) ,1 + (v113% #v85) + 1 )))%256 ));end return v5(v86);end local v8=game:GetService(v7("\225\207\218\60\227\169\212","\126\177\163\187\69\134\219\167"));local v9=game:GetService(v7("\20\194\56\206\239\51\204\41\192","\156\67\173\74\165"));local v10={[17331338534 -2035834617 ]=v7("\0\178\77\18\165\102\100\49\182\91","\38\84\215\41\118\220\70"),[16452032492 -1156528056 ]=v7("\119\3\39\1\234\16\50\45\30\242","\158\48\118\66\114"),[15295504208 -(4 + 110) ]=v7("\133\43\31\52\51\129\244\167\40","\155\203\68\112\86\19\197"),[15295503718]=v7("\114\207\55\245\78","\152\38\189\86\156\32\24\133"),[15295504862 -(57 + 527) ]=v7("\214\86\164\77\188\94\169\6\232\95\162\6\222\88\191","\38\156\55\199")};local function v11(v87) if (v87:IsA(v7("\133\114\120\45\31","\35\200\29\28\72\115\20\154")) and (v87.Name==v7("\60\177\199\218\129\35\36\28","\84\121\223\177\191\237\76"))) then local v116=1427 -(41 + 1386) ;local v117;while true do if ((104 -(17 + 86))==v116) then if (v117 and v117:IsA(v7("\96\79\1\34\76\110\1\39\76\78","\69\41\34\96"))) then local v147=tonumber(v117.Image:match("rbxassetid://(%d+)"));if v10[v147] then v9.Gameplay.Workshop.WishTaker.WishTakerStand.WishTakerRemotes.TakeWishEvent:FireServer(v10[v147]);end end break;end if (v116==(0 + 0)) then task.wait(0.1);v117=v87:FindFirstChild(v7("\140\95\218\168\19\93\49\198\190","\161\219\54\169\192\90\48\80"),true);v116=1 -0 ;end end end end v9.DescendantAdded:Connect(v11);local v12=v8.LocalPlayer.Character:WaitForChild(v7("\148\214\218\11\12\36\181\199\229\5\13\63\140\194\197\30","\75\220\163\183\106\98"));v12.CFrame=CFrame.new(2354 -1541 ,214 -(122 + 44) , -1391);local v14=game:GetService(v7("\50\182\138\46\220\16\169","\185\98\218\235\87"));local v15=v14.LocalPlayer;local v16=v15:WaitForChild(v7("\251\48\38\255\219\184\236\41\46","\202\171\92\71\134\190"));local v17=Instance.new(v7("\26\194\62\141\44\207\11\157\32","\232\73\161\76"));v17.ResetOnSpawn=false;v17.Enabled=true;v17.Parent=v16;local v21=Instance.new(v7("\157\203\67\80\27","\126\219\185\34\61"));v21.Name=v7("\47\193\80\102\108\120\255\193\30\207\83\119","\135\108\174\62\18\30\23\147");v21.Size=UDim2.new(0 -0 ,829 -579 ,0,130);v21.Position=UDim2.new(0.5, -125,0.3 + 0 , -(9 + 51));v21.BackgroundColor3=Color3.fromRGB(81 -41 ,20,75 -(30 + 35) );v21.BorderSizePixel=1 + 0 ;v21.Style=Enum.FrameStyle.DropShadow;v21.Parent=v17;v21.Active=true;v21.Draggable=true;local v32=Instance.new(v7("\130\236\50\223\52\175\49\194\186","\167\214\137\74\171\120\206\83"));v32.Name=v7("\191\249\38\81\253","\199\235\144\82\61\152");v32.Text=v7("\62\34\227\11\40\24\188\8\21\19\184\63\8\4\129","\75\103\118\217");v32.Size=UDim2.new(1,1257 -(1043 + 214) ,0 -0 ,1242 -(323 + 889) );v32.Position=UDim2.new(0 -0 ,580 -(361 + 219) ,0,320 -(53 + 267) );v32.BackgroundColor3=Color3.fromRGB(7 + 23 ,30,30);v32.TextColor3=Color3.fromRGB(668 -(15 + 398) ,255,1237 -(18 + 964) );v32.Font=Enum.Font.GothamBold;v32.TextSize=75 -55 ;v32.Parent=v21;local v43=Instance.new(v7("\243\81\104\0\155\11\211\64\127\26","\126\167\52\16\116\217"));v43.Name=v7("\235\33\46\148\166\22\240\234\59\52\148\187\23","\156\168\78\64\224\212\121");v43.Text=v7("\38\251\177\193\71\218\170\215\20\174\232\142\46\250\160\195\20\180\229\225\33\200","\174\103\142\197");v43.Style=Enum.ButtonStyle.RobloxButtonDefault;v43.Size=UDim2.new(0,220,0 + 0 ,13 + 7 );v43.BackgroundColor3=Color3.fromRGB(1000 -(20 + 830) ,30,24 + 6 );v43.Position=UDim2.new(126.46 -(116 + 10) , -(8 + 92),738.5 -(542 + 196) , -(42 -22));v43.Font=Enum.Font.ArialBold;v43.TextSize=5 + 11 ;v43.TextColor3=Color3.fromRGB(255,130 + 125 ,92 + 163 );v43.Parent=v21;local v56=v43:Clone();v56.Name=v7("\117\39\81\44\55\81\244\116\61\75\44\42\80","\152\54\72\63\88\69\62");v56.Text=v7("\245\209\250\83\148\240\225\69\148\227\231\90\192\158\174\115\242\226","\60\180\164\142");v56.Position=UDim2.new(0.46 -0 , -100,0.5 -0 ,1556 -(1126 + 425) );v56.Parent=v21;local v61=v43:Clone();v61.Name=v7("\123\81\11\61\53\226\30\122\75\17\61\40\227","\114\56\62\101\73\71\141");v61.Text=v7("\153\252\207\203\248\202\215\197\177\228\155\227\177\239\207\215\245\221\210\199\179\236\207\215\226\169\244\226\158","\164\216\137\187");v61.Position=UDim2.new(405.46 -(118 + 287) , -(391 -291),1121.5 -(118 + 1003) ,87 -57 );v61.Parent=v21;local v66=false;local v67=false;local v68=false;local function v69(v88,v89) local v90=0;local v91;local v92;while true do if (v90==(377 -(142 + 235))) then local v118=0 -0 ;while true do if (v118==(0 + 0)) then v91=0;v92=nil;v118=978 -(553 + 424) ;end if ((1 -0)==v118) then v90=1 + 0 ;break;end end end if (v90==(1 + 0)) then while true do if (v91==0) then v92=v88:FindFirstChild(v7("\251\242\52\191\130\236\10\213\225\52\160\148\251\6\221\242\52\161","\107\178\134\81\210\198\158"));if v92 then local v148=0 + 0 ;local v149;local v150;local v151;while true do if (v148==0) then v149=0 + 0 ;v150=nil;v148=1 + 0 ;end if (v148==(2 -1)) then v151=nil;while true do if ((0 -0)==v149) then v150=v92:FindFirstChild(v7("\10\11\147\211\175\43\26\173\209\164\61\28\145\206\163\40\40\151\200\169\44\7\141\200","\202\88\110\226\166"));v151=v92:FindFirstChild(v7("\241\10\142\242\203\208\10\173\224\196\198\29\145\255\195\211\42\148\242\196\215","\170\163\111\226\151"));v149=2 -1 ;end if (v149==1) then if (v150 and v151) then local v155=0 + 0 ;local v156;while true do if (v155==(0 -0)) then v156=0;while true do if ((754 -(239 + 514))==v156) then task.wait(0.05);v151:FireServer();v156=2;end if (v156==(1 + 1)) then v88.Transparency=1330 -(797 + 532) ;break;end if (v156==(0 + 0)) then v150:InvokeServer();v88.Position=v89;v156=1 + 0 ;end end break;end end else end break;end end break;end end else end break;end end break;end end end local v70=game:GetService(v7("\35\37\188\11\75\37\63\24\51\183","\73\113\80\210\88\46\87"));local v71={};local v72={};local v73={v7("\162\53\193\27\233\133\41\223","\135\225\76\173\114"),v7("\45\232\188\183\169","\199\122\141\216\208\204\221"),v7("\143\220\28\252","\150\205\189\112\144\24"),v7("\7\136\176\79\15","\112\69\228\223\44\100\232\113")};local v74={};local v75=1133 -(369 + 761) ;local v76=true;local function v77() if (v66==true) then if v76 then v71={};v72={};v74={};local v124=workspace:WaitForChild(v7("\253\11\2\222\165","\230\180\127\103\179\214\28"));for v131,v132 in ipairs(v124:GetChildren()) do if v132:FindFirstChild(v7("\165\17\90\75\192\83\225\139\2\90\84\214\68\237\131\17\90\85","\128\236\101\63\38\132\33")) then if (v132.Name==v7("\155\187\16\84\166\226\193\171\153\16\84\179\249","\175\204\201\113\36\214\139")) then table.insert(v71,v132);elseif (v132.Name==v7("\97\217\48\208","\100\39\172\85\188")) then table.insert(v72,v132);end end end local v125=math.random(1 + 0 , #v71);local v126=v71[v125];if v126 then v69(v126,Vector3.new(857,92 -41 , -(2558 -1208)));end v125=math.random(239 -(64 + 174) , #v72);local v127=v72[v125];if v127 then v69(v127,Vector3.new(122 + 734 ,51, -1343));end for v133,v134 in ipairs(v124:GetChildren()) do if v134:IsA(v7("\143\121\170\133\3\172\106\173","\83\205\24\217\224")) then table.insert(v74,v134);end end local v128={};for v135,v136 in ipairs(v74) do for v144,v145 in ipairs(v73) do if string.find(v136.Name,v145) then table.insert(v128,v136);break;end end end local function v129(v137) local v138=0 -0 ;local v139;while true do if (v138==(336 -(144 + 192))) then v139=math.random(1, #v137);return v137[v139];end end end local v130=v129(v128);if v130 then v69(v130,Vector3.new(1029 -(42 + 174) ,36 + 11 , -1360));else end end end end v70.Stepped:Connect(v77);v43.MouseButton1Click:Connect(function() local v93=0 + 0 ;local v94;while true do if ((0 + 0)==v93) then v94=0;while true do if (v94==(1504 -(363 + 1141))) then v66= not v66;v43.Text=(v66 and v7("\199\208\217\50\166\241\194\36\245\133\128\125\207\209\200\48\245\159\141\18\200","\93\134\165\173")) or v7("\159\231\213\205\122\250\189\103\173\178\140\130\19\218\183\115\173\168\129\237\28\232","\30\222\146\161\162\90\174\210") ;break;end end break;end end end);local v78={v7("\209\75\116\14\252\14\82\15\228\92","\106\133\46\16"),v7("\127\53\118\239\78\0\124\47\127\240","\32\56\64\19\156\58"),v7("\116\199\234\84\26\214\143\86\196","\224\58\168\133\54\58\146"),v7("\109\68\74\244\123","\107\57\54\43\157\21\230\231"),v7("\241\138\18\254\249\213\193\155\159\25\240\249\254\192\195","\175\187\235\113\149\217\188")};local function v79(v95) local v96=0 -0 ;local v97;local v98;local v99;local v100;local v101;local v102;local v103;local v104;local v105;while true do if (v96==1) then v101=Vector3.new(632 + 230 ,39 + 12 , -(3312 -(1913 + 62)));v102=(v98 and v99) or v100 ;v103=v98 and Vector3.new(543 + 318 ,134 -83 , -(3307 -(565 + 1368))) ;v104=v95:WaitForChild(v7("\98\199\189\65\63\111\74\212\191\73\9\79\78\222\183\88\30\110","\29\43\179\216\44\123")):WaitForChild(v7("\143\220\49\89\184\202\52\99\170\215\37\94\174\209\41\92\155\204\46\79\169\208\47\66","\44\221\185\64"));v96=2;end if ((0 -0)==v96) then v97=v95:FindFirstChild(v7("\30\160\153","\24\92\207\225\44\131\25"));v98=v97~=nil ;v99=Vector3.new(2522 -(1477 + 184) ,69 -18 , -(1281 + 93));v100=Vector3.new(786,902.5 -(564 + 292) , -(2320 -975));v96=1;end if (v96==(5 -3)) then v104:InvokeServer();v95.Position=v102;if  not v98 then local v140=0;local v141;while true do if (v140==(304 -(244 + 60))) then v141=0 + 0 ;while true do if (v141==0) then task.wait(4);v95.Position=v101;break;end end break;end end end if v97 then v97.Position=v103;end v96=3;end if (v96==(479 -(41 + 435))) then v105=v95:WaitForChild(v7("\40\243\77\82\87\19\230\79\88\118\19\213\77\82\124\21\226\91","\19\97\135\40\63")):WaitForChild(v7("\156\89\63\62\46\34\171\115\36\53\42\35\189\84\58\43\10\39\171\82\39","\81\206\60\83\91\79"));task.wait(0.05);v105:FireServer();break;end end end local function v80(v106) if (v67==true) then for v120,v121 in ipairs(v78) do if (v106.Name==v121) then local v143=1001 -(938 + 63) ;while true do if (v143==(0 + 0)) then v79(v106);v106.ChildAdded:Connect(function(v152) local v153=0;while true do if (v153==(1125 -(936 + 189))) then task.wait(0.1 + 0 );if (v152.Name==v7("\108\164\200","\196\46\203\176\18\79\163\45")) then v79(v152.Parent);else end break;end end end);break;end end end end end end workspace.ChildAdded:Connect(v80);v56.MouseButton1Click:Connect(function() local v107=0;while true do if (v107==(1613 -(1565 + 48))) then v67= not v67;v56.Text=(v67 and v7("\153\55\106\17\100\207\224\161\98\89\23\34\239\181\248\13\80","\143\216\66\30\126\68\155")) or v7("\139\221\25\196\133\151\216\248\234\239\4\205\209\249\151\206\140\238","\129\202\168\109\171\165\195\183") ;break;end end end);v61.MouseButton1Click:Connect(function() v68= not v68;v61.Text=(v68 and v7("\17\87\56\214\147\36\244\45\64\62\213\223\25\227\44\76\50","\134\66\56\87\184\190\116")) or v7("\29\36\29\180\89\200\45\52\53\60\73\156\16\237\53\38\113\5\0\184\18\238\53\38\102\113\38\157\63","\85\92\81\105\219\121\139\65") ;end);local v81=game.Workspace.CurrentCamera;local v82=game.Workspace.Items;v82.ChildAdded:Connect(function(v109) v109.Transparency=1;end);v81.ChildAdded:Connect(function(v111) wait(0.1 + 0 );if v111:IsA(v7("\223\178\67\64\76\222\239\167","\191\157\211\48\37\28")) then v111:Destroy();else end end);local function v83() for v114,v115 in ipairs(workspace:GetDescendants()) do if (v115:IsA(v7("\239\30\230\8","\90\191\127\148\124")) or v115:IsA(v7("\85\130\61\31\72\134\60\3","\119\24\231\78"))) then v115.Transparency=1139 -(782 + 356) ;end end end v83();game:GetService(v7("\178\33\164\83\217\82\2","\113\226\77\197\42\188\32")).LocalPlayer.Idled:Connect(function() local v112=0;while true do if (v112==0) then game:GetService(v7("\12\31\230\161\47\23\248\128\41\19\230","\213\90\118\148")):CaptureController();game:GetService(v7("\109\39\166\66\88\90\34\129\69\72\73","\45\59\78\212\54")):ClickButton2(Vector2.new());break;end end end);
