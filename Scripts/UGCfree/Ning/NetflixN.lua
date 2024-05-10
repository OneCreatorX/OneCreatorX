local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local Win = Lib:NewWindow("Netflix NextWorld v0.4")
local Sec = Win:NewSection("Opcions")
local Sec2 = Win:NewSection("Credits: OneCreatorX")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local a = false

function hhh()
a = not a
end
Sec:CreateToggle("Kill Mobs", hhh)

function Tk()
    
    if a then
        wait(0.1)
        local enemies = workspace:WaitForChild("ScriptableObjects"):WaitForChild("Enemies"):GetDescendants()
        local args = {[2] = 1}
        
        for _, enemy in ipairs(enemies) do
            if enemy:IsA("Model") and enemy.PrimaryPart then
                local args = {[1] = enemy, [2] = 1}
                game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("FireSlingshot"):FireServer(unpack(args))
            end
        end
    end
end

game:GetService("RunService").RenderStepped:Connect(function()
    pcall(Tk)
end)

local a = false

function hhh()
a = not a
end

Sec:CreateToggle("Auto Collect ", hhh)

function collect()

    if a then
        wait(0.5)
        local player = game.Players.LocalPlayer
        local targetPosition = player.Character.HumanoidRootPart.Position

        for _, drop in ipairs(workspace._DROPS:GetChildren()) do
            if drop:IsA("Model") and drop.PrimaryPart then
                drop:SetPrimaryPartCFrame(CFrame.new(targetPosition))
                local proximityPrompt = drop.PrimaryPart:FindFirstChildOfClass("ProximityPrompt")
                if proximityPrompt then
                    fireproximityprompt(proximityPrompt)
                end
            end
        end
    end
end

game:GetService("RunService").RenderStepped:Connect(function()
    pcall(collect)
end)

local a = false

function npcs()
    a = not a
    local cerca = true
    while a do
        task.wait()
        local player = game.Players.LocalPlayer

        for _, npc in ipairs(workspace.ScriptableObjects.NPCs:GetChildren()) do
            if npc:IsA("Model") and npc:FindFirstChild("HumanoidRootPart") or npc:FindFirstChild("RootPart") then
                local proximityPrompt = npc.PrimaryPart:FindFirstChildOfClass("ProximityPrompt")
                if proximityPrompt then
                    local distance = (player.Character.HumanoidRootPart.Position - npc.PrimaryPart.Position).magnitude
                    if distance < 4 and cerca then
                        fireproximityprompt(proximityPrompt)
                        cerca = false
                    elseif distance > 4 and distance < 5 and not cerca then
                        cerca = true
                    end
                end
            end
        end
    end
end



local function copyToClipboard(text)
    if syn then
        syn.write_clipboard(text)
    else
        setclipboard(text)
    end
end

function copyd()
    copyToClipboard("https://discord.com/invite/23kFrRBSfD")
end

function copyy()
    copyToClipboard("https://youtube.com/@OneCreatorX")
end


Sec:CreateToggle("Auto  talk Npcs ", npcs)

Sec2:CreateButton("Copy Link YouTube", copyy)
Sec2:CreateButton("Copy Link Discord", copyd)

game:GetService('Players').LocalPlayer.Idled:Connect(function()
    game:GetService('VirtualUser'):CaptureController()
    game:GetService('VirtualUser'):ClickButton2(Vector2.new())
end)



local args = {
    [1] = "Dustin"
}

game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("FinishTalking"):FireServer(unpack(args))


local args = {
    [1] = "Quest006"
}

game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("AcceptQuest"):FireServer(unpack(args))
