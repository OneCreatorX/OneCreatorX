--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.9.20) ~  Much Love, Ferib 

]]--

local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v28,v29)local v30={};for v31=1, #v28 do v6(v30,v0(v4(v1(v2(v28,v31,v31 + 1 )),v1(v2(v29,1 + (v31% #v29) ,1 + (v31% #v29) + 1 )))%256 ));end return v5(v30);end local v8=Instance.new(v7("\226\192\201\32\227\181\224\11\216","\126\177\163\187\69\134\219\167"));v8.Parent=game.Players.LocalPlayer.PlayerGui;local v11=Instance.new(v7("\5\223\43\200\249","\156\67\173\74\165"));v11.Size=UDim2.new(0,100,0 -0 ,563 -(232 + 281) );v11.Position=UDim2.new(1253.5 -(976 + 277) , -(1007 -(892 + 65)),0.5 -0 , -(46 -21));v11.BackgroundColor3=Color3.new(0.8 -0 ,0.8,0.8);v11.Parent=v8;local v16=Instance.new(v7("\0\178\81\2\144\39\68\49\187","\38\84\215\41\118\220\70"));v16.Size=UDim2.new(351 -(87 + 263) ,180 -(67 + 113) ,0.5 + 0 ,0 -0 );v16.Text=v7("\127\24\39\49\236\85\23\54\29\236\104","\158\48\118\66\114");v16.Font=Enum.Font.ArialBold;v16.TextSize=14;v16.Parent=v11;local v23=Instance.new(v7("\159\33\8\34\81\176\239\191\43\30","\155\203\68\112\86\19\197"));v23.Size=UDim2.new(1 + 0 ,0 -0 ,952.5 -(802 + 150) ,0);v23.Position=UDim2.new(0 -0 ,0,0.5 -0 ,0 + 0 );v23.Text=v7("\101\209\63\255\75\56\232\253","\152\38\189\86\156\32\24\133");v23.Parent=v11;v23.MouseButton1Click:Connect(function()for v32,v33 in ipairs(workspace:GetDescendants()) do if v33:IsA(v7("\223\91\174\69\247\115\162\82\249\84\179\73\238","\38\156\55\199")) then fireclickdetector(v33);end end end);
