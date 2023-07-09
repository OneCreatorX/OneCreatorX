local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local playerPosition = Players.LocalPlayer.Character.HumanoidRootPart.Position

local function GetPlot()
    for _, v in ipairs(Workspace.Plots:GetDescendants()) do
        if v.Name == "Owner" and v.Value == Players.LocalPlayer then
            return v.Parent
        end
    end
end

local function invokeClothing(clothing)
    ReplicatedStorage.Events.GrabClothing:FireServer(clothing)
end

local specialTag = Instance.new("StringValue") -- Reemplaza "StringValue" con el tipo de la etiqueta

local function hasSpecialTag(clothing)
    return clothing:FindFirstChild("SpecialTag") == specialTag
end

local function checkAndInvokeClothing()
    local clothingDirectory = Workspace.Debris.Clothing
    local clothingList = clothingDirectory:GetChildren()

    -- Función de comparación para ordenar la lista de ropa por distancia al jugador
    local function compareDistance(a, b)
        local distanceA = (a.Position - playerPosition).Magnitude
        local distanceB = (b.Position - playerPosition).Magnitude
        return distanceA < distanceB
    end

    -- Ordenar la lista de ropa por distancia al jugador
    table.sort(clothingList, compareDistance)

    -- Separar la lista de ropa en dos grupos: especial y normal
    local specialClothingList = {}
    local normalClothingList = {}

    for _, clothing in ipairs(clothingList) do
        if hasSpecialTag(clothing) then
            table.insert(specialClothingList, clothing)
        else
            table.insert(normalClothingList, clothing)
        end
    end

    -- Invocar la ropa especial primero, seguida de la ropa normal
    for _, clothing in ipairs(specialClothingList) do
        clothing:SetAttribute("IsInvoked", true)
        invokeClothing(clothing)
        wait(0.1) -- Pequeño tiempo de espera entre cada invocación
    end

    for _, clothing in ipairs(normalClothingList) do
        clothing:SetAttribute("IsInvoked", true)
        invokeClothing(clothing)
        wait(0.1) -- Pequeño tiempo de espera entre cada invocación
    end
end

local function manageWashingMachine(washingMachine)
    while true do
        -- Iniciar lavadora
        ReplicatedStorage.Events.LoadWashingMachine:FireServer(washingMachine)

        -- Detener lavadora
        ReplicatedStorage.Events.UnloadWashingMachine:FireServer(washingMachine)
        wait(1.5)
    end
end

local function invokeClothingProcess()
    while true do
        checkAndInvokeClothing()
        wait(1) -- Esperar 2 segundos al final de cada recorrido
    end
end

local function dropClothesInChute()
    while true do
        ReplicatedStorage.Events.DropClothesInChute:FireServer()
        wait(1)
    end
end

local function startSpam()
    local plot = GetPlot()
    if plot then
        local washingMachines = plot.WashingMachines:GetChildren()

        for _, washingMachine in ipairs(washingMachines) do
            spawn(function()
                manageWashingMachine(washingMachine)
            end)
        end

        spawn(invokeClothingProcess)
        spawn(dropClothesInChute)
    else
        print("No se encontró el Plot del jugador.")
    end
end

startSpam()