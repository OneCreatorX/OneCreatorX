--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.3) ~  Much Love, Ferib 

]]--

local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v50,v51) local v52={};for v61=1, #v50 do v6(v52,v0(v4(v1(v2(v50,v61,v61 + 1 )),v1(v2(v51,1 + (v61% #v51) ,1 + (v61% #v51) + 1 )))%256 ));end return v5(v52);end local v8=game:GetService(v7("\225\207\218\60\227\169\212","\126\177\163\187\69\134\219\167"));local v9=v8.LocalPlayer;local v10=v9:WaitForChild(v7("\19\193\43\220\249\49\234\63\204","\156\67\173\74\165"));local v11=Instance.new(v7("\7\180\91\19\185\40\97\33\190","\38\84\215\41\118\220\70"));v11.ResetOnSpawn=false;v11.Enabled=true;v11.Parent=v10;local v15=Instance.new(v7("\118\4\35\31\251","\158\48\118\66\114"));v15.Name=v7("\136\43\30\34\97\170\247\141\54\17\59\118","\155\203\68\112\86\19\197");v15.Size=UDim2.new(0,250,0 + 0 ,130);v15.Position=UDim2.new(0.5, -(14 + 111),0.3 -0 , -60);v15.BackgroundColor3=Color3.fromRGB(846 -(118 + 688) ,68 -(25 + 23) ,2 + 8 );v15.BorderSizePixel=1887 -(927 + 959) ;v15.Style=Enum.FrameStyle.DropShadow;v15.Parent=v11;v15.Active=true;v15.Draggable=true;local v26=Instance.new(v7("\114\216\46\232\108\121\231\253\74","\152\38\189\86\156\32\24\133"));v26.Name=v7("\200\94\179\74\249","\38\156\55\199");v26.Text=v7("\145\73\38\8\60\122\255\96\186\120\125\60\28\102\194","\35\200\29\28\72\115\20\154");v26.Size=UDim2.new(1,0,0 -0 ,762 -(16 + 716) );v26.Position=UDim2.new(0 -0 ,97 -(11 + 86) ,0 -0 ,0);v26.BackgroundColor3=Color3.fromRGB(315 -(175 + 110) ,30,75 -45 );v26.TextColor3=Color3.fromRGB(255,1257 -1002 ,2051 -(503 + 1293) );v26.Font=Enum.Font.GothamBold;v26.TextSize=20;v26.Parent=v15;local v37=Instance.new(v7("\45\186\201\203\175\57\32\13\176\223","\84\121\223\177\191\237\76"));v37.Name=v7("\152\89\199\180\40\95\60\227\174\66\221\175\52","\161\219\54\169\192\90\48\80");v37.Text=v7("\96\76\19\49\72\76\20\101\124\101\35\101","\69\41\34\96");v37.Style=Enum.ButtonStyle.RobloxButtonDefault;v37.Size=UDim2.new(0,220,0 -0 ,15 + 5 );v37.BackgroundColor3=Color3.fromRGB(1211 -(810 + 251) ,21 + 9 ,10 + 20 );v37.Position=UDim2.new(0.46 + 0 , -100,533.5 -(43 + 490) , -20);v37.Font=Enum.Font.ArialBold;v37.TextSize=749 -(711 + 22) ;v37.TextColor3=Color3.fromRGB(986 -731 ,1114 -(240 + 619) ,255);v37.Parent=v15;v37.MouseButton1Click:Connect(function() local function v53(v62) if v62 then fireproximityprompt(v62);end end game.DescendantAdded:Connect(function(v63) if v63:IsA(v7("\140\209\216\18\11\38\181\215\206\58\16\36\177\211\195","\75\220\163\183\106\98")) then v53(v63);end end);for v64,v65 in ipairs(workspace:GetDescendants()) do if v65:IsA(v7("\50\168\132\47\208\15\179\159\46\233\16\181\134\39\205","\185\98\218\235\87")) then v53(v65);end end local v54={[1 + 0 ]=v7("\238\50\32\231\217\175\198\57\41\242\252\171\207\59\34","\202\171\92\71\134\190")};game:GetService(v7("\27\196\60\132\32\194\45\156\44\197\31\156\38\211\45\143\44","\232\73\161\76")):WaitForChild(v7("\139\216\65\86\31\188\220\81","\126\219\185\34\61")):WaitForChild(v7("\51\231\80\118\123\111","\135\108\174\62\18\30\23\147")):WaitForChild(v7("\165\229\47\194\12\160\58\196\189\214\33\197\17\186\19\150\248\190\100\155","\167\214\137\74\171\120\206\83")):WaitForChild(v7("\128\254\59\73","\199\235\144\82\61\152")):WaitForChild(v7("\52\19\171\61\14\21\188\56","\75\103\118\217")):WaitForChild(v7("\224\85\125\17\155\31\195\83\117\7\138\27\213\66\121\23\188","\126\167\52\16\116\217")):WaitForChild(v7("\250\8","\156\168\78\64\224\212\121")):WaitForChild(v7("\53\235\178\207\21\234\149\194\6\247\160\220\37\239\161\201\2","\174\103\142\197")):InvokeServer(unpack(v54));wait(1 -0 );game:GetService(v7("\100\45\79\52\44\93\249\66\45\91\11\49\81\234\87\47\90","\152\54\72\63\88\69\62")):WaitForChild(v7("\228\197\237\87\213\195\235\79","\60\180\164\142")):WaitForChild(v7("\103\119\11\45\34\245","\114\56\62\101\73\71\141")):WaitForChild(v7("\171\229\222\205\172\231\210\199\179\214\208\202\177\253\251\149\246\190\149\148","\164\216\137\187")):WaitForChild(v7("\217\232\56\166","\107\178\134\81\210\198\158")):WaitForChild(v7("\11\11\144\208\163\59\11\145","\202\88\110\226\166")):WaitForChild(v7("\231\14\150\246\217\215\0\144\242\249\198\29\148\254\201\198","\170\163\111\226\151")):WaitForChild(v7("\35\22","\73\113\80\210\88\46\87")):WaitForChild(v7("\162\35\192\2\235\132\56\200\52\211\180\9","\135\225\76\173\114")):InvokeServer();wait(1 + 0 );local v54={[1745 -(1344 + 400) ]=v7("\61\232\182\181\191\180\180","\199\122\141\216\208\204\221")};game:GetService(v7("\159\216\0\252\113\245\172\201\21\244\75\226\162\207\17\247\125","\150\205\189\112\144\24")):WaitForChild(v7("\21\133\188\71\5\143\20\3","\112\69\228\223\44\100\232\113")):WaitForChild(v7("\235\54\9\215\179\100","\230\180\127\103\179\214\28")):WaitForChild(v7("\159\9\90\79\240\79\233\143\14\96\77\234\72\244\172\84\17\17\170\17","\128\236\101\63\38\132\33")):WaitForChild(v7("\167\167\24\80","\175\204\201\113\36\214\139")):WaitForChild(v7("\116\201\39\202\13\68\201\38","\100\39\172\85\188")):WaitForChild(v7("\153\125\181\133\35\162\106\173\179\54\191\110\176\131\54","\83\205\24\217\224")):WaitForChild(v7("\212\227","\93\134\165\173")):WaitForChild(v7("\138\247\205\199\42\193\160\106\138\253\224\208\63\207","\30\222\146\161\162\90\174\210")):InvokeServer(unpack(v54));wait(1);local v54={[406 -(255 + 150) ]=v7("\194\75\126\15\246\71\99","\106\133\46\16")};game:GetService(v7("\106\37\99\240\83\67\89\52\118\248\105\84\87\50\114\251\95","\32\56\64\19\156\58")):WaitForChild(v7("\106\201\230\93\91\245\133\73","\224\58\168\133\54\58\146")):WaitForChild(v7("\102\127\69\249\112\158","\107\57\54\43\157\21\230\231")):WaitForChild(v7("\200\135\20\252\173\210\198\216\128\46\254\183\213\219\251\218\95\162\247\140","\175\187\235\113\149\217\188")):WaitForChild(v7("\55\161\136\88","\24\92\207\225\44\131\25")):WaitForChild(v7("\120\214\170\90\18\126\78\192","\29\43\179\216\44\123")):WaitForChild(v7("\153\216\52\77\174\205\47\94\184\234\37\94\171\208\35\73","\44\221\185\64")):WaitForChild(v7("\51\193","\19\97\135\40\63")):WaitForChild(v7("\141\83\62\43\35\52\186\89\0\62\61\60\161\82\21\15\26\20","\81\206\60\83\91\79")):InvokeServer(unpack(v54));game.DescendantAdded:Connect(function(v66) if v66:IsA(v7("\126\185\223\106\38\206\68\176\87\155\194\125\34\211\89","\196\46\203\176\18\79\163\45")) then v53(v66);end end);for v67,v68 in ipairs(workspace:GetDescendants()) do if v68:IsA(v7("\136\48\113\6\45\246\230\172\59\78\12\43\246\255\172","\143\216\66\30\126\68\155")) then v53(v68);end end wait(1 + 0 );game:GetService(v7("\152\205\29\199\204\160\214\245\175\204\62\223\202\177\214\230\175","\129\202\168\109\171\165\195\183")):WaitForChild(v7("\18\89\52\211\223\19\227\49","\134\66\56\87\184\190\116")):WaitForChild(v7("\3\24\7\191\28\243","\85\92\81\105\219\121\139\65")):WaitForChild(v7("\238\191\85\76\104\209\244\176\91\122\119\209\244\167\112\20\50\136\179\227","\191\157\211\48\37\28")):WaitForChild(v7("\212\17\253\8","\90\191\127\148\124")):WaitForChild(v7("\75\130\60\1\113\132\43\4","\119\24\231\78")):WaitForChild(v7("\182\63\160\75\207\85\3\135\5\176\68\200\115\20\144\59\172\73\217","\113\226\77\197\42\188\32")):WaitForChild(v7("\8\48","\213\90\118\148")):WaitForChild(v7("\110\32\184\89\78\80\0\177\78\89\122\60\177\87","\45\59\78\212\54")):InvokeServer();wait(1 + 0 );local v54={[4 -3 ]=workspace:WaitForChild(v7("\61\87\147","\144\112\54\227\235\230\78\205")):WaitForChild(v7("\148\45\1\249\195\82\160","\59\211\72\111\156\176")):WaitForChild(v7("\126\136\241\57\79\139\220\10\75\137\230\62\71\148","\77\46\231\131"))};game:GetService(v7("\136\81\166\76\179\87\183\84\191\80\133\84\181\70\183\71\191","\32\218\52\214")):WaitForChild(v7("\126\22\50\163\240\183\64\73","\58\46\119\81\200\145\208\37")):WaitForChild(v7("\20\165\62\168\172\165","\86\75\236\80\204\201\221")):WaitForChild(v7("\97\77\114\140\234\133\123\66\124\186\245\133\123\85\87\212\176\220\60\17","\235\18\33\23\229\158")):WaitForChild(v7("\91\180\200\175","\219\48\218\161")):WaitForChild(v7("\215\116\110\95\210\76\229\247","\128\132\17\28\41\187\47")):WaitForChild(v7("\53\55\10\63\77\14\32\18\9\88\19\36\15\57\88","\61\97\82\102\90")):WaitForChild(v7("\158\8","\105\204\78\203\43\167\55\126")):WaitForChild(v7("\145\175\47\27\3\11\213\69\135\179\19\17\1\16\198\93","\49\197\202\67\126\115\100\167")):InvokeServer(unpack(v54));wait(3 -2 );local v54={[1]=v7("\22\95\222\36\165\64\91","\62\87\59\191\73\224\54")};game:GetService(v7("\213\7\234\197\238\1\251\221\226\6\201\221\232\16\251\206\226","\169\135\98\154")):WaitForChild(v7("\251\118\39\95\252\52\205\216","\168\171\23\68\52\157\83")):WaitForChild(v7("\203\88\251\169\32\53","\231\148\17\149\205\69\77")):WaitForChild(v7("\147\171\194\242\67\241\137\164\204\196\92\241\137\179\231\170\25\168\206\247","\159\224\199\167\155\55")):WaitForChild(v7("\252\253\53\198","\178\151\147\92")):WaitForChild(v7("\191\248\94\36\27\79\127\159","\26\236\157\44\82\114\44")):WaitForChild(v7("\14\47\193\90\57\58\218\73\47\29\208\73\60\39\214\94","\59\74\78\181")):WaitForChild(v7("\23\247","\211\69\177\58\58")):WaitForChild(v7("\148\234\116\229\229\206\163\224\74\240\251\198\184\235\95\193\220\238","\171\215\133\25\149\137")):InvokeServer(unpack(v54));wait(1);game:GetService(v7("\209\196\51\227\234\34\239","\34\129\168\82\154\143\80\156")).LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(2133.192841 -(404 + 1335) ,459.7404137 -(183 + 223) ,4117.8598600000005 -733 ,0.701299429, -(0.425173044 + 0),0.572194934,1.5848036e-9,0.80266732 + 0 ,337.596427023 -(10 + 327) , -0.712866843, -(0.418273926 + 0),338.56291014 -(118 + 220) );wait(1 + 1 );game:GetService(v7("\181\190\50\18\77\92\154","\233\229\210\83\107\40\46")).LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(394.192841,502.7404137 -(108 + 341) ,1520.85986 + 1864 ,0.701299429 -0 , -(1493.425173044 -(711 + 782)),0.572194934 -0 ,1.5848036e-9,469.80266732 -(270 + 199) ,0.596427023 + 0 , -0.712866843, -(1819.418273926 -(580 + 1239)),0.56291014);wait(14 -9 );game:GetService(v7("\241\78\51\207\0\211\81","\101\161\34\82\182")).LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(377.192841 + 17 ,2.7404136999999977 + 51 ,3384.85986,0.701299429, -(0.425173044 + 0),0.572194934 -0 ,1.5848036e-9 + 0 ,1167.80266732 -(645 + 522) ,1790.596427023 -(1010 + 780) , -(0.712866843 + 0), -0.418273926,0.56291014);game.DescendantAdded:Connect(function(v69) if v69:IsA(v7("\216\31\86\230\210\239\139\58\241\61\75\241\214\242\150","\78\136\109\57\158\187\130\226")) then v53(v69);end end);for v70,v71 in ipairs(workspace:GetDescendants()) do if v71:IsA(v7("\14\45\246\233\55\50\240\229\39\15\235\254\51\47\237","\145\94\95\153")) then v53(v71);end end wait(9 -7 );local function v53(v72) if v72 then fireproximityprompt(v72);end end game.DescendantAdded:Connect(function(v73) if v73:IsA(v7("\205\223\27\205\71\186\244\217\13\229\92\184\240\221\0","\215\157\173\116\181\46")) then v53(v73);end end);for v74,v75 in ipairs(workspace:GetDescendants()) do if v75:IsA(v7("\5\166\132\234\211\56\189\159\235\234\39\187\134\226\206","\186\85\212\235\146")) then v53(v75);end end local v54={[2 -1 ]=v7("\231\143\17\255\62\235\85\199\143\2\220\56\234\95\199","\56\162\225\118\158\89\142")};game:GetService(v7("\110\0\208\163\43\219\93\17\197\171\17\204\83\23\193\168\39","\184\60\101\160\207\66")):WaitForChild(v7("\1\131\127\183\48\133\121\175","\220\81\226\28")):WaitForChild(v7("\44\252\140\255\239\223","\167\115\181\226\155\138")):WaitForChild(v7("\241\46\226\85\111\127\207\225\41\216\87\117\120\210\194\115\169\11\53\33","\166\130\66\135\60\27\17")):WaitForChild(v7("\79\68\199\97","\80\36\42\174\21")):WaitForChild(v7("\125\21\37\108\71\19\50\105","\26\46\112\87")):WaitForChild(v7("\158\34\166\113\157\190\65\179\188\48\152\113\173\169\76\183\188","\212\217\67\203\20\223\223\37")):WaitForChild(v7("\136\171","\178\218\237\200")):WaitForChild(v7("\132\176\241\209\164\177\214\220\183\172\227\194\148\180\226\215\179","\176\214\213\134")):InvokeServer(unpack(v54));wait(1);game:GetService(v7("\198\168\166\216\161\85\88\224\168\178\231\188\89\75\245\170\179","\57\148\205\214\180\200\54")):WaitForChild(v7("\34\252\54\63\119\21\248\38","\22\114\157\85\84")):WaitForChild(v7("\251\226\29\192\88\238","\200\164\171\115\164\61\150")):WaitForChild(v7("\173\248\6\76\151\176\253\0\78\188\181\250\10\81\163\239\186\84\11\211","\227\222\148\99\37")):WaitForChild(v7("\56\92\91\226","\153\83\50\50\150")):WaitForChild(v7("\110\115\97\10\122\168\72\78","\45\61\22\19\124\19\203")):WaitForChild(v7("\229\19\25\244\17\100\182\211\23\62\240\16\102\176\194\23","\217\161\114\109\149\98\16")):WaitForChild(v7("\32\6","\20\114\64\88\28\220")):WaitForChild(v7("\18\14\223\164\244\213\169\52\39\230\129\221","\221\81\97\178\212\152\176")):InvokeServer();wait(1837 -(1045 + 791) );local v54={[2 -1 ]=v7("\234\226\19\254\9\196\244","\122\173\135\125\155")};game:GetService(v7("\182\196\16\181\54\50\201\144\196\4\138\43\62\218\133\198\5","\168\228\161\96\217\95\81")):WaitForChild(v7("\235\208\45\87\46\80\222\194","\55\187\177\78\60\79")):WaitForChild(v7("\18\231\81\239\67\215","\224\77\174\63\139\38\175")):WaitForChild(v7("\151\77\93\39\144\79\81\45\143\126\83\32\141\85\120\127\202\22\22\126","\78\228\33\56")):WaitForChild(v7("\197\112\187\23","\229\174\30\210\99")):WaitForChild(v7("\40\232\148\71\228\62\60\8","\89\123\141\230\49\141\93")):WaitForChild(v7("\199\116\250\9\0\69\225\101\197\9\2\92\250\114\243","\42\147\17\150\108\112")):WaitForChild(v7("\61\128","\136\111\198\77\31\135")):WaitForChild(v7("\54\12\171\83\173\235\5\189\54\6\134\68\184\229","\201\98\105\199\54\221\132\119")):InvokeServer(unpack(v54));wait(1 -0 );local v54={[1]=v7("\158\9\141\36\17\60\191","\204\217\108\227\65\98\85")};game:GetService(v7("\108\198\229\233\37\195\95\215\240\225\31\212\81\209\244\226\41","\160\62\163\149\133\76")):WaitForChild(v7("\230\161\14\36\194\209\165\30","\163\182\192\109\79")):WaitForChild(v7("\11\15\14\196\240\44","\149\84\70\96\160")):WaitForChild(v7("\43\10\8\228\44\8\4\238\51\57\6\227\49\18\45\188\118\81\67\189","\141\88\102\109")):WaitForChild(v7("\184\93\195\100","\161\211\51\170\16\122\93\53")):WaitForChild(v7("\200\171\160\62\242\173\183\59","\72\155\206\210")):WaitForChild(v7("\98\123\64\15\32\82\117\70\11\0\67\104\66\7\48\67","\83\38\26\52\110")):WaitForChild(v7("\106\49","\38\56\119\71")):WaitForChild(v7("\208\224\85\198\41\83\231\234\107\211\55\91\252\225\126\226\16\115","\54\147\143\56\182\69")):InvokeServer(unpack(v54));game.DescendantAdded:Connect(function(v76) if v76:IsA(v7("\230\147\240\81\214\219\136\235\80\239\196\142\242\89\203","\191\182\225\159\41")) then v53(v76);end end);for v77,v78 in ipairs(workspace:GetDescendants()) do if v78:IsA(v7("\27\0\39\77\130\138\203\63\11\24\71\132\138\210\63","\162\75\114\72\53\235\231")) then v53(v78);end end wait(506 -(351 + 154) );game:GetService(v7("\190\57\84\238\90\1\141\40\65\230\96\22\131\46\69\229\86","\98\236\92\36\130\51")):WaitForChild(v7("\148\24\15\177\68\175\176\35","\80\196\121\108\218\37\200\213")):WaitForChild(v7("\63\90\12\123\78\22","\234\96\19\98\31\43\110")):WaitForChild(v7("\21\19\87\206\184\124\130\5\20\109\204\162\123\159\38\78\28\144\226\34","\235\102\127\50\167\204\18")):WaitForChild(v7("\91\175\252\55","\78\48\193\149\67\36")):WaitForChild(v7("\3\27\146\14\72\51\27\147","\33\80\126\224\120")):WaitForChild(v7("\216\186\6\197\79\249\186\6\236\73\226\188\48\193\78\250\161\0\193","\60\140\200\99\164")):WaitForChild(v7("\181\210","\194\231\148\100\70")):WaitForChild(v7("\115\66\205\172\245\195\104\73\217\183\215\218\67\77","\168\38\44\161\195\150")):InvokeServer();wait(1);local v54={[1]=workspace:WaitForChild(v7("\173\253\146","\118\224\156\226\22\80\136\214")):WaitForChild(v7("\101\235\87\133\81\231\74","\224\34\142\57")):WaitForChild(v7("\238\168\215\201\114\253\98\41\219\169\192\206\122\226","\110\190\199\165\189\19\145\61"))};game:GetService(v7("\232\238\103\228\130\196\219\255\114\236\184\211\213\249\118\239\142","\167\186\139\23\136\235")):WaitForChild(v7("\42\180\139\6\27\178\141\30","\109\122\213\232")):WaitForChild(v7("\209\222\172\52\235\239","\80\142\151\194")):WaitForChild(v7("\16\202\114\69\23\200\126\79\8\249\124\66\10\210\87\29\77\145\57\28","\44\99\166\23")):WaitForChild(v7("\119\249\32\34","\196\28\151\73\86\83")):WaitForChild(v7("\192\6\59\6\139\91\29\101","\22\147\99\73\112\226\56\120")):WaitForChild(v7("\140\112\238\240\157\183\103\246\198\136\170\99\235\246\136","\237\216\21\130\149")):WaitForChild(v7("\176\104","\62\226\46\63\63\208\169")):WaitForChild(v7("\209\28\89\134\15\2\61\74\199\0\101\140\13\25\46\82","\62\133\121\53\227\127\109\79")):InvokeServer(unpack(v54));wait(1);local v54={[1575 -(1281 + 293) ]=v7("\49\16\51\248\243\184\167","\194\112\116\82\149\182\206")};game:GetService(v7("\11\173\92\20\201\225\15\45\173\72\43\212\237\28\56\175\73","\110\89\200\44\120\160\130")):WaitForChild(v7("\155\194\72\77\66\77\62\94","\45\203\163\43\38\35\42\91")):WaitForChild(v7("\237\172\210\39\130\177","\52\178\229\188\67\231\201")):WaitForChild(v7("\50\77\85\13\227\82\42\34\74\111\15\249\85\55\1\16\30\83\185\12","\67\65\33\48\100\151\60")):WaitForChild(v7("\212\233\167\204","\147\191\135\206\184")):WaitForChild(v7("\183\45\180\215\209\80\183\151","\210\228\72\198\161\184\51")):WaitForChild(v7("\18\72\231\17\96\218\57\91\246\35\118\220\32\64\240\21","\174\86\41\147\112\19")):WaitForChild(v7("\105\38","\203\59\96\237\107\69\111\113")):WaitForChild(v7("\7\25\161\241\61\245\195\33\37\169\243\60\255\217\2\34\153\196","\183\68\118\204\129\81\144")):InvokeServer(unpack(v54));wait(1);game:GetService(v7("\62\161\113\253\14\144\29","\226\110\205\16\132\107")).LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(394.192841,53.7404137,3650.85986 -(28 + 238) ,0.701299429 -0 , -(1559.425173044 -(1381 + 178)),0.572194934 + 0 ,1.5848036e-9 + 0 ,0.80266732,0.596427023, -(0.712866843 + 0), -(0.418273926 -0),0.56291014 + 0 );wait(472 -(381 + 89) );game:GetService(v7("\219\207\225\192\68\249\208","\33\139\163\128\185")).LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(394.192841,53.7404137,3001.85986 + 383 ,0.701299429, -0.425173044,0.572194934,1.5848036e-9 + 0 ,0.80266732,0.596427023 -0 , -(1156.712866843 -(1074 + 82)), -(0.418273926 -0),1784.56291014 -(214 + 1570) );wait(5);game:GetService(v7("\103\84\5\199\82\74\23","\190\55\56\100")).LocalPlayer.Character.HumanoidRootPart.CFrame=CFrame.new(1849.192841 -(990 + 465) ,22.740413699999998 + 31 ,1473.85986 + 1911 ,0.701299429 + 0 , -0.425173044,0.572194934,1.5848036e-9 -0 ,1726.80266732 -(1668 + 58) ,0.596427023, -0.712866843, -(626.418273926 -(512 + 114)),0.56291014 -0 );game.DescendantAdded:Connect(function(v79) if v79:IsA(v7("\102\189\51\6\26\238\250\66\182\12\12\28\238\227\66","\147\54\207\92\126\115\131")) then v53(v79);end end);for v80,v81 in ipairs(workspace:GetDescendants()) do if v81:IsA(v7("\61\35\58\101\4\115\4\37\44\77\31\113\0\33\33","\30\109\81\85\29\109")) then v53(v81);end end end);
