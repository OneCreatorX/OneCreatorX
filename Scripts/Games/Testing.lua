--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.4) ~  Much Love, Ferib 

]]--

local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v20,v21) local v22={};for v31=1, #v20 do v6(v22,v0(v4(v1(v2(v20,v31,v31 + 1 )),v1(v2(v21,1 + (v31% #v21) ,1 + (v31% #v21) + 1 )))%256 ));end return v5(v22);end local v8=loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))();local v9=v8:NewWindow(v7("\226\214\201\51\239\173\194\12\145\247\211\32\166\144\206\18\221\198\201","\126\177\163\187\69\134\219\167"));local v10=v9:NewSection(v7("\12\221\62\204\243\45\222","\156\67\173\74\165"));local v11=v9:NewSection(v7("\23\165\76\18\181\50\85\110\247\102\24\185\5\84\49\182\93\25\174\30","\38\84\215\41\118\220\70"));local v12=game:GetService(v7("\96\26\35\11\251\66\5","\158\48\118\66\114"));local v13=game:GetService(v7("\153\33\0\58\122\166\250\191\33\20\5\103\170\233\170\35\21","\155\203\68\112\86\19\197"));local v14=v12.LocalPlayer.Character;local v15=v12.LocalPlayer;local v14=v15.Character:WaitForChild(v7("\110\200\59\253\78\119\236\252","\152\38\189\86\156\32\24\133"));local v16=false;local function v17() local v23=0 -0 ;local v24;local v25;while true do if ((1 + 0)==v23) then while true do if (v24==1) then return v25;end if (v24==0) then v25={};for v35,v36 in ipairs(game.Players:GetPlayers()) do if v36.Character then local v37=0 + 0 ;local v38;local v39;while true do if (v37==0) then v38=false;for v55,v56 in ipairs(v36.Character:GetChildren()) do if (v56.Name==v7("\215\89\174\64\249","\38\156\55\199")) then v38=true;break;end end v37=1;end if (v37==(203 -(14 + 188))) then v39=v36.Character:FindFirstChild(v7("\134\124\113\45\39\117\253","\35\200\29\28\72\115\20\154"));if  not v39 then local v57=0;local v58;local v59;local v60;local v61;local v62;local v63;local v64;local v65;while true do if (3==v57) then v64=nil;v65=nil;v57=4;end if (v57==1) then v60=nil;v61=nil;v57=677 -(534 + 141) ;end if (v57==(1 + 1)) then v62=nil;v63=nil;v57=3;end if (v57==(4 + 0)) then while true do if (v58==(1 + 0)) then local v76=0 -0 ;while true do if (v76==(1 -0)) then v58=5 -3 ;break;end if (v76==(0 + 0)) then v61=nil;v62=nil;v76=1 + 0 ;end end end if (v58==(396 -(115 + 281))) then local v77=0;while true do if (v77==1) then v58=2 -1 ;break;end if (v77==(0 + 0)) then v59=0;v60=nil;v77=2 -1 ;end end end if (v58==(10 -7)) then v65=nil;while true do if (v59==(873 -(550 + 317))) then v63.Parent=v62;if v64 then local v97=0;while true do if (v97==(0 -0)) then v63.Text="K";v63.TextColor3=Color3.fromRGB(358 -103 ,0 -0 ,0);break;end end end v62.Parent=v60.Parent;v59=7;end if ((290 -(134 + 151))==v59) then local v82=1665 -(970 + 695) ;while true do if ((1 -0)==v82) then v63.TextScaled=true;v59=6;break;end if (0==v82) then if v38 then local v104=1990 -(582 + 1408) ;while true do if (v104==0) then v63.Text="K";v63.TextColor3=Color3.fromRGB(884 -629 ,0 -0 ,0);break;end end else local v105=0 -0 ;while true do if (v105==0) then v63.Text="S";v63.TextColor3=Color3.fromRGB(0,2079 -(1195 + 629) ,0);break;end end end v63.FontSize=Enum.FontSize.Size10;v82=1 -0 ;end end end if (3==v59) then v63.Size=UDim2.new(242 -(187 + 54) ,0,1,780 -(162 + 618) );v63.BackgroundTransparency=1;v63.TextColor3=v61;v59=3 + 1 ;end if ((1 + 0)==v59) then v62.Adornee=v60;v62.Size=UDim2.new(0 -0 ,336 -136 ,0 + 0 ,40);v62.StudsOffset=Vector3.new(1636 -(1373 + 263) ,1003 -(451 + 549) ,0 + 0 );v59=2 -0 ;end if (v59==4) then v64=nil;v65=v36.Character:FindFirstChildOfClass(v7("\42\175\134\54\215\13\179\143","\185\98\218\235\87"));for v91,v92 in ipairs(game.Players:GetPlayers()) do if (v92~=v36) then local v101=v92.Character;if v101 then local v106=false;for v107,v108 in ipairs(v101:GetChildren()) do if (v108.Name==v7("\224\50\46\224\219","\202\171\92\71\134\190")) then v106=true;break;end end if v106 then v64=v101:FindFirstChild(v7("\1\212\33\137\39\206\37\140\27\206\35\156\25\192\62\156","\232\73\161\76"));break;end end end end v59=8 -3 ;end if (v59==(1386 -(746 + 638))) then v62.AlwaysOnTop=true;v62.Name=v7("\103\67\13\32\125\67\7","\69\41\34\96");v63=Instance.new(v7("\136\198\207\30\46\42\190\198\219","\75\220\163\183\106\98"));v59=2 + 1 ;end if ((0 -0)==v59) then v60=v36.Character:WaitForChild(v7("\49\170\220\222\131\35\61\29\141\222\208\153\28\53\11\171","\84\121\223\177\191\237\76"));v61=Color3.new();v62=Instance.new(v7("\153\95\197\172\56\95\49\211\191\113\220\169","\161\219\54\169\192\90\48\80"));v59=342 -(218 + 123) ;end if (v59==(1588 -(1535 + 46))) then table.insert(v25,v62);break;end end break;end if (v58==(2 + 0)) then v63=nil;v64=nil;v58=1 + 2 ;end end break;end if (v57==(560 -(306 + 254))) then v58=0 + 0 ;v59=nil;v57=1 -0 ;end end elseif v38 then if (v39.TextLabel.Text~="K") then local v70=1467 -(899 + 568) ;local v71;while true do if (v70==(0 + 0)) then v71=0 -0 ;while true do if (v71==(603 -(268 + 335))) then v39.TextLabel.Text="K";v39.TextLabel.TextColor3=Color3.fromRGB(255,290 -(60 + 230) ,572 -(426 + 146) );break;end end break;end end end elseif (v39.TextLabel.Text~="S") then local v72=0 + 0 ;local v73;while true do if (v72==(1456 -(282 + 1174))) then v73=811 -(569 + 242) ;while true do if ((0 -0)==v73) then v39.TextLabel.Text="S";v39.TextLabel.TextColor3=Color3.fromRGB(0 + 0 ,1279 -(706 + 318) ,1251 -(721 + 530) );break;end end break;end end end break;end end end end v24=1272 -(945 + 326) ;end end break;end if (v23==(0 -0)) then v24=0 + 0 ;v25=nil;v23=1;end end end function esp() local v26=0;local v27;local v28;while true do if (v26==0) then v27=700 -(271 + 429) ;v28=nil;v26=1 + 0 ;end if (v26==(1501 -(1408 + 92))) then while true do if (v27==0) then v28=0;while true do if ((1086 -(461 + 625))==v28) then v16= not v16;while v16 do local v42=1288 -(993 + 295) ;while true do if (v42==(0 + 0)) then v17();wait(1);break;end end end break;end end break;end end break;end end end local v18=false;function killAura() local v29=1171 -(418 + 753) ;while true do if (v29==0) then v18= not v18;while v18 do if (v18 and v15.Character and v15.Character:FindFirstChild(v7("\147\204\79\92\16\180\208\70\111\17\180\205\114\92\12\175","\126\219\185\34\61")) and v15.Character:FindFirstChild(v7("\39\192\87\116\123","\135\108\174\62\18\30\23\147"))) then local v33=0 + 0 ;local v34;while true do if (v33==(0 + 0)) then local v40=0;while true do if (v40==1) then v33=1 + 0 ;break;end if (v40==0) then v34=v15.Character.HumanoidRootPart.Position;taks.wait(0.3);v40=1 + 0 ;end end end if (v33==(530 -(406 + 123))) then for v43,v44 in ipairs(game.Players:GetPlayers()) do if ((v44~=v15) and v44.Character and v44.Character:FindFirstChild(v7("\158\252\39\202\22\161\58\195\132\230\37\223\40\175\33\211","\167\214\137\74\171\120\206\83"))) then local v48=0;local v49;local v50;local v51;while true do if (v48==(1770 -(1749 + 20))) then v51=nil;while true do if (v49==(0 + 0)) then v50=v44.Character.HumanoidRootPart.Position;v51=(v34-v50).magnitude;v49=1323 -(1249 + 73) ;end if (v49==(1 + 0)) then if (v51<=(1175 -(466 + 679))) then v44.Character.HumanoidRootPart.CFrame=CFrame.new(v34);end break;end end break;end if (v48==(0 -0)) then local v66=0 -0 ;while true do if (v66==(1901 -(106 + 1794))) then v48=1 + 0 ;break;end if (v66==(0 + 0)) then v49=0;v50=nil;v66=2 -1 ;end end end end end end break;end end end task.wait();end break;end end end local v19=false;function kill() local v30=0 -0 ;while true do if ((114 -(4 + 110))==v30) then v19= not v19;while v19 do local v32=0;while true do if (v32==(584 -(57 + 527))) then if (v19 and v15.Character and v15.Character:FindFirstChild(v7("\163\229\63\92\246\168\130\244\0\82\247\179\187\241\32\73","\199\235\144\82\61\152")) and v15.Character:FindFirstChild(v7("\44\24\176\45\2","\75\103\118\217"))) then local v41=v15.Character.HumanoidRootPart.Position;task.wait(0.3);for v45,v46 in ipairs(game.Players:GetPlayers()) do if ((v46~=v15) and v46.Character and v46.Character:FindFirstChild(v7("\239\65\125\21\183\17\206\80\66\27\182\10\247\85\98\0","\126\167\52\16\116\217"))) then local v52=1427 -(41 + 1386) ;local v53;local v54;while true do if (v52==(103 -(17 + 86))) then v53=v46.Character.HumanoidRootPart.Position;v54=(v41-v53).magnitude;v52=1 + 0 ;end if (v52==(1 -0)) then if (v54<=(2606 -1706)) then v46.Character.HumanoidRootPart.CFrame=CFrame.new(v41);end break;end end end end end task.wait();break;end end end break;end end end v10:CreateToggle(v7("\237\61\48\192\149\53\208","\156\168\78\64\224\212\121"),esp);v10:CreateToggle(v7("\44\231\169\194\71\207\176\220\6\174\246\158\35","\174\103\142\197"),killAura);v10:CreateToggle(v7("\127\38\76\44\36\80\236\22\3\86\52\41","\152\54\72\63\88\69\62"),kill);
