local RS = game:GetService("ReplicatedStorage")
local F = RS:WaitForChild("F"):WaitForChild("RE")

local function ejecutarAccion(accion, parametros)
    F:FireServer(accion, parametros)
end

local function ejecutarHuevo(identificador)
    for i = 1, 45 do
        ejecutarAccion("OpenEgg", "SHOP_" .. identificador)
        wait(1)
    end
end

local function crearBoton(parent, posicion, texto, callback)
    local boton = Instance.new("TextButton")
    boton.Parent = parent
    boton.Position = posicion
    boton.Size = UDim2.new(0, 100, 0, 50)
    boton.Text = texto
    boton.MouseButton1Click:Connect(callback)
    return boton
end

local gui = Instance.new("ScreenGui")
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

crearBoton(gui, UDim2.new(0, 10, 0, 10), "Egg 1(250)", function()
    ejecutarHuevo(1)
end)

crearBoton(gui, UDim2.new(0, 120, 0, 10), "Egg 2 (50)", function()
    ejecutarHuevo(2)
end)

-- Ejecuta el resto de las acciones
ejecutarAccion("UseItem", "M_OPEN_1")
ejecutarAccion("StartQuest", "UgcGiver_1")
ejecutarAccion("OpenEgg", "SHOP_17")
wait(3)
ejecutarAccion("OpenEgg", "SHOP_1")

-- Configura y reclama las recompensas del temporizador
local function reclamarRecompensas(tipo, tiempo, cantidad)
    local timerRewards = {
        FORM_BAKUGAN = "",
        REWARD_TYPE = tipo,
        REWARD_AMOUNT = cantidad,
        TIME = tiempo
    }
    ejecutarAccion("ClaimTimerReward", timerRewards)
end

reclamarRecompensas("COIN", 3, 3000000000000000)
reclamarRecompensas("DIAMOND", 5, 5000000000)
reclamarRecompensas("ITEM", 10, 1000)

-- Ejecuta otras acciones
ejecutarAccion("GiveSpinRewards", {[1] = 1, [2] = 1})
ejecutarAccion("UseItem", "XP_BOOST_2")
ejecutarAccion("BossBoostCollected", "BB_INS_DMG")
ejecutarAccion("BossBoostCollected", "BB_REVIVE")
