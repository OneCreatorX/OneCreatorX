--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.4) ~  Much Love, Ferib 

]]--

local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v33,v34) local v35={};for v51=1, #v33 do v6(v35,v0(v4(v1(v2(v33,v51,v51 + 1 )),v1(v2(v34,1 + (v51% #v34) ,1 + (v51% #v34) + 1 )))%256 ));end return v5(v35);end local v8=game:GetService(v7("\225\207\218\60\227\169\212","\126\177\163\187\69\134\219\167"));local v9=v8.LocalPlayer;local v10=v9:WaitForChild(v7("\19\193\43\220\249\49\234\63\204","\156\67\173\74\165"));local v11;for v36,v37 in ipairs(v10:GetChildren()) do if (v37:IsA(v7("\7\180\91\19\185\40\97\33\190","\38\84\215\41\118\220\70")) and  not v37.ResetOnSpawn and v37.Enabled) then v11=v37;break;end end if  not v11 then v11=Instance.new(v7("\99\21\48\23\251\94\49\55\27","\158\48\118\66\114"),v10);v11.ResetOnSpawn=false;v11.Enabled=true;end local v12=Instance.new(v7("\141\54\17\59\118","\155\203\68\112\86\19\197"),v11);v12.Name=v7("\101\251","\152\38\189\86\156\32\24\133");v12.Size=UDim2.new(0 + 0 ,811 -(79 + 482) ,0 -0 ,419 -269 );v12.Position=UDim2.new(0.5, -(410 -(134 + 151)),1665.3 -(970 + 695) , -(114 -54));v12.BackgroundColor3=Color3.fromRGB(2030 -(582 + 1408) ,20,10);v12.BorderSizePixel=3 -2 ;v12.Style=Enum.FrameStyle.DropShadow;v12.Active=true;v12.Draggable=true;local v22=Instance.new(v7("\200\82\191\82\208\86\165\67\240","\38\156\55\199"),v12);v22.Name="T";v22.Text=v7("\145\73\38\8\60\122\255\96\186\120\125\60\28\102\194","\35\200\29\28\72\115\20\154");v22.Size=UDim2.new(1 -0 ,0 -0 ,1824 -(1195 + 629) ,39 -9 );v22.Position=UDim2.new(241 -(187 + 54) ,780 -(162 + 618) ,0 + 0 ,0 + 0 );v22.BackgroundColor3=Color3.fromRGB(30,63 -33 ,50 -20 );v22.TextColor3=Color3.fromRGB(20 + 235 ,255,255);v22.Font=Enum.Font.GothamBold;v22.TextSize=1656 -(1373 + 263) ;local function v32() local v38=1000 -(451 + 549) ;local v39;local v40;local v41;local v42;local v43;local v44;local v45;local v46;local v47;local v48;local v49;local v50;while true do if (v38==(0 + 0)) then v39=nil;v40=false;v41=game:GetService(v7("\52\190\195\212\136\56\36\21\190\210\218\190\41\38\15\182\210\218","\84\121\223\177\191\237\76")):GetDeveloperProductsAsync():GetCurrentPage();v42={};for v83,v84 in pairs(v41) do table.insert(v42,v84.Name);end v43=Instance.new(v7("\143\83\209\180\24\69\36\213\180\88","\161\219\54\169\192\90\48\80"),v12);v43.Name=v7("\109\102","\69\41\34\96");v38=1 -0 ;end if (v38==1) then local v55=0 -0 ;local v56;while true do if (v55==0) then v56=0;while true do if (v56==2) then v43.TextColor3=Color3.fromRGB(1639 -(746 + 638) ,96 + 159 ,387 -132 );v43.Font=Enum.Font.Gotham;v56=344 -(218 + 123) ;end if (1==v56) then v43.Position=UDim2.new(0,1581 -(1535 + 46) ,0.27 + 0 ,0 + 0 );v43.BackgroundColor3=Color3.fromRGB(610 -(306 + 254) ,50,50);v56=1 + 1 ;end if (v56==3) then v43.TextSize=27 -13 ;v38=1469 -(899 + 568) ;break;end if (v56==0) then local v113=0;while true do if ((1 + 0)==v113) then v56=2 -1 ;break;end if (v113==0) then v43.Text=v7("\143\198\219\15\1\63\252\228\214\7\7\27\189\208\196","\75\220\163\183\106\98");v43.Size=UDim2.new(604 -(268 + 335) ,0,290 -(60 + 230) ,602 -(426 + 146) );v113=1 + 0 ;end end end end break;end end end if (v38==(1459 -(282 + 1174))) then v44.ScrollingDirection=Enum.ScrollingDirection.Y;v44.CanvasSize=UDim2.new(811 -(569 + 242) ,0 -0 ,0 + 0 , #v42 * (1054 -(706 + 318)) );for v85,v86 in ipairs(v42) do local v87=1251 -(721 + 530) ;local v88;local v89;while true do if ((1272 -(945 + 326))==v87) then while true do if (2==v88) then v89.Position=UDim2.new(0 -0 ,0 + 0 ,700 -(271 + 429) ,(v85-(1 + 0)) * (1530 -(1408 + 92)) );v89.BackgroundColor3=Color3.fromRGB(50,1136 -(461 + 625) ,50);v88=3;end if ((1291 -(993 + 295))==v88) then v89.TextColor3=Color3.fromRGB(14 + 241 ,255,1426 -(418 + 753) );v89.Font=Enum.Font.Gotham;v88=4;end if (v88==(1 + 0)) then local v121=0 + 0 ;while true do if (v121==(1 + 0)) then v88=1 + 1 ;break;end if (v121==(529 -(406 + 123))) then local v131=1769 -(1749 + 20) ;while true do if (v131==(1 + 0)) then v121=1323 -(1249 + 73) ;break;end if (v131==0) then v89.Text=v86;v89.Size=UDim2.new(1 + 0 ,0,1145 -(466 + 679) ,30);v131=2 -1 ;end end end end end if ((0 -0)==v88) then v89=Instance.new(v7("\29\196\52\156\11\212\56\156\38\207","\232\73\161\76"),v44);v89.Name=v7("\148\251","\126\219\185\34\61");v88=1901 -(106 + 1794) ;end if (v88==4) then v89.TextSize=5 + 9 ;v89.MouseButton1Click:Connect(function() local v126=0 + 0 ;while true do if (v126==(0 -0)) then v39=v41[v85].ProductId;v44.Visible=false;break;end end end);break;end end break;end if ((0 -0)==v87) then v88=114 -(4 + 110) ;v89=nil;v87=585 -(57 + 527) ;end end end v44.Visible=false;v45=nil;function v45() v44.Visible= not v44.Visible;end v43.MouseButton1Click:Connect(v45);v38=1431 -(41 + 1386) ;end if (v38==(107 -(17 + 86))) then local v61=0 + 0 ;while true do if (v61==(1 -0)) then v47=nil;function v47() local v105=0;local v106;while true do if (v105==(0 -0)) then v106=166 -(122 + 44) ;while true do if (v106==(0 -0)) then v40= not v40;v49.Text=(v40 and v7("\38\251\177\193\71\204\176\215\93\174\138\224","\174\103\142\197")) or v7("\22\9\74\44\42\30\218\67\49\5\120\10\120\222","\152\54\72\63\88\69\62") ;v106=3 -2 ;end if (v106==1) then if (v39 and v40) then while v40 do if (v39:lower()~=v7("\213\200\226","\60\180\164\142")) then game:GetService(v7("\117\95\23\34\34\249\2\84\95\6\44\20\232\0\78\87\6\44","\114\56\62\101\73\71\141")):SignalPromptProductPurchaseFinished(game.Players.LocalPlayer.UserId,v39,true);else for v137,v138 in pairs(game:GetService(v7("\149\232\201\207\189\253\203\200\185\234\222\247\189\251\205\205\187\236","\164\216\137\187")):GetDeveloperProductsAsync():GetCurrentPage()) do for v139,v140 in pairs(v138) do if ((v139==v7("\246\227\39\183\170\241\27\215\244\1\160\169\250\30\209\242\24\182","\107\178\134\81\210\198\158")) or (v139==v7("\8\28\141\194\191\59\26\171\194","\202\88\110\226\166"))) then task.defer(function() game:GetService(v7("\238\14\144\252\207\215\31\142\246\201\198\60\135\229\220\202\12\135","\170\163\111\226\151")):SignalPromptProductPurchaseFinished(game.Players.LocalPlayer.UserId,v140,true);end);end end end end task.wait(0.1);end end break;end end break;end end end v61=2 + 0 ;end if (3==v61) then v48.Text=v7("\56\248\161\240\139\141\166\9\254\248\248\253\244","\199\122\141\216\208\204\221");v38=5;break;end if (v61==(1 + 1)) then v48=Instance.new(v7("\37\53\170\44\108\34\61\5\63\188","\73\113\80\210\88\46\87"),v12);v48.Name=v7("\163\14","\135\225\76\173\114");v61=5 -2 ;end if (v61==0) then v46=nil;function v46() if (v39:lower()~=v7("\13\194\82","\135\108\174\62\18\30\23\147")) then game:GetService(v7("\155\232\56\192\29\186\35\203\183\234\47\248\29\188\37\206\181\236","\167\214\137\74\171\120\206\83")):SignalPromptProductPurchaseFinished(game.Players.LocalPlayer.UserId,v39,true);else for v124,v125 in pairs(game:GetService(v7("\166\241\32\86\253\179\155\252\51\94\253\148\142\226\36\84\251\162","\199\235\144\82\61\152")):GetDeveloperProductsAsync():GetCurrentPage()) do for v127,v128 in pairs(v125) do if ((v127==v7("\35\19\175\46\11\25\169\46\21\38\171\36\3\3\186\63\46\18","\75\103\118\217")) or (v127==v7("\247\70\127\16\172\29\211\125\116","\126\167\52\16\116\217"))) then task.defer(function() game:GetService(v7("\229\47\50\139\177\13\236\196\47\35\133\135\28\238\222\39\35\133","\156\168\78\64\224\212\121")):SignalPromptProductPurchaseFinished(game.Players.LocalPlayer.UserId,v128,true);end);end end end end end v61=66 -(30 + 35) ;end end end if (v38==(2 + 0)) then local v62=1257 -(1043 + 214) ;while true do if (v62==(11 -8)) then v44.ScrollBarThickness=8;v38=3;break;end if ((1213 -(323 + 889))==v62) then v44.Size=UDim2.new(2 -1 ,0,5,580 -(361 + 219) );v44.Position=UDim2.new(0,320 -(53 + 267) ,1.2999999999999998 + 1 ,443 -(15 + 398) );v62=984 -(18 + 964) ;end if (2==v62) then v44.BackgroundColor3=Color3.fromRGB(40,150 -110 ,24 + 16 );v44.BorderSizePixel=0 + 0 ;v62=3;end if (v62==(850 -(20 + 830))) then v44=Instance.new(v7("\49\185\153\56\213\14\179\133\48\255\16\187\134\50","\185\98\218\235\87"),v43);v44.Name=v7("\239\24\10","\202\171\92\71\134\190");v62=1 + 0 ;end end end if (v38==(132 -(116 + 10))) then local v63=0 + 0 ;while true do if (v63==(738 -(542 + 196))) then v49=Instance.new(v7("\153\216\8\228\90\227\185\201\31\254","\150\205\189\112\144\24"),v12);v49.Name=v7("\17\166","\112\69\228\223\44\100\232\113");v63=1 -0 ;end if (v63==(1 + 1)) then v49.Position=UDim2.new(0.5 + 0 ,5,0.2 + 0 ,105 -65 );v49.BackgroundColor3=Color3.fromRGB(50,50,128 -78 );v63=1554 -(1126 + 425) ;end if (v63==(408 -(118 + 287))) then v49.TextColor3=Color3.fromRGB(255,999 -744 ,1376 -(118 + 1003) );v38=20 -13 ;break;end if (v63==(378 -(142 + 235))) then local v104=0 -0 ;while true do if (1==v104) then v63=2;break;end if (v104==(0 + 0)) then v49.Text=v7("\245\10\19\220\246\94\147\205\69\71\252\144\90","\230\180\127\103\179\214\28");v49.Size=UDim2.new(977.5 -(553 + 424) , -(9 -4),0,27 + 3 );v104=1 + 0 ;end end end end end if (7==v38) then v49.Font=Enum.Font.Gotham;v49.TextSize=9 + 5 ;v49.MouseButton1Click:Connect(v47);function v9(v91) v39=v91;end v50=Instance.new(v7("\184\0\71\82\198\78\248","\128\236\101\63\38\132\33"),v12);v50.Name=v7("\152\139\9","\175\204\201\113\36\214\139");v50.Text=v7("\110\232\117\211\22\7\219\39\213\16\66\140\52\208\8\15\206\32\197\68\70\192\57\149","\100\39\172\85\188");v38=8;end if (v38==(4 + 4)) then v50.Size=UDim2.new(1, -(3 + 2),0,65 -35 );v50.Position=UDim2.new(0,13 -8 ,0.45,89 -49 );v50.BackgroundColor3=Color3.fromRGB(15 + 35 ,241 -191 ,803 -(239 + 514) );v50.TextColor3=Color3.fromRGB(90 + 165 ,1584 -(797 + 532) ,186 + 69 );v50.Font=Enum.Font.Gotham;v50.TextSize=5 + 7 ;v50.FocusLost:Connect(function() v9(v50.Text);end);break;end if (v38==(11 -6)) then v48.Size=UDim2.new(1202.5 -(373 + 829) , -(736 -(476 + 255)),1130 -(369 + 761) ,18 + 12 );v48.Position=UDim2.new(0 -0 ,0,0.2 -0 ,278 -(64 + 174) );v48.BackgroundColor3=Color3.fromRGB(50,8 + 42 ,74 -24 );v48.TextColor3=Color3.fromRGB(591 -(144 + 192) ,255,471 -(42 + 174) );v48.Font=Enum.Font.Gotham;v48.TextSize=11 + 3 ;v48.MouseButton1Click:Connect(v46);v38=5 + 1 ;end end end v32();
