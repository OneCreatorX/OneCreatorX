local function createButton(text, position, parent)
    local button = Instance.new("TextButton")
    button.Text = text
    button.TextSize = 18
    button.AutoButtonColor = false
    button.Size = UDim2.new(1, -20, 0, 30)
    button.Position = position
    button.BackgroundColor3 = Color3.fromRGB(45, 102, 224)
    button.TextColor3 = Color3.new(1, 1, 1)
    button.Parent = parent
    return button
end

local function createCutout(parent)
    local cutout = Instance.new("Frame")
    cutout.BorderSizePixel = 0
    cutout.Size = UDim2.new(1, -10, 1, -10)
    cutout.Position = UDim2.new(0, 5, 0, 5)
    cutout.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    cutout.Parent = parent
    return cutout
end

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "MyFuturisticInterface"
gui.Parent = player.PlayerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 400, 0, 400)
frame.Position = UDim2.new(0.5, -200, 0.5, -200)
frame.BackgroundColor3 = Color3.new(0, 0, 0)
frame.BackgroundTransparency = 0.5
frame.Active = true
frame.Draggable = true
frame.Parent = gui

for i = 1, 10 do
    createCutout(frame).Size = UDim2.new(1, -10 - i * 2, 1, -10 - i * 2)
end

local descriptionFrame = Instance.new("Frame")
descriptionFrame.Size = UDim2.new(0, 380, 0, 340)
descriptionFrame.Position = UDim2.new(0, 10, 0, 50)
descriptionFrame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
descriptionFrame.BackgroundTransparency = 0.5
descriptionFrame.Visible = false
descriptionFrame.Parent = frame

for i = 1, 10 do
    createCutout(descriptionFrame).Size = UDim2.new(1, -10 - i * 2, 1, -10 - i * 2)
end

local descriptionText = Instance.new("TextLabel")
descriptionText.Text = ""
descriptionText.TextSize = 16
descriptionText.Size = UDim2.new(1, -10, 1, -10)
descriptionText.Position = UDim2.new(0, 5, 0, 5)
descriptionText.BackgroundTransparency = 1
descriptionText.TextWrapped = true
descriptionText.TextColor3 = Color3.new(1, 1, 1)
descriptionText.Parent = descriptionFrame

local closeButton = Instance.new("TextButton")
closeButton.Text = "X"
closeButton.TextSize = 18
closeButton.AutoButtonColor = false
closeButton.Size = UDim2.new(0, 40, 0, 20)
closeButton.Position = UDim2.new(0.55, -40, 1, -40)
closeButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.Parent = frame

local scriptList = {
    {
        name = {
            english = "Scripts for Games",
            spanish = "Scripts de Juegos"
        },
        description = {
            english = "Here are all the scripts of the games that I have created so far.",
            spanish = "Aqui se encuentran todos los scripts de los juegos que eh creado hasta el momento"
        },
        url = "https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/UIs/Loady/UILoady.lua"
    },
    {
        name = {
            english = "Useful Scripts",
            spanish = "Scripts Útiles"
        },
        description = {
            english = "Tools that can make your games more fun and easier.",
            spanish = "Herramientas que pueden hacer tus juegos mas divertidos o fáciles."
        },
        url = "https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/UIs/UIGenerales/GeneralesUI.lua"
    }
}

local selectedButton = nil
local buttonList = {}

for i, scriptInfo in ipairs(scriptList) do
    local buttonText = scriptInfo.name[player.LocaleId] or scriptInfo.name.english
    local button = createButton(buttonText, UDim2.new(0, 10, 0, 40 * (i - 1) + 50), frame)
    buttonList[i] = button

    button.MouseButton1Click:Connect(function()
        if selectedButton == button then
            loadstring(game:HttpGet(scriptInfo.url))()
        else
            if selectedButton then
                selectedButton.TextColor3 = Color3.new(1, 1, 1)
            end
            selectedButton = button
            button.TextColor3 = Color3.new(0, 1, 0)
            local description = scriptInfo.description[player.LocaleId] or scriptInfo.description.english
            descriptionText.Text = description
            descriptionFrame.Visible = true
        end
    end)

    button.MouseButton2Click:Connect(function()
        descriptionFrame.Visible = false
    end)
end

closeButton.MouseButton1Click:Connect(function()
    gui:Destroy()
end)
