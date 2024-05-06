local Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local Win = Lib:NewWindow("K-Pop Obby")
local Sec = Win:NewSection("Options")
local Sec2 = Win:NewSection("Credits: OneCreatorX")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local wa = false



function too()
wa = not wa
while wa do
wait(0.1)
for _, p in pairs(game:GetService("MarketplaceService"):GetDeveloperProductsAsync():GetCurrentPage()) do
                for f, v in pairs(p) do
                    if f == "DeveloperProductId" or f == "ProductId" then
                        task.defer(function()
                            game:GetService("MarketplaceService"):SignalPromptProductPurchaseFinished(game.Players.LocalPlayer.UserId, v, true)
                        end)
                    end
end
                end
end
end

local waa = false
function ty()
waa = not waa
for _, tycoon in ipairs(workspace.Tycoon.Tycoons:GetChildren()) do
    for _, child in ipairs(tycoon:GetChildren()) do
        if string.lower(child.Name) == "owner" then
            
            if child.Value == tostring(game.Players.LocalPlayer.Name) then
                local tycoonn = child.Parent
                
                while waa and tycoonn do
                    wait(0.1)
                    for _, Button in ipairs(tycoonn.Buttons:GetChildren()) do
                        local args = {
                            [1] = workspace.Tycoon.Tycoons[tycoonn.Name].Buttons[Button.Name]
                        }
                        game:GetService("ReplicatedStorage").RE.purchaseButton:InvokeServer(unpack(args))
                    end
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


function re()
we = not we
while we do
wait(3)
game.ReplicatedStorage.RE.Rebirth:FireServer(true)
end
end

Sec:CreateToggle("Inf Money", too)
Sec:CreateToggle("Auto Tycoon", ty)
Sec:CreateToggle("Auto Rebirth", re)
Sec2:CreateButton("Copy Link YouTube", copyy)
Sec2:CreateButton("Copy Link Discord", copyd)

game:GetService('Players').LocalPlayer.Idled:Connect(function()
game:GetService('VirtualUser'):CaptureController()   game:GetService('VirtualUser'):ClickButton2(Vector2.new())
end)
