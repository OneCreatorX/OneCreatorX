local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")
local screenGui = Instance.new("ScreenGui")
local background = Instance.new("Frame")
local collectablesFolder = workspace:WaitForChild("Powerpuff Girls Collectables")
local isUGCButtonActive = false

-- Function to create buttons
local function createButton(text, position, size, callback)
    local button = Instance.new("TextButton")
    button.Size = size
    button.Position = position
    button.Text = text
    button.TextColor3 = Color3.new(1, 1, 1)
    button.BackgroundColor3 = Color3.new(0.2, 0.6, 1)  -- Color azul claro
    button.BorderSizePixel = 0
    button.Font = Enum.Font.SourceSansBold
    button.Parent = background
    button.MouseButton1Click:Connect(callback)
    return button
end

-- Function to move player to collision
local function movePlayerToCollision()
    for _, powerpuffBubblesFolder in pairs(collectablesFolder:GetChildren()) do
        if powerpuffBubblesFolder:IsA("Folder") then
            for _, collectableModel in pairs(powerpuffBubblesFolder:GetChildren()) do
                if collectableModel:IsA("Model") then
                    local collisionPart = collectableModel:FindFirstChild("Collision")
                    if collisionPart and collisionPart:IsA("Part") then
                        player.Character:SetPrimaryPartCFrame(collisionPart.CFrame)
                        wait(1)
                    end
                end
            end
        end
    end
end

-- Function to teleport player to collectable root parts
local function teleportPlayerToCollectableRootParts(folder)
    for _, child in pairs(folder:GetChildren()) do
        if child:IsA("Model") and child.Name == "ChemicalX" then
            local collectableRootPart = child:FindFirstChild("CollectableRootPart")
            if collectableRootPart and collectableRootPart:IsA("Part") then
                player.Character:SetPrimaryPartCFrame(collectableRootPart.CFrame)
                wait(1)
            end
        elseif child:IsA("Folder") then
            teleportPlayerToCollectableRootParts(child)
        end
    end
end

-- Function to claim UGC (safe version)
local function claimUGC()
    local args = {
        [1] = "PowerpuffBubbles",
        [2] = 1700204402
    }

    local success, result = pcall(function()
        return game:GetService("ReplicatedStorage"):WaitForChild("Packages"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("ProgressionDataService"):WaitForChild("RF"):WaitForChild("CheckUGCAward"):InvokeServer(unpack(args))
    end)

    if success then
        print("UGC reclamado exitosamente:", result)
    else
        warn("Error al reclamar UGC:", result)
    end
end

-- Setup GUI
screenGui.Parent = playerGui
background.Size = UDim2.new(0, 200, 0, 120)
background.Position = UDim2.new(0.5, -100, 0.5, -60)
background.BackgroundColor3 = Color3.new(0, 0, 0)
background.BackgroundTransparency = 0.3
background.BorderSizePixel = 0
background.Active = true
background.Draggable = true
background.Parent = screenGui

-- Configuración de colores y apariencia
local titleText = Instance.new("TextLabel")
titleText.Size = UDim2.new(1, 0, 0.4, 0)
titleText.Position = UDim2.new(0, 0, 0, 0)
titleText.Text = "UGC Cartoon Network Game On"
titleText.Font = Enum.Font.SourceSansBold
titleText.TextSize = 16
titleText.TextColor3 = Color3.new(1, 1, 1)
titleText.Parent = background

local smallText = Instance.new("TextLabel")
smallText.Size = UDim2.new(0, 100, 0, 20)
smallText.Position = UDim2.new(0.8, 0, 0.9, 0)
smallText.Text = "YT: OneCreatorX"
smallText.Font = Enum.Font.SourceSans
smallText.TextSize = 12
smallText.TextColor3 = Color3.new(1, 1, 1)
smallText.Parent = background

createButton("Ejecutar Funciones", UDim2.new(0.5, -50, 0.7, -15), UDim2.new(0, 100, 0, 30), function()
    print("Ejecutar Funciones button clicked")
    movePlayerToCollision()
    wait(1)
    teleportPlayerToCollectableRootParts(collectablesFolder)
end)

createButton("Spam para reclamar UGC", UDim2.new(0.5, -50, 0.5, -15), UDim2.new(0, 100, 0, 30), function()
    print("Spam para reclamar UGC button clicked")
    isUGCButtonActive = not isUGCButtonActive
    while isUGCButtonActive do
        claimUGC()
        wait(0.1)
    end
end)
