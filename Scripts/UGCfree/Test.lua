local jugadorLocal = game.Players.LocalPlayer
local quests = jugadorLocal.Quests
local clickerRemote = game:GetService("ReplicatedStorage"):WaitForChild("MouseClicked")

function runnerBehavior()
    local character = jugadorLocal.Character
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")

    while true do
        humanoid.WalkToPoint = Vector3.new(math.random(-5, 5), 0, math.random(-5, 5))
        wait()
    end
end

function clickerBehavior()
    while true do
        clickerRemote:FireServer()
        wait(1)
    end
end

function jumpBehavior()
    local character = jugadorLocal.Character
    local humanoid = character and character:FindFirstChildOfClass("Humanoid")

    while true do
        humanoid.Jump = true
        wait(0.3)
    end
end

function afkBehavior()
    -- No hace nada especial, ya que AFK no requiere una acción en bucle
end

quests.ChildAdded:Connect(function(archivo)
    print("Nuevo archivo agregado:", archivo.Name)
    local completedBool = archivo:WaitForChild("Completed")
    local nombreArchivo = archivo.Name

    completedBool.Changed:Connect(function(newValue)
        print("Completed cambiado a:", newValue)
        if newValue then
            if nombreArchivo == "Runner" then
                spawn(runnerBehavior)
            elseif nombreArchivo == "AFK" then
                afkBehavior()
            elseif nombreArchivo == "Clicker" then
                spawn(clickerBehavior)
            elseif nombreArchivo == "Jump" then
                spawn(jumpBehavior)
            end

            game:GetService("ReplicatedStorage"):WaitForChild("ClaimQuestReward"):FireServer(nombreArchivo)
        end
    end)
end)
