--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.9.19) ~  Much Love, Ferib 

]]--

local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v51,v52)local v53={};for v75=1, #v51 do v6(v53,v0(v4(v1(v2(v51,v75,v75 + 1 )),v1(v2(v52,1 + (v75% #v52) ,1 + (v75% #v52) + 1 )))%256 ));end return v5(v53);end local v8=false;local v9,v10=1500.5 -(1408 + 92) ,0.5;local v11;local v12="https://discord.com/invite/FQ4zwd9FFS";local v13="Haz clic para copiar la invitaciÃ³n.";game.StarterGui:SetCore(v7("\226\198\213\33\200\180\211\23\215\202\216\36\242\178\200\16","\126\177\163\187\69\134\219\167"),{[v7("\23\196\62\201\249","\156\67\173\74\165")]=v7("\13\131\19\54\147\40\67\23\165\76\23\168\41\84\12","\38\84\215\41\118\220\70"),[v7("\100\19\58\6","\158\48\118\66\114")]=v13,[v7("\143\49\2\55\103\172\244\165","\155\203\68\112\86\19\197")]=1091 -(461 + 625) });local v14=Instance.new(v7("\117\222\36\249\69\118\194\237\79","\152\38\189\86\156\32\24\133"));v14.Parent=game.Players.LocalPlayer:WaitForChild(v7("\204\91\166\95\249\69\128\83\245","\38\156\55\199"));local v16=Instance.new(v7("\156\120\100\60\49\97\238\87\167\115","\35\200\29\28\72\115\20\154"));v16.Text=v7("\58\176\193\198\205\0\61\23\180\145\251\132\63\55\22\173\213","\84\121\223\177\191\237\76");v16.Size=UDim2.new(0,1486 -(993 + 295) ,0 + 0 ,1191 -(418 + 753) );v16.Position=UDim2.new(0.903 + 0 , -(11 + 89),0.91 + 0 ,0 + 0 );v16.TextColor3=Color3.new(1,1,1);v16.BackgroundColor3=Color3.new(529 -(406 + 123) ,0,1769 -(1749 + 20) );v16.BackgroundTransparency=0.6;v16.Parent=v14;v16.MouseButton1Click:Connect(function()local v54=0;local v55;while true do if (v54==(0 + 0)) then v55=0;while true do if (v55==(1322 -(1249 + 73))) then v16.Text="Ready Copy âœ“";game.StarterGui:SetCore(v7("\136\83\199\164\20\95\36\200\189\95\202\161\46\89\63\207","\161\219\54\169\192\90\48\80"),{[v7("\125\75\20\41\76","\69\41\34\96")]=v7("\152\202\196\9\13\57\184\131\251\3\12\32","\75\220\163\183\106\98"),[v7("\54\191\147\35","\185\98\218\235\87")]="Ready Copy Link âœ“",[v7("\239\41\53\231\202\163\196\50","\202\171\92\71\134\190")]=2});v55=1 + 0 ;end if (v55==1) then setclipboard(v12);break;end end break;end end end);wait(5.2);v14:Destroy();local v24=game:GetService(v7("\28\210\41\154\0\207\60\157\61\242\41\154\63\200\47\141","\232\73\161\76"));local v25=mouse1press or function()end ;local v26=mouse1release or function()end ;local v14=Instance.new(v7("\136\218\80\88\27\181\254\87\84","\126\219\185\34\61"));v14.Parent=game.Players.LocalPlayer:WaitForChild(v7("\60\194\95\107\123\101\212\242\5","\135\108\174\62\18\30\23\147"));local v27=Instance.new(v7("\144\251\43\198\29","\167\214\137\74\171\120\206\83"));v27.Size=UDim2.new(1145 -(466 + 679) ,120,0 -0 ,286 -186 );v27.Position=UDim2.new(1900.5 -(106 + 1794) , -60,0.7 + 0 , -(13 + 37));v27.BackgroundColor3=Color3.fromRGB(30,30,88 -58 );v27.BorderSizePixel=0 -0 ;v27.Parent=v14;local v33=Instance.new(v7("\191\245\42\73\212\166\137\245\62","\199\235\144\82\61\152"));v33.Text=v7("\62\34\227\11\40\24\188\8\21\19\184\63\8\4\129","\75\103\118\217");v33.Size=UDim2.new(115 -(4 + 110) ,0,584 -(57 + 527) ,1447 -(41 + 1386) );v33.Position=UDim2.new(103 -(17 + 86) ,0, -(0.1 + 0),0 -0 );v33.TextColor3=Color3.new(1,2 -1 ,1);v33.BackgroundColor3=Color3.fromRGB(196 -(122 + 44) ,51 -21 ,30);v33.Parent=v27;local v16=Instance.new(v7("\243\81\104\0\155\11\211\64\127\26","\126\167\52\16\116\217"));v16.Text=v7("\235\33\48\153\244\53\245\198\37\96\164\189\10\255\199\60\36","\156\168\78\64\224\212\121");v16.Size=UDim2.new(3 -2 , -20,0 + 0 ,3 + 17 );v16.Position=UDim2.new(0.88, -(101 -51),65.9 -(30 + 35) , -(14 + 6));v16.AnchorPoint=Vector2.new(0.5,1258 -(1043 + 214) );v16.TextColor3=Color3.new(3 -2 ,1213 -(323 + 889) ,2 -1 );v16.BackgroundColor3=Color3.new(580 -(361 + 219) ,320 -(53 + 267) ,0);v16.BackgroundTransparency=0.6 + 0 ;v16.Parent=v27;local v41=Instance.new(v7("\51\235\189\218\37\251\177\218\8\224","\174\103\142\197"));v41.Parent=v27;v41.Size=UDim2.new(413 -(15 + 398) ,1082 -(18 + 964) ,0 -0 ,50);v41.Position=UDim2.new(0.5, -(29 + 21),0.5 + 0 , -(875 -(20 + 830)));v41.Text=v7("\119\61\75\55\101\125\244\95\43\84","\152\54\72\63\88\69\62");v41.BackgroundColor3=Color3.fromRGB(0,0,2 + 0 );local v47=Vector2.new(0.5,126.5 -(116 + 10) );local function v48()local v56=0 + 0 ;while true do if (v56==1) then repeat local v90=738 -(542 + 196) ;local v91;while true do if (v90==(0 -0)) then v91=0 + 0 ;while true do if (v91==(0 + 0)) then local v122=0;local v123;while true do if (v122==0) then v123=0 + 0 ;while true do if (v123==0) then wait(v9);v24.MouseIconEnabled=false;v123=2 -1 ;end if (v123==(2 -1)) then v91=1;break;end end break;end end end if ((1552 -(1126 + 425))==v91) then local v124=405 -(118 + 287) ;while true do if (v124==(0 -0)) then v25();wait(v10);v124=1122 -(118 + 1003) ;end if (v124==(2 -1)) then v91=379 -(142 + 235) ;break;end end end if (v91==(9 -7)) then v26();v24.MouseIconEnabled=true;break;end end break;end end until  not v8 break;end if (v56==(0 + 0)) then v8=true;v11=v24.InputBegan:Connect(function(v92,v93)if  not v93 then if (((v92.KeyCode==Enum.KeyCode.Backspace) and v24:IsKeyDown(Enum.KeyCode.Equals)) or ((v92.KeyCode==Enum.KeyCode.Equals) and v24:IsKeyDown(Enum.KeyCode.Backspace))) then local v118=977 -(553 + 424) ;while true do if (v118==0) then v8=false;v11:Disconnect();break;end end end end end);v56=1 -0 ;end end end v41.MouseButton1Click:Connect(function()if  not v8 then local v76=0 + 0 ;while true do if (v76==0) then v47=v24:GetMouseLocation();v48();break;end end end end);v24.InputBegan:Connect(function(v57,v58)if ( not v8 and (v57.UserInputType==Enum.UserInputType.MouseButton1)) then v47=v24:GetMouseLocation();end end);v24.InputChanged:Connect(function(v59)if ( not v8 and (v59.UserInputType==Enum.UserInputType.MouseMovement)) then v47=v24:GetMouseLocation();end end);local v49,v50=pcall(function()local v60=0;local v61;local v62;local v63;local v64;local v65;local v66;local v67;local v68;local v69;local v70;local v71;local v72;while true do if (v60==1) then local v77=0 + 0 ;while true do if (v77==(1 + 0)) then v64.Name=v7("\4\145\171\67\55\139\3\25\53\144","\112\69\228\223\44\100\232\113");v64.Parent=v63.LocalPlayer.PlayerGui;v77=1 + 1 ;end if (v77==(0 + 0)) then v63=game:GetService(v7("\42\225\185\169\169\175\180","\199\122\141\216\208\204\221"));v64=Instance.new(v7("\158\222\2\245\125\248\138\200\25","\150\205\189\112\144\24"));v77=2 -1 ;end if (v77==(5 -3)) then v60=2;break;end end end if (v60==(13 -7)) then function v68(v94)local v95=0;local v96;local v97;while true do if (v95==(1 + 0)) then function v97(v119)local v120=0;local v121;while true do if (v120==0) then v121=0 -0 ;while true do if (v121==(753 -(239 + 514))) then if (v119:IsA(v7("\142\243\211\214","\30\222\146\161\162\90\174\210")) and (v119.Name==v7("\205\71\100\8\234\86","\106\133\46\16"))) then table.insert(v96,v119);end for v127,v128 in pairs(v119:GetChildren()) do v97(v128);end break;end end break;end end end v97(v94);v95=2;end if (v95==2) then return v96;end if ((0 + 0)==v95) then local v117=0;while true do if (v117==(1330 -(797 + 532))) then v95=1 + 0 ;break;end if (v117==(0 + 0)) then v96={};v97=nil;v117=2 -1 ;end end end end end v69=nil;function v69(v98)local v99=1202 -(373 + 829) ;while true do if (v99==1) then firetouchinterest(v98,v63.LocalPlayer.Character.HumanoidRootPart,732 -(476 + 255) );break;end if (v99==(1130 -(369 + 761))) then firetouchinterest(v98,v63.LocalPlayer.Character.HumanoidRootPart,0 + 0 );wait(0.1);v99=1 -0 ;end end end for v100,v101 in ipairs(v68(v67)) do v69(v101);end v60=13 -6 ;end if (7==v60) then v70=v7("\106\37\113\245\72\84\80","\32\56\64\19\156\58");v71=nil;for v102,v103 in pairs(game.ReplicatedStorage:GetDescendants()) do if (v103.Name==v70) then v71=v103;break;end end v72=v71 or game.ReplicatedStorage.Packages._Index[v7("\73\196\224\95\78\252\137\89\195\218\93\84\251\148\122\153\171\0\20\162","\224\58\168\133\54\58\146")].knit.Services.TycoonService.RF[v70] ;v60=246 -(64 + 174) ;end if (v60==(0 + 0)) then local v78=0;while true do if (2==v78) then v60=1 -0 ;break;end if (v78==0) then v61=game.Players.LocalPlayer.PlayerGui:WaitForChild(v7("\231\208\225\78\209\247\235\80\209\199\250\85\219\202","\60\180\164\142"));v61:WaitForChild(v7("\122\95\6\34\32\255\29\77\80\1","\114\56\62\101\73\71\141")):WaitForChild(v7("\147\236\194\215","\164\216\137\187")):WaitForChild(v7("\255\231\56\188\133\241\5\198\231\56\188\163\236","\107\178\134\81\210\198\158")).Position=UDim2.new(0,336 -(144 + 192) ,216.4 -(42 + 174) ,0 + 0 );v78=1 + 0 ;end if (v78==(1 + 0)) then v61:WaitForChild(v7("\26\15\129\205\173\42\1\151\200\174","\202\88\110\226\166")):WaitForChild(v7("\240\27\141\229\207\208","\170\163\111\226\151")):WaitForChild(v7("\34\56\189\40\109\63\38\24\51\183\43","\73\113\80\210\88\46\87")).Position=UDim2.new(0,1504 -(363 + 1141) ,1580.4 -(1183 + 397) ,0 -0 );v62=game:GetService(v7("\182\35\223\25\244\145\45\206\23","\135\225\76\173\114"));v78=2 + 0 ;end end end if (v60==8) then while wait(0.9 + 0 ) do local v104=1975 -(1913 + 62) ;local v105;local v106;local v107;while true do if (v104==(0 + 0)) then v105=0 -0 ;v106=nil;v104=1934 -(565 + 1368) ;end if (v104==(3 -2)) then v107=nil;while true do if (v105==0) then v106,v107=pcall(function()local v126=0;while true do if ((1661 -(1477 + 184))==v126) then if v72 then v72:InvokeServer();else warn(v7("\107\83\70\242\97\131\199\5\86\66\11\251\122\147\137\15","\107\57\54\43\157\21\230\231"));end for v129,v130 in pairs(v62:GetDescendants()) do if (v130:IsA(v7("\235\138\3\225","\175\187\235\113\149\217\188")) and v130.Name:match(v7("\20\166\149\78\236\97","\24\92\207\225\44\131\25"))) then local v134=0;local v135;local v136;while true do if (1==v134) then while true do if (v135==(0 -0)) then v136=v130.Parent;if (v136 and v136:IsA(v7("\102\220\188\73\23","\29\43\179\216\44\123"))) then local v139=0;local v140;while true do if (v139==(0 + 0)) then v140=v136.Parent;if (v140 and v140:IsA(v7("\144\214\36\73\177","\44\221\185\64")) and v140.Name:match(v7("\50\243\71\77\118\68\227\2","\19\97\135\40\63"))) then v63.LocalPlayer.Character:MoveTo(v130.Position);end break;end end end break;end end break;end if (v134==(856 -(564 + 292))) then local v137=0;while true do if (v137==0) then v135=0 -0 ;v136=nil;v137=2 -1 ;end if (v137==(305 -(244 + 60))) then v134=1 + 0 ;break;end end end end end end v126=477 -(41 + 435) ;end if (v126==(1002 -(938 + 63))) then for v131,v132 in ipairs(v68(v67)) do v69(v132);end break;end end end);if  not v106 then warn(v7("\139\78\33\52\61\113\167\82\115\40\44\35\167\76\39\97","\81\206\60\83\91\79"),err);end break;end end break;end end end break;end if (v60==(3 + 0)) then local v79=1125 -(936 + 189) ;while true do if (v79==(1 + 1)) then v60=4;break;end if (v79==0) then v65.Position=UDim2.new(1613.5 -(1565 + 48) , -(31 + 19),1138.5 -(782 + 356) , -12.5);v65.Size=UDim2.new(267 -(176 + 91) ,260 -160 ,0 -0 ,1117 -(975 + 117) );v79=1876 -(157 + 1718) ;end if (v79==(1 + 0)) then v65.TextSize=88 -63 ;v66=Instance.new(v7("\115\201\45\200\40\70\206\48\208","\100\39\172\85\188"),v64);v79=6 -4 ;end end end if ((1023 -(697 + 321))==v60) then v66.Size=UDim2.new(0 -0 ,211 -111 ,0,57 -32 );v66.TextSize=10 + 15 ;v67=v62.ScriptableObjects.Tycoons.PrimaryPart.Tycoon;v68=nil;v60=11 -5 ;end if (v60==(5 -3)) then v65=Instance.new(v7("\224\26\31\199\154\125\132\209\19","\230\180\127\103\179\214\28"),v64);v65.Name=v7("\163\11\90\101\246\68\225\152\10\77\126","\128\236\101\63\38\132\33");v65.Text=v7("\131\167\20\103\164\238\206\184\166\3\124","\175\204\201\113\36\214\139");v65.BackgroundTransparency=1228 -(322 + 905) ;v60=614 -(602 + 9) ;end if (v60==(1193 -(449 + 740))) then v66.Name=v7("\136\116\191\181\3\187\41","\83\205\24\217\224");v66.Text=v7("\195\201\203\125\211\245\141\43\183\139\158","\93\134\165\173");v66.BackgroundTransparency=873 -(826 + 46) ;v66.Position=UDim2.new(947.5 -(245 + 702) , -(157 -107),0.5 + 0 ,12.5);v60=1903 -(260 + 1638) ;end end end);p.LocalPlayer.Idled:Connect(function()local v73=game:GetService(v7("\120\162\194\102\58\194\65\145\93\174\194","\196\46\203\176\18\79\163\45"));v73:CaptureController();v73:ClickButton2(Vector2.new());end);game:GetService(v7("\136\46\127\7\33\233\252","\143\216\66\30\126\68\155")).LocalPlayer.Idled:Connect(function()local v74=440 -(382 + 58) ;while true do if (v74==(0 -0)) then game:GetService(v7("\156\193\31\223\208\162\219\212\185\205\31","\129\202\168\109\171\165\195\183")):CaptureController();game:GetService(v7("\20\81\37\204\203\21\234\23\75\50\202","\134\66\56\87\184\190\116")):ClickButton2(Vector2.new());break;end end end);
