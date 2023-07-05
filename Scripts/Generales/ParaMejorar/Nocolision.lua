local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local function enableAutoJump()
    local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.AutoJumpEnabled = true
    end
end

local function disableCollisionExceptFloor()
    local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
    if humanoid then
        humanoid.AutoJumpEnabled = false
    end

    local parts = player.Character:GetDescendants()
    for _, part in ipairs(parts) do
        if part:IsA("BasePart") and part ~= workspace.Terrain then
            part.CanCollide = false
        end
    end
end

local isCollisionDisabled = false

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui

local disableCollisionButton = Instance.new("TextButton")
disableCollisionButton.Name = "DisableCollisionButton"
disableCollisionButton.Text = "Quitar Colisión"
disableCollisionButton.Size = UDim2.new(0, 180, 0, 50)
disableCollisionButton.Position = UDim2.new(0.5, -90, 0, 20)
disableCollisionButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
disableCollisionButton.TextColor3 = Color3.new(1, 1, 1)
disableCollisionButton.Parent = screenGui

local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Text = "Cerrar Menú"
closeButton.Size = UDim2.new(0, 180, 0, 50)
closeButton.Position = UDim2.new(0.5, -90, 0, 80)
closeButton.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.Parent = screenGui

disableCollisionButton.Activated:Connect(function()
    if not isCollisionDisabled then
        isCollisionDisabled = true
        disableCollisionButton.Text = "Activar Colisión"
        while isCollisionDisabled do
            disableCollisionExceptFloor()
            wait(0.001)
        end
        enableAutoJump()  -- Activar salto automático al salir del menú
        player.Character.Humanoid.Jump = true  -- Permitir saltar una vez al presionar el botón de salto
    else
        isCollisionDisabled = false
        disableCollisionButton.Text = "Quitar Colisión"
    end
end)

closeButton.Activated:Connect(function()
    screenGui:Destroy()
    enableAutoJump()  -- Activar salto automático al cerrar el menú
    player.Character.Humanoid.Jump = true  -- Permitir saltar una vez al presionar el botón de salto
end)
