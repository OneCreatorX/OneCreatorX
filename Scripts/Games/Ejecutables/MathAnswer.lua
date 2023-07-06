game:GetService("ReplicatedStorage").Events.Round.RoundRE.OnClientEvent:Connect(function(Status, Time, Data)
    if Status == "countdown" and Time == game:GetService("ReplicatedStorage").GameData.RoundCountdown.Value then
        Data.CurrentQuestion = Data.CurrentQuestion:gsub("= %?", "")

        if Data.CurrentQuestion:match("÷") then
            Data.CurrentQuestion = Data.CurrentQuestion:gsub("÷", "/")
        elseif Data.CurrentQuestion:match("×") then
            Data.CurrentQuestion = Data.CurrentQuestion:gsub("×", "*")
        end

        game:GetService("ReplicatedStorage").Functions.Answer.AnswerRF:InvokeServer("answer", loadstring("return "..Data.CurrentQuestion)())
    end
end)