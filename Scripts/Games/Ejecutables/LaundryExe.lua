local Plot = game:GetService("Players").LocalPlayer.NonSaveVars.OwnsPlot.Value

local function UpdateClothingDirectory()
    return game:GetService("Workspace").Debris.Clothing:GetChildren()
end

local function InvokeClothing(clothing)
    game:GetService("ReplicatedStorage").Events.GrabClothing:FireServer(clothing)
end

local function DropClothesInChute()
    game:GetService("ReplicatedStorage").Events.DropClothesInChute:FireServer()
end

local gui = Instance.new("ScreenGui")
gui.Name = "AutoFarmGUI"
gui.ResetOnSpawn = false
gui.DisplayOrder = 1000
gui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 200, 0, 180)
mainFrame.Position = UDim2.new(0.5, -100, 0.5, -90)
mainFrame.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
mainFrame.BorderSizePixel = 0
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Parent = gui

local titleButton = Instance.new("TextButton")
titleButton.Size = UDim2.new(0, 180, 0, 40)
titleButton.Position = UDim2.new(0.5, -0, 0.5, -40)
titleButton.AnchorPoint = Vector2.new(0.5, 0.5)
titleButton.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
titleButton.BorderSizePixel = 1
titleButton.Text = "Solo ropa especial [X]"
titleButton.TextColor3 = Color3.fromRGB(255, 299, 255)
titleButton.Font = Enum.Font.GothamSemibold
titleButton.TextSize = 14
titleButton.Parent = mainFrame

local autofarmButton = Instance.new("TextButton")
autofarmButton.Size = UDim2.new(0, 120, 0, 40)
autofarmButton.Position = UDim2.new(0.5, -0, 0.8, -20)
autofarmButton.AnchorPoint = Vector2.new(0.5, 0.5)
autofarmButton.BackgroundColor3 = Color3.fromRGB(40, 130, 240)
autofarmButton.BorderSizePixel = 0
autofarmButton.Text = "Auto Game"
autofarmButton.TextColor3 = Color3.fromRGB(255, 255, 255)
autofarmButton.Font = Enum.Font.GothamSemibold
autofarmButton.TextSize = 14
autofarmButton.Parent = mainFrame


local isAutoFarmEnabled = false

local function ToggleAutoFarm()
    isAutoFarmEnabled = not isAutoFarmEnabled
    
    if isAutoFarmEnabled then
        titleButton.Text = "Solo ropa especial [✓]"
        
        -- Iniciar el bucle de comprobación e invocación continua
        while isAutoFarmEnabled do
            local clothingList = UpdateClothingDirectory()
            local specialClothingList = {}

            for _, v in ipairs(clothingList) do
                local SpecialTag = v:FindFirstChild("SpecialTag")

                if SpecialTag then
                    table.insert(specialClothingList, v)
                end
            end

            -- Tomar las prendas especiales
            for _, v in ipairs(specialClothingList) do
                InvokeClothing(v)
                wait(0.2)
            end
            
            wait(1)  -- Esperar un segundo antes de realizar la próxima comprobación
        end
    else
        titleButton.Text = "Solo ropa especial X"
        
        -- Detener la función
        -- Implementa la lógica necesaria para detener la función según tus necesidades
    end
end

local function AutoFarm()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/Games/Scripts/Simulator/Laundry/AutoFarm.lua"))()
end

autofarmButton.MouseButton1Click:Connect(function()
    AutoFarm()
end)

titleButton.MouseButton1Click:Connect(function()
    ToggleAutoFarm()
end)

titleButton.Parent = mainFrame