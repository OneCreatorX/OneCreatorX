local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local playerPosition = player.Character.HumanoidRootPart.Position

local function GetPlot()
    for _, v in ipairs(Workspace.Plots:GetDescendants()) do
        if v.Name == "Owner" and v.Value == player then
            return v.Parent
        end
    end
end

local function invokeClothing(clothing)
    ReplicatedStorage.Events.GrabClothing:FireServer(clothing)
end

local function compareDistance(a, b)
    local distanceA = (a.Position - playerPosition).Magnitude
    local distanceB = (b.Position - playerPosition).Magnitude
    return distanceA < distanceB
end

local function checkAndInvokeClothing()
    local clothingDirectory = Workspace.Debris.Clothing
    local clothingList = {}

    for _, clothing in ipairs(clothingDirectory:GetChildren()) do
        table.insert(clothingList, clothing)
    end

    table.sort(clothingList, compareDistance)

    for _, clothing in ipairs(clothingList) do
        clothing:SetAttribute("IsInvoked", true)
        invokeClothing(clothing)
        wait(0.1) -- Pequeño tiempo de espera entre cada invocación
    end

    table.clear(clothingList) -- Limpiar la tabla de ropas
end

local function manageWashingMachine(washingMachine)
    while true do
        -- Iniciar lavadora
        ReplicatedStorage.Events.LoadWashingMachine:FireServer(washingMachine)

        -- Detener lavadora
        ReplicatedStorage.Events.UnloadWashingMachine:FireServer(washingMachine)
        wait()
    end
end

local function invokeClothingProcess()
    while true do
        checkAndInvokeClothing()
        wait(2) -- Esperar 2 segundos al final de cada recorrido
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
