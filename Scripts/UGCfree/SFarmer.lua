local p = game.Players.LocalPlayer
local g = Instance.new("ScreenGui", p.PlayerGui)
local pg = p:WaitForChild("PlayerGui")
local osb = pg:WaitForChild("OnScreenButtons")
local player = game.Players.LocalPlayer
local workspace = game.Workspace
local playerScripts = player.PlayerScripts
local replicatedStorage = game:GetService("ReplicatedStorage")
local playerGui = player:WaitForChild("PlayerGui")

local petHandler = player.PlayerScripts.PlayerPetHandler
local signal = Instance.new("BindableEvent")
local wasDisabled = petHandler.Disabled

petHandler.Disabled = true

local function checkDisabled()
    if petHandler.Disabled ~= wasDisabled then
        wasDisabled = petHandler.Disabled
        if not wasDisabled then
            signal:Fire()
            petHandler.Disabled = true
        end
    end
end

checkDisabled()

local f = Instance.new("Frame", g)
f.Size = UDim2.new(0, 220, 0, 310)
f.Position = UDim2.new(0.23, 0, 0, -34)
f.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
f.BorderSizePixel = 0
f.Active = true
f.Draggable = true

local ct = Instance.new("TextLabel", f)
ct.Text = "YT:@OneCreatorX"
ct.Size = UDim2.new(0, 200, 0, 20)
ct.Position = UDim2.new(0.5, -90, 1, -20)
ct.TextColor3 = Color3.new(1, 1, 1)
ct.BackgroundColor3 = Color3.new(30/255, 30/255, 30/255)
ct.BorderSizePixel = 0
ct.Font = Enum.Font.SourceSans
ct.TextSize = 18

local playerGui = player:WaitForChild("PlayerGui")
local templeUI = playerGui:WaitForChild("TempleUI")
local frame = templeUI:WaitForChild("Frame")
local button = Instance.new("TextButton", f)
button.Name = "SecretButton"
button.Size = UDim2.new(0, 50, 0, 20)
button.Position = UDim2.new(0.35, 10, 0, 40)
button.BackgroundTransparency = 1
button.Text = "Secret"
button.TextColor3 = Color3.new(1, 1, 1)
button.BackgroundColor3 = Color3.new(30/255, 30/255, 30/255)
button.BorderSizePixel = 0
button.Font = Enum.Font.SourceSans
button.TextSize = 14

button.MouseButton1Click:Connect(function()
    templeUI.Enabled = true
    frame.Visible = true
end)

local gText = Instance.new("TextLabel", f)
gText.Size = UDim2.new(0, 200, 0, 20)
gText.Position = UDim2.new(0, 0, 0, 0)
gText.TextColor3 = Color3.new(1, 1, 1)
gText.BackgroundColor3 = Color3.new(30/255, 30/255, 30/255)
gText.BorderSizePixel = 0

local GuaranteedNumber = p.PlayerGui.PetsPopup.Frame.GuaranteedLegendary:WaitForChild("GuaranteedNumber")

local function updateText()
    gText.Text = "Egg For Legendary: " .. tostring(GuaranteedNumber.Text)
end

gText.Text = "Egg For Legendary: Loading..."

GuaranteedNumber:GetPropertyChangedSignal("Text"):Connect(function()
    updateText()
end)

local mb = Instance.new("TextButton", f)
mb.Text = "-"
mb.Size = UDim2.new(0, 20, 0, 20)
mb.Position = UDim2.new(1, -20, 0, 0)
mb.TextColor3 = Color3.fromRGB(255, 255, 255)
mb.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mb.BorderSizePixel = 0

local mi = false

mb.MouseButton1Click:Connect(function()
    mi = not mi
    f.Size = mi and UDim2.new(0.5, 20, 0, 20) or UDim2.new(0, 220, 0, 300)
    mb.Text = mi and "+" or "-"
    for _, el in ipairs(f:GetChildren()) do
        if el:IsA("TextButton") or el:IsA("TextBox") then
            if el ~= mb then
                el.Visible = not mi
            end
        end
    end
end)

local tractorName = player.Name .. " Tractor"
local cropName = "Crop"
local autoDungeonEnabled = false

local tractor = workspace.Tractors:FindFirstChild(tractorName)
local crops = workspace.Crops.DungeonCrops

local function findMeshPart(model, name)
    for _, part in ipairs(model:GetChildren()) do
        if part:IsA("MeshPart") and part.Name == name and part.Transparency < 1 then
            return part
        elseif part:IsA("Model") or part:IsA("Folder") then
            local result = findMeshPart(part, name)
            if result then return result end
        end
    end
end

local function moveTractorAndCrop(meshPart)
    if autoDungeonEnabled then
        local currentHeight = tractor.PrimaryPart.Position.Y
        local newX = meshPart.Position.X + 12
        local newZ = meshPart.Position.Z + 3
        tractor:SetPrimaryPartCFrame(CFrame.new(Vector3.new(newX, currentHeight, newZ)))
    end
