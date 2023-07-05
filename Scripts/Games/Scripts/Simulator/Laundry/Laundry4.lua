local washingMachines = workspace.Plots.Plot4.WashingMachines:GetChildren()

local function startWashingMachine(washingMachine)
    while wait() do
        game:GetService("ReplicatedStorage").Events.LoadWashingMachine:FireServer(washingMachine)
    end
end

local function stopWashingMachine(washingMachine)
    while true do
        game:GetService("ReplicatedStorage").Events.UnloadWashingMachine:FireServer(washingMachine)
        wait()
    end
end

local function invokeClothing(clothingName)
    game:GetService("ReplicatedStorage").Events.GrabClothing:FireServer(workspace.Debris.Clothing:FindFirstChild(clothingName))
end

local function invokeClothingProcess()
    local clothingList = workspace.Debris.Clothing:GetChildren()
    local lastIndex = 1

    while true do
        for i = lastIndex, #clothingList, 20 do
            local endIndex = math.min(i + 8, #clothingList)

            for j = i, endIndex do
                invokeClothing(clothingList[j].Name)
            end

            wait(1)

            if endIndex == #clothingList and i >= lastIndex then
                lastIndex = i
                wait(2)
            end
        end

        wait()
    end
end

local function dropClothesInChute()
    while true do
        for i = 1, 5 do
            game:GetService("ReplicatedStorage").Events.DropClothesInChute:FireServer()
        end
        wait(1)
    end
end

local walkPositions = {
    Vector3.new(-132.559, 4.49802, -44.7912),
    Vector3.new(-106.621, 5.57671, -11.1147)
}

local function walkToPosition(position)
    local humanoid = game.Players.LocalPlayer.Character.Humanoid
    humanoid:MoveTo(position)
    humanoid.MoveToFinished:Wait()
    wait(1)
end

-- Función para iniciar las lavadoras y "spam"
local function startSpam()
    for i, washingMachine in ipairs(washingMachines) do
        spawn(function()
            startWashingMachine(washingMachine)
        end)
    end

    spawn(invokeClothingProcess)

    for i, washingMachine in ipairs(washingMachines) do
        spawn(function()
            stopWashingMachine(washingMachine)
        end)
    end

    spawn(dropClothesInChute)

    while true do
        -- Ida
        for _, position in ipairs(walkPositions) do
            walkToPosition(position)
        end

        -- Vuelta
        for i = #walkPositions, 1, -1 do
            walkToPosition(walkPositions[i])
        end
    end
end

-- Iniciar el "spam"
startSpam()
