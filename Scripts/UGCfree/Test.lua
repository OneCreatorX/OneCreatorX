local jugadorLocal = game.Players.LocalPlayer
local quests = jugadorLocal.Quests
local clickerRemote = game:GetService("ReplicatedStorage"):WaitForChild("MouseClicked")

function spamBehavior(actionFunction)
    local completed = false

    spawn(function()
        while not completed do
            actionFunction()
            wait()
        end
    end)

    return function()
        completed = true
    end
end

function runnerBehavior()
    local character = jugadorLocal.Character
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")

    return function()
        humanoid.WalkToPoint = Vector3.new(math.random(-5, 5), 0, math.random(-5, 5))
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
        wait()
        humanoid.Jump = false
    end
end

function afkBehavior()
    -- No hace nada especial, ya que AFK no requiere una acción en bucle
    return function()
        -- No se requiere acción de finalización para AFK
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
