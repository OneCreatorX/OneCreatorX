local jugadorLocal = game.Players.LocalPlayer
local quests = jugadorLocal.Quests
local clickerRemote = game:GetService("ReplicatedStorage"):WaitForChild("MouseClicked")

local destinations = {
    Vector3.new(0, 8, 30),
    Vector3.new(-32, 8, 0),
    Vector3.new(40, 8, 0),
    Vector3.new(2, 8, -17)
}

function movePlayerTo(destination)
    jugadorLocal.Character:WaitForChild("Humanoid").WalkToPoint = destination
end


function spamBehavior(actionFunction)
    local completed = false

    spawn(function()
        while not completed do
            actionFunction()
         task.wait()
        end
    end)

    return function()
        completed = true
    end
end

function runnerBehavior()
    local currentDestinationIndex = 1
    local distanceThreshold = 5 

    return function()
        local humanoid = jugadorLocal.Character:FindFirstChildOfClass("Humanoid")
        if humanoid then
            local currentPos = humanoid.Parent and humanoid.Parent.PrimaryPart and humanoid.Parent.PrimaryPart.Position
            if currentPos and (currentPos - destinations[currentDestinationIndex]).Magnitude < distanceThreshold then
                currentDestinationIndex = (currentDestinationIndex % #destinations) + 1
            end
            movePlayerTo(destinations[currentDestinationIndex])
        end
    end
end

function clickerBehavior()
    return function()
        clickerRemote:FireServer()
    end
end

function jumpBehavior()
    local character = jugadorLocal.Character
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")

    return function()
        humanoid.Jump = true
        task.wait(0.001)
        humanoid.Jump = false
    end
end

function afkBehavior()
    return function()
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
    elseif nombreArchivo == "Jumper" then  -- Aquí cambió de "Jump" a "Jumper"
        actionFunc = jumpBehavior()
    end

    local stopSpam = spamBehavior(actionFunc)

    completedBool.Changed:Connect(function(newValue)
        print("Completed cambiado a:", newValue)
        if newValue then
            stopSpam()  -- Detener la acción en bucle cuando la tarea está completa
            game:GetService("ReplicatedStorage"):WaitForChild("ClaimQuestReward"):FireServer(nombreArchivo)
        end
    end)
end)
