local p = game.Players.LocalPlayer
local g = Instance.new("ScreenGui", p.PlayerGui)
local pg = p:WaitForChild("PlayerGui")
local osb = pg:WaitForChild("OnScreenButtons")
local player = game.Players.LocalPlayer
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
f.Position = UDim2.new(0.85, -200, 0.1, 0)
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

local gText = Instance.new("TextLabel", f)
gText.Size = UDim2.new(0, 200, 0, 20)
gText.Position = UDim2.new(0, 0, 0, 0)
gText.TextColor3 = Color3.new(1, 1, 1)
gText.BackgroundColor3 = Color3.new(30/255, 30/255, 30/255)
gText.BorderSizePixel = 0
gText.Text = "Egg For Legendary: Loading..."
gText.Visible = false

local GuaranteedNumber = p.PlayerGui.PetsPopup.Frame.GuaranteedLegendary:WaitForChild("GuaranteedNumber")

local function updateText()
    gText.Text = "Egg For Legendary: " .. tostring(GuaranteedNumber.Text)
end

gText.Visible = true

GuaranteedNumber:GetPropertyChangedSignal("Text"):Connect(function()
    updateText()
    -- Oculta "Cargando..." después de recibir la señal
    gText.Visible = false
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

local nMC = "Crop"
local nU = p.Name
local nMT = nU .. " Tractor"

local rMT = game.Workspace.Tractors:FindFirstChild(nMT)
local rC = game.Workspace.Crops.DungeonCrops

local tA = false

local function bMPM(m, nMP)
    for _, o in ipairs(m:GetChildren()) do
        if o:IsA("MeshPart") and o.Name == nMP and o.Transparency < 1 then
            return o
        elseif o:IsA("Model") or o:IsA("Folder") then
            local r = bMPM(o, nMP)
            if r then return r end
        end
    end
end

local function mTAP(mp)
    if tA then
        return
    end
    
    rMT:SetPrimaryPartCFrame(CFrame.new(mp.Position + Vector3.new(13, 0, 3)))
end

local function oTC(mP)
    if mP.Transparency == 1 then
        local nMP = bMPM(rC, nMC)
        if nMP and rMT:IsA("Model") then
            local d = (rMT.PrimaryPart.Position - nMP.Position).Magnitude
            if d <= 200 then
                mTAP(nMP)
                
                nMP:GetPropertyChangedSignal("Transparency"):Connect(function()
                    oTC(nMP)
                end)
                
                nMP.Touched:Connect(function(hit)
                    if hit:IsA("Part") then hit.CollisionGroupId = 2 end
                end)
            end
        end
    else
        tA = true
    end
end

if rMT and rMT:IsA("Model") and rMT.PrimaryPart then
    print("Se encontró el modelo del tractor:", nMT)
end

local aFA = false
local tB = Instance.new("TextButton", f)
tB.Text = "AutoFarm Dungeon OFF"
tB.Size = UDim2.new(0, 180, 0, 20)
tB.Position = UDim2.new(0.5, -90, 0, 255)

local function tAF()
    aFA = not aFA
    tB.Text = aFA and "AutoFarm Dugeon ON" or "AutoFarm Dungeon OFF"

    while aFA do
        game:GetService("ReplicatedStorage").Events.DungeonEvent:FireServer("StartDungeon")
        task.wait(2)
        if rMT and rC and rMT:IsA("Model") and rC:IsA("Folder") then
            local pMP = bMPM(rC, nMC)
            if pMP then
                mTAP(pMP)
                pMP:GetPropertyChangedSignal("Transparency"):Connect(function()
                    oTC(pMP)
                end)
            end
        end
        task.wait(2)
    end
end

tB.MouseButton1Click:Connect(tAF)

local function eC(c)
    loadstring(c)()
end

local b = {
    {"Auto Click", 'game:GetService("ReplicatedStorage").Events.DamageIncreaseOnClickEvent:FireServer()', 0.1},
    {"Auto Sell", 'game:GetService("ReplicatedStorage").Events.SellBlocks:FireServer()', 2},
    {"Auto Ascender", 'game:GetService("ReplicatedStorage").Events.AscendEvent:FireServer(true)', 15},
    {
        "Auto Mejoras Trac",
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
uIVI.Position = UDim2.new(0.56, -110, 0, 40 * (#b + 1.439))
uIVI.TextColor3 = Color3.new(0.5, 0, 0) 

local iLE = false

local function oEBT()
    oEB.Text = "Open Egg (Anim Off) - " .. (iLE and "ON" or "OFF")
end

oEB.MouseButton1Click:Connect(function()
    local oEC = tonumber(oECI.Text) or 1
    local uIV = uIVI.Text or ""

    iLE = not iLE
    oEBT()

    local function oEL()
        for i = 1, oEC do
            if not iLE then
                break
            end

            eC('game:GetService("ReplicatedStorage").Events.PlayerPressedKeyOnEgg:FireServer("' .. uIV .. '")')
            task.wait(2.1)
        end

        iLE = false
        oEBT()
    end

    coroutine.wrap(oEL)()
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
    modeloTractor:SetPrimaryPartCFrame(CFrame.new(posicion + Vector3.new(13, 15, 3)))
end

local function onBotonClic()
    local numeroPart = tonumber(wNI.Text)
    if numeroPart then
        local partDeseado = TeleportLocations:FindFirstChild(tostring(numeroPart))
        if partDeseado then
            moverTractorAPosicion(partDeseado.Position)
        else
            warn("No se encontró el Part con el número:", numeroPart)
        end
    else
        warn("Ingresa un número válido en el TextBox.")
    end
end

cWB.MouseButton1Click:Connect(onBotonClic)
