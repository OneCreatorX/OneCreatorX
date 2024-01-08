local currentProximityPrompt = nil

local function activateProximityPromptsInFolder(folder)
    if folder then
        for _, object in ipairs(folder:GetDescendants()) do
            if object:IsA("ProximityPrompt") then
                fireproximityprompt(object)
                currentProximityPrompt = object
            end
        end
    else
        print("La carpeta proporcionada es nil.")
    end
end

local storesFolder = workspace:WaitForChild("Stores")

local function moverYProceso()
    local jugador = game.Players.LocalPlayer
    local nuevaPosicion = Vector3.new(870, 16, -146)
    jugador.Character:SetPrimaryPartCFrame(CFrame.new(nuevaPosicion))
    task.wait(2)

    local humanoidRootPart = jugador.Character:WaitForChild("HumanoidRootPart")

    local function buscarMarker(objeto)
        local billboardGui = objeto:FindFirstChildOfClass("BillboardGui")
        if billboardGui and billboardGui.Name == "Marker" then
            return objeto
        end

        for _, hijo in ipairs(objeto:GetChildren()) do
            local resultado = buscarMarker(hijo)
            if resultado then
                return resultado
            end
        end

        return nil
    end

    local markerParent = nil

    for _, objeto in ipairs(storesFolder:GetDescendants()) do
        local marker = buscarMarker(objeto)
        if marker then
            markerParent = marker.Parent
            break
        end
    end

    if markerParent then
        humanoidRootPart.CFrame = CFrame.new(markerParent.Position)
        task.wait(1)
        activateProximityPromptsInFolder(storesFolder)
        task.wait(1)
        game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvents"):WaitForChild("EndCriminalRobbery"):FireServer()
    else
        print("No se encontró el Marker en Workspace.Stores.")
        return
    end
    task.wait(2)
    moverYProceso()
end

activateProximityPromptsInFolder(storesFolder)
moverYProceso()
