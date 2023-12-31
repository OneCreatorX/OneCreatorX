local replicatedStorage = game:GetService("ReplicatedStorage")

if replicatedStorage:FindFirstChild("FreeUGCComplete") then
    replicatedStorage.FreeUGCComplete:FireServer()
end
