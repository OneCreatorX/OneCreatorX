--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.9.19) ~  Much Love, Ferib 

]]--

local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v141,v142)local v143={};for v184=1, #v141 do v6(v143,v0(v4(v1(v2(v141,v184,v184 + 1 )),v1(v2(v142,1 + (v184% #v142) ,1 + (v184% #v142) + 1 )))%256 ));end return v5(v143);end local v8=game.Players.LocalPlayer;local v9=Instance.new(v7("\226\192\201\32\227\181\224\11\216","\126\177\163\187\69\134\219\167"),v8.PlayerGui);local v10=v8:WaitForChild(v7("\19\193\43\220\249\49\234\63\204","\156\67\173\74\165"));local v11=v10:WaitForChild(v7("\27\185\122\21\174\35\67\58\149\92\2\168\41\72\39","\38\84\215\41\118\220\70"));local v12=game.Players.LocalPlayer;local v13=game.Workspace;local v14=v12.PlayerScripts;local v15=game:GetService(v7("\98\19\50\30\247\83\23\54\23\250\99\2\45\0\255\87\19","\158\48\118\66\114"));local v16=v12:WaitForChild(v7("\155\40\17\47\118\183\220\190\45","\155\203\68\112\86\19\197"));local v17=v12.PlayerScripts.PlayerPetHandler;local v18=Instance.new(v7("\100\212\56\248\65\122\233\253\99\203\51\242\84","\152\38\189\86\156\32\24\133"));local v19=v17.Disabled;v17.Disabled=true;local function v21()if (v17.Disabled~=v19) then local v191=0;while true do if (v191==0) then v19=v17.Disabled;if  not v19 then local v223=1263 -(1083 + 180) ;while true do if (v223==(0 -0)) then v18:Fire();v17.Disabled=true;break;end end end break;end end end end v21();local v22=Instance.new(v7("\218\69\166\75\249","\38\156\55\199"),v9);v22.Size=UDim2.new(336 -(144 + 192) ,220,0,310);v22.Position=UDim2.new(216.23 -(42 + 174) ,0,0 + 0 , -34);v22.BackgroundColor3=Color3.fromRGB(25 + 5 ,30,30);v22.BorderSizePixel=0;v22.Active=true;v22.Draggable=true;local v29=Instance.new(v7("\156\120\100\60\63\117\248\70\164","\35\200\29\28\72\115\20\154"),v22);v29.Text=v7("\32\139\139\255\162\34\49\58\173\212\222\153\35\38\33","\84\121\223\177\191\237\76");v29.Size=UDim2.new(0,85 + 115 ,0,1524 -(363 + 1141) );v29.Position=UDim2.new(0.5, -(1670 -(1183 + 397)),1, -(60 -40));v29.TextColor3=Color3.new(1,1 + 0 ,1);v29.BackgroundColor3=Color3.new(30/(191 + 64) ,30/(2230 -(1913 + 62)) ,(19 + 11)/255 );v29.BorderSizePixel=0;v29.Font=Enum.Font.SourceSans;v29.TextSize=47 -29 ;local v16=v12:WaitForChild(v7("\139\90\200\185\63\66\23\212\178","\161\219\54\169\192\90\48\80"));local v39=v16:WaitForChild(v7("\125\71\13\53\69\71\53\12","\69\41\34\96"));local v40=v39:WaitForChild(v7("\154\209\214\7\7","\75\220\163\183\106\98"));local v41=Instance.new(v7("\54\191\147\35\251\23\174\159\56\215","\185\98\218\235\87"),v22);v41.Name=v7("\248\57\36\244\219\190\233\41\51\242\209\164","\202\171\92\71\134\190");v41.Size=UDim2.new(0,1983 -(565 + 1368) ,0 -0 ,20);v41.Position=UDim2.new(0.35,10,0,1701 -(1477 + 184) );v41.BackgroundTransparency=1 -0 ;v41.Text=v7("\4\206\62\141\105\238\60\139\32\206\34\155","\232\73\161\76");v41.TextColor3=Color3.new(1,1 + 0 ,857 -(564 + 292) );v41.BackgroundColor3=Color3.new(30/255 ,30/(439 -184) ,(90 -60)/255 );v41.BorderSizePixel=0;v41.Font=Enum.Font.SourceSans;v41.TextSize=318 -(244 + 60) ;v41.MouseButton1Click:Connect(function()local v144=0 + 0 ;while true do if (v144==0) then v39.Enabled=true;v40.Visible=true;break;end end end);local v52=Instance.new(v7("\143\220\90\73\50\186\219\71\81","\126\219\185\34\61"),v22);v52.Size=UDim2.new(476 -(41 + 435) ,1201 -(938 + 63) ,0 + 0 ,1145 -(936 + 189) );v52.Position=UDim2.new(0,0,0 + 0 ,1613 -(1565 + 48) );v52.TextColor3=Color3.new(1,1 + 0 ,1139 -(782 + 356) );v52.BackgroundColor3=Color3.new((297 -(176 + 91))/(664 -409) ,30/255 ,(44 -14)/(1347 -(975 + 117)) );v52.BorderSizePixel=1875 -(157 + 1718) ;local v58=v8.PlayerGui.PetsPopup.Frame.GuaranteedLegendary:WaitForChild(v7("\43\219\95\96\127\121\231\226\9\202\112\103\115\117\246\245","\135\108\174\62\18\30\23\147"));local function v59()v52.Text=v7("\154\236\45\206\22\170\50\213\175\179\106","\167\214\137\74\171\120\206\83")   .. tostring(v58.Text) ;end v52.Text=v7("\167\245\53\88\246\163\138\226\43\7\184\132\135\249\49\86\184\151\142\228\33","\199\235\144\82\61\152");v58:GetPropertyChangedSignal(v7("\51\19\161\63","\75\103\118\217")):Connect(function()v59();end);local v61=Instance.new(v7("\243\81\104\0\155\11\211\64\127\26","\126\167\52\16\116\217"),v22);v61.Text="-";v61.Size=UDim2.new(0,17 + 3 ,0,70 -50 );v61.Position=UDim2.new(3 -2 , -20,1018 -(697 + 321) ,0 -0 );v61.TextColor3=Color3.fromRGB(539 -284 ,255,587 -332 );v61.BackgroundColor3=Color3.fromRGB(30,12 + 18 ,30);v61.BorderSizePixel=0 -0 ;local v68=false;v61.MouseButton1Click:Connect(function()local v146=0 -0 ;while true do if (v146==(1227 -(322 + 905))) then local v201=611 -(602 + 9) ;while true do if (v201==(1190 -(449 + 740))) then v146=1;break;end if (v201==(872 -(826 + 46))) then v68= not v68;v22.Size=(v68 and UDim2.new(947.5 -(245 + 702) ,63 -43 ,0 + 0 ,20)) or UDim2.new(1898 -(260 + 1638) ,220,440 -(382 + 58) ,962 -662 ) ;v201=1 + 0 ;end end end if (v146==1) then v61.Text=(v68 and "+") or "-" ;for v207,v208 in ipairs(v22:GetChildren()) do if (v208:IsA(v7("\252\43\56\148\150\12\232\220\33\46","\156\168\78\64\224\212\121")) or v208:IsA(v7("\51\235\189\218\37\225\189","\174\103\142\197"))) then if (v208~=v61) then v208.Visible= not v68;end end end break;end end end);local v69=v12.Name   .. v7("\22\28\77\57\38\74\247\68","\152\54\72\63\88\69\62") ;local v70=v7("\247\214\225\76","\60\180\164\142");local v71=false;local v72=v13.Tractors:FindFirstChild(v69);local v73=v13.Crops.DungeonCrops;local v72=v13.Tractors:FindFirstChild(v69);local v74=v72:FindFirstChild(v7("\107\78\0\42\46\236\30\123\95\22\44","\114\56\62\101\73\71\141"));if  not v74 then local v185=0 -0 ;while true do if ((2 -1)==v185) then v74.Parent=v72;print(v7("\11\30\135\197\163\57\2\161\199\185\61\56\131\202\191\61\78\171\200\163\44\7\131\202\240","\202\88\110\226\166"),v74 and v74.Value );break;end if (v185==0) then local v210=1205 -(902 + 303) ;while true do if (v210==(0 -0)) then v74=Instance.new(v7("\154\230\212\200\142\232\215\209\189","\164\216\137\187"));v74.Name=v7("\225\246\52\177\175\255\7\241\231\34\183","\107\178\134\81\210\198\158");v210=2 -1 ;end if (v210==1) then v185=1;break;end end end end end local function v75(v147)local v148=0;local v149;local v150;while true do if (v148==(0 + 0)) then local v203=1690 -(1121 + 569) ;while true do if (v203==(215 -(22 + 192))) then v148=1;break;end if (v203==(683 -(483 + 200))) then v149=v147:FindFirstChild(v7("\225\0\134\238","\170\163\111\226\151"));v150=v147:FindFirstChild(v7("\34\32\183\59\71\54\37\50\49\161\61","\73\113\80\210\88\46\87"));v203=1464 -(1404 + 59) ;end end end if (v148==(2 -1)) then if (v150 and v150:IsA(v7("\163\35\194\30\209\128\32\216\23","\135\225\76\173\114")) and v150.Value) then return 2 -0 ;elseif (v149 and (v149:IsA(v7("\55\232\171\184\156\188\181\14","\199\122\141\216\208\204\221")) or v149:IsA(v7("\157\220\2\228","\150\205\189\112\144\24")))) then return 767 -(468 + 297) ;else return 563 -(334 + 228) ;end break;end end end local v76=v75(v72);local function v77(v151,v152)for v186,v187 in ipairs(v151:GetChildren()) do if (v187:IsA(v7("\8\129\172\68\52\137\3\4","\112\69\228\223\44\100\232\113")) and (v187.Name==v152) and (v187.Transparency<(3 -2))) then local v204=0 -0 ;while true do if (v204==(0 -0)) then if v71 then local v227=0 + 0 ;local v228;local v229;local v230;local v231;local v232;while true do if (v227==(239 -(141 + 95))) then if ((v229<=(344 + 6)) and (math.abs(v228-v230 )<=(77 -47))) then local v247=0 -0 ;local v248;while true do if ((0 + 0)==v247) then v248=0 -0 ;while true do if ((1 + 0)==v248) then v77(v151,v152);break;end if (v248==0) then v72:SetPrimaryPartCFrame(CFrame.new(Vector3.new(v231,v228,v232)));repeat wait(0.1 + 0 );until v187.Transparency>=(1 -0)  v248=1;end end break;end end end break;end if (2==v227) then v231,v232=nil;if ((v76==1) or ((v76==(2 + 0)) and  not v74.Value)) then local v249=0;local v250;while true do if (v249==0) then v250=0;while true do if ((163 -(92 + 71))==v250) then v231=v187.Position.X;v232=v187.Position.Z + 11 ;break;end end break;end end elseif ((v76==(1 + 1)) and v74.Value) then v231=v187.Position.X + 11 ;v232=v187.Position.Z;end v227=4 -1 ;end if (v227==(765 -(574 + 191))) then local v242=0;while true do if (v242==(1 + 0)) then v227=2 -1 ;break;end if (v242==0) then for v255,v256 in ipairs(v187:GetChildren()) do if (v256:IsA(v7("\228\30\21\199","\230\180\127\103\179\214\28")) or v256:IsA(v7("\161\0\76\78\212\64\242\152","\128\236\101\63\38\132\33"))) then v256.CanCollide=false;end end v228=v72.PrimaryPart.Position.Y;v242=1;end end end if (v227==(1 + 0)) then v229=(v72.PrimaryPart.Position-v187.Position).Magnitude;v230=v187.Position.Y;v227=851 -(254 + 595) ;end end end return;end end elseif (v187:IsA(v7("\129\166\21\65\186","\175\204\201\113\36\214\139")) or v187:IsA(v7("\97\195\57\216\1\85","\100\39\172\85\188"))) then v77(v187,v152);end end end local function v78(v153,v154)if v71 then task.wait(126.1 -(55 + 71) );v77(v73,v70);end end v73.ChildAdded:Connect(function(v155)v78(v155,true);end);local v79=Instance.new(v7("\153\125\161\148\17\184\108\173\143\61","\83\205\24\217\224"),v22);v79.Size=UDim2.new(0,20,0 -0 ,20);v79.Position=UDim2.new(1791.1 -(573 + 1217) , -50,0 -0 ,20 + 235 );v79.Text="";local v74=v72:FindFirstChild(v7("\213\213\200\62\239\196\193\30\231\214\200","\93\134\165\173"));v79.MouseButton1Click:Connect(function()if v74 then local v192=0 -0 ;while true do if (v192==0) then v74.Value= not v74.Value;v79.Text=(v74.Value and "âœ“") or "" ;break;end end end end);local v83=Instance.new(v7("\138\247\217\214\24\219\166\106\177\252","\30\222\146\161\162\90\174\210"),v22);v83.Text=v7("\196\91\100\5\165\106\101\4\226\75\127\4\165\120\62\88\165\97\86\44","\106\133\46\16");v83.Size=UDim2.new(939 -(714 + 225) ,493 -324 ,0 -0 ,3 + 17 );v83.Position=UDim2.new(0.5 -0 , -(896 -(118 + 688)),48 -(25 + 23) ,255);local function v87()local v156=0;local v157;while true do if (v156==(0 + 0)) then v157=1886 -(927 + 959) ;while true do if (v157==1) then if v71 then local v233=0;local v234;while true do if ((0 -0)==v233) then v234=732 -(16 + 716) ;while true do if (v234==(0 -0)) then v14.TankController.Disabled=true;v14.CropFarmingEffects.Disabled=true;v234=98 -(11 + 86) ;end if (v234==1) then v15.Events.DungeonEvent:FireServer(v7("\106\66\74\239\97\162\146\5\94\83\68\243","\107\57\54\43\157\21\230\231"));break;end end break;end end else local v235=0 -0 ;local v236;while true do if (v235==(286 -(175 + 110))) then v14.TankController.Disabled=false;break;end if (v235==0) then local v246=0 -0 ;while true do if (v246==0) then v236={[1]=v7("\254\147\24\225","\175\187\235\113\149\217\188")};v15.Events.DungeonEvent:FireServer(unpack(v236));v246=4 -3 ;end if (v246==(1797 -(503 + 1293))) then v235=1;break;end end end end end break;end if ((0 -0)==v157) then v71= not v71;v83.Text=(v71 and v7("\121\53\103\243\26\100\77\46\116\249\85\78\24\22\61\174\26\111\118","\32\56\64\19\156\58")) or v7("\123\221\241\89\26\214\149\84\207\224\89\84\178\182\20\154\165\121\124\212","\224\58\168\133\54\58\146") ;v157=1;end end break;end end end v83.MouseButton1Click:Connect(v87);local v88=v16:WaitForChild(v7("\24\186\143\75\230\118\118\17\174\136\66","\24\92\207\225\44\131\25"));local v89=v88.Frame.Wave.WaveNumber;local v90=Instance.new(v7("\127\214\160\88\57\114\83","\29\43\179\216\44\123"),v22);v90.Text=v7("\138\216\54\73","\44\221\185\64");v90.Size=UDim2.new(0,19 + 6 ,0,20);v90.Position=UDim2.new(1061.3 -(810 + 251) , -50,0 + 0 ,255);v90.TextColor3=Color3.new(0.5 + 0 ,0 + 0 ,533 -(43 + 490) );v90.PlaceholderText=v7("\54\230\94\90","\19\97\135\40\63");local function v96()local v158=733 -(711 + 22) ;local v159;local v160;local v161;while true do if (v158==(0 -0)) then v159=tonumber(v90.Text);v160,v160,v161=string.find(v89.Text,v7("\153\93\37\62\117\113\230\25\55\112\102","\81\206\60\83\91\79"));v158=860 -(240 + 619) ;end if (v158==(1 + 0)) then if (v159==tonumber(v161)) then local v216=0 -0 ;local v217;while true do if (v216==2) then v14.CropFarmingEffects.Disabled=true;v16.DungeonFinishUI.Enabled=false;v216=1 + 2 ;end if (v216==(1745 -(1344 + 400))) then task.wait(406 -(255 + 150) );v14.TankController.Disabled=true;v216=2 + 0 ;end if (v216==(2 + 1)) then task.wait(5);v15.Events.DungeonEvent:FireServer(v7("\139\54\127\12\48\223\250\182\37\123\17\42","\143\216\66\30\126\68\155"));break;end if (v216==(0 -0)) then v217={[1]=v7("\107\179\217\102","\196\46\203\176\18\79\163\45")};v15.Events.DungeonEvent:FireServer(unpack(v217));v216=1;end end end break;end end end v89:GetPropertyChangedSignal(v7("\158\205\21\223","\129\202\168\109\171\165\195\183")):Connect(v96);local function v97(v162)loadstring(v162)();end local v98={{v7("\1\84\62\219\213","\134\66\56\87\184\190\116"),'game:GetService("ReplicatedStorage").Events.DamageIncreaseOnClickEvent:FireServer()',0.1 + 0 },{v7("\15\52\5\183","\85\92\81\105\219\121\139\65"),'game:GetService("ReplicatedStorage").Events.SellBlocks:FireServer()',4},{v7("\220\160\83\64\114\219","\191\157\211\48\37\28"),'game:GetService("ReplicatedStorage").Events.AscendEvent:FireServer(true)',464 -(108 + 341) },{v7("\253\10\237\92\14\205\30\247\8\53\205","\90\191\127\148\124"),'game:GetService("ReplicatedStorage").Events.PlayerUpgradeTank:FireServer("HarvestRange")\nwait(1)\ngame:GetService("ReplicatedStorage").Events.PlayerUpgradeTank:FireServer("TractorSpeed")\nwait(1)\ngame:GetService("ReplicatedStorage").Events.PlayerUpgradeTank:FireServer("TractorPower")\nwait(1)\ngame:GetService("ReplicatedStorage").Events.PlayerUpgradeTank:FireServer("TractorEvolution")',1503 -(711 + 782) }};local v99=Instance.new(v7("\76\130\54\3\90\146\58\3\119\137","\119\24\231\78"),v22);v99.Text=v7("\173\61\160\68\156\101\22\133\109\232\10\243\102\55","\113\226\77\197\42\188\32");v99.Size=UDim2.new(0,345 -165 ,469 -(270 + 199) ,7 + 13 );v99.Position=UDim2.new(1819.5 -(580 + 1239) , -(267 -177),0,((39 + 1) * ( #v98 + 1)) + 1 + 17 );local v103=Instance.new(v7("\14\19\236\161\24\25\236","\213\90\118\148"),v22);v103.Text=v7("\120\33\161\88\89","\45\59\78\212\54");v103.Size=UDim2.new(0 + 0 ,26,0 -0 ,13 + 7 );v103.Position=UDim2.new(1.04, -(1207 -(645 + 522)),1790 -(1010 + 780) ,40 * ( #v98 + 1.43 + 0) );v103.TextColor3=Color3.new(0.5 -0 ,0 -0 ,1836 -(1045 + 791) );local v108=Instance.new(v7("\36\83\155\159\164\33\181","\144\112\54\227\235\230\78\205"),v22);v108.Text=v7("\132\39\29\240\212","\59\211\72\111\156\176");v108.Size=UDim2.new(0,65 -39 ,0 -0 ,525 -(351 + 154) );v108.Position=UDim2.new(1574.56 -(1281 + 293) , -110,266 -(28 + 238) ,(89 -49) * ( #v98 + (1560.438 -(1381 + 178))) );v108.TextColor3=Color3.new(0.5 + 0 ,0 + 0 ,0 + 0 );local v113=false;local v114=nil;local function v115(v163)v99.Text=v7("\97\151\230\35\14\162\228\42\14\202\163","\77\46\231\131")   .. ((v163 and v7("\149\122","\32\218\52\214")) or v7("\97\49\23","\58\46\119\81\200\145\208\37")) ;end local function v116()if v114 then v114=nil;end end local function v117()local v165=tonumber(v103.Text) or (0 -0) ;local v166=v108.Text or "" ;local function v167()if v113 then local v205=0 + 0 ;while true do if (v205==(470 -(381 + 89))) then v97('game:GetService("ReplicatedStorage").Events.PlayerPressedKeyOnEgg:FireServer("'   .. v166   .. '")' );task.wait(2.1 + 0 );break;end end end end while v113 do v167();if (v165>(0 + 0)) then v165=v165-(1 -0) ;if (v165==(1156 -(1074 + 82))) then break;end end end v113=false;v116();v115(false);end v99.MouseButton1Click:Connect(function()if v113 then local v193=0 -0 ;local v194;while true do if (v193==(1784 -(214 + 1570))) then v194=0;while true do if (v194==(1455 -(990 + 465))) then local v240=0;while true do if (v240==1) then v194=1;break;end if (v240==0) then v113=false;v116();v240=1;end end end if ((1 + 0)==v194) then v115(false);break;end end break;end end else v113=true;v115(true);v114=coroutine.create(v117);coroutine.resume(v114);end end);v99.MouseButton2Click:Connect(function()local v168=0 + 0 ;while true do if (v168==(0 + 0)) then v113=false;v116();v168=1;end if (v168==(3 -2)) then v115(false);break;end end end);local function v118(v169,v170)local v171=Instance.new(v7("\31\137\40\184\139\168\34\63\131\62","\86\75\236\80\204\201\221"),v22);v171.Text=v169[1727 -(1668 + 58) ]   .. v7("\50\12\55\170\216\173","\235\18\33\23\229\158") ;v171.Size=UDim2.new(626 -(512 + 114) ,180,0 -0 ,41 -21 );v171.Position=UDim2.new(0.5 -0 , -(42 + 48),0 + 0 ,((35 + 5) * (v170-(3 -2))) + (2014 -(109 + 1885)) );v171.MouseButton1Click:Connect(function()local v188=1469 -(1269 + 200) ;while true do if (v188==(1 -0)) then while v169.isLooping do local v218=815 -(98 + 717) ;local v219;while true do if ((826 -(802 + 24))==v218) then v219=0;while true do if (v219==(0 -0)) then v97(v169[2 -0 ]);task.wait(v169[1 + 2 ]);break;end end break;end end end break;end if (v188==(0 + 0)) then v169.isLooping= not v169.isLooping;v171.Text=v169[1]   .. ((v169.isLooping and v7("\16\247\129\148\126","\219\48\218\161")) or v7("\164\60\60\102\253\105","\128\132\17\28\41\187\47")) ;v188=1 + 0 ;end end end);end for v175,v176 in ipairs(v98) do v118(v176,v175);end local v119=Instance.new(v7("\53\55\30\46\127\20\38\18\53\83","\61\97\82\102\90"),v22);v119.Text=v7("\152\30\235\106\235\123\94\65\253\99\250\28\142","\105\204\78\203\43\167\55\126");v119.Size=UDim2.new(0 + 0 ,180,0 -0 ,66 -46 );v119.Position=UDim2.new(0.5 + 0 , -(37 + 53),0,((33 + 7) *  #v98) + 14 + 4 );local v123=Instance.new(v7("\145\175\59\10\49\11\223","\49\197\202\67\126\115\100\167"),v22);v123.Text=v7("\0\84\205\37\132","\62\87\59\191\73\224\54");v123.PlaceholderText="1";v123.Size=UDim2.new(0 + 0 ,1459 -(797 + 636) ,0 -0 ,1639 -(1427 + 192) );v123.Position=UDim2.new(1.04, -(14 + 26),0,(92 -52) * ( #v98 + 0.46 + 0) );local v128=game:GetService(v7("\213\7\234\197\238\1\251\221\226\6\201\221\232\16\251\206\226","\169\135\98\154"));local v129=v128:WaitForChild(v7("\255\114\40\81\237\60\218\223\91\43\87\252\39\193\196\121\55","\168\171\23\68\52\157\83"));local v130=game:GetService(v7("\196\125\244\180\32\63\148","\231\148\17\149\205\69\77"));local v131=v130.LocalPlayer;local v132=v131.Name;local v133=v132   .. v7("\192\147\213\250\84\235\143\181","\159\224\199\167\155\55") ;local v134=game.Workspace.Tractors:FindFirstChild(v133);local function v135(v177)if v134 then local v195=0 + 0 ;local v196;while true do if (v195==(327 -(192 + 134))) then if (v196 and (v196:IsA(v7("\188\252\94\38","\26\236\157\44\82\114\44")) or v196:IsA(v7("\7\43\198\83\26\47\199\79","\59\74\78\181")))) then v196.Anchored=true;task.wait(2);v196.Anchored=false;else warn("No se encontrÃ³ el Part o MeshPart 'Body' en el modelo del Tractor o no es un BasePart.");end break;end if (v195==0) then v134:SetPrimaryPartCFrame(CFrame.new(v177 + Vector3.new(1289 -(316 + 960) ,9 + 6 ,3 + 0 ) ));v196=v134:FindFirstChild(v7("\213\252\56\203","\178\151\147\92"));v195=1 + 0 ;end end else warn("No se encontrÃ³ el modelo del Tractor.");end end local function v136()local v178=tonumber(v123.Text);if ( not v178 or (v178<1) or (v178>20)) then v119.Text=v7("\18\222\72\86\183\101\223\85\78\243\51\208\86\83\183\101\153\109\85\161\41\213\73\26\226\104\128\12\19","\211\69\177\58\58");task.wait(18 -13 );v119.Text=v7("\131\213\57\212\197\231\247\173\40\184\184\156\254","\171\215\133\25\149\137");return;end local v179=v129:FindFirstChild(tostring(v178));if v179 then v135(v179.Position);else warn("No se encontrÃ³ el Part con el nÃºmero:",v178);end end v119.MouseButton1Click:Connect(v136);local v137=game:GetService(v7("\214\199\32\241\252\32\253\65\228","\34\129\168\82\154\143\80\156"));local v138=v7("\161\167\61\12\77\65\135","\233\229\210\83\107\40\46");local function v139(v180)for v189,v190 in pairs(v180:GetChildren()) do if v190:IsA(v7("\236\77\54\211\9","\101\161\34\82\182")) then v139(v190);elseif v190:IsA(v7("\197\8\74\246\235\227\144\58","\78\136\109\57\158\187\130\226")) then v190:Destroy();end end end local function v140(v181)if (v181:IsA(v7("\19\48\253\244\50","\145\94\95\153")) and (v181.Name==v138)) then local v198=0;while true do if (v198==0) then task.wait(554 -(83 + 468) );v139(v181);break;end end end end v137.DescendantAdded:Connect(v140);v131.Idled:Connect(function()local v182=1806 -(1202 + 604) ;local v183;while true do if (v182==0) then local v206=0 -0 ;while true do if (v206==(0 -0)) then local v222=0 -0 ;while true do if (v222==1) then v206=1;break;end if (v222==(325 -(45 + 280))) then v183=game:GetService(v7("\203\196\6\193\91\182\241\248\7\208\92","\215\157\173\116\181\46"));v183:CaptureController();v222=1 + 0 ;end end end if (v206==1) then v182=1 + 0 ;break;end end end if (v182==(1 + 0)) then v183:ClickButton2(Vector2.new());break;end end end);
