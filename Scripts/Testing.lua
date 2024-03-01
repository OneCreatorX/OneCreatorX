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

        for i = 1, 100 do
            for j = 1, 15 do
                local args = {
                    [1] = i,
                    [2] = j
                }

                game:GetService("ReplicatedStorage"):WaitForChild("GameCommon"):WaitForChild("Messages"):WaitForChild("Interaction"):WaitForChild("FinishOrderRecipes"):FireServer(unpack(args))
            for u = 30, 34 do
            local args = {
                [1] = u,
                [2] = "TakeOrder"
            }

            game:GetService("ReplicatedStorage"):WaitForChild("GameCommon"):WaitForChild("Messages"):WaitForChild("Interaction"):WaitForChild("OperatePart"):FireServer(unpack(args))
                    end
                    
                end
        end
        task.wait(4)
    end
end)
