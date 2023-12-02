local player = game.Players.LocalPlayer
local savedPositions = {}
local tweenService = game:GetService("TweenService")

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = player.PlayerGui

local frame = Instance.new("Frame")
frame.Parent = ScreenGui
frame.Size = UDim2.new(0, 100, 0, 130)
frame.Position = UDim2.new(0.5, -50, 0.5, -50)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundTransparency = 0.5
frame.BackgroundColor3 = Color3.new(0, 0, 0)
frame.BorderSizePixel = 0
frame.Draggable = true
frame.Active = true

local function createButton(parent, text, position, color)
    local button = Instance.new("TextButton")
    button.Parent = parent
    button.Size = UDim2.new(0, 75, 0, 30)
    button.Position = position
    button.Text = text
    button.BackgroundColor3 = color
    button.TextColor3 = Color3.new(1, 1, 1)
    return button
end

local saveButton = createButton(frame, "Guardar P", UDim2.new(0.5, -37.5, 0, 10), Color3.new(0.2, 0.6, 0.2))
local playButton = createButton(frame, "Teleports", UDim2.new(0.5, -37.5, 0, 50), Color3.new(0.6, 0, 0.6))
local walkButton = createButton(frame, "Caminar", UDim2.new(0.5, -37.5, 0, 90), Color3.new(0.6, 0, 0.6))

local walking = false
local reproducing = false

local function guardarPosicion()
    table.insert(savedPositions, player.Character.HumanoidRootPart.Position)
end

local function reproducirPosiciones()
    while reproducing do
        for _, position in ipairs(savedPositions) do
            player.Character:SetPrimaryPartCFrame(CFrame.new(position))
            wait(1.5)
        end
    end

    toggleButtonColor(playButton, false)
end

local function caminarPosiciones()
    while walking do
        for i = 1, #savedPositions do
            if not walking then
                break
            end
            
            local targetPosition = savedPositions[i]
            
            player.Character.Humanoid:MoveTo(targetPosition)
            
            repeat
                wait(0.5)
            until (player.Character.HumanoidRootPart.Position - targetPosition).Magnitude < 1 or not walking

            wait(1)  -- Espera adicional antes de pasar a la siguiente posición
        end
    end

    toggleButtonColor(walkButton, false)
end


local function toggleButtonColor(button, active)
    local color = active and Color3.new(0.2, 0.6, 0.2) or Color3.new(0.6, 0, 0.6)
    local tweenInfo = TweenInfo.new(0.2)
    local tweenGoal = {BackgroundColor3 = color}
    local tween = tweenService:Create(button, tweenInfo, tweenGoal)
    tween:Play()
end

saveButton.MouseButton1Click:Connect(function()
    guardarPosicion()
end)

playButton.MouseButton1Click:Connect(function()
    reproducing = not reproducing

    if reproducing then
        toggleButtonColor(playButton, true)
        coroutine.wrap(reproducirPosiciones)()
    else
        toggleButtonColor(playButton, false)
    end
end)

walkButton.MouseButton1Click:Connect(function()
    walking = not walking

    if walking then
        toggleButtonColor(walkButton, true)
        coroutine.wrap(caminarPosiciones)()
    else
        toggleButtonColor(walkButton, false)
    end
end)
