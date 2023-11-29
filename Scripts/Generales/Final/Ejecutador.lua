local player = game.Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = player.PlayerGui
ScreenGui.ResetOnSpawn = false

local Frame = Instance.new("Frame")
Frame.Size, Frame.Position, Frame.BackgroundColor3, Frame.Parent, Frame.Active, Frame.Draggable = UDim2.new(0, 120, 0, 80), UDim2.new(0, 10, 0, 10), Color3.new(0.2, 0.2, 0.2), ScreenGui, true, true

local ActivadoDict = {
    AutoClickFight = true 
}

local codeTextBox = Instance.new("TextBox")
codeTextBox.Text, codeTextBox.Size, codeTextBox.Position, codeTextBox.BackgroundColor3, codeTextBox.Parent = "      Código aquí", UDim2.new(0, 100, 0, 20), UDim2.new(0, 10, 0, 10), Color3.new(0.4, 0.4, 0.4), Frame
codeTextBox.TextWrapped = true
codeTextBox.TextXAlignment = Enum.TextXAlignment.Left

local timeTextBox = Instance.new("TextBox")
timeTextBox.Text, timeTextBox.Size, timeTextBox.Position, timeTextBox.BackgroundColor3, timeTextBox.Parent = "..Tiempo (seg 1)", UDim2.new(0, 100, 0, 20), UDim2.new(0, 10, 0, 40), Color3.new(0.4, 0.4, 0.4), Frame

local function autoClickFight()
    while wait(tonumber(timeTextBox.Text) or 1) do
        if ActivadoDict.AutoClickFight then
            local code = loadstring(codeTextBox.Text)
            if code then
                code()
            end
        end
    end
end

local startButton = Instance.new("TextButton")
startButton.Text, startButton.Size, startButton.Position, startButton.BackgroundColor3, startButton.Parent = "Detener Bucle", UDim2.new(0, 80, 0, 15), UDim2.new(0.05, 10, 0, 60), Color3.new(0.2, 0.8, 0.2), Frame

startButton.MouseButton1Click:Connect(function()
    ActivadoDict.AutoClickFight = not (ActivadoDict.AutoClickFight or false)
    startButton.Text = ActivadoDict.AutoClickFight and "Detener Bucle" or "Iniciar Bucle"
    startButton.BackgroundColor3 = ActivadoDict.AutoClickFight and Color3.new(0.2, 0.8, 0.2) or Color3.new(0.4, 0.4, 0.4)
end)

local closeButton = Instance.new("TextButton")
closeButton.Text, closeButton.Size, closeButton.Position, closeButton.BackgroundColor3, closeButton.Parent = "x", UDim2.new(0, 20, 0, 10), UDim2.new(0, 90, 0, 0), Color3.new(0.8, 0.2, 0.2), Frame

closeButton.MouseButton1Click:Connect(function()
    ActivadoDict.AutoClickFight = false  
    ScreenGui:Destroy()
end)

autoClickFight()
