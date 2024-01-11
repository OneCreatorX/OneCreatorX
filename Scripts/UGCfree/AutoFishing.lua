local cf = CFrame.new
local jugador = game.Players.LocalPlayer
local rods = {"Xmas Tree Rod", "Wooden Rod", "Metal Rod"}

local function createBob(cframe)
    game.ReplicatedStorage.BobEvents.CreateBob:FireServer(cframe)
end

local function getFishAll()
    for _, rodType in ipairs(rods) do
        game.ReplicatedStorage.FishRemote.GetFish:InvokeServer(rodType)
    end
end

local function equipObjects()
    local backpack = jugador:WaitForChild("Backpack")
    if not backpack then return end

    for _, objectName in pairs(rods) do
        local obj = backpack:FindFirstChild(objectName)
        if obj then
            obj.Parent = jugador.Character
            local destHand = jugador.Character:FindFirstChild("RightHand") or jugador.Character:FindFirstChild("LeftHand")
            if destHand then obj.Handle.CFrame = destHand.CFrame end
        end
    end
end

-- Crear una señal personalizada para el evento de objeto agregado
local objetoAgregadoSignal = Instance.new("BindableEvent")
objetoAgregadoSignal.Name = "ObjetoAgregadoSignal"
objetoAgregadoSignal.Parent = jugador

local function onObjectAdded(objectName)
    table.insert(rods, objectName)
    print("Nuevo objeto agregado a la lista de rods:", objectName)
end
objetoAgregadoSignal.Event:Connect(onObjectAdded)

local function main()
    local backpack = jugador:WaitForChild("Backpack")
    if not backpack then return end

    for _, obj in pairs(backpack:GetChildren()) do
        if obj:IsA("Model") and not table.find(rods, obj.Name) then
            table.insert(rods, obj.Name)
            -- Llamar a la señal personalizada para simular el evento de objeto agregado
            objetoAgregadoSignal:Fire(obj.Name)
        end
    end

    while true do
        for _, pos in ipairs({
            cf(45.77, 28.79, 9.04, -0.998, -0.02, -0.0618, -0.0181, 0.9993, -0.0318, 0.0624, -0.0306, -0.998),
            cf(56.23, 12, 34.05, 1, 0, 0, 0, 1, 0, 0, 0, 1)
        }) do
            createBob(pos)
            wait(1)

            getFishAll()

            equipObjects()
        end
    end
end

main()
