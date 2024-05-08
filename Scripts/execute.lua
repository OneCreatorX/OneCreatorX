local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local Win = Lib:NewWindow("Collect For UGC")
local Sec = Win:NewSection("Options")
local Sec3 = Win:NewSection("Info Script")
local Sec2 = Win:NewSection("Credits: OneCreatorX")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer

Sec:CreateTextbox("ID Texture", function(value)
    local success, errorMessage = pcall(loadstring(value))
    if not success then
        warn("Error al ejecutar el código ingresado: " .. errorMessage)
    end
end)
