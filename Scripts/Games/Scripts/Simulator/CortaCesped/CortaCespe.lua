local function executeSpam(zone, time)
    spawn(function()
        local endTime = os.time() + time
        while os.time() < endTime do
            game:GetService("ReplicatedStorage").Remotes.Game.ClientMowGrass:FireServer(tostring(zone))
            wait()
        end
    end)

    spawn(function()
        local gasPumps = workspace.Map.Zones["1"][tostring(zone)].GasStation.GasPumps
        while true do
            game:GetService("ReplicatedStorage").Remotes.Game.ClientToggleUseGasStation:FireServer(gasPumps, true)
            wait(0.3)
        end
    end)

    -- Pausa antes de pasar a la siguiente zona
    wait(time)

    -- Imprimir un mensaje indicando que se pasa a la siguiente zona
    print("Pasar a la siguiente zona: " .. tostring(zone + 1))
end

for zone = 1, 9 do
    executeSpam(zone, 130) 
end

