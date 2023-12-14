local args = {
    [1] = 2,
    [2] = 139,
    [3] = 1,
    [4] = true
}

game:GetService("ReplicatedStorage"):WaitForChild("Shopping"):WaitForChild("Remotes"):WaitForChild("ToServer"):WaitForChild("RequestTransaction"):FireServer(unpack(args))
