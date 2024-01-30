local jugadorLocal = game.Players.LocalPlayer
local quests = jugadorLocal.Quests
local clickerRemote = game:GetService("ReplicatedStorage"):WaitForChild("MouseClicked")

local destinations = {
    Vector3.new(0, 8, 30),
    Vector3.new(-32, 8, 0),
    Vector3.new(40, 8, 0),
    Vector3.new(2, 8, -17)
}

function spamBehavior(actionFunction)
    local completed = false

    local connection
    connection = game:GetService("RunService").Heartbeat:Connect(function()
        if not completed then
            actionFunction()
        else
            connection:Disconnect()
        end
    end)

    return function()
        completed = true
    end
end

function movePlayerTo(destination)
    jugadorLocal.Character:WaitForChild("Humanoid").WalkToPoint = destination
end

function runnerBehavior()
    local currentDestinationIndex = 1

    return function()
        movePlayerTo(destinations[currentDestinationIndex])
        currentDestinationIndex = (currentDestinationIndex % #destinations) + 1
    end
end

function clickerBehavior()
    return function()
        clickerRemote:FireServer()
    end
end

function jumperBehavior()
    return function()
        local humanoid = jugadorLocal.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            humanoid.Jump = true
            humanoid.Jump = false
        end
    end
end

function afkBehavior()
    return function()
        -- No se requiere una acción específica para AFK
    end
end

-- Verificar si ya existen archivos al inicio
for _, archivo in pairs(quests:GetChildren()) do
    local completedBool = archivo:FindFirstChild("Completed")
    if completedBool and completedBool.Value then
        local nombreArchivo = archivo.Name
        local actionFunc
        if nombreArchivo == "Runner" then
            actionFunc = runnerBehavior()
        elseif nombreArchivo == "AFK" then
            actionFunc = afkBehavior()
        elseif nombreArchivo == "Clicker" then
            actionFunc = clickerBehavior()
        elseif nombreArchivo == "Jumper" then
            actionFunc = jumperBehavior()
        end

        local stopSpam = spamBehavior(actionFunc)

        completedBool.Changed:Connect(function(newValue)
            print("Completed cambiado a:", newValue)
            if newValue then
                stopSpam()  -- Detener la acción en bucle cuando la tarea está completa
                game:GetService("ReplicatedStorage"):WaitForChild("ClaimQuestReward"):FireServer(nombreArchivo)
            end
        end)
    end
end

quests.ChildAdded:Connect(function(archivo)
    print("Nuevo archivo agregado:", archivo.Name)
    local completedBool = archivo:WaitForChild("Completed")
    local nombreArchivo = archivo.Name
    local actionFunc

    if nombreArchivo == "Runner" then
        actionFunc = runnerBehavior()
    elseif nombreArchivo == "AFK" then
        actionFunc = afkBehavior()
    elseif nombreArchivo == "Clicker" then
        actionFunc = clickerBehavior()
    elseif nombreArchivo == "Jumper" then
        actionFunc = jumperBehavior()
    end

    local stopSpam = spamBehavior(actionFunc)

    completedBool.Changed:Connect(function(newValue)
        print("Completed cambiado a:", newValue)
        if newValue then
            stopSpam()
            game:GetService("ReplicatedStorage"):WaitForChild("ClaimQuestReward"):FireServer(nombreArchivo)
        end
    end)
end)