end

local function onTouch(meshPart)
    if meshPart.Transparency == 1 then
        local cropPart = findMeshPart(crops, cropName)
        if cropPart and tractor:IsA("Model") then
            local distance = (tractor.PrimaryPart.Position - cropPart.Position).Magnitude
            if distance <= 9000 then
                moveTractorAndCrop(cropPart)

                cropPart:GetPropertyChangedSignal("Transparency"):Connect(function()
                    onTouch(cropPart)
                end)

                cropPart.Touched:Connect(function(hit)
                    if hit:IsA("Part") then
                        hit.CollisionGroupId = 2
                    end
                end)
            end
        end
    else
        autoDungeonEnabled = true
    end
end

local function onFileChanged(child, added)
    if autoDungeonEnabled then
        task.wait(0.1)
        local part = findMeshPart(crops, cropName)
        if part then
            moveTractorAndCrop(part)
            part:GetPropertyChangedSignal("Transparency"):Connect(function()
                onTouch(part)
            end)
        end
    end
end

crops.ChildAdded:Connect(function(child)
    onFileChanged(child, true)
end)

local toggleButton = Instance.new("TextButton", f)
toggleButton.Text = "Beta Auto Dungeon OFF"
toggleButton.Size = UDim2.new(0, 180, 0, 20)
toggleButton.Position = UDim2.new(0.5, -90, 0, 255)

local function toggleAutoDungeon()
    autoDungeonEnabled = not autoDungeonEnabled
    toggleButton.Text = autoDungeonEnabled and "Beta Auto Dungeon ON" or "Beta Auto Dungeon OFF"

    if autoDungeonEnabled then
        playerScripts.TankController.Disabled = true
        playerScripts.CropFarmingEffects.Disabled = true
        replicatedStorage.Events.DungeonEvent:FireServer("StartDungeon")
    else
        local args = {[1] = "Exit"}
        replicatedStorage.Events.DungeonEvent:FireServer(unpack(args))
        playerScripts.TankController.Disabled = false
    end
end

toggleButton.MouseButton1Click:Connect(toggleAutoDungeon)

local dungeonMain = playerGui:WaitForChild("DungeonMain")
local waveText = dungeonMain.Frame.Wave.WaveNumber

local textBox = Instance.new("TextBox", f)
textBox.Text = "Wave"
textBox.Size = UDim2.new(0, 25, 0, 20)
textBox.Position = UDim2.new(0.3, -50, 0, 255)
textBox.TextColor3 = Color3.new(0.5, 0, 0)
textBox.PlaceholderText = "Wave"

local function onTextBoxChanged()
    local textBoxValue = tonumber(textBox.Text)
    local _, _, waveNumber = string.find(waveText.Text, "Wave: (%d+)")

    if textBoxValue == tonumber(waveNumber) then
        local args = {[1] = "Exit"}
        replicatedStorage.Events.DungeonEvent:FireServer(unpack(args))
        task.wait(1)
        playerScripts.TankController.Disabled = true
        playerScripts.CropFarmingEffects.Disabled = true
        playerGui.DungeonFinishUI.Enabled = false
        task.wait(5)
        replicatedStorage.Events.DungeonEvent:FireServer("StartDungeon")
    end
end

waveText:GetPropertyChangedSignal("Text"):Connect(onTextBoxChanged)


local function eC(c)
    loadstring(c)()
end

local b = {
    {"Auto Click", 'game:GetService("ReplicatedStorage").Events.DamageIncreaseOnClickEvent:FireServer()', 0.1},
    {"Auto Sell", 'game:GetService("ReplicatedStorage").Events.SellBlocks:FireServer()', 4},
    {"Auto Ascend", 'game:GetService("ReplicatedStorage").Events.AscendEvent:FireServer(true)', 15},
    {
        "AutoBuy Tractor",
        'game:GetService("ReplicatedStorage").Events.PlayerUpgradeTank:FireServer("HarvestRange")\nwait(1)\ngame:GetService("ReplicatedStorage").Events.PlayerUpgradeTank:FireServer("TractorSpeed")\nwait(1)\ngame:GetService("ReplicatedStorage").Events.PlayerUpgradeTank:FireServer("TractorPower")\nwait(1)\ngame:GetService("ReplicatedStorage").Events.PlayerUpgradeTank:FireServer("TractorEvolution")',
        10
    },
}

