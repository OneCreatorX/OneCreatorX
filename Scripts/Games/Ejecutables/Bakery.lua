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

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ButtonContainer"
screenGui.Parent = game.Players.LocalPlayer.PlayerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 250, 0, 230)
frame.Position = UDim2.new(0.5, -frame.Size.X.Offset / 2, 0.5, -frame.Size.Y.Offset / 2)
frame.BackgroundTransparency = 0.5
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = screenGui

local titleContainer = Instance.new("Frame")
titleContainer.Size = UDim2.new(1, 0, 0, 40)
titleContainer.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
titleContainer.BorderSizePixel = 0
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
invokeButton.Position = UDim2.new(0.1, 0, 0, 50)
invokeButton.Text = "Invocar ingredientes"
invokeButton.Font = Enum.Font.Gotham
invokeButton.TextColor3 = Color3.new(1, 1, 1)
invokeButton.TextSize = 16
invokeButton.BackgroundColor3 = Color3.fromRGB(128, 128, 128)
invokeButton.BorderSizePixel = 0
invokeButton.Parent = frame

local ovensButton = Instance.new("TextButton")
ovensButton.Size = buttonSize
ovensButton.Position = UDim2.new(0.1, 0, 0, 50 + buttonSize.Y.Offset + buttonSpacing)
ovensButton.Text = "Ingre Hornos"
ovensButton.Font = Enum.Font.Gotham
ovensButton.TextColor3 = Color3.new(1, 1, 1)
ovensButton.TextSize = 16
ovensButton.BackgroundColor3 = Color3.fromRGB(128, 128, 128)
ovensButton.BorderSizePixel = 0
ovensButton.Parent = frame

local finalButton = Instance.new("TextButton")
finalButton.Size = buttonSize
finalButton.Position = UDim2.new(0.1, 0, 0, 50 + (buttonSize.Y.Offset + buttonSpacing) * 2)
finalButton.Text = "Proceso final"
finalButton.Font = Enum.Font.Gotham
finalButton.TextColor3 = Color3.new(1, 1, 1)
finalButton.TextSize = 16
finalButton.BackgroundColor3 = Color3.fromRGB(128, 128, 128)
finalButton.BorderSizePixel = 0
finalButton.Parent = frame

local startButton = Instance.new("TextButton")
startButton.Size = buttonSize
startButton.Position = UDim2.new(0.1, 0, 0, 50 + (buttonSize.Y.Offset + buttonSpacing) * 3)
startButton.Text = "Iniciar cocción"
startButton.Font = Enum.Font.Gotham
startButton.TextColor3 = Color3.new(1, 1, 1)
startButton.TextSize = 16
startButton.BackgroundColor3 = Color3.fromRGB(128, 128, 128)
startButton.BorderSizePixel = 0
startButton.Parent = frame

local buttonState = {
    invokeButton = false,
    ovensButton = false,
    finalButton = false,
    startButton = false,
}

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
