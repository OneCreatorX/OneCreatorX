--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.2) ~  Much Love, Ferib 

]]--

local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v61,v62) local v63={};for v70=1, #v61 do v6(v63,v0(v4(v1(v2(v61,v70,v70 + 1 )),v1(v2(v62,1 + (v70% #v62) ,1 + (v70% #v62) + 1 )))%256 ));end return v5(v63);end local v8=game:GetService(v7("\230\204\201\46\245\171\198\29\212","\126\177\163\187\69\134\219\167"));local v9=game:GetService(v7("\19\193\43\220\249\49\222","\156\67\173\74\165"));local v10=Instance.new(v7("\7\180\91\19\185\40\97\33\190","\38\84\215\41\118\220\70"));v10.ResetOnSpawn=false;v10.Parent=v9.LocalPlayer:WaitForChild(v7("\96\26\35\11\251\66\49\55\27","\158\48\118\66\114"));local v13=Instance.new(v7("\141\54\17\59\118","\155\203\68\112\86\19\197"));v13.Size,v13.Position,v13.AnchorPoint,v13.Draggable,v13.Active,v13.BackgroundColor3=UDim2.new(0,98 + 122 ,836 -(660 + 176) ,23 + 167 ),UDim2.new(202.5 -(14 + 188) , -(785 -(534 + 141)),0.5 + 0 , -100),Vector2.new(0.5,0.5 + 0 ),true,true,Color3.fromRGB(49 + 1 ,105 -55 ,50);v13.Parent=v10;local v21=Instance.new(v7("\114\216\46\232\108\121\231\253\74","\152\38\189\86\156\32\24\133"));v21.Text,v21.Size,v21.TextSize,v21.TextColor3,v21.BackgroundColor3=v7("\197\99\253\102\211\89\162\101\238\82\166\82\243\69\159","\38\156\55\199"),UDim2.new(1 -0 ,0,0 -0 ,30),10 + 7 ,Color3.fromRGB(163 + 92 ,396 -(115 + 281) ,0),Color3.fromRGB(174 -99 ,63 + 12 ,75);v21.Parent=v13;local v28=Instance.new(v7("\156\120\100\60\63\117\248\70\164","\35\200\29\28\72\115\20\154"));v28.Text,v28.Size,v28.TextSize,v28.TextColor3,v28.BackgroundColor3,v28.Position=v7("\56\177\197\214\205\13\18\50\255\156\159\172\57\32\22\255\243\202\153\56\59\23\172\139\159\162\2","\84\121\223\177\191\237\76"),UDim2.new(2 -1 ,0 -0 ,0,897 -(550 + 317) ),16 -4 ,Color3.fromRGB(358 -103 ,0 -0 ,285 -(134 + 151) ),Color3.fromRGB(1740 -(970 + 695) ,143 -68 ,2065 -(582 + 1408) ),UDim2.new(0,0 -0 ,0 -0 ,584 -429 );v28.Parent=v13;local v36=Instance.new(v7("\143\83\209\180\24\69\36\213\180\88","\161\219\54\169\192\90\48\80"));v36.Text,v36.Size,v36.Position,v36.Parent,v36.BackgroundColor3,v36.TextSize,v36.TextColor3=v7("\104\87\20\42\9\111\15\43\76\91","\69\41\34\96"),UDim2.new(1824 -(1195 + 629) ,238 -58 ,241 -(187 + 54) ,820 -(162 + 618) ),UDim2.new(0.5 + 0 , -(60 + 30),0 -0 ,100),v13,Color3.fromRGB(168 -68 ,8 + 92 ,1736 -(1373 + 263) ),1014 -(451 + 549) ,Color3.fromRGB(81 + 174 ,396 -141 ,428 -173 );v36.Parent=v13;local v44=Instance.new(v7("\136\198\207\30\32\62\168\215\216\4","\75\220\163\183\106\98"));v44.Text,v44.Size,v44.Position,v44.Parent,v44.BackgroundColor3,v44.TextSize,v44.TextColor3=v7("\35\175\159\56\153\53\181\153\60\208\12\189","\185\98\218\235\87"),UDim2.new(1384 -(746 + 638) ,68 + 112 ,0,60 -20 ),UDim2.new(0.5, -(431 -(218 + 123)),1581 -(1535 + 46) ,45 + 0 ),v13,Color3.fromRGB(100,15 + 85 ,660 -(306 + 254) ),1 + 13 ,Color3.fromRGB(500 -245 ,1722 -(899 + 568) ,168 + 87 );v44.Parent=v13;local v52,v53=false,false;local v54=v9.LocalPlayer;local v55=v54.DisplayName   .. "'s Business" ;local v56=game.Workspace.TycoonPlots;local v57=nil;pcall(function() for v71,v72 in pairs(v56:GetDescendants()) do if (v72:IsA(v7("\251\61\53\242","\202\171\92\71\134\190")) and (v72.Name==v7("\11\206\45\154\45","\232\73\161\76"))) then local v76=v72:FindFirstChild(v7("\136\208\69\83","\126\219\185\34\61"));local v77=v76 and v76:FindFirstChild(v7("\56\199\74\126\123","\135\108\174\62\18\30\23\147")) ;if (v77 and v77:IsA(v7("\130\236\50\223\52\175\49\194\186","\167\214\137\74\171\120\206\83"))) then local v85=v77.Text;print(v7("\169\229\33\94\249\169\143\255\104","\199\235\144\82\61\152"),v55);print(v7("\34\24\186\36\9\2\171\42\3\25\227","\75\103\118\217"),v85);if (v85 and (v85==v55)) then v57=v72.Parent.Parent.Parent;print("El jugador local estÃ¡ en el Plot",v57.Name);break;end end end end end);if  not v57 then warn("No se encontrÃ³ el Plot del jugador local.");end local function v58() local v64=v57;if  not v64 then return;end local v65={};for v73,v74 in pairs(v64:GetDescendants()) do if (v74:IsA(v7("\234\91\116\17\181","\126\167\52\16\116\217")) and (string.sub(v74.Name,2 -1 ,611 -(268 + 335) ):lower()==v7("\204\60\47\144\164\28\238\247","\156\168\78\64\224\212\121"))) then local v78={};local v79=v74;while v79 do table.insert(v78,291 -(60 + 230) ,v79.Name);v79=v79.Parent;end local v80=table.concat(v78,".");if  not v65[v80] then local v86=572 -(426 + 146) ;local v87;local v88;while true do if ((1 + 0)==v86) then while true do if (v87==(1457 -(282 + 1174))) then v65[v80]=true;break;end if (v87==(811 -(569 + 242))) then local v93=0 -0 ;while true do if (v93==(1 + 0)) then v87=1025 -(706 + 318) ;break;end if (v93==(1251 -(721 + 530))) then v88={game:GetService(v7("\53\235\181\194\14\237\164\218\2\234\150\218\8\252\164\201\2","\174\103\142\197")):WaitForChild(v7("\100\45\82\55\49\91\235","\152\54\72\63\88\69\62")):WaitForChild(v7("\249\197\237\84\221\202\235\79","\60\180\164\142")):WaitForChild(v7("\124\76\10\57\55\232\0","\114\56\62\101\73\71\141")):WaitForChild(v7("\141\249\220\214\185\237\222","\164\216\137\187")),v74};game:GetService(v7("\224\227\33\190\175\253\10\198\227\53\129\178\241\25\211\225\52","\107\178\134\81\210\198\158")):WaitForChild(v7("\10\11\143\201\190\61\29","\202\88\110\226\166")):WaitForChild(v7("\238\14\129\255\195\205\10\145","\170\163\111\226\151")):WaitForChild(v7("\53\34\189\40\94\50\59","\73\113\80\210\88\46\87")):FireServer(unpack(v88));v93=1 + 0 ;end end end end break;end if ((700 -(271 + 429))==v86) then v87=0 + 0 ;v88=nil;v86=1501 -(1408 + 92) ;end end end wait(1086.1 -(461 + 625) );end end end local function v59() v53= not v53;v44.BackgroundColor3=(v53 and Color3.fromRGB(1288 -(993 + 295) ,255,0)) or Color3.fromRGB(6 + 94 ,1271 -(418 + 753) ,39 + 61 ) ;while v53 do local v75=0 + 0 ;while true do if (v75==(0 + 0)) then v58();task.wait(10);break;end end end end local function v60() local v67=0;while true do if (v67==(1 + 0)) then while v52 do local v83=529 -(406 + 123) ;local v84;while true do if (v83==(1769 -(1749 + 20))) then v84=v57:FindFirstChild(v7("\181\53\206\29\232\143","\135\225\76\173\114")):FindFirstChild(v7("\46\244\187\191\163\179\180","\199\122\141\216\208\204\221")):FindFirstChild(v7("\139\209\31\255\106\167","\150\205\189\112\144\24")):FindFirstChild(v7("\6\133\172\68\39\135\29\28\32\135\171\67\22\217","\112\69\228\223\44\100\232\113")):FindFirstChild(v7("\249\16\9\214\175\95\137\216\19\2\208\162\115\148","\230\180\127\103\179\214\28")):FindFirstChild(v7("\165\11\79\83\240","\128\236\101\63\38\132\33"));if v84 then local v91=0 + 0 ;while true do if ((1322 -(1249 + 73))==v91) then firetouchinterest(v84,v54.Character:WaitForChild(v7("\132\188\28\69\184\228\198\168\155\30\75\162\219\206\190\189","\175\204\201\113\36\214\139")),1);wait(0.1 + 0 );v91=1;end if (v91==(1146 -(466 + 679))) then firetouchinterest(v84,v54.Character:WaitForChild(v7("\111\217\56\221\10\72\197\49\238\11\72\216\5\221\22\83","\100\39\172\85\188")),0);break;end end else print(v7("\128\119\183\133\42\142\119\181\140\54\174\108\182\146\125\132\118\169\149\39\237\118\182\192\54\163\123\182\142\39\191\121\189\143\115\168\118\249\133\63\237\72\181\143\39\237\121\186\148\38\172\116\247","\83\205\24\217\224"));task.wait(11 -6 );end break;end end end break;end if (v67==0) then local v81=0 -0 ;while true do if (v81==1) then v67=1901 -(106 + 1794) ;break;end if (v81==(0 + 0)) then v52= not v52;v36.BackgroundColor3=(v52 and Color3.fromRGB(0,65 + 190 ,0 -0 )) or Color3.fromRGB(270 -170 ,214 -(4 + 110) ,684 -(57 + 527) ) ;v81=1428 -(41 + 1386) ;end end end end end v36.MouseButton1Click:Connect(v60);v44.MouseButton1Click:Connect(v59);game:GetService(v7("\214\201\204\36\227\215\222","\93\134\165\173")).LocalPlayer.Idled:Connect(function() local v68=103 -(17 + 86) ;local v69;while true do if (v68==(0 + 0)) then v69=0 -0 ;while true do if (v69==0) then game:GetService(v7("\136\251\211\214\47\207\190\75\173\247\211","\30\222\146\161\162\90\174\210")):CaptureController();game:GetService(v7("\211\71\98\30\240\79\124\63\246\75\98","\106\133\46\16")):ClickButton2(Vector2.new());break;end end break;end end end);
