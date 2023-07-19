local replicatedStorage = game:GetService("ReplicatedStorage")

local function invokeIngredient(ingredient)
    local remote = replicatedStorage.Remotes.TI_0
    remote:FireServer(ingredient)
end

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ButtonContainer"
screenGui.Parent = game.Players.LocalPlayer.PlayerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 220, 0, 200)
frame.Position = UDim2.new(0.5, -frame.Size.X.Offset / 2, 0.7, -frame.Size.Y.Offset / 2)
frame.BackgroundTransparency = 0.8
frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50) -- Cambiamos el color de fondo
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = screenGui

local titleContainer = Instance.new("Frame")
titleContainer.Size = UDim2.new(1, 0, 0, 30) -- Reducimos la altura del contenedor del título
titleContainer.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
titleContainer.BorderSizePixel = 0
titleContainer.Parent = frame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -40, 1, -10) -- Hacemos espacio para los botones de minimizar y restaurar
title.Position = UDim2.new(0, 5, 0, 5)
title.BackgroundTransparency = 1
title.Text = "-|MyCoffee Shop|-"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextSize = 14 -- Reducimos el tamaño del texto del título
title.Font = Enum.Font.GothamBold
title.TextWrapped = true
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = titleContainer

local minimizeButton = Instance.new("TextButton") -- Botón para minimizar la interfaz
minimizeButton.Size = UDim2.new(0, 20, 0, 20)
minimizeButton.Position = UDim2.new(1, -30, 0, 5)
minimizeButton.Text = "-"
minimizeButton.TextColor3 = Color3.new(1, 1, 1)
minimizeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
minimizeButton.Parent = titleContainer

local restoreButton = Instance.new("TextButton") -- Botón para restaurar la interfaz
restoreButton.Size = UDim2.new(0, 20, 0, 20)
restoreButton.Position = UDim2.new(1, -60, 0, 5)
restoreButton.Text = ""
restoreButton.TextColor3 = Color3.new(50, 50, 50)
restoreButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
restoreButton.Visible = false
restoreButton.Parent = titleContainer

local buttonSize = UDim2.new(0.8, 0, 0, 30)
local buttonSpacing = 8

local buttonStyle = {
    BackgroundColor3 = Color3.fromRGB(255, 0, 0), -- Cambiamos el color de fondo predeterminado a rojo
    BorderColor3 = Color3.fromRGB(60, 60, 60),
    TextColor3 = Color3.new(1, 1, 1),
    Font = Enum.Font.Gotham,
    TextSize = 12,
}

local buttonState = {
    invokeButton = false,
    ovensButton = false,
    finalButton = false,
    startButton = false,
}

local function applyButtonStyle(button)
    button.BackgroundColor3 = buttonStyle.BackgroundColor3
    button.BorderColor3 = buttonStyle.BorderColor3
    button.TextColor3 = buttonStyle.TextColor3
    button.Font = buttonStyle.Font
    button.TextSize = buttonStyle.TextSize
end

local function toggleButtonState(buttonName, button)
    buttonState[buttonName] = not buttonState[buttonName]
    if buttonState[buttonName] then
        button.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Cambiamos el color de fondo cuando está activo a verde
        button.TextColor3 = Color3.fromRGB(255, 255, 255)
        -- Mostramos la notificación de botón activado
        local notification = Instance.new("TextLabel")
        notification.Size = UDim2.new(1, 0, 0, 20)
        notification.Position = UDim2.new(0, 0, -1, -50)
        notification.BackgroundTransparency = 0.5
        notification.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
        notification.TextColor3 = Color3.new(1, 1, 1)
        notification.Text = button.Text .. " activado"
        notification.Font = Enum.Font.Gotham
        notification.TextSize = 12
        notification.Parent = button.Parent
        notification:TweenPosition(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true,
            function()
                wait(1)
                notification:TweenPosition(UDim2.new(0, 0, -1, -50), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.3, true,
                    function()
                        notification:Destroy()
                    end
                )
            end
        )
    else
        applyButtonStyle(button) -- Restauramos el estilo original cuando no está activo
        -- Mostramos la notificación de botón desactivado
        local notification = Instance.new("TextLabel")
        notification.Size = UDim2.new(1, 0, 0, 20)
        notification.Position = UDim2.new(0, 0, -1, -50)
        notification.BackgroundTransparency = 0.5
        notification.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
        notification.TextColor3 = Color3.new(1, 1, 1)
        notification.Text = button.Text .. " desactivado"
        notification.Font = Enum.Font.Gotham
        notification.TextSize = 12
        notification.Parent = button.Parent
        notification:TweenPosition(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true,
            function()
                wait(1)
                notification:TweenPosition(UDim2.new(0, 0, -1, -50), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.3, true,
                    function()
                        notification:Destroy()
                    end
                )
            end
        )
    end
