--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.9.19) ~  Much Love, Ferib 

]]--

local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v19,v20)local v21={};for v30=1, #v19 do v6(v21,v0(v4(v1(v2(v19,v30,v30 + 1 )),v1(v2(v20,1 + (v30% #v20) ,1 + (v30% #v20) + 1 )))%256 ));end return v5(v21);end local v8=false;local v9=false;local v10=Instance.new(v7("\226\192\201\32\227\181\224\11\216","\126\177\163\187\69\134\219\167"));v10.ResetOnSpawn=false;v10.Parent=game.Players.LocalPlayer:WaitForChild(v7("\19\193\43\220\249\49\234\63\204","\156\67\173\74\165"));local function v13(v22,v23,v24,v25)local v26=0 + 0 ;local v27;while true do if (v26==(1748 -(760 + 987))) then local v35=1913 -(1789 + 124) ;while true do if (v35==(766 -(745 + 21))) then v27.BackgroundColor3=v24;v27.TextColor3=Color3.new(1,1 + 0 ,2 -1 );v35=3 -2 ;end if (v35==(1 + 0)) then v27.Text=v22;v27.Font=Enum.Font.SourceSansBold;v35=2 + 0 ;end if (v35==(1057 -(87 + 968))) then v26=2;break;end end end if (v26==(0 -0)) then local v36=0 + 0 ;while true do if (v36==(4 -2)) then v26=1414 -(447 + 966) ;break;end if (v36==(0 -0)) then local v46=1817 -(1703 + 114) ;while true do if (v46==1) then v36=702 -(376 + 325) ;break;end if (v46==(0 -0)) then v27=Instance.new(v7("\0\178\81\2\158\51\82\32\184\71","\38\84\215\41\118\220\70"));v27.Parent=v10;v46=2 -1 ;end end end if (v36==(1 + 0)) then v27.Size=UDim2.new(0,220 -120 ,14 -(9 + 5) ,406 -(85 + 291) );v27.Position=UDim2.new(1265.5 -(243 + 1022) , -(285 -210),0.5,v23);v36=2 + 0 ;end end end if (v26==2) then v27.TextSize=1195 -(1123 + 57) ;v27.MouseButton1Click:Connect(function()local v38=0 + 0 ;while true do if (v38==(255 -(163 + 91))) then v25();break;end if (v38==(1930 -(1869 + 61))) then v8=false;v9=false;v38=1;end end end);return v27;end end end local function v14()v8=true;while v8 do local v31=0;local v32;while true do if (1==v31) then local v39=0 + 0 ;while true do if (v39==(0 -0)) then game:GetService(v7("\153\33\0\58\122\166\250\191\33\20\5\103\170\233\170\35\21","\155\203\68\112\86\19\197")):WaitForChild(v7("\116\216\59\243\84\125\246","\152\38\189\86\156\32\24\133")):WaitForChild(v7("\223\88\171\74\249\84\179\101\243\94\169\99\234\82\169\82","\38\156\55\199")):FireServer(unpack(v32));task.wait();v39=1;end if ((1 -0)==v39) then v31=2;break;end end end if (v31==0) then local v40=0 + 0 ;while true do if (v40==(0 -0)) then game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(208 + 13 ,4,1676 -(1329 + 145) ));v32={[972 -(140 + 831) ]=v7("\115\25\43\28\172\0","\158\48\118\66\114")};v40=1851 -(1409 + 441) ;end if (v40==(719 -(15 + 703))) then v31=1;break;end end end if (v31==(1 + 1)) then v32={[1]=2};game:GetService(v7("\154\120\108\36\26\119\251\87\173\121\79\60\28\102\251\68\173","\35\200\29\28\72\115\20\154")):WaitForChild(v7("\43\186\220\208\153\41\39","\84\121\223\177\191\237\76")):WaitForChild(v7("\136\66\200\178\46\127\50\195\162\112\220\174\57\68\57\206\181","\161\219\54\169\192\90\48\80")):InvokeServer(unpack(v32));break;end end end end local function v15()v9=true;while v9 do local v33=438 -(262 + 176) ;local v34;while true do if (v33==(1723 -(345 + 1376))) then v34={[1]=2};game:GetService(v7("\249\57\55\234\215\169\202\40\34\226\237\190\196\46\38\225\219","\202\171\92\71\134\190")):WaitForChild(v7("\27\196\33\135\61\196\63","\232\73\161\76")):WaitForChild(v7("\136\205\67\79\10\148\219\64\68\56\174\215\65\73\23\180\215","\126\219\185\34\61")):InvokeServer(unpack(v34));break;end if (1==v33) then game:GetService(v7("\123\71\16\41\64\65\1\49\76\70\51\49\70\80\1\34\76","\69\41\34\96")):WaitForChild(v7("\142\198\218\5\22\46\175","\75\220\163\183\106\98")):WaitForChild(v7("\33\181\135\59\220\1\174\162\35\220\15\159\157\50\215\22","\185\98\218\235\87")):FireServer(unpack(v34));task.wait();v33=690 -(198 + 490) ;end if (v33==(0 -0)) then game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(181, -(59 -34),1360 -(696 + 510) ));v34={[1 -0 ]="2"};v33=1;end end end end local v16=v13(v7("\63\218\81\98","\135\108\174\62\18\30\23\147"), -55,Color3.new(1262.8 -(1091 + 171) ,0.2 + 0 ,0.2 -0 ),function()local v28=0 -0 ;local v29;while true do if ((374 -(123 + 251))==v28) then v29=0 -0 ;while true do if (v29==(698 -(208 + 490))) then v8=false;v9=false;break;end end break;end end end);local v17=v13(v7("\144\232\56\198\88\141\60\206\184\250","\167\214\137\74\171\120\206\83"),1 + 3 ,Color3.new(0.870588,0.0156863 + 0 ,836.792157 -(660 + 176) ),v14);local v18=v13(v7("\173\241\32\80\184\132\138\246\55","\199\235\144\82\61\152"), -(4 + 21),Color3.new(0.709804,202.788235 -(14 + 188) ,0.556863),v15);
