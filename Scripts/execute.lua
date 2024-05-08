local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local Win = Lib:NewWindow("Execute us Scripts")
local Sec = Win:NewSection("Options")
local Sec2 = Win:NewSection("Credits: OneCreatorX")

Sec:CreateTextbox("Script n Enter", function(value)
    local success, errorMessage = pcall(loadstring(value))
    if not success then
        
    end
end)
