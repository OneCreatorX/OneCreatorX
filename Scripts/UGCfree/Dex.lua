--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.9.19) ~  Much Love, Ferib 

]]--

local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v9,v10)local v11={};for v14=1, #v9 do v6(v11,v0(v4(v1(v2(v9,v14,v14 + 1 )),v1(v2(v10,1 + (v14% #v10) ,1 + (v14% #v10) + 1 )))%256 ));end return v5(v11);end local v8=17856282221 -1676376745 ;for v12,v13 in pairs(game:GetDescendants()) do pcall(function()if v13:IsA(v7("\227\198\214\42\242\190\226\8\212\205\207","\126\177\163\187\69\134\219\167")) then if ((v13.Name~=v7("\23\200\38\192\236\44\223\62\245\240\34\212\47\215","\156\67\173\74\165")) and  not string.find(v13.Name,v7("\10\135\70\4\168\39\74","\38\84\215\41\118\220\70"))) then print(v7("\113\21\54\27\232\81\24\38\29\190\98\19\47\29\234\85\51\52\23\240\68\76","\158\48\118\66\114"),v13.Name);v13:FireServer(v8);end end end);end