end

local invokeButton = Instance.new("TextButton")
invokeButton.Size = buttonSize
invokeButton.Position = UDim2.new(0.1, 0, 0, 40) -- Ajustamos la posición de los botones
invokeButton.Text = "Invocar Ingredientes"
invokeButton.Parent = frame
applyButtonStyle(invokeButton)

local ovensButton = Instance.new("TextButton")
ovensButton.Size = buttonSize
ovensButton.Position = UDim2.new(0.1, 0, 0, 40 + buttonSize.Y.Offset + buttonSpacing)
ovensButton.Text = "Dar Ingredientes"
ovensButton.Parent = frame
applyButtonStyle(ovensButton)

local finalButton = Instance.new("TextButton")
finalButton.Size = buttonSize
finalButton.Position = UDim2.new(0.1, 0, 0, 40 + (buttonSize.Y.Offset + buttonSpacing) * 2)
finalButton.Text = "Procesos Finales"
finalButton.Parent = frame
applyButtonStyle(finalButton)

local startButton = Instance.new("TextButton")
startButton.Size = buttonSize
startButton.Position = UDim2.new(0.1, 0, 0, 40 + (buttonSize.Y.Offset + buttonSpacing) * 3)
startButton.Text = "Iniciar Cafeteras"
startButton.Parent = frame
applyButtonStyle(startButton)

local function adjustTitleSize()
    local textBounds = title.TextBounds
    local containerWidth = titleContainer.AbsoluteSize.X
    if textBounds > containerWidth then
        local scale = containerWidth / textBounds
        title.TextScaled = true
        title.TextSize = title.TextSize * scale
    else
        title.TextScaled = false
    end
end

title:GetPropertyChangedSignal("TextBounds"):Connect(adjustTitleSize)

local isMinimized = false

local function toggleMinimize()
    isMinimized = not isMinimized
    frame.Size = isMinimized and UDim2.new(0, 220, 0, 30) or UDim2.new(0, 220, 0, 200)
    restoreButton.Visible = isMinimized
    invokeButton.Visible = not isMinimized
    ovensButton.Visible = not isMinimized
    finalButton.Visible = not isMinimized
    startButton.Visible = not isMinimized
end

minimizeButton.MouseButton1Click:Connect(toggleMinimize)
restoreButton.MouseButton1Click:Connect(toggleMinimize)

local dragStartPos
local frameStartPos

frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragStartPos = input.Position
        frameStartPos = frame.Position
    end
end)

frame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        local dragDelta = input.Position - dragStartPos
        frame.Position = UDim2.new(frameStartPos.X.Scale, frameStartPos.X.Offset + dragDelta.X, frameStartPos.Y.Scale, frameStartPos.Y.Offset + dragDelta.Y)
    end
end)

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
            local playerBakeryName = game.Players.LocalPlayer.Name .. "'s Cafe"
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
            local playerBakeryName = game.Players.LocalPlayer.Name .. "'s Cafe"

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
            local playerBakeryName = game.Players.LocalPlayer.Name .. "'s Cafe"

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
                            replicatedStorage.Remotes.StartBake:FireServer(oven, "Boba Smoothie")
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