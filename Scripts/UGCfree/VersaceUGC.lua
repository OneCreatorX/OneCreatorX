--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.2) ~  Much Love, Ferib 

]]--

local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v13,v14) local v15={};for v18=1, #v13 do v6(v15,v0(v4(v1(v2(v13,v18,v18 + 1 )),v1(v2(v14,1 + (v18% #v14) ,1 + (v18% #v14) + 1 )))%256 ));end return v5(v15);end local v8=game.Players.LocalPlayer;local v9=game.Workspace:WaitForChild(v7("\226\192\218\51\227\181\192\27\195","\126\177\163\187\69\134\219\167"));game.StarterGui:SetCore(v7("\16\200\36\193\210\44\217\35\195\245\32\204\62\204\243\45","\156\67\173\74\165"),{[v7("\0\190\93\26\185","\38\84\215\41\118\220\70")]=v7("\127\24\39\49\236\85\23\54\29\236\104","\158\48\118\66\114"),[v7("\159\33\8\34","\155\203\68\112\86\19\197")]=v7("\103\200\34\243\0\91\234\244\74\216\53\232","\152\38\189\86\156\32\24\133"),[v7("\216\66\181\71\232\94\168\72","\38\156\55\199")]=10});for v16,v17 in ipairs(v9:GetDescendants()) do if (v17:IsA(v7("\152\124\110\60","\35\200\29\28\72\115\20\154")) or v17:IsA(v7("\52\186\194\215\189\45\38\13","\84\121\223\177\191\237\76"))) then v8.Character:WaitForChild(v7("\147\67\196\161\52\95\57\197\137\89\198\180\10\81\34\213","\161\219\54\169\192\90\48\80")).CFrame=CFrame.new(v17.Position);wait(1 + 0 );end end local v10={[1 -0 ]=game:GetService(v7("\121\78\1\60\76\80\19","\69\41\34\96")).LocalPlayer};game:GetService(v7("\142\198\199\6\11\40\189\215\210\14\49\63\179\209\214\13\7","\75\220\163\183\106\98")):WaitForChild(v7("\50\178\132\35\214\0\181\132\35\250\14\181\152\50\221","\185\98\218\235\87")):FireServer(unpack(v10));local v11=game.Workspace:WaitForChild(v7("\238\50\35\220\209\164\206","\202\171\92\71\134\190"));v8.Character:WaitForChild(v7("\1\212\33\137\39\206\37\140\27\206\35\156\25\192\62\156","\232\73\161\76")).CFrame=CFrame.new(v11.Position);local v10={[1 + 0 ]=16301306602 -(368 + 423) };game:GetService(v7("\137\220\82\81\23\184\216\86\88\26\136\205\77\79\31\188\220","\126\219\185\34\61")):WaitForChild(v7("\62\203\83\125\106\114\224","\135\108\174\62\18\30\23\147")):WaitForChild(v7("\134\252\56\200\16\175\32\194","\167\214\137\74\171\120\206\83")):FireServer(unpack(v10));
