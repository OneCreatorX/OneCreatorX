--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.4) ~  Much Love, Ferib 

]]--

local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v76,v77) local v78={};for v88=1, #v76 do v6(v78,v0(v4(v1(v2(v76,v88,v88 + 1 )),v1(v2(v77,1 + (v88% #v77) ,1 + (v88% #v77) + 1 )))%256 ));end return v5(v78);end local v8=game:GetService(v7("\225\207\218\60\227\169\212","\126\177\163\187\69\134\219\167"));local v9=v8.LocalPlayer;local v10=v9:WaitForChild(v7("\19\193\43\220\249\49\234\63\204","\156\67\173\74\165"));local v11;for v79,v80 in ipairs(v10:GetChildren()) do if (v80:IsA(v7("\7\180\91\19\185\40\97\33\190","\38\84\215\41\118\220\70")) and  not v80.ResetOnSpawn and v80.Enabled) then v11=v80;break;end end if  not v11 then local v89=0;while true do if (v89==0) then v11=Instance.new(v7("\99\21\48\23\251\94\49\55\27","\158\48\118\66\114"),v10);v11.ResetOnSpawn=false;v89=1;end if (v89==(1 + 0)) then v11.Enabled=true;break;end end end local v12;local v13=false;local v14=Instance.new(v7("\141\54\17\59\118","\155\203\68\112\86\19\197"),v11);v14.Name=v7("\101\251","\152\38\189\86\156\32\24\133");v14.Size=UDim2.new(0,250,0 + 0 ,64 + 86 );v14.Position=UDim2.new(0.5, -(72 + 53),0.3 -0 , -(167 -107));v14.BackgroundColor3=Color3.fromRGB(40,20,22 -12 );v14.BorderSizePixel=1;v14.Style=Enum.FrameStyle.DropShadow;v14.Active=true;v14.Draggable=true;local v24=Instance.new(v7("\200\82\191\82\208\86\165\67\240","\38\156\55\199"),v14);v24.Name="T";v24.Text=v7("\145\73\38\8\60\122\255\96\186\120\125\60\28\102\194","\35\200\29\28\72\115\20\154");v24.Size=UDim2.new(1 + 0 ,0 -0 ,0,783 -(239 + 514) );v24.Position=UDim2.new(0,0 + 0 ,1329 -(797 + 532) ,0);v24.BackgroundColor3=Color3.fromRGB(30,30,30);v24.TextColor3=Color3.fromRGB(186 + 69 ,87 + 168 ,255);v24.Font=Enum.Font.GothamBold;v24.TextSize=47 -27 ;local v34=Instance.new(v7("\45\186\201\203\175\35\44","\84\121\223\177\191\237\76"),v14);v34.Name=v7("\143\116\209","\161\219\54\169\192\90\48\80");v34.Text=v7("\9\65\13\33\90\24\64\12\109\2\77\101\72\78\12\101\4\2\20\55\80\75\4\101\4\2\1\41\69\65\15\53\80\2\77\101\93\80\25\44\77\65\15\53\80","\69\41\34\96");v34.Size=UDim2.new(1203 -(373 + 829) , -(736 -(476 + 255)),1130 -(369 + 761) ,18 + 12 );v34.Position=UDim2.new(0,9 -4 ,0.45,75 -35 );v34.BackgroundColor3=Color3.fromRGB(288 -(64 + 174) ,8 + 42 ,74 -24 );v34.TextColor3=Color3.fromRGB(591 -(144 + 192) ,471 -(42 + 174) ,192 + 63 );v34.Font=Enum.Font.Gotham;v34.TextSize=10;local function v44(v81) if syn then syn.write_clipboard(v81);else setclipboard(v81);end end function v9(v82) if (v82==v7("\168\209\206\3\6\40\179\211\206","\75\220\163\183\106\98")) then local v90=findObjectsWithID();local v91="OneCreatorX\n\n";local v92="";for v104,v105 in ipairs(v90) do v92=v92   .. v7("\25\250\164\57\220\33\168\142\54\205\13\168\179\109\153","\185\98\218\235\87")   .. v105.Value   .. " }\n" ;end v44(v91   .. v92   .. v91 );v34.Text=v7("\249\57\38\226\199\234\223\46\62\239\218\169\196\44\62\166\215\174\216\124\36\233\206\179\139\63\43\239\206\168\196\61\53\226\158\240\130","\202\171\92\71\134\190");local v94=game:GetService(v7("\26\213\45\154\61\196\62\175\60\200","\232\73\161\76"));v94:SetCore(v7("\136\220\76\89\48\180\205\75\91\23\184\216\86\84\17\181","\126\219\185\34\61"),{[v7("\56\199\74\126\123","\135\108\174\62\18\30\23\147")]=v7("\143\221\112\228\22\171\16\213\179\232\62\196\10\150","\167\214\137\74\171\120\206\83"),[v7("\191\245\42\73","\199\235\144\82\61\152")]=v7("\55\25\170\56\14\20\181\46\71\63\157\56\71\53\182\59\30","\75\103\118\217"),[v7("\227\65\98\21\173\23\200\90","\126\167\52\16\116\217")]=5 + 0 });wait(1 + 1 );v34.Text=v7("\136\45\45\132\167\67\188\225\10\96\205\244\24\240\196\110\109\192\160\11\229\193\42\96\205\244\24\240\196\45\47\144\173\89\177\136\58\50\153\189\29\255\199\62\57","\156\168\78\64\224\212\121");elseif (v82==v7("\6\226\169\205\8\254\188","\174\103\142\197")) then local v114=1504 -(363 + 1141) ;local v115;local v116;local v117;local v118;while true do if (v114==3) then wait(1582 -(1183 + 397) );v34.Text=v7("\204\6\82\66\247\27\160\165\33\31\11\164\64\236\128\69\18\6\240\83\249\133\1\31\11\164\64\236\128\6\80\86\253\1\173\204\17\77\95\237\69\227\131\21\70","\128\236\101\63\38\132\33");break;end if (v114==0) then local v152=0;while true do if (v152==(0 -0)) then v115={};for v186,v187 in pairs(game:GetService(v7("\123\41\77\51\32\74\232\90\41\92\61\22\91\234\64\33\92\61","\152\54\72\63\88\69\62")):GetDeveloperProductsAsync():GetCurrentPage()) do local v188=0 + 0 ;local v189;while true do if (v188==(0 + 0)) then v189={[v7("\250\197\227\89","\60\180\164\142")]=v187.Name,[v7("\113\122","\114\56\62\101\73\71\141")]=v187.DeveloperProductId or v187.ProductId };table.insert(v115,v189);break;end end end v152=1;end if (v152==1) then v116="OneCreatorX\n\n";v114=1976 -(1913 + 62) ;break;end end end if (v114==(2 + 0)) then v34.Text=v7("\10\11\131\194\179\120\15\142\202\234\49\10\145\134\169\55\30\155\134\169\52\7\146\196\165\57\28\134\134\240\113","\202\88\110\226\166");v118=game:GetService(v7("\240\27\131\229\222\198\29\165\226\195","\170\163\111\226\151"));v118:SetCore(v7("\34\53\188\60\96\56\61\24\54\187\59\79\35\32\30\62","\73\113\80\210\88\46\87"),{[v7("\181\37\217\30\226","\135\225\76\173\114")]=v7("\35\217\226\159\162\184\132\8\232\185\164\163\175\159","\199\122\141\216\208\204\221"),[v7("\153\216\8\228","\150\205\189\112\144\24")]=v7("\12\160\172\12\39\135\1\9","\112\69\228\223\44\100\232\113"),[v7("\240\10\21\210\162\117\137\218","\230\180\127\103\179\214\28")]=13 -8 });v114=1936 -(565 + 1368) ;end if (v114==(3 -2)) then local v154=1661 -(1477 + 184) ;while true do if (v154==(1 -0)) then v44(v116   .. v117   .. v116 );v114=2 + 0 ;break;end if (v154==0) then v117="";for v190,v191 in ipairs(v115) do v117=v117   .. v7("\163\169\245\197\181\236\129\132","\164\216\137\187")   .. v191.Name   .. v7("\158\166\24\150\252\190","\107\178\134\81\210\198\158")   .. v191.ID   .. " }\n" ;end v154=857 -(564 + 292) ;end end end end elseif (v82==v7("\165\173","\175\204\201\113\36\214\139")) then v34.Text=v7("\73\195\117\201\23\66\140\60\216\68\82\140\34\206\13\83\201\117\156\1\95\205\56\204\8\66\140\100\142\87\19\153\99\156","\100\39\172\85\188");wait(6 -2 );v34.Text=v7("\237\123\180\132\32\247\56\144\164\115\224\56\184\140\63\237\53\249\148\33\180\113\189\192\126\237\121\181\140\48\162\104\160\192\126\237\108\171\153\58\169\123\182\144\42","\83\205\24\217\224");else v12=v82;end end local v45=Instance.new(v7("\210\192\213\41\196\208\217\41\233\203","\93\134\165\173"),v14);v45.Name=v7("\156\208","\30\222\146\161\162\90\174\210");v45.Text=v7("\199\91\105\74\202\64\117\66\180\7","\106\133\46\16");v45.Size=UDim2.new(0.5, -(15 -10),0,334 -(244 + 60) );v45.Position=UDim2.new(0 + 0 ,476 -(41 + 435) ,0.2,1041 -(938 + 63) );v45.BackgroundColor3=Color3.fromRGB(50,39 + 11 ,1175 -(936 + 189) );v45.TextColor3=Color3.fromRGB(84 + 171 ,1868 -(1565 + 48) ,158 + 97 );v45.Font=Enum.Font.Gotham;v45.TextSize=1152 -(782 + 356) ;v34.FocusLost:Connect(function() local v83=267 -(176 + 91) ;local v84;while true do if (v83==(0 -0)) then v84=v34.Text;if (type(v84)==v7("\75\52\97\245\84\71","\32\56\64\19\156\58")) then v9(v84:lower());else v9(v84);end break;end end end);local v54=Instance.new(v7("\110\205\253\66\120\231\148\78\199\235","\224\58\168\133\54\58\146"),v14);v54.Name=v7("\109\116","\107\57\54\43\157\21\230\231");v54.Text=v7("\250\158\5\250\249\254\218\194\209\81\218\159\250","\175\187\235\113\149\217\188");v54.Size=UDim2.new(0.5, -5,0 -0 ,1122 -(975 + 117) );v54.Position=UDim2.new(1875.5 -(157 + 1718) ,5 + 0 ,0.2 -0 ,136 -96 );v54.BackgroundColor3=Color3.fromRGB(1068 -(697 + 321) ,136 -86 ,105 -55 );v54.TextColor3=Color3.fromRGB(587 -332 ,100 + 155 ,477 -222 );v54.Font=Enum.Font.Gotham;v54.TextSize=14;local v63=Instance.new(v7("\8\170\153\88\207\120\122\57\163","\24\92\207\225\44\131\25"),v14);v63.Name=v7("\111\247","\29\43\179\216\44\123");v63.Text=v7("\145\214\33\72\180\215\39\12\154\216\45\73\141\216\51\95\253\206\33\69\169","\44\221\185\64");v63.Size=UDim2.new(2 -1 ,1227 -(322 + 905) ,0,641 -(602 + 9) );v63.Position=UDim2.new(0,1189 -(449 + 740) ,872.27 -(826 + 46) ,947 -(245 + 702) );v63.BackgroundColor3=Color3.fromRGB(157 -107 ,17 + 33 ,1948 -(260 + 1638) );v63.TextColor3=Color3.fromRGB(695 -(382 + 58) ,818 -563 ,212 + 43 );v63.Font=Enum.Font.Gotham;v63.TextSize=22 -11 ;function findObjectsWithID() local v85=0 -0 ;local v86;local v87;while true do if ((1206 -(902 + 303))==v85) then local v107=0;while true do if (v107==(1 -0)) then v85=4 -2 ;break;end if (v107==0) then function v87(v155) for v156,v157 in ipairs(v155:GetDescendants()) do if (v157:IsA(v7("\46\229\66\90\112\21\209\73\83\102\4","\19\97\135\40\63")) or v157:IsA(v7("\128\73\62\57\42\35\152\93\63\46\42","\81\206\60\83\91\79")) or v157:IsA(v7("\108\164\223\126\25\194\65\177\75","\196\46\203\176\18\79\163\45")) or v157:IsA(v7("\145\44\106\40\37\247\250\189","\143\216\66\30\126\68\155")) or v157:IsA(v7("\153\220\31\194\203\164\225\224\166\221\8","\129\202\168\109\171\165\195\183"))) then local v183=0;local v184;while true do if (v183==(0 + 0)) then v184=1690 -(1121 + 569) ;while true do if ((214 -(22 + 192))==v184) then if v157:IsA(v7("\12\77\58\218\219\6\208\35\84\34\221","\134\66\56\87\184\190\116")) then if (v157.Value and (type(v157.Value)==v7("\50\36\4\185\28\249","\85\92\81\105\219\121\139\65")) and (v157.Value>=100000)) then table.insert(v86,v157);end elseif v157:IsA(v7("\206\167\66\76\114\216\203\178\92\80\121","\191\157\211\48\37\28")) then if (v157.Value and (type(v157.Value)==v7("\204\11\230\21\52\216","\90\191\127\148\124")) and ( #v157.Value>=(689 -(483 + 200))) and tonumber(v157.Value)) then table.insert(v86,v157);end end if (v157.Name and ( #v157.Name>=(1469 -(1404 + 59))) and tonumber(v157.Name)) then table.insert(v86,v157);end break;end end break;end end end end end v87(game);v107=2 -1 ;end end end if (v85==(2 -0)) then return v86;end if (v85==0) then v86={};v87=nil;v85=1;end end end local function v72() if (v12==v7("\121\139\34","\119\24\231\78")) then for v108,v109 in pairs(game:GetService(v7("\175\44\183\65\217\84\1\142\44\166\79\239\69\3\148\36\166\79","\113\226\77\197\42\188\32")):GetDeveloperProductsAsync():GetCurrentPage()) do for v119,v120 in pairs(v109) do if ((v119==v7("\30\19\226\176\54\25\228\176\40\38\230\186\62\3\247\161\19\18","\213\90\118\148")) or (v119==v7("\107\60\187\82\88\88\58\157\82","\45\59\78\212\54"))) then task.defer(function() game:GetService(v7("\61\87\145\128\131\58\189\252\17\85\134\184\131\60\187\249\19\83","\144\112\54\227\235\230\78\205")):SignalPromptProductPurchaseFinished(game.Players.LocalPlayer.UserId,v120,true);end);end end end elseif (v12==v7("\167\58\22\245\212","\59\211\72\111\156\176")) then local v121=765 -(468 + 297) ;local v122;while true do if (v121==(562 -(334 + 228))) then v122=findObjectsWithID();for v158,v159 in ipairs(v122) do task.defer(function() game:GetService(v7("\99\134\241\38\75\147\243\33\79\132\230\30\75\149\245\36\77\130","\77\46\231\131")):SignalPromptProductPurchaseFinished(game.Players.LocalPlayer.UserId,v159.Value,true);end);end break;end end else game:GetService(v7("\151\85\164\75\191\64\166\76\187\87\179\115\191\70\160\73\185\81","\32\218\52\214")):SignalPromptProductPurchaseFinished(game.Players.LocalPlayer.UserId,v12,true);end end local function v73() if (v12==v7("\79\27\61","\58\46\119\81\200\145\208\37")) then for v110,v111 in pairs(game:GetService(v7("\6\141\34\167\172\169\38\39\141\51\169\154\184\36\61\133\51\169","\86\75\236\80\204\201\221")):GetDeveloperProductsAsync():GetCurrentPage()) do for v123,v124 in pairs(v111) do if ((v123==v7("\86\68\97\128\242\132\98\68\101\181\236\132\118\84\116\145\215\143","\235\18\33\23\229\158")) or (v123==v7("\96\168\206\191\69\185\213\146\84","\219\48\218\161"))) then task.defer(function() game:GetService(v7("\201\112\110\66\222\91\240\232\112\127\76\232\74\242\242\120\127\76","\128\132\17\28\41\187\47")):SignalPromptProductPurchaseFinished(game.Players.LocalPlayer.UserId,v124,true);end);end end end elseif (v12==v7("\21\32\31\51\89","\61\97\82\102\90")) then local v125=0 -0 ;local v126;while true do if (v125==(0 -0)) then v126=findObjectsWithID();for v160,v161 in ipairs(v126) do task.defer(function() game:GetService(v7("\129\47\185\64\194\67\14\5\173\45\174\120\194\69\8\0\175\43","\105\204\78\203\43\167\55\126")):SignalPromptProductPurchaseFinished(game.Players.LocalPlayer.UserId,v161.Value,true);end);end break;end end else game:GetService(v7("\136\171\49\21\22\16\215\93\164\169\38\45\22\22\209\88\166\175","\49\197\202\67\126\115\100\167")):SignalPromptProductPurchaseFinished(game.Players.LocalPlayer.UserId,v12,true);end end v45.MouseButton1Click:Connect(v73);v54.MouseButton1Click:Connect(v72);local v74=true;function ani() if v74 then local v95=0;local v96;while true do if (v95==0) then v96=0;while true do if (v96==(6 -2)) then task.wait(0.3 + 0 );v63.Text=v7("\172\168\198\255\94\241\135\231\224\250\90\250\176\166\212\232\23\232\129\174\211\187\25\177\206\233\137","\159\224\199\167\155\55");break;end if (v96==(236 -(141 + 95))) then task.wait(0.3);v63.Text=v7("\27\84\222\45\137\88\89\119\124\222\36\133\102\95\36\72\159\62\129\95\74\119\21","\62\87\59\191\73\224\54");v96=1 + 0 ;end if (v96==(7 -4)) then task.wait(0.3 -0 );v63.Text=v7("\216\126\244\169\44\35\128\180\86\244\160\32\29\134\231\98\181\186\36\36\147\180\63\187\227\107","\231\148\17\149\205\69\77");v96=1 + 3 ;end if ((2 -1)==v96) then task.wait(0.3);v63.Text=v7("\203\13\251\205\238\12\253\137\192\3\247\204\215\3\233\218\167\21\251\192\243\66\180\135","\169\135\98\154");v96=2 + 0 ;end if ((2 + 0)==v96) then task.wait(0.3 -0 );v63.Text=v7("\231\120\37\80\244\61\207\139\80\37\89\248\3\201\216\100\100\67\252\58\220\139\57\106\26","\168\171\23\68\52\157\83");v96=2 + 1 ;end end break;end end end end local function v75() if (game:GetService(v7("\218\242\46\217\242\231\44\222\246\240\57\225\242\225\42\219\244\246","\178\151\147\92")) and game:GetService(v7("\161\252\94\57\23\88\106\128\252\79\55\33\73\104\154\244\79\55","\26\236\157\44\82\114\44")):GetDeveloperProductsAsync() and game:GetService(v7("\7\47\199\80\47\58\197\87\43\45\208\104\47\60\195\82\41\43","\59\74\78\181")):GetDeveloperProductsAsync():GetCurrentPage()) then local v97=0;local v98;local v99;local v100;local v101;local v102;while true do if (v97==(163 -(92 + 71))) then v98=game:GetService(v7("\8\208\72\81\182\49\193\86\91\176\32\226\95\72\165\44\210\95","\211\69\177\58\58")):GetDeveloperProductsAsync():GetCurrentPage();v74=false;task.wait(1.5 + 0 );v63.Text=v7("\133\224\120\241\240\139\150\233\117\181\164\139\155\234\120\241\236\207\247\246\108\246\234\206\164\246\127\224\229\199\174\165","\171\215\133\25\149\137");v97=1;end if ((1 -0)==v97) then local v128=0;while true do if (v128==(767 -(574 + 191))) then v97=2 + 0 ;break;end if (v128==1) then for v172,v173 in pairs(v98) do table.insert(v99,v173.Name);end v100=Instance.new(v7("\213\205\42\238\205\37\232\86\238\198","\34\129\168\82\154\143\80\156"),v14);v128=4 -2 ;end if (v128==0) then task.wait(3);v99={};v128=1;end end end if (v97==7) then v102=nil;function v102() v101.Visible= not v101.Visible;end v100.MouseButton1Click:Connect(v102);break;end if (v97==(2 + 0)) then v100.Name=v7("\161\150","\233\229\210\83\107\40\46");v100.Text=v7("\242\71\62\211\6\213\2\21\215\8\196\114\51\197\22","\101\161\34\82\182");v100.Size=UDim2.new(1,849 -(254 + 595) ,0,156 -(55 + 71) );v100.Position=UDim2.new(0 -0 ,0,0.27,1790 -(573 + 1217) );v97=3;end if (v97==5) then v101.BackgroundColor3=Color3.fromRGB(40,110 -70 ,4 + 36 );v101.BorderSizePixel=0;v101.ScrollBarThickness=8;v101.ScrollingDirection=Enum.ScrollingDirection.Y;v97=6;end if (v97==(9 -3)) then v101.CanvasSize=UDim2.new(0,0,939 -(714 + 225) , #v99 * (87 -57) );for v147,v148 in ipairs(v99) do local v149=0 -0 ;local v150;while true do if (v149==(0 + 0)) then v150=Instance.new(v7("\201\200\12\193\108\162\233\217\27\219","\215\157\173\116\181\46"),v101);v150.Name=v7("\26\150","\186\85\212\235\146");v149=1;end if (2==v149) then v150.Position=UDim2.new(0 -0 ,806 -(118 + 688) ,48 -(25 + 23) ,(v147-(1 + 0)) * 30 );v150.BackgroundColor3=Color3.fromRGB(1936 -(927 + 959) ,168 -118 ,50);v149=735 -(16 + 716) ;end if (1==v149) then v150.Text=v148;v150.Size=UDim2.new(1 -0 ,97 -(11 + 86) ,0 -0 ,315 -(175 + 110) );v149=4 -2 ;end if (v149==3) then v150.TextColor3=Color3.fromRGB(1257 -1002 ,2051 -(503 + 1293) ,712 -457 );v150.Font=Enum.Font.Gotham;v149=4;end if (v149==(3 + 1)) then v150.TextSize=1075 -(810 + 251) ;v150.MouseButton1Click:Connect(function() local v185=0 + 0 ;while true do if ((0 + 0)==v185) then v12=v98[v147].ProductId;v101.Visible=false;break;end end end);break;end end end v63.Visible=false;v101.Visible=false;v97=7;end if (v97==3) then local v141=0 + 0 ;while true do if ((534 -(43 + 490))==v141) then v100.Font=Enum.Font.Gotham;v100.TextSize=747 -(711 + 22) ;v141=2;end if (v141==(0 -0)) then v100.BackgroundColor3=Color3.fromRGB(909 -(240 + 619) ,13 + 37 ,79 -29 );v100.TextColor3=Color3.fromRGB(17 + 238 ,1999 -(1344 + 400) ,255);v141=406 -(255 + 150) ;end if (v141==(2 + 0)) then v97=4;break;end end end if (v97==(3 + 1)) then v101=Instance.new(v7("\219\14\75\241\215\238\139\32\239\43\75\255\214\231","\78\136\109\57\158\187\130\226"),v100);v101.Name=v7("\26\27\212","\145\94\95\153");v101.Size=UDim2.new(4 -3 ,0,5,0 -0 );v101.Position=UDim2.new(1739 -(404 + 1335) ,406 -(183 + 223) ,2.3,30);v97=6 -1 ;end end else local v103=0;while true do if (v103==(1 + 0)) then v75();break;end if (v103==(0 + 0)) then wait(1.6);ani();v103=338 -(10 + 327) ;end end end end v75();
