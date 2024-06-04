local rl = loadstring(game:HttpGet("https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/UGCfree/Ning/Info.lua"))
spawn(rl)

local UL = loadstring(game:HttpGet("https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/UIs/MyLibrery.lua"))()

local gameName = ""
if gameName == "" then
    gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
end

local function cleanGameName(name)
    name = name:gsub("%b[]", "")
    name = name:match("^[^:]*")
    return name:match("^%s*(.-)%s*$")
end

gameName = cleanGameName(gameName)

local sg = UL:CrSG("Defauld")
local frm, cfrm, crFrm = UL:CrFrm(sg, gameName)

local function copy(text)
    if syn then
        syn.write_clipboard(text)
    else
        setclipboard(text)
    end
end

local p = game.Players.LocalPlayer

local collectStars = false
local tpToStars = false

local function collectStarsFunc()
    collectStars = not collectStars
    while collectStars do
        for _, obj in ipairs(workspace.Stars:GetChildren()) do
            if obj:IsA("BasePart") and obj:FindFirstChild("TouchInterest") and obj.Transparency == 0 then
                local distance = (obj.Position - p.Character.HumanoidRootPart.Position).Magnitude
                if distance <= 150 then
                    firetouchinterest(p.Character.HumanoidRootPart, obj, 0)
                    task.wait(0.5)
                    firetouchinterest(p.Character.HumanoidRootPart, obj, 1)
                end
            end
        end
        task.wait(1)
    end
end

local function tpToStarsFunc()
    tpToStars = not tpToStars
    while tpToStars do
        for _, obj in ipairs(workspace.Stars:GetChildren()) do
            if not tpToStars then break end
            if obj:IsA("BasePart") and obj:FindFirstChild("TouchInterest") and obj.Transparency == 0 then
                p.Character.HumanoidRootPart.CFrame = CFrame.new(obj.Position)
                task.wait(1)
            end
        end
        task.wait(1)
    end
end

UL:AddTBtn(cfrm, "Auto Collect Stars", false, function() collectStarsFunc() end)
UL:AddTBtn(cfrm, "Teleport to Stars", false, function() tpToStarsFunc() end)
UL:AddTBox(cfrm, "Enter Speed here e.g 30", function(text) 
    p.Character.Humanoid.WalkSpeed = text
end)

-- UL:AddBtn(cfrm, "Delete Obstacles", function() ggaa() end)

UL:AddText(crFrm, "By Script: OneCreatorX ")
UL:AddText(crFrm, "Create Script: 05/05/24 ")
UL:AddText(crFrm, "Update Script: --/--/--")
UL:AddText(crFrm, "Script Version: 0.1")
UL:AddBtn(crFrm, "Copy link YouTube", function() copy("https://youtube.com/@onecreatorx") end)
UL:AddBtn(crFrm, "Copy link Discord", function() copy("https://discord.com/invite/UNJpdJx7c4") end)

game:GetService('Players').LocalPlayer.Idled:Connect(function()
    game:GetService('VirtualUser'):CaptureController()
    game:GetService('VirtualUser'):ClickButton2(Vector2.new())
end)
