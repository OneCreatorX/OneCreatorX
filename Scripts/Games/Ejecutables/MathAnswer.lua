local Debounce = false

game:GetService("ReplicatedStorage").Events.Round.RoundRE.OnClientEvent:Connect(function(Status, Time, Data)

        if Status == "countdown" and not Debounce then
            Debounce = true
            Data.CurrentQuestion = Data.CurrentQuestion:gsub("= %?", "")

            if Data.CurrentQuestion:match("÷") then
                Data.CurrentQuestion = Data.CurrentQuestion:gsub("÷", "/")
            elseif Data.CurrentQuestion:match("×") then
                Data.CurrentQuestion = Data.CurrentQuestion:gsub("×", "*")
            end

            game:GetService("ReplicatedStorage").Functions.Answer.AnswerRF:InvokeServer("answer", loadstring("return "..Data.CurrentQuestion)())
        elseif Status == "idle" then
            Debounce = false
        end
    end)