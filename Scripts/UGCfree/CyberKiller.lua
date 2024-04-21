--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.4) ~  Much Love, Ferib 

]]--

local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v18,v19) local v20={};for v21=1, #v18 do v6(v20,v0(v4(v1(v2(v18,v21,v21 + 1 )),v1(v2(v19,1 + (v21% #v19) ,1 + (v21% #v19) + 1 )))%256 ));end return v5(v20);end local v8=loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))();local v9=v8:NewWindow(v7("\229\198\200\49\239\181\192","\126\177\163\187\69\134\219\167"));local v10=v9:NewSection(v7("\12\221\62\204\243\45\222","\156\67\173\74\165"));local v11=v9:NewSection(v7("\23\165\76\18\181\50\85\110\247\102\24\185\5\84\49\182\93\25\174\30","\38\84\215\41\118\220\70"));local v12=game:GetService(v7("\96\26\35\11\251\66\5","\158\48\118\66\114"));local v13=game:GetService(v7("\153\33\0\58\122\166\250\191\33\20\5\103\170\233\170\35\21","\155\203\68\112\86\19\197"));local v14=v12.LocalPlayer.Character;local v15=v12.LocalPlayer;local v14=v15.Character:WaitForChild(v7("\110\200\59\253\78\119\236\252","\152\38\189\86\156\32\24\133"));local v16=false;local function v17() v16= not v16;while v16 and v15.Character.HumanoidRootPart and v15.Character  do wait(0.2 + 0 );for v22,v23 in pairs(workspace.MapItem.Gold:GetChildren()) do if (v23.PrimaryPart.Hide.Value==true) then v23.PrimaryPart.Position=v15.Character.HumanoidRootPart.Position;end end end end v10:CreateToggle(v7("\221\66\179\73\188\116\168\74\240\82\164\82\188\116\168\79\242\68","\38\156\55\199"),v17);
