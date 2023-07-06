-- Función para cargar y ejecutar un script
local function loadAndExecuteScript(url)
    local script = game:HttpGet(url)
    loadstring(script)()
end

-- Hilos para ejecutar los scripts simultáneamente
local thread1 = coroutine.create(function()
    loadAndExecuteScript("https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/Games/Scripts/Simulator/CortaCesped/CespedCaminar.lua")
end)

local thread2 = coroutine.create(function()
    loadAndExecuteScript("https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/Games/Scripts/Simulator/CortaCesped/CortaCespe.lua")
end)

local thread3 = coroutine.create(function()
    loadAndExecuteScript("https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/Games/Scripts/Simulator/CortaCesped/ComprarCespet.lua")
end)

-- Función para ejecutar los hilos
local function executeThreads()
    coroutine.resume(thread1)
    coroutine.resume(thread2)
    coroutine.resume(thread3)
end

-- Ejecutar los hilos
executeThreads()

