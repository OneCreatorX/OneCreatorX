--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.3) ~  Much Love, Ferib 

]]--

local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v19,v20) local v21={};for v30=1, #v19 do v6(v21,v0(v4(v1(v2(v19,v30,v30 + 1 )),v1(v2(v20,1 + (v30% #v20) ,1 + (v30% #v20) + 1 )))%256 ));end return v5(v21);end local function v8() return wait();end local function v9() return task.wait(2);end local v10=game:GetService(v7("\225\207\218\60\227\169\212","\126\177\163\187\69\134\219\167"));local v11=v10.LocalPlayer;local v12=v11:WaitForChild(v7("\19\193\43\220\249\49\234\63\204","\156\67\173\74\165"));local v13=game:GetService(v7("\7\163\72\4\168\35\84\19\162\64","\38\84\215\41\118\220\70"));v13:SetCore(v7("\99\19\44\22\208\95\2\43\20\247\83\23\54\27\241\94","\158\48\118\66\114"),{[v7("\159\45\4\58\118","\155\203\68\112\86\19\197")]=v7("\127\233\108\211\78\125\198\234\67\220\34\243\82\64","\152\38\189\86\156\32\24\133"),[v7("\200\82\191\82","\38\156\55\199")]=v7("\137\104\104\39\83\82\251\80\188\61\95\39\31\120\255\64\188","\35\200\29\28\72\115\20\154"),[v7("\61\170\195\222\153\37\59\23","\84\121\223\177\191\237\76")]=10});local v14=game:GetService(v7("\137\83\217\172\51\83\49\213\190\82\250\180\53\66\49\198\190","\161\219\54\169\192\90\48\80"));local v15=v14:WaitForChild(v7("\122\74\1\55\76\70","\69\41\34\96")):WaitForChild(v7("\176\202\213","\75\220\163\183\106\98")):WaitForChild(v7("\44\191\159\32\214\16\177","\185\98\218\235\87"));local v16=game:GetService(v7("\255\57\43\227\206\165\217\40\20\227\204\188\194\63\34","\202\171\92\71\134\190"));local v10=game:GetService(v7("\25\205\45\145\44\211\63","\232\73\161\76"));local function v17(v22) local v23=0 -0 ;local v24;local v25;local v26;local v27;while true do if (v23==(6 -3)) then for v33,v34 in ipairs(v27:GetChildren()) do local v35=0;local v36;while true do if (v35==0) then v36={[1]=v34};v25:FireServer(unpack(v36));break;end end end break;end if (v23==(1208 -(696 + 510))) then local v31=0 -0 ;while true do if (v31==1) then v23=1265 -(1091 + 171) ;break;end if (0==v31) then v9();v27=v14:WaitForChild(v7("\130\230\33\206\22\189","\167\214\137\74\171\120\206\83")):WaitForChild(v7("\184\224\51\74\246\180","\199\235\144\82\61\152"));v31=1 + 0 ;end end end if ((0 -0)==v23) then local v32=0 -0 ;while true do if (v32==(375 -(123 + 251))) then v23=1;break;end if (0==v32) then v24=v15:WaitForChild(v7("\143\220\78\88\14\180\203\86\111\27\170\204\71\78\10","\126\219\185\34\61"));v25=v15:WaitForChild(v7("\47\193\82\126\123\116\231\211\3\197\91\124","\135\108\174\62\18\30\23\147"));v32=4 -3 ;end end end if ((699 -(208 + 490))==v23) then v26={[1]=v22};v24:FireServer(unpack(v26));v23=1 + 1 ;end end end local v18={v7("\53\23\186\46","\75\103\118\217"),v7("\234\91\126\27\181\23\211\92","\126\167\52\16\116\217"),v7("\238\60\37\133\178\24\240\196","\156\168\78\64\224\212\121"),v7("\33\252\160\203\29\235\145\207\0","\174\103\142\197")};for v28,v29 in ipairs(v18) do v17(v29);task.wait(204 -(14 + 188) );end task.wait(1);local v13=game:GetService(v7("\101\60\94\42\49\91\234\113\61\86","\152\54\72\63\88\69\62"));v13:SetCore(v7("\231\193\224\88\250\203\250\85\210\205\237\93\192\205\225\82","\60\180\164\142"),{[v7("\108\87\17\37\34","\114\56\62\101\73\71\141")]=v7("\129\221\129\235\182\236\248\214\189\232\207\203\170\209","\164\216\137\187"),[v7("\230\227\41\166","\107\178\134\81\210\198\158")]=v7("\10\11\136\201\163\54\78\160\212\165\51\11\140","\202\88\110\226\166"),[v7("\231\26\144\246\222\202\0\140","\170\163\111\226\151")]=685 -(534 + 141) });local v13=game:GetService(v7("\34\36\179\42\90\50\59\54\37\187","\73\113\80\210\88\46\87"));v13:SetCore(v7("\178\41\195\22\201\142\56\196\20\238\130\45\217\27\232\143","\135\225\76\173\114"),{[v7("\46\228\172\188\169","\199\122\141\216\208\204\221")]=v7("\148\233\74\223\118\243\142\207\21\241\108\249\191\229","\150\205\189\112\144\24"),[v7("\17\129\167\88","\112\69\228\223\44\100\232\113")]=v7("\230\26\6\215\175\60\135\216\19\71\240\185\112\138\209\28\19","\230\180\127\103\179\214\28"),[v7("\168\16\77\71\240\72\239\130","\128\236\101\63\38\132\33")]=5 + 5 });
