local jugadorLocal = game.Players.LocalPlayer
local directorioCoins = workspace.LevelSections:FindFirstChild("Coins")

if not jugadorLocal or not directorioCoins then return end

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = jugadorLocal.PlayerGui

local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 100, 0, 50)
button.Position = UDim2.new(0.5, -50, 0.9, -25)
button.Text = "Buscar y tp"
button.Parent = screenGui
button.BackgroundColor3 = Color3.new(1, 0, 0)
button.Draggable = true

local MAX_DISTANCIA = 40000000

local function cambiarColorBoton(activado)
    button.BackgroundColor3 = activado and Color3.new(0, 1, 0) or Color3.new(1, 0, 0)
end

local function teletransportarAPosicion(posicion)
    jugadorLocal.Character:SetPrimaryPartCFrame(CFrame.new(posicion))
end

local function buscarPosicionMasCercana(objeto, posicionesVisitadas)
    local distanciaMinima, posicionMasCercana = math.huge

    for _, parte in pairs(objeto:GetDescendants()) do
        if parte:IsA("BasePart") then
            local distancia = (jugadorLocal.Character.HumanoidRootPart.Position - parte.Position).Magnitude
            if distancia < distanciaMinima and distancia <= MAX_DISTANCIA and not posicionesVisitadas[parte.Position] then
                distanciaMinima, posicionMasCercana = distancia, parte.Position
            end
        end
    end

    return posicionMasCercana
end

local teletransporteActivo, posicionesVisitadas = false, {}

local function iniciarTeletransporteContinuo()
    teletransporteActivo = true
    cambiarColorBoton(true)
    while teletransporteActivo do
        local nuevaPosicion = buscarPosicionMasCercana(directorioCoins, posicionesVisitadas)
        if nuevaPosicion then
            posicionesVisitadas[nuevaPosicion] = true
            teletransportarAPosicion(nuevaPosicion)
            wait(0.1)
        else break end
    end
    teletransporteActivo = false
    cambiarColorBoton(false)
end

button.MouseButton1Click:Connect(function()
    teletransporteActivo = not teletransporteActivo
    if teletransporteActivo then iniciarTeletransporteContinuo() end
end) 

local function teleport(player, position)
    if position then
        player.Character:SetPrimaryPartCFrame(CFrame.new(position))
        wait(1)
    end
end

local function findCommonParent(part1, part2)
    local function getAllParents(part)
        local parents = {}
        while part do
            table.insert(parents, part)
            part = part.Parent
        end
        return parents
    end

    local parents1, parents2 = getAllParents(part1), getAllParents(part2)

    for _, parent1 in ipairs(parents1) do
        for _, parent2 in ipairs(parents2) do
            if parent1 == parent2 then return parent1 end
        end
    end

    return nil
end

local function findPartsAtSameLevel(startPart, directory, name)
    local parts = {}
    local function findPart(part)
        if part:IsA("BasePart") and part.Name == name then table.insert(parts, part) end
        for _, child in pairs(part:GetChildren()) do findPart(child) end
    end
    local parent = startPart.Parent
    if parent then findPart(parent) end
    findPart(directory)
    return parts
end

local commonFolder = workspace.LevelSections.Common
local startParts = findPartsAtSameLevel(commonFolder, commonFolder, "StartingLine")

if #startParts > 0 then
    teleport(jugadorLocal, startParts[1].Position)
    
    local finishParts = findPartsAtSameLevel(startParts[1], commonFolder, "FinishLineTrigger")
    
    if #finishParts > 0 then
        local commonParent = findCommonParent(startParts[1], finishParts[1])
        if commonParent then teleport(jugadorLocal, finishParts[1].Position)
        else print("FinishLineTrigger does not belong to the same parent as StartingLine.") end
    else print("FinishLineTrigger not found at the same level.") end
else print("StartingLine not found.") end

local gui = Instance.new("ScreenGui")
gui.Parent = jugadorLocal.PlayerGui

local button = Instance.new("TextButton")
button.Name = "TpButton"
button.Text = "Tp"
button.Size = UDim2.new(0, 100, 0, 50)
button.Position = UDim2.new(0.5, -50, 0.9, -25)
button.Draggable = true
button.Parent = gui

button.MouseButton1Click:Connect(function()
    local commonFolder = workspace.LevelSections.Common
    local startParts = findPartsAtSameLevel(commonFolder, commonFolder, "StartingLine")

    if #startParts > 0 then
        teleport(jugadorLocal, startParts[1].Position)

        local finishParts = findPartsAtSameLevel(startParts[1], commonFolder, "FinishLineTrigger")

        if #finishParts > 0 then
            local commonParent = findCommonParent(startParts[1], finishParts[1])
            if commonParent then teleport(jugadorLocal, finishParts[1].Position)
            else print("FinishLineTrigger does not belong to the same parent as StartingLine.") end
        else print("FinishLineTrigger not found at the same level.") end
    else print("StartingLine not found.") end
end)
