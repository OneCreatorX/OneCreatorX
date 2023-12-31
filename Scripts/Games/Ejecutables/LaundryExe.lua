local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local rootPart = character:WaitForChild("HumanoidRootPart")
local initialPosition = rootPart.Position

local function moveToPosition(position)
    humanoid:MoveTo(position)
    humanoid.MoveToFinished:Wait()
end

-- Cambiar Gamepasses a true
local gamepasses = player:FindFirstChild("Gamepasses")
if gamepasses then
    for _, child in ipairs(gamepasses:GetChildren()) do
        if child.Name ~= "VIP" then
            child.Value = true
        end
    end
end

-- Ejecutar URL
local url = "https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/Games/Scripts/Simulator/Laundry/AutoFarm.lua"

local success, scriptContent = pcall(function()
    return game:HttpGet(url)
end)

if success then
    local success, scriptFunction = pcall(function()
        return loadstring(scriptContent)
    end)

    if success then
        success, _ = pcall(scriptFunction)
    end
else
    warn("No se pudo obtener el contenido del script desde el URL.")
end

local function onPropertyChanged(property)
    if property == "Visible" and player.PlayerGui.SpecialNotification and player.PlayerGui.SpecialNotification.BottomFrame.Visible then
        -- Guardar la posición inicial
        initialPosition = rootPart.Position

        -- Agrega las ubicaciones y tiempos de espera deseados aquí
        moveToPosition(Vector3.new(20.4233, 5.5667, -11.7425))
        wait(15) -- Espera 15 segundos

        moveToPosition(Vector3.new(30.6013, 5.19095, -32.8078))
        wait(7) -- Espera 7 segundos

        moveToPosition(Vector3.new(69.3579, 4.48846, -37.1112))
        wait(2) -- Espera 2 segundos

        moveToPosition(Vector3.new(70.4744, 4.48846, 12.9616))
        wait(2) -- Espera 2 segundos

        moveToPosition(Vector3.new(32.0488, 5.19095, 10.918))
        wait(2) -- Espera 2 segundos

        moveToPosition(Vector3.new(17.3527, 5.57671, -10.0421))
        wait(1) -- Espera 1 segundo

        -- Vuelve a la posición inicial
        moveToPosition(initialPosition)
    end
end

if player.PlayerGui.SpecialNotification and player.PlayerGui.SpecialNotification.BottomFrame then
    player.PlayerGui.SpecialNotification.BottomFrame:GetPropertyChangedSignal("Visible"):Connect(onPropertyChanged)
end
