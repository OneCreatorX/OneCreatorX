local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Parent = player.PlayerGui
local playerGui = player:WaitForChild("PlayerGui")
local onScreenButtons = playerGui:WaitForChild("OnScreenButtons")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 290)
frame.Position = UDim2.new(0.85, -200, 0.1, 0)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Parent = gui
frame.Active = true
frame.Draggable = true

local minimizeButton = Instance.new("TextButton")
minimizeButton.Text = "-"
minimizeButton.Size = UDim2.new(0, 20, 0, 20)
minimizeButton.Position = UDim2.new(1, -20, 0, 0)
minimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
minimizeButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
minimizeButton.BorderSizePixel = 0
minimizeButton.Parent = frame

local isMinimized = false

minimizeButton.MouseButton1Click:Connect(function()
    isMinimized = not isMinimized
    frame.Size = isMinimized and UDim2.new(0, 20, 0, 20) or UDim2.new(0, 200, 0, 350)
    minimizeButton.Text = isMinimized and "+" or "-"
    
    for _, element in ipairs(frame:GetChildren()) do
        if element:IsA("TextButton") or element:IsA("TextBox") then
            if element ~= minimizeButton then
                element.Visible = not isMinimized
            end
        end
    end
end)

local nombreMeshPartEnCrops = "Crop"
local nombreUsuario = game.Players.LocalPlayer.Name
local nombreModeloTractor = nombreUsuario .. " Tractor"

local rutaModeloTractor = game.Workspace.Tractors:FindFirstChild(nombreModeloTractor)
local rutaCrops = game.Workspace.Crops.DungeonCrops

local function buscarMeshPartEnModelo(modelo, nombreMeshPart)
    for _, objeto in ipairs(modelo:GetChildren()) do
        if objeto:IsA("MeshPart") and objeto.Name == nombreMeshPart and objeto.Transparency < 1 then
            return objeto
        elseif objeto:IsA("Model") or objeto:IsA("Folder") then
            local resultado = buscarMeshPartEnModelo(objeto, nombreMeshPart)
            if resultado then return resultado end
        end
    end
    return nil
end

local function moverTractorAPosicion(meshPart)
    rutaModeloTractor:SetPrimaryPartCFrame(CFrame.new(meshPart.Position + Vector3.new(13, 5, 3)))
end

local function onTransparenciaCambiada(meshPart)
    if meshPart.Transparency == 1 then
        local nuevoMeshPart = buscarMeshPartEnModelo(rutaCrops, nombreMeshPartEnCrops)
        if nuevoMeshPart and rutaModeloTractor:IsA("Model") then
            local distancia = (rutaModeloTractor.PrimaryPart.Position - nuevoMeshPart.Position).Magnitude
            if distancia <= 400 then
                moverTractorAPosicion(nuevoMeshPart)
                nuevoMeshPart:GetPropertyChangedSignal("Transparency"):Connect(function()
                    onTransparenciaCambiada(nuevoMeshPart)
                end)
                nuevoMeshPart.Touched:Connect(function(hit)
                    if hit:IsA("Part") then hit.CollisionGroupId = 2 end
                end)
            end
        else
            warn("No se encontró el modelo del tractor o la carpeta DungeonCrops.")
        end
    end
end

-- Verificar si se encontró el modelo del tractor
if rutaModeloTractor and rutaModeloTractor:IsA("Model") and rutaModeloTractor.PrimaryPart then
    print("Se encontró el modelo del tractor:", nombreModeloTractor)
    -- Resto del código aquí
else
    warn("El modelo del tractor no es válido o no tiene una parte principal.")
end

local autoFarmActive = false
local toggleButton = Instance.new("TextButton")
toggleButton.Text = "Auto Farming Dungeons OFF"
toggleButton.Size = UDim2.new(0, 180, 0, 20)
toggleButton.Position = UDim2.new(0.5, -90, 0, 255)
toggleButton.Parent = frame

local function toggleAutoFarm()
    autoFarmActive = not autoFarmActive
    toggleButton.Text = autoFarmActive and "Applied-AutoFarm ON" or "Auto Farming Dungeons OFF"

    while autoFarmActive do
        game:GetService("ReplicatedStorage").Events.DungeonEvent:FireServer("StartDungeon")
        wait(3)
        if rutaModeloTractor and rutaCrops and rutaModeloTractor:IsA("Model") and rutaCrops:IsA("Folder") then
            local posicionMeshPart = buscarMeshPartEnModelo(rutaCrops, nombreMeshPartEnCrops)
            if posicionMeshPart then
                moverTractorAPosicion(posicionMeshPart)
                posicionMeshPart:GetPropertyChangedSignal("Transparency"):Connect(function()
                    onTransparenciaCambiada(posicionMeshPart)
                end)
            end
        end
        wait(3)
    end
end

toggleButton.MouseButton1Click:Connect(toggleAutoFarm)

local function executeCode(code)
    loadstring(code)()
end

