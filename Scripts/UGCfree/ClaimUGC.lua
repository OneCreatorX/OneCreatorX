--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.3) ~  Much Love, Ferib 

]]--

local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v16,v17) local v18={};for v33=1, #v16 do v6(v18,v0(v4(v1(v2(v16,v33,v33 + 1 )),v1(v2(v17,1 + (v33% #v17) ,1 + (v33% #v17) + 1 )))%256 ));end return v5(v18);end local v8=game:GetService(v7("\227\214\213\22\227\169\209\23\210\198","\126\177\163\187\69\134\219\167"));local v9=game:GetService(v7("\16\217\43\215\232\38\223\13\208\245","\156\67\173\74\165"));local v10={[v7("\54\162\80\52\169\50\82\59\185","\38\84\215\41\118\220\70")]=false,[v7("\83\23\44\17\251\92\52\55\6\234\95\24","\158\48\118\66\114")]=false,[v7("\168\37\30\53\118\169\201\174\37\3\57\125","\155\203\68\112\86\19\197")]=false};local function v11(v19,v20,v21) if  not v10[v19] then v9:SetCore(v7("\117\216\56\248\110\119\241\241\64\212\53\253\84\113\234\246","\152\38\189\86\156\32\24\133"),{[v7("\200\94\179\74\249","\38\156\55\199")]=v19,[v7("\156\120\100\60","\35\200\29\28\72\115\20\154")]=v20,[v7("\61\170\195\222\153\37\59\23","\84\121\223\177\191\237\76")]=v21});v10[v19]=true;end end v11(v7("\130\98\147\128\21\94\53\226\169\83\200\180\53\66\8","\161\219\54\169\192\90\48\80"),v7("\4\28\64\4\92\86\15\101\106\78\1\44\68\2\38\23\108\103\64\16\110\97\64\121\4\2\77\123\9\99\21\49\70\2\35\36\71\65\5\41\9\108\15\101\111\80\5\32\9\30\77","\69\41\34\96"),1030 -(451 + 549) );local function v12(v22) local v23=nil;for v34,v35 in ipairs(v22:GetDescendants()) do if (v35:IsA(v7("\136\198\207\30\46\42\190\198\219","\75\220\163\183\106\98")) and (v35.Name==v7("\54\191\147\35","\185\98\218\235\87"))) then local v39=v35.Text:lower();if ((v39==v7("\202\63\34\246\202\171\217","\202\171\92\71\134\190")) or (v39==v7("\40\194\47\141\57\213","\232\73\161\76"))) then v23=v35;break;end end end if v23 then local v37=v23.AbsolutePosition.X + (v23.AbsoluteSize.X/(0.5 -0)) ;local v38=v23.AbsolutePosition.Y + (v23.AbsoluteSize.Y/(1262.5 -(1091 + 171))) ;game:GetService(v7("\141\208\80\73\11\186\213\107\83\14\174\205\111\92\16\186\222\71\79","\126\219\185\34\61")):SendMouseButtonEvent(v37,v38,0 + 0 ,true,game,3 -2 );game:GetService(v7("\58\199\76\102\107\118\255\206\2\222\75\102\83\118\253\230\11\203\76","\135\108\174\62\18\30\23\147")):SendMouseButtonEvent(v37,v38,0 -0 ,false,game,1 -0 );end end local function v13(v24) local v25=374 -(123 + 251) ;local v26;local v27;local v28;local v29;local v30;while true do if ((9 -7)==v25) then v30=nil;while true do if (v26==(699 -(208 + 490))) then local v42=0 + 0 ;while true do if (v42==(0 + 0)) then v29=nil;v30=nil;v42=1 + 0 ;end if (v42==(561 -(306 + 254))) then v26=838 -(660 + 176) ;break;end end end if (v26==(3 -1)) then while true do if (v27==(1 + 0)) then v30=nil;for v44,v45 in ipairs(v24:GetDescendants()) do if (v45:IsA(v7("\130\236\50\223\52\175\49\194\186","\167\214\137\74\171\120\206\83")) and (v45.Name==v7("\191\245\42\73","\199\235\144\82\61\152"))) then local v50=v45.Text:lower();if ((v50==v7("\4\23\183\40\2\26\184\57","\75\103\118\217")) or (v50==v7("\196\85\126\23\188\18","\126\167\52\16\116\217"))) then v28=v50;elseif (v50=="0") then v29=v45;else v30=v45;end end end v27=204 -(14 + 188) ;end if (v27==(675 -(534 + 141))) then local v43=0 + 0 ;while true do if (v43==(2 -1)) then v27=1 + 0 ;break;end if (v43==(0 + 0)) then v28=nil;v29=nil;v43=1 + 0 ;end end end if (v27==2) then if v29 then local v46=0 -0 ;local v47;local v48;while true do if (v46==(0 -0)) then local v51=0;while true do if (v51==(2 -1)) then v46=1 + 0 ;break;end if (v51==(0 + 0)) then v47=v29.AbsolutePosition.X + (v29.AbsoluteSize.X/(0.5 -0)) ;v48=v29.AbsolutePosition.Y + (v29.AbsoluteSize.Y/(396.5 -(115 + 281))) ;v51=1;end end end if (v46==(1 + 0)) then game:GetService(v7("\254\39\50\148\161\24\240\225\32\48\149\160\52\253\198\47\39\133\166","\156\168\78\64\224\212\121")):SendMouseButtonEvent(v47,v48,0 -0 ,true,game,1 + 0 );game:GetService(v7("\49\231\183\218\18\239\169\231\9\254\176\218\42\239\171\207\0\235\183","\174\103\142\197")):SendMouseButtonEvent(v47,v48,0 -0 ,false,game,2 -1 );v46=7 -5 ;end if (v46==(869 -(550 + 317))) then local v52=0 -0 ;while true do if (v52==(0 -0)) then v11(v7("\112\26\122\29\101\107\223\117\104\111\10\12\125\221\22\120","\152\54\72\63\88\69\62"),v7("\245\241\218\115\148\231\194\125\253\233\174\122\230\225\203\28\225\227\205\28\153\132\204\101\142\132\193\114\241\231\220\121\245\240\193\110\236\138","\60\180\164\142"),5 + 0 );task.wait(19 -12 );v52=286 -(134 + 151) ;end if (v52==(1289 -(993 + 295))) then v46=1668 -(970 + 695) ;break;end end end if (v46==(5 -2)) then v12(v24);break;end end elseif v28 then for v53,v54 in ipairs(v24:GetDescendants()) do if (v54:IsA(v7("\108\91\29\61\11\236\16\93\82","\114\56\62\101\73\71\141")) and (v54.Name==v7("\140\236\195\208","\164\216\137\187")) and (v54.Text:lower()==v28)) then local v55=v54.AbsolutePosition.X + (v54.AbsoluteSize.X/(1990.5 -(582 + 1408))) ;local v56=v54.AbsolutePosition.Y + (v54.AbsoluteSize.Y/(0.5 -0)) ;game:GetService(v7("\228\239\35\166\179\255\7\251\232\33\167\178\211\10\220\231\54\183\180","\107\178\134\81\210\198\158")):SendMouseButtonEvent(v55,v56,0 -0 ,true,game,1 + 0 );game:GetService(v7("\14\7\144\210\191\57\2\171\200\186\45\26\175\199\164\57\9\135\212","\202\88\110\226\166")):SendMouseButtonEvent(v55,v56,0 -0 ,false,game,1825 -(1195 + 629) );v11(v7("\237\32\194\209\248\230\42\194\194\237\224","\170\163\111\226\151"),v7("\50\17\156\27\107\27\0\63\23\242\8\123\5\10\57\17\129\29\0\119\11\40\106\157\22\107\20\27\52\17\134\23\124\15","\73\113\80\210\88\46\87"),6 -1 );v10.cancelButton=true;break;end end end if (v30 and ( not tonumber(v30.Text) or (tonumber(v30.Text)~=(529 -(406 + 123)))) and (v30.Text:lower()~=v7("\128\47\200\2\243\128\62","\135\225\76\173\114")) and (v30.Text:lower()~=v7("\27\238\187\181\188\169","\199\122\141\216\208\204\221"))) then v11(v7("\131\242\80\214\74\211\136\145\80\194\125\231\184\212\2\245\107\182\159\210\18\229\96","\150\205\189\112\144\24"),""   .. v30.Text ,1774 -(1749 + 20) );else local v49=241 -(187 + 54) ;while true do if (v49==(0 + 0)) then task.wait(783 -(162 + 618) );v12(v24);break;end end end break;end end break;end if (v26==(0 + 0)) then v27=0 + 0 ;v28=nil;v26=1 + 0 ;end end break;end if ((2 -1)==v25) then v28=nil;v29=nil;v25=5 -3 ;end if (v25==(1900 -(106 + 1794))) then v26=0 -0 ;v27=nil;v25=1 -0 ;end end end local v14=game:GetService(v7("\6\139\173\73\35\157\24","\112\69\228\223\44\100\232\113"));local v15=v14:WaitForChild(v7("\228\10\21\208\190\125\149\209\47\21\220\187\108\146","\230\180\127\103\179\214\28"));v8.Heartbeat:Connect(function() local v31=0 + 0 ;local v32;while true do if ((0 -0)==v31) then v32=false;for v40,v41 in ipairs(v15:GetDescendants()) do if (v41:IsA(v7("\184\0\71\82\200\64\226\137\9","\128\236\101\63\38\132\33")) and (v41.Name==v7("\152\172\9\80","\175\204\201\113\36\214\139"))) then v32=true;break;end end v31=1 + 0 ;end if (v31==(1637 -(1373 + 263))) then if  not v32 then v10={[v7("\69\217\44\254\17\83\216\58\210","\100\39\172\85\188")]=false,[v7("\174\121\183\131\54\161\90\172\148\39\162\118","\83\205\24\217\224")]=false,[v7("\229\196\195\62\227\201\255\56\231\214\194\51","\93\134\165\173")]=false};end v13(v15);break;end end end);
