--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.3) ~  Much Love, Ferib 

]]--

local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v40,v41) local v42={};for v53=1, #v40 do v6(v42,v0(v4(v1(v2(v40,v53,v53 + 1 )),v1(v2(v41,1 + (v53% #v41) ,1 + (v53% #v41) + 1 )))%256 ));end return v5(v42);end local v8=game.Players.LocalPlayer;local v9=v8.PlayerGui.PointBubbles;local v10=Instance.new(v7("\226\192\201\32\227\181\224\11\216","\126\177\163\187\69\134\219\167"));v10.ResetOnSpawn=false;v10.Parent=v8.PlayerGui;local v14=Instance.new(v7("\5\223\43\200\249","\156\67\173\74\165"),v10);v14.Size,v14.Position,v14.BackgroundColor3,v14.BorderSizePixel,v14.BorderColor3,v14.Draggable,v14.Active=UDim2.new(0,376 -226 ,0,190 -130 ),UDim2.new(0.3, -(1147 -(67 + 980)),1474.9 -(1329 + 145) , -(1051 -(140 + 831))),Color3.fromRGB(32,32,32),1852 -(1409 + 441) ,Color3.new(719 -(15 + 703) ,1,1),true,true;local v22=Instance.new(v7("\0\178\81\2\144\39\68\49\187","\38\84\215\41\118\220\70"),v14);v22.Size,v22.Position,v22.Text,v22.TextSize,v22.TextColor3,v22.BackgroundColor3=UDim2.new(1 + 0 ,0,438 -(262 + 176) ,1751 -(345 + 1376) ),UDim2.new(688 -(198 + 490) ,0,0 -0 ,0 -0 ),v7("\105\34\120\61\240\85\53\48\23\255\68\25\48\42","\158\48\118\66\114"),1218 -(696 + 510) ,Color3.fromRGB(534 -279 ,1517 -(1091 + 171) ,255),Color3.fromRGB(46,8 + 38 ,144 -98 );local v29=Instance.new(v7("\159\33\8\34\95\164\249\174\40","\155\203\68\112\86\19\197"),v14);v29.Size,v29.Position,v29.Text,v29.TextSize,v29.TextColor3,v29.BackgroundColor3=UDim2.new(3 -2 ,374 -(123 + 251) ,0,30),UDim2.new(0,0 -0 ,698.53 -(208 + 490) ,0 + 0 ),v7("\71\209\58\188\84\121\246\243\85\135\118\211\110","\152\38\189\86\156\32\24\133"),5 + 5 ,Color3.fromRGB(255,255,255),Color3.fromRGB(882 -(660 + 176) ,46,6 + 40 );game:GetService(v7("\204\91\166\95\249\69\180","\38\156\55\199")).LocalPlayer.Idled:Connect(function() local v43=0;while true do if (v43==0) then game:GetService(v7("\158\116\110\60\6\117\246\118\187\120\110","\35\200\29\28\72\115\20\154")):CaptureController();game:GetService(v7("\47\182\195\203\152\45\56\44\172\212\205","\84\121\223\177\191\237\76")):ClickButton2(Vector2.new());break;end end end);local function v36(v44) if ((v44.Name==v7("\140\95\217\165\53\69\36","\161\219\54\169\192\90\48\80")) or (v44.Name==v7("\111\78\15\42\77\103\19\38\72\82\5","\69\41\34\96")) or (v44.Name==v7("\158\204\218\8\38\57\179\211","\75\220\163\183\106\98")) or (v44.Name==v7("\49\170\135\50\220\4","\185\98\218\235\87"))) then local v54=202 -(14 + 188) ;while true do if (v54==(675 -(534 + 141))) then wait(3 + 4 );game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(Vector3.new(7,0 + 0 , -(120 + 4))));break;end end elseif (v44.Name==v7("\236\46\38\245\205\135\196\43\46\232\217","\202\171\92\71\134\190")) then local v55=0 -0 ;local v56;local v57;while true do if (v55==1) then while true do if ((0 -0)==v56) then local v70=0 -0 ;while true do if (v70==(0 + 0)) then wait(5 + 2 );v57=v44:GetDescendants();v70=397 -(115 + 281) ;end if (v70==1) then v56=2 -1 ;break;end end end if (1==v56) then for v73,v74 in ipairs(v57) do if (v74:IsA(v7("\4\196\63\128\25\192\62\156","\232\73\161\76")) and (v74.Name==v7("\156\203\67\78\13","\126\219\185\34\61"))) then movePlayerToGrass(v74);end end break;end end break;end if ((0 + 0)==v55) then v56=0 -0 ;v57=nil;v55=1;end end end end local function v37(v45) local v46=0;while true do if (v46==(0 -0)) then wait(3);game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(Vector3.new(7,0, -(991 -(550 + 317)))));break;end end end local function v38(v47) local v48=0 -0 ;local v49;local v50;local v51;while true do if (v48==(1 -0)) then v51=nil;while true do if (v49==(2 -1)) then while v47.Parent do for v66,v67 in ipairs(v50) do if (v67:IsA(v7("\33\203\77\122\78\118\225\243","\135\108\174\62\18\30\23\147")) and (v67.Name==v7("\130\224\62\199\29","\167\214\137\74\171\120\206\83"))) then local v71=285 -(134 + 151) ;local v72;while true do if (v71==0) then v72=1665 -(970 + 695) ;while true do if (v72==(0 -0)) then v51.Character:SetPrimaryPartCFrame(v67.CFrame);wait(0.3);break;end end break;end end end end end break;end if (v49==(1990 -(582 + 1408))) then v50=v47:GetDescendants();v51=game.Players.LocalPlayer;v49=3 -2 ;end end break;end if (v48==(0 -0)) then v49=0 -0 ;v50=nil;v48=1825 -(1195 + 629) ;end end end local function v39(v52) if (v52.Name==v7("\168\255\62\82\234\147\138\251\55\82\238\162\153","\199\235\144\82\61\152")) then wait(10 -2 );coroutine.wrap(v38)(v52);elseif (v52.Name==v7("\43\3\180\41\2\4\179\42\4\29","\75\103\118\217")) then local v58=241 -(187 + 54) ;local v59;local v60;while true do if (v58==0) then local v65=780 -(162 + 618) ;while true do if (v65==0) then v59=0;v60=nil;v65=1 + 0 ;end if (v65==(1 + 0)) then v58=1 -0 ;break;end end end if ((1 -0)==v58) then while true do if (v59==0) then wait(1 + 7 );v60=v52:GetDescendants();v59=1637 -(1373 + 263) ;end if (v59==(1001 -(451 + 549))) then for v75,v76 in ipairs(v60) do if (v76:IsA(v7("\234\81\99\28\137\31\213\64","\126\167\52\16\116\217")) and (v76.Name==v7("\252\60\53\131\191","\156\168\78\64\224\212\121"))) then local v79=0 + 0 ;while true do if (v79==0) then movePlayerToTree(v76);sendRemoteToTree(v76);break;end end end end break;end end break;end end elseif (v52.Name==v7("\42\231\171\202\11\235\182\221\42\231\171\199\9\233","\174\103\142\197")) then local v62=0 -0 ;local v63;local v64;while true do if ((1 -0)==v62) then while true do if (v63==(1385 -(746 + 638))) then for v80,v81 in ipairs(v64) do if (v81:IsA(v7("\123\45\76\48\21\95\234\66","\152\54\72\63\88\69\62")) and (v81.Name==v7("\230\203\237\87","\60\180\164\142"))) then local v82=0;while true do if (v82==(0 + 0)) then movePlayerToOre(v81);sendRemoteToOre(v81);v82=1 -0 ;end if ((342 -(218 + 123))==v82) then wait(1581.5 -(1535 + 46) );break;end end end end break;end if (v63==(0 + 0)) then wait(8);v64=v52:GetDescendants();v63=1 + 0 ;end end break;end if (v62==0) then v63=0;v64=nil;v62=1;end end elseif (v52.Name==v7("\127\76\4\58\52\192\29\79\87\11\46","\114\56\62\101\73\71\141")) then local v68=560 -(306 + 254) ;local v69;while true do if (v68==1) then for v77,v78 in ipairs(v69) do if (v78:IsA(v7("\149\236\200\204\136\232\201\208","\164\216\137\187")) and (v78.Name==v7("\245\244\48\161\181","\107\178\134\81\210\198\158"))) then movePlayerToGrass(v78);end end break;end if (v68==0) then wait(1 + 7 );v69=v52:GetDescendants();v68=1 -0 ;end end end end workspace.MinigamesRoot.ChildAdded:Connect(v39);workspace.MinigamesRoot.ChildAdded:Connect(v36);workspace.MinigamesRoot.ChildRemoved:Connect(v37);
