local replicatedStorage = game:GetService("ReplicatedStorage")

local buttonState = {
    invokeButton = false,
    ovensButton = false,
    finalButton = false,
    startButton = false
}

local function invokeIngredient(ingredient)
    local remote = replicatedStorage.Remotes.TI_0
    remote:FireServer(ingredient.Ingredient_Collider)
end

-- Crear una instancia de ScreenGui para contener los botones
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ButtonContainer"
screenGui.Parent = game.Players.LocalPlayer.PlayerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 250, 0, 230)
frame.Position = UDim2.new(0.5, -frame.Size.X.Offset / 2, 0.5, -frame.Size.Y.Offset / 2)
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
frame.Active = true
frame.Draggable = true
frame.Parent = screenGui

local titleContainer = Instance.new("Frame")
titleContainer.Size = UDim2.new(1, 0, 0, 40)
titleContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
titleContainer.Parent = frame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -10, 1, -10)
title.Position = UDim2.new(0, 5, 0, 5)
title.BackgroundTransparency = 1
title.Text = "Panadería | YT:@OneCreatorX"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextSize = 20
title.Font = Enum.Font.GothamBold
title.TextWrapped = true
title.Parent = titleContainer

local buttonSize = UDim2.new(0.8, 0, 0, 40)
local buttonSpacing = 10

local invokeButton = Instance.new("TextButton")
invokeButton.Size = buttonSize
invokeButton.Position = UDim2.new(0.1, 0, 0, 1.5)
invokeButton.Text = "Invocar ingredientes"
invokeButton.Parent = frame

local ovensButton = Instance.new("TextButton")
ovensButton.Size = buttonSize
ovensButton.Position = UDim2.new(0.1, 0, 0, 2 + buttonSize.Y.Offset + buttonSpacing)
ovensButton.Text = "Ingre Hornos"
ovensButton.Parent = frame

local finalButton = Instance.new("TextButton")
finalButton.Size = buttonSize
finalButton.Position = UDim2.new(0.1, 0, 0, 0 + (buttonSize.Y.Offset + buttonSpacing) * 2.5)
finalButton.Text = "Proceso final"
finalButton.Parent = frame

local startButton = Instance.new("TextButton")
startButton.Size = buttonSize
startButton.Position = UDim2.new(0.1, 0, 0, 0 + (buttonSize.Y.Offset + buttonSpacing) * 3.5)
startButton.Text = "Iniciar cocción"
startButton.Parent = frame

local function toggleButtonState(buttonName, button)
    buttonState[buttonName] = not buttonState[buttonName]
    if buttonState[buttonName] then
        button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
    else
        button.BackgroundColor3 = Color3.fromRGB(128, 128, 128)
        button.TextColor3 = Color3.fromRGB(200, 200, 200)
    end
end

invokeButton.MouseButton1Click:Connect(function()
    toggleButtonState("invokeButton", invokeButton)
end)

ovensButton.MouseButton1Click:Connect(function()
    toggleButtonState("ovensButton", ovensButton)
end)

finalButton.MouseButton1Click:Connect(function()
    toggleButtonState("finalButton", finalButton)
end)

startButton.MouseButton1Click:Connect(function()
    toggleButtonState("startButton", startButton)
end)

local function invokeIngredientsLoop()
    while true do
        if buttonState["invokeButton"] then
            local ingredientsDirectory = workspace.Ingredients
            for _, ingredient in ipairs(ingredientsDirectory:GetChildren()) do
                invokeIngredient(ingredient)
            end
        end
        wait(1)
    end
end

invokeButton.MouseButton1Click:Connect(invokeIngredientsLoop)

local function invokeOvens()
    while true do
        if buttonState["ovensButton"] then
            local playerBakeryName = game.Players.LocalPlayer.Name .. "'s Bakery"
            local playerPlot = nil

            for _, plot in ipairs(workspace.Plots:GetChildren()) do
                local sign = plot:FindFirstChild("Sign")
                local textLabel = sign and sign.OwnerName and sign.OwnerName.TextLabel

                if textLabel and textLabel.Text == playerBakeryName then
                    playerPlot = plot
                    break
                end
            end

            if playerPlot then
                local ovensFolder = playerPlot:FindFirstChild("Ovens")
                if ovensFolder then
                    for _, oven in ipairs(ovensFolder:GetChildren()) do
                        oven.ConverterData.noob:FireServer()
                    end
                end
            end
        end

        wait(1)
    end
end

local function finalProcess()
    while true do
        if buttonState["finalButton"] then
            local playerPlot = nil
            local playerBakeryName = game.Players.LocalPlayer.Name .. "'s Bakery"

            for _, plot in ipairs(workspace.Plots:GetChildren()) do
                local sign = plot:FindFirstChild("Sign")
                local textLabel = sign and sign.OwnerName and sign.OwnerName.TextLabel

                if textLabel and textLabel.Text == playerBakeryName then
                    playerPlot = plot
                    break
                end
            end

            if playerPlot then
                local ovensFolder = playerPlot:FindFirstChild("Ovens")
                if ovensFolder then
                    for _, oven in ipairs(ovensFolder:GetChildren()) do
                        local converterContents = oven.ConverterData.ConverterContents
                        local products = converterContents and converterContents.Products
                        if products and #products:GetChildren() > 0 then
                            oven.ConverterData.__REMOTE:FireServer()
                            playerPlot.Shelf.Info:FireServer()
                        end
                    end
                end
            end
        end

        wait(1)
    end
end

local function startBaking()
    while true do
        if buttonState["startButton"] then
            local playerPlot = nil
            local playerBakeryName = game.Players.LocalPlayer.Name .. "'s Bakery"

            for _, plot in ipairs(workspace.Plots:GetChildren()) do
                local sign = plot:FindFirstChild("Sign")
                local textLabel = sign and sign.OwnerName and sign.OwnerName.TextLabel

                if textLabel and textLabel.Text == playerBakeryName then
                    playerPlot = plot
                    break
                end
            end

            if playerPlot then
                local ovensFolder = playerPlot:FindFirstChild("Ovens")
                if ovensFolder then
                    for _, oven in ipairs(ovensFolder:GetChildren()) do
                        local converterContents = oven.ConverterData.ConverterContents.Products:GetChildren()
                        local currentlyCooking = oven.ConverterData.CurrentlyCooking.Value

                        if #converterContents == 0 and not currentlyCooking then
                            replicatedStorage.Remotes.StartBake:FireServer(oven, "Cookies")
                        end
                    end
                end
            end
        end

        wait(1)
    end
end

spawn(invokeOvens)
spawn(finalProcess)
spawn(startBaking)
