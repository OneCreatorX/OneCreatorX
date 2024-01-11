local jugador = game.Players.LocalPlayer

local lootFolder
repeat
    lootFolder = game.Workspace:FindFirstChild("LootFolder")
    wait(3)
until lootFolder

local function moverHaciaPosicion(posicion)
    jugador.Character:SetPrimaryPartCFrame(CFrame.new(posicion))
end

local function contarObjetosEnMochila()
    local mochila = jugador.Backpack
    local cantidadObjetos = 0

    for _, objeto in pairs(mochila:GetChildren()) do
        if objeto:IsA("Tool") then
            cantidadObjetos = cantidadObjetos + 1
        end
    end

    return cantidadObjetos
end

local objetivoAlcanzado = false

while not objetivoAlcanzado do
    if contarObjetosEnMochila() >= 4 then
        objetivoAlcanzado = true
    else
        for _, modelo in ipairs(lootFolder:GetChildren()) do
            if modelo:IsA("Model") then
                for _, objeto in ipairs(modelo:GetDescendants()) do
                    if objeto:IsA("MeshPart") then
                        moverHaciaPosicion(objeto.Position)
                        wait(1)
                    end
                end
            end
        end
    end
end

moverHaciaPosicion(Vector3.new(-37, 16, 107))
