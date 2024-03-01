task.spawn(function()
while true do
    for i = 8, 15 do
        local args = {
            [1] = i,
            [2] = "MakeMain"
        }

        game:GetService("ReplicatedStorage"):WaitForChild("GameCommon"):WaitForChild("Messages"):WaitForChild("Interaction"):WaitForChild("OperatePart"):FireServer(unpack(args))
    end

    for i = 30, 34 do
        local args = {
            [1] = i,
            [2] = "TakeOrder"
        }

        game:GetService("ReplicatedStorage"):WaitForChild("GameCommon"):WaitForChild("Messages"):WaitForChild("Interaction"):WaitForChild("OperatePart"):FireServer(unpack(args))
    end

    for i = 1, 80 do
        for j = 1, 15 do
            local args = {
                [1] = i,
                [2] = j
            }

            game:GetService("ReplicatedStorage"):WaitForChild("GameCommon"):WaitForChild("Messages"):WaitForChild("Interaction"):WaitForChild("FinishOrderRecipes"):FireServer(unpack(args))
        end
    end
    task.wait(2)
end
end)