local buttons = {
    {"Auto Click", 'game:GetService("ReplicatedStorage").Events.DamageIncreaseOnClickEvent:FireServer()', 0.1},
    {"Auto Sell", 'game:GetService("ReplicatedStorage").Events.SellBlocks:FireServer()', 2},
    {"Auto Ascender", 'game:GetService("ReplicatedStorage").Events.AscendEvent:FireServer(true)', 15},
    {
        "Auto Mejoras Trac",
        'game:GetService("ReplicatedStorage").Events.PlayerUpgradeTank:FireServer("HarvestRange")\nwait(1)\ngame:GetService("ReplicatedStorage").Events.PlayerUpgradeTank:FireServer("TractorSpeed")\nwait(1)\ngame:GetService("ReplicatedStorage").Events.PlayerUpgradeTank:FireServer("TractorPower")\nwait(1)\ngame:GetService("ReplicatedStorage").Events.PlayerUpgradeTank:FireServer("TractorEvolution")',
        10
    },
}

local openEggButton = Instance.new("TextButton")
openEggButton.Text = "Open Egg (Anim Off) - OFF"
openEggButton.Size = UDim2.new(0, 180, 0, 20)
openEggButton.Position = UDim2.new(0.5, -90, 0, 40 * (#buttons + 1) + 18)
openEggButton.Parent = frame

local openEggCountInput = Instance.new("TextBox")
openEggCountInput.Text = "Count"
openEggCountInput.Size = UDim2.new(0, 23, 0, 20)
openEggCountInput.Position = UDim2.new(1.05, -40, 0, 40 * (#buttons + 1.43))
openEggCountInput.TextColor3 = Color3.new(0.5, 0, 0)
openEggCountInput.Parent = frame

local userInputValueInput = Instance.new("TextBox")
userInputValueInput.Text = "World"
userInputValueInput.Size = UDim2.new(0, 23, 0, 20)
userInputValueInput.Position = UDim2.new(0.6, -110, 0, 40 * (#buttons + 1.43))
userInputValueInput.TextColor3 = Color3.new(0.5, 0, 0) 
userInputValueInput.Parent = frame
local isLoopingOpenEgg = false

local function setOpenEggButtonText()
    openEggButton.Text = "Open Egg (Anim Off) - " .. (isLoopingOpenEgg and "ON" or "OFF")
end

openEggButton.MouseButton1Click:Connect(function()
    local openEggCount = tonumber(openEggCountInput.Text) or 1
    local userInputValue = userInputValueInput.Text or ""

    isLoopingOpenEgg = not isLoopingOpenEgg
    setOpenEggButtonText()

    local function openEggLoop()
        for i = 1, openEggCount do
            if not isLoopingOpenEgg then
                break
            end

            executeCode('game:GetService("ReplicatedStorage").Events.PlayerPressedKeyOnEgg:FireServer("' .. userInputValue .. '")')
            wait(2.1)
        end

        isLoopingOpenEgg = false
        setOpenEggButtonText()
    end

    coroutine.wrap(openEggLoop)()
end)

local function createButton(buttonData, index)
    local button = Instance.new("TextButton")
    button.Text = buttonData[1] .. " - OFF"
    button.Size = UDim2.new(0, 180, 0, 20)
    button.Position = UDim2.new(0.5, -90, 0, 40 * (index - 1) + 20)
    button.Parent = frame

    button.MouseButton1Click:Connect(function()
        buttonData.isLooping = not buttonData.isLooping
        button.Text = buttonData[1] .. (buttonData.isLooping and " - ON" or " - OFF")

        while buttonData.isLooping do
            executeCode(buttonData[2])
            task.wait(buttonData[3])
        end
    end)
end

for index, buttonData in ipairs(buttons) do
    createButton(buttonData, index)
end

local changeWorldButton = Instance.new("TextButton")
changeWorldButton.Text = "TP World Desblock"
changeWorldButton.Size = UDim2.new(0, 180, 0, 20)
changeWorldButton.Position = UDim2.new(0.5, -90, 0, 40 * (#buttons) + 18)
changeWorldButton.Parent = frame

local worldNumberInput = Instance.new("TextBox")
worldNumberInput.PlaceholderText = "1"
worldNumberInput.Size = UDim2.new(0, 20, 0, 20)
worldNumberInput.Position = UDim2.new(1.05, -40, 0, 40 * (#buttons + 0.46))
worldNumberInput.Parent = frame

changeWorldButton.MouseButton1Click:Connect(function()
    local worldNumber = tonumber(worldNumberInput.Text)
    if worldNumber then
        executeCode('game:GetService("ReplicatedStorage").Events.TeleportEvent:InvokeServer("Teleport", ' .. worldNumber .. ')')
    end
end)

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

while true do
    checkDisabled()
    wait(10)
end

onScreenButtons:GetPropertyChangedSignal("Enabled"):Connect(function()
    if not onScreenButtons.Enabled then
        onScreenButtons.Enabled = true
    end
end)
