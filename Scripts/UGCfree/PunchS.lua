local g=Instance.new("ScreenGui")g.ResetOnSpawn=false g.Parent=game.Players.LocalPlayer.PlayerGui
pcall(function() game.ReplicatedStorage.EggOpenMap:Destroy() end)
local f=Instance.new("Frame")f.Size=UDim2.new(0.1,0,0.3,0)f.Position=UDim2.new(0.8,0,0.2,0)f.BackgroundColor3=Color3.fromRGB(20,20,20)f.BackgroundTransparency=0.5 f.BorderSizePixel=0 f.Draggable=true f.Active=true f.Parent=g
local t=Instance.new("TextLabel")t.Size=UDim2.new(1,0,0.1,0)t.Text="Punch S."t.TextColor3=Color3.new(1,1,1)t.Font=Enum.Font.SourceSansBold t.TextSize=20 t.Parent=f

local function createButton(name,eventName,interval,hasTextbox)
    local b=Instance.new("TextButton")b.Size=UDim2.new(0.3,0,0.1,0)b.Position=UDim2.new(0.1,0,0.25,0)b.BackgroundColor3=Color3.fromRGB(0,128,128)b.Text=name b.TextColor3=Color3.new(1,1,1)b.Font=Enum.Font.SourceSans b.TextSize=14 b.Parent=f 
    local r=false local tb 
    if hasTextbox then 
        tb=Instance.new("TextBox")tb.Size=UDim2.new(0.4,0,0.1,0)tb.Position=UDim2.new(0.5,0,0.25,0)tb.BackgroundColor3=Color3.fromRGB(0,128,128)tb.Text="1"tb.Parent=f 
    end 
    b.MouseButton1Click:Connect(function()
        r=not r b.BackgroundColor3=r and Color3.fromRGB(128,0,0)or Color3.fromRGB(0,128,128)
        if r then 
            spawn(function()
                while r do 
                    if hasTextbox then 
                        local args={[1]=tb.Text}game.ReplicatedStorage.Events[eventName]:FireServer(unpack(args))
                    else 
                        game.ReplicatedStorage.Events[eventName]:FireServer()
                    end 
                    wait(interval)
                end 
            end)
        end 
    end) 
    return b 
end

local eggButton=createButton("Egg","PlayerPressedKeyOnEgg",2.2,true)local clickDmgButton=createButton("Click D","DamageIncreaseOnClickEvent",0.1,false)clickDmgButton.Position=UDim2.new(0.34,0,0.45,0)

local teleportTextBox=Instance.new("TextBox")teleportTextBox.Text="World 1"teleportTextBox.Size=UDim2.new(0,70,0,20)teleportTextBox.TextColor3=Color3.new(128,128,0)teleportTextBox.BackgroundColor3=Color3.fromRGB(0,128,128)teleportTextBox.Position=UDim2.new(0.5,0,0.8,0)teleportTextBox.AnchorPoint=Vector2.new(0.5,0.5)teleportTextBox.Parent=f
teleportTextBox.FocusLost:Connect(function(enterPressed)if enterPressed then local location=game.ReplicatedStorage.TeleportLocations:FindFirstChild(teleportTextBox.Text) if location then local player=game.Players.LocalPlayer local character=player.Character if character then local humanoidRootPart=character:WaitForChild("HumanoidRootPart")humanoidRootPart.Anchored=true player.Character:MoveTo(location.Position) wait(4)humanoidRootPart.Anchored=false end end end end)

local ytFrame=Instance.new("Frame")ytFrame.Size=UDim2.new(1,0,0.1,0)ytFrame.Position=UDim2.new(0,0,1,0)ytFrame.BackgroundColor3=Color3.fromRGB(0,0,0)ytFrame.BorderSizePixel=0 ytFrame.Parent=f
local ytLabel=Instance.new("TextLabel")ytLabel.Size=UDim2.new(1,0,1,0)ytLabel.Text="YT:@OneCreatorX"ytLabel.TextColor3=Color3.new(1,1,1)ytLabel.Font=Enum.Font.SourceSansBold ytLabel.TextSize=15 ytLabel.Parent=ytFrame

game.Players.LocalPlayer.Idled:Connect(function()local VirtualUser=game:GetService('VirtualUser')VirtualUser:CaptureController()VirtualUser:ClickButton2(Vector2.new())end)
