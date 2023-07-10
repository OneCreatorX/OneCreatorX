local jugador = game.Players.LocalPlayer
local preguntaTextLabel = jugador.PlayerGui.Main.Question.Bg.QuestionTxt
local timerTextLabel = jugador.PlayerGui.Main.Question.Bg.TimerTxt
local url = "https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/Games/Scripts/Preguntasyrespuestas.lua"

local preguntasRespuestas = {}
local preguntaActual = ""
local timerActual = ""
local iniciandoRonda = false

local function obtenerRespuesta(pregunta)
    if preguntasRespuestas[pregunta] then
        return preguntasRespuestas[pregunta]
    end
    return "No tengo una respuesta para esa pregunta."
end

local function enviarPregunta()
    preguntaActual = preguntaTextLabel.Text

    local respuesta = obtenerRespuesta(preguntaActual)

    if respuesta ~= "No tengo una respuesta para esa pregunta." then
        wait(6) -- Agregar un retraso de 5 segundos
        game:GetService("ReplicatedStorage").Common.Library.Network.RemoteFunction:InvokeServer("S_System_SubmitAnswer", {respuesta})
    end
end

local function descargarPreguntasRespuestas()
    local response = game:HttpGet(url)
    local lines = string.split(response, "\n")

    preguntasRespuestas = {}

    for i, line in ipairs(lines) do
        local pregunta, respuesta = line:match("^(.-):(.+)$")
        if pregunta and respuesta then
            preguntasRespuestas[pregunta] = respuesta
        end
    end
end

descargarPreguntasRespuestas()

local function timerChanged()
    local nuevoValorTemporizador = timerTextLabel.Text

    if not iniciandoRonda and nuevoValorTemporizador > "00:05" then
        iniciandoRonda = true
        enviarPregunta()
    end
end

preguntaTextLabel:GetPropertyChangedSignal("Text"):Connect(enviarPregunta)
timerTextLabel:GetPropertyChangedSignal("Text"):Connect(timerChanged)

enviarPregunta()

