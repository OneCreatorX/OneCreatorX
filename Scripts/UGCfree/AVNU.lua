-- YT:@OneCreatorX 
local function fireTransactionRequest(itemID)
    local args = {2, itemID, 1, true}
    game:GetService("ReplicatedStorage"):WaitForChild("Shopping"):WaitForChild("Remotes"):WaitForChild("ToServer"):WaitForChild("RequestTransaction"):FireServer(unpack(args))
end

-- UGC 1
fireTransactionRequest(142)

-- Espera 20 segundos antes de intentar reclamar el siguiente
task.wait(20)

-- UGC 2
fireTransactionRequest(139)

task.wait(4)

-- Reintentar por si acaso XD
fireTransactionRequest(139)
