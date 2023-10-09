-- Función para crear un botón en el GUI
local function createButton(gui, name, filename)
    local button = Instance.new("TextButton")
    button.Name = name
    button.Text = name
    button.Size = UDim2.new(0, 200, 0, 30)
    button.Position = UDim2.new(0.5, -100, 0.5, (#gui:GetChildren() - 1) * 40)
    button.AnchorPoint = Vector2.new(0.5, 0.5)
    button.Parent = gui

    local idList = {}  -- Lista de IDs para este botón

    button.MouseButton1Click:Connect(function()
        local url = "https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/Generales/Musica/" .. filename
        local response = game:HttpGet(url)

        if response then
            for id in response:gmatch("%d+") do
                table.insert(idList, tonumber(id))
            end

            button.Visible = false  -- Ocultar el botón después de hacer clic

            -- Enviar los IDs correspondientes
            for _, id in ipairs(idList) do
                executeCodeForID(id)
                wait(1) -- Esperar 1 segundo antes de enviar el siguiente ID
            end
        end
    end)
end

-- Función para cargar la lista de nombres y archivos desde GitHub
local function loadButtonData()
    local url = "https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/Generales/Final/MusicF.lua"
    local response = game:HttpGet(url)

    if response then
        local pairs = {}
        for pair in response:gmatch("(%S+:%S+)") do
            local name, filename = pair:match("(%S+):(%S+)")
            table.insert(pairs, { name = name, filename = filename })
        end
        return pairs
    end

    return {}
end

-- Crear ScreenGui
local gui = Instance.new("ScreenGui")
gui.Parent = game.Players.LocalPlayer.PlayerGui

-- Cargar los datos de los botones desde GitHub
local buttonData = loadButtonData()

-- Crear botones para cada par nombre-archivo
for _, pair in ipairs(buttonData) do
    createButton(gui, pair.name, pair.filename)
end

-- Definir la función executeCodeForID como en tu código original
function executeCodeForID(id)
    local args = { id }
    game:GetService("ReplicatedStorage").MusicStorage.MusicSubmit:FireServer(unpack(args))
end
