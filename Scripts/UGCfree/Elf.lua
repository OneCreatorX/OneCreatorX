local P = game:GetService("Players")
local W = game:GetService("Workspace")

local SG = Instance.new("ScreenGui")
SG.Name = "YTSG"
SG.Parent = P.LocalPlayer.PlayerGui

local TL = Instance.new("TextLabel")
TL.Name = "YTLabel"
TL.Size = UDim2.new(0, 200, 0, 50)
TL.Position = UDim2.new(0.6, -100, 0.5, 200)
TL.AnchorPoint = Vector2.new(0.5, 0.5)
TL.BackgroundColor3 = Color3.new(0, 0, 0)
TL.TextColor3 = Color3.new(1, 1, 1)
TL.Font = Enum.Font.SourceSansBold
TL.TextSize = 20
TL.Text = "YT:@OneCreatorX"
TL.Parent = SG
TL.Active = true
TL.Draggable = true

local VAI = {
    [15295503917] = "Teddy Bear",
    [15295504436] = "Guest Doll",
    [15295504094] = "Noob Doll",
    [15295503718] = "Train",
    [15295504278] = "Jack in the Box"
}

local function searchModel(model)
    if model:IsA("Model") and model.Name == "Envelope" then
        task.wait(0.1)
        local WI = model:FindFirstChild("WishImage", true)
        if WI and WI:IsA("ImageLabel") then
            local assetId = tonumber(WI.Image:match("rbxassetid://(%d+)"))
            if VAI[assetId] then
                W.Gameplay.Workshop.WishTaker.WishTakerStand.WishTakerRemotes.TakeWishEvent:FireServer(VAI[assetId])
            end
        end
    end
end

W.DescendantAdded:Connect(searchModel)

P.LocalPlayer.Idled:Connect(function()
    local VU = game:GetService("VirtualUser")
    VU:CaptureController()
    VU:ClickButton2(Vector2.new())
end)

local HRP = P.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
HRP.CFrame = CFrame.new(813, 48, -1391)
