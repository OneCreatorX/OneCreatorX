loadstring(game:HttpGet("https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/UGCfree/Ning/AutoClaimUGC.lua"))()
local function clickButton(btn)
    local pos = btn.AbsolutePosition
    local size = btn.AbsoluteSize
    local centerX = pos.X + size.X / 1
    local centerY = pos.Y + size.Y / 1
    game:GetService("VirtualInputManager"):SendMouseButtonEvent(centerX, centerY, 0, true, game, 1)
    wait(0.05) 
    game:GetService("VirtualInputManager"):SendMouseButtonEvent(centerX, centerY, 0, false, game, 1)
end

local keysButton = game:GetService("Players").LocalPlayer.PlayerGui.StoreSelection.Background.Keys.MainContainer.Generic.TextButton

keysButton:GetPropertyChangedSignal("AbsolutePosition"):Connect(function()
    local tolerance = 1
    local posX = keysButton.AbsolutePosition.X
    local posY = keysButton.AbsolutePosition.Y
    
    if posX >= 150 - tolerance and posX <= 160 + tolerance and
       posY >= 80 - tolerance and posY <= 90 + tolerance then
        clickButton(keysButton)
    end
end)

local shopChoices = game:GetService("Players").LocalPlayer.PlayerGui.StoreSelection.Background.Stores.ShopChoices

shopChoices.ChildAdded:Connect(function(child)
        wait(0.5)
        local button = child.TextButton      
        clickButton(button)
end)

local i = game:GetService("Players").LocalPlayer.PlayerGui
i.ChildAdded:Connect(function(chil)
wait(1)
if chil.Name == ScreenGui then
chil.Enabled = false 
end
    end
