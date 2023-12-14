-- YT:@OneCreatorX 
-- UGC 1

local args = {
    [1] = 2,
    [2] = 142,
    [3] = 1,
    [4] = true
}

game:GetService("ReplicatedStorage"):WaitForChild("Shopping"):WaitForChild("Remotes"):WaitForChild("ToServer"):WaitForChild("RequestTransaction"):FireServer(unpack(args))

-- espera 15 segundos antes ze intentar reclamar el siguiente 
task.wait(15)

-- UGC 2
local args = {
    [1] = 2,
    [2] = 139,
    [3] = 1,
    [4] = true
}

game:GetService("ReplicatedStorage"):WaitForChild("Shopping"):WaitForChild("Remotes"):WaitForChild("ToServer"):WaitForChild("RequestTransaction"):FireServer(unpack(args))
