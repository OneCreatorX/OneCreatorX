--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.4) ~  Much Love, Ferib 

]]--

local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v33,v34) local v35={};for v51=1, #v33 do v6(v35,v0(v4(v1(v2(v33,v51,v51 + 1 )),v1(v2(v34,1 + (v51% #v34) ,1 + (v51% #v34) + 1 )))%256 ));end return v5(v35);end local v8=game:GetService(v7("\225\207\218\60\227\169\212","\126\177\163\187\69\134\219\167"));local v9=v8.LocalPlayer;local v10=v9:WaitForChild(v7("\19\193\43\220\249\49\234\63\204","\156\67\173\74\165"));local v11;for v36,v37 in ipairs(v10:GetChildren()) do if (v37:IsA(v7("\7\180\91\19\185\40\97\33\190","\38\84\215\41\118\220\70")) and  not v37.ResetOnSpawn and v37.Enabled) then v11=v37;break;end end if  not v11 then local v52=0 -0 ;while true do if (v52==(1 + 0)) then v11.Enabled=true;break;end if (v52==(0 + 0)) then v11=Instance.new(v7("\99\21\48\23\251\94\49\55\27","\158\48\118\66\114"),v10);v11.ResetOnSpawn=false;v52=837 -(660 + 176) ;end end end local v12=Instance.new(v7("\141\54\17\59\118","\155\203\68\112\86\19\197"),v11);v12.Name=v7("\101\251","\152\38\189\86\156\32\24\133");v12.Size=UDim2.new(0 + 0 ,452 -(14 + 188) ,675 -(534 + 141) ,61 + 89 );v12.Position=UDim2.new(0.5 + 0 , -125,0.3, -(58 + 2));v12.BackgroundColor3=Color3.fromRGB(84 -44 ,31 -11 ,10);v12.BorderSizePixel=2 -1 ;v12.Style=Enum.FrameStyle.DropShadow;v12.Active=true;v12.Draggable=true;local v22=Instance.new(v7("\200\82\191\82\208\86\165\67\240","\38\156\55\199"),v12);v22.Name="T";v22.Text=v7("\145\73\38\8\60\122\255\96\186\120\125\60\28\102\194","\35\200\29\28\72\115\20\154");v22.Size=UDim2.new(1 + 0 ,0 + 0 ,396 -(115 + 281) ,69 -39 );v22.Position=UDim2.new(0 + 0 ,0 -0 ,0,0 -0 );v22.BackgroundColor3=Color3.fromRGB(897 -(550 + 317) ,43 -13 ,30);v22.TextColor3=Color3.fromRGB(358 -103 ,255,712 -457 );v22.Font=Enum.Font.GothamBold;v22.TextSize=305 -(134 + 151) ;local function v32() local v38=1665 -(970 + 695) ;local v39;local v40;local v41;local v42;local v43;local v44;local v45;local v46;local v47;local v48;local v49;local v50;while true do if (v38==(1 -0)) then local v53=1990 -(582 + 1408) ;while true do if (v53==0) then v43.Text=v7("\143\198\219\15\1\63\252\228\214\7\7\27\189\208\196","\75\220\163\183\106\98");v43.Size=UDim2.new(3 -2 ,0 -0 ,0 -0 ,1854 -(1195 + 629) );v53=1 -0 ;end if (v53==3) then v43.TextSize=255 -(187 + 54) ;v38=2;break;end if (v53==1) then v43.Position=UDim2.new(0,780 -(162 + 618) ,0.27 + 0 ,0 + 0 );v43.BackgroundColor3=Color3.fromRGB(50,106 -56 ,50);v53=2 -0 ;end if (v53==(1 + 1)) then v43.TextColor3=Color3.fromRGB(255,1891 -(1373 + 263) ,1255 -(451 + 549) );v43.Font=Enum.Font.Gotham;v53=1 + 2 ;end end end if (v38==0) then v39=nil;v40=false;v41=game:GetService(v7("\52\190\195\212\136\56\36\21\190\210\218\190\41\38\15\182\210\218","\84\121\223\177\191\237\76")):GetDeveloperProductsAsync():GetCurrentPage();v42={};for v84,v85 in pairs(v41) do table.insert(v42,v85.Name);end v43=Instance.new(v7("\143\83\209\180\24\69\36\213\180\88","\161\219\54\169\192\90\48\80"),v12);v43.Name=v7("\109\102","\69\41\34\96");v38=1 -0 ;end if (v38==(2 -0)) then v44=Instance.new(v7("\49\185\153\56\213\14\179\133\48\255\16\187\134\50","\185\98\218\235\87"),v43);v44.Name=v7("\239\24\10","\202\171\92\71\134\190");v44.Size=UDim2.new(1385 -(746 + 638) ,0 + 0 ,7 -2 ,0);v44.Position=UDim2.new(341 -(218 + 123) ,0,1583.3 -(1535 + 46) ,30 + 0 );v44.BackgroundColor3=Color3.fromRGB(6 + 34 ,600 -(306 + 254) ,3 + 37 );v44.BorderSizePixel=0 -0 ;v44.ScrollBarThickness=8;v38=3;end if (v38==6) then v49=Instance.new(v7("\98\45\71\44\7\75\236\66\39\81","\152\54\72\63\88\69\62"),v12);v49.Name=v7("\224\230","\60\180\164\142");v49.Text=v7("\121\75\17\38\103\207\7\65\4\69\6\1\203","\114\56\62\101\73\71\141");v49.Size=UDim2.new(1467.5 -(899 + 568) , -(4 + 1),0,72 -42 );v49.Position=UDim2.new(603.5 -(268 + 335) ,295 -(60 + 230) ,0.2,40);v49.BackgroundColor3=Color3.fromRGB(622 -(426 + 146) ,50,6 + 44 );v49.TextColor3=Color3.fromRGB(255,255,255);v38=1463 -(282 + 1174) ;end if (v38==4) then v46=nil;function v46() if v39 then game:GetService(v7("\33\207\76\121\123\99\227\235\13\205\91\65\123\101\229\238\15\203","\135\108\174\62\18\30\23\147")):SignalPromptProductPurchaseFinished(game.Players.LocalPlayer.UserId,v39,true);end end v47=nil;function v47() v40= not v40;v49.Text=(v40 and v7("\151\252\62\196\88\140\38\222\236\169\5\229","\167\214\137\74\171\120\206\83")) or v7("\203\209\39\73\247\231\169\229\43\7\184\136\173\214","\199\235\144\82\61\152") ;if (v39 and v40) then while v40 do local v112=811 -(569 + 242) ;while true do if (v112==(0 -0)) then game:GetService(v7("\42\23\171\32\2\2\169\39\6\21\188\24\2\4\175\34\4\19","\75\103\118\217")):SignalPromptProductPurchaseFinished(game.Players.LocalPlayer.UserId,v39,true);task.wait(0.1 + 0 );break;end end end end end v48=Instance.new(v7("\243\81\104\0\155\11\211\64\127\26","\126\167\52\16\116\217"),v12);v48.Name=v7("\234\12","\156\168\78\64\224\212\121");v48.Text=v7("\37\251\188\142\32\222\164\221\20\174\237\159\78","\174\103\142\197");v38=1029 -(706 + 318) ;end if (v38==5) then local v69=1251 -(721 + 530) ;while true do if (v69==2) then v48.Font=Enum.Font.Gotham;v48.TextSize=1285 -(945 + 326) ;v69=7 -4 ;end if (v69==(0 + 0)) then v48.Size=UDim2.new(700.5 -(271 + 429) , -(5 + 0),0,1530 -(1408 + 92) );v48.Position=UDim2.new(1086 -(461 + 625) ,1288 -(993 + 295) ,0.2 + 0 ,1211 -(418 + 753) );v69=1;end if (v69==(2 + 1)) then v48.MouseButton1Click:Connect(v46);v38=1 + 5 ;break;end if (v69==(1 + 0)) then v48.BackgroundColor3=Color3.fromRGB(50,13 + 37 ,50);v48.TextColor3=Color3.fromRGB(255,784 -(406 + 123) ,2024 -(1749 + 20) );v69=2;end end end if (v38==(2 + 6)) then v50.Size=UDim2.new(0.5, -5,1322 -(1249 + 73) ,11 + 19 );v50.Position=UDim2.new(1145.25 -(466 + 679) ,11 -6 ,0.45 -0 ,1940 -(106 + 1794) );v50.BackgroundColor3=Color3.fromRGB(16 + 34 ,13 + 37 ,50);v50.TextColor3=Color3.fromRGB(255,255,752 -497 );v50.Font=Enum.Font.Gotham;v50.TextSize=37 -23 ;v50.FocusLost:Connect(function() v9(v50.Text);end);break;end if ((117 -(4 + 110))==v38) then v44.ScrollingDirection=Enum.ScrollingDirection.Y;v44.CanvasSize=UDim2.new(584 -(57 + 527) ,0,1427 -(41 + 1386) , #v42 * 30 );for v87,v88 in ipairs(v42) do local v89=103 -(17 + 86) ;local v90;while true do if (v89==0) then v90=Instance.new(v7("\29\196\52\156\11\212\56\156\38\207","\232\73\161\76"),v44);v90.Name=v7("\148\251","\126\219\185\34\61");v89=1 + 0 ;end if (v89==(3 -1)) then v90.Position=UDim2.new(0,0 -0 ,0,(v87-(167 -(122 + 44))) * 30 );v90.BackgroundColor3=Color3.fromRGB(86 -36 ,165 -115 ,41 + 9 );v89=1 + 2 ;end if (v89==4) then v90.TextSize=14;v90.MouseButton1Click:Connect(function() local v121=0 -0 ;while true do if (v121==0) then v39=v41[v87].ProductId;v44.Visible=false;break;end end end);break;end if (v89==3) then local v117=65 -(30 + 35) ;while true do if (v117==0) then local v122=0 + 0 ;while true do if (v122==(1257 -(1043 + 214))) then v90.TextColor3=Color3.fromRGB(963 -708 ,1467 -(323 + 889) ,686 -431 );v90.Font=Enum.Font.Gotham;v122=1;end if (v122==(581 -(361 + 219))) then v117=321 -(53 + 267) ;break;end end end if ((1 + 0)==v117) then v89=417 -(15 + 398) ;break;end end end if ((983 -(18 + 964))==v89) then v90.Text=v88;v90.Size=UDim2.new(3 -2 ,0 + 0 ,0 + 0 ,880 -(20 + 830) );v89=2;end end end v44.Visible=false;v45=nil;function v45() v44.Visible= not v44.Visible;end v43.MouseButton1Click:Connect(v45);v38=4 + 0 ;end if (v38==(133 -(116 + 10))) then local v81=0;while true do if (v81==0) then v49.Font=Enum.Font.Gotham;v49.TextSize=14;v81=1;end if (v81==3) then v50.Text=v7("\17\42\194\238\175\42\11","\202\88\110\226\166");v38=1 + 7 ;break;end if (v81==(740 -(542 + 196))) then v50=Instance.new(v7("\140\236\195\208\154\230\195","\164\216\137\187"),v12);v50.Name=v7("\230\196\41","\107\178\134\81\210\198\158");v81=6 -3 ;end if (v81==1) then v49.MouseButton1Click:Connect(v47);function v9(v120) v39=v120;end v81=1 + 1 ;end end end end end v32();