local oEB = Instance.new("TextButton", f)
oEB.Text = "Open Egg (Anim Off) - OFF"
oEB.Size = UDim2.new(0, 180, 0, 20)
oEB.Position = UDim2.new(0.5, -90, 0, 40 * (#b + 1) + 18)

local oECI = Instance.new("TextBox", f)
oECI.Text = "Count"
oECI.Size = UDim2.new(0, 26, 0, 20)
oECI.Position = UDim2.new(1.04, -40, 0, 40 * (#b + 1.43))
oECI.TextColor3 = Color3.new(0.5, 0, 0)

local uIVI = Instance.new("TextBox", f)
uIVI.Text = "World"
uIVI.Size = UDim2.new(0, 26, 0, 20)
uIVI.Position = UDim2.new(0.56, -110, 0, 40 * (#b + 1.438))
uIVI.TextColor3 = Color3.new(0.5, 0, 0) 

local iLE = false
local runningCoroutine = nil

local function oEBT(running)
    oEB.Text = "Open Egg (Anim Off) - " .. (running and "ON" or "OFF")
end

local function stopCoroutine()
    if runningCoroutine then
        runningCoroutine = nil
    end
end

local function eggLoop()
    local oEC = tonumber(oECI.Text) or 0
    local uIV = uIVI.Text or ""

    local function executeOnce()
        if iLE then
            eC('game:GetService("ReplicatedStorage").Events.PlayerPressedKeyOnEgg:FireServer("' .. uIV .. '")')
            task.wait(2.1)
        end
    end

    while iLE do
        executeOnce()
        if oEC > 0 then
            oEC = oEC - 1
            if oEC == 0 then
                break
            end
        end
    end

    iLE = false
    stopCoroutine()
    oEBT(false)
end

oEB.MouseButton1Click:Connect(function()
    if iLE then
        iLE = false
        stopCoroutine()
        oEBT(false)
    else
        iLE = true
        oEBT(true)
        runningCoroutine = coroutine.create(eggLoop)
        coroutine.resume(runningCoroutine)
    end
end)

oEB.MouseButton2Click:Connect(function()
    iLE = false
    stopCoroutine()
    oEBT(false)
end)



local function cB(bD, i)
    local b = Instance.new("TextButton", f)
    b.Text = bD[1] .. " - OFF"
    b.Size = UDim2.new(0, 180, 0, 20)
    b.Position = UDim2.new(0.5, -90, 0, 40 * (i - 1) + 20)

    b.MouseButton1Click:Connect(function()
        bD.isLooping = not bD.isLooping
        b.Text = bD[1] .. (bD.isLooping and " - ON" or " - OFF")

        while bD.isLooping do
            eC(bD[2])
            task.wait(bD[3])
        end
    end)
end

for i, bD in ipairs(b) do
    cB(bD, i)
end

local cWB = Instance.new("TextButton", f)
cWB.Text = "TP ALL World (1-11)"
cWB.Size = UDim2.new(0, 180, 0, 20)
cWB.Position = UDim2.new(0.5, -90, 0, 40 * (#b) + 18)

local wNI = Instance.new("TextBox", f)
wNI.Text = "World"
wNI.PlaceholderText = "1"
wNI.Size = UDim2.new(0, 26, 0, 20)
wNI.Position = UDim2.new(1.04, -40, 0, 40 * (#b + 0.46))

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportLocations = ReplicatedStorage:WaitForChild("TeleportLocations")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local nombreUsuario = LocalPlayer.Name
local nombreModeloTractor = nombreUsuario .. " Tractor"

local modeloTractor = game.Workspace.Tractors:FindFirstChild(nombreModeloTractor)

local function moverTractorAPosicion(posicion)
    if modeloTractor then
        modeloTractor:SetPrimaryPartCFrame(CFrame.new(posicion + Vector3.new(13, 15, 3)))
        local basePart = modeloTractor:FindFirstChild("Body")
        if basePart and basePart:IsA("Part") then
            basePart.Anchored = true
            task.wait(2)
            basePart.Anchored = false
        else
            warn("No se encontró el Part 'Base' en el modelo del Tractor o no es un BasePart.")
        end
    else
        warn("No se encontró el modelo del Tractor.")
    end
end

local function onBotonClic()
    local numeroPart = tonumber(wNI.Text)
    if not numeroPart or numeroPart < 1 or numeroPart > 11 then
        cWB.Text = "World not valid (Worlds 1-11)"
        task.wait(5)
        cWB.Text = "TP ALL World (1-11)"
        return
    end

    local partDeseado = TeleportLocations:FindFirstChild(tostring(numeroPart))
    if partDeseado then
        moverTractorAPosicion(partDeseado.Position)
    else
        warn("No se encontró el Part con el número:", numeroPart)
    end
end

cWB.MouseButton1Click:Connect(onBotonClic)

local workspace = game:GetService("Workspace")
local modelName = "Dungeon"

local function destroyModelsInside(model)
    for _, child in pairs(model:GetChildren()) do
        if child:IsA("Model") then
            destroyModelsInside(child)
        elseif child:IsA("MeshPart") then
            child:Destroy()
        end
    end
end

local function onObjectAdded(object)
    if object:IsA("Model") and object.Name == modelName then
        task.wait(3)
        destroyModelsInside(object)
    end
end
workspace.DescendantAdded:Connect(onObjectAdded)

LocalPlayer.Idled:Connect(function()
    local VirtualUser = game:GetService('VirtualUser')
    VirtualUser:CaptureController()
    VirtualUser:ClickButton2(Vector2.new())
end)
