local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "PlatformGeneratorGui"
gui.Parent = player.PlayerGui

local buttonSize = UDim2.new(0, 150, 0, 50)

local button = Instance.new("TextButton")
button.Size = buttonSize
button.Position = UDim2.new(0.5, -buttonSize.X.Offset / 2, 0.9, -buttonSize.Y.Offset)
button.Text = "Generar Plataforma"
button.Parent = gui

local generatedPlatform = nil

local dragging = false
local offset = Vector2.new(0, 0)

local function createPlatform()
    local character = player.Character
    if not character then
        return
    end
    
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if not rootPart then
        return
    end
    
    local forwardVector = rootPart.CFrame.lookVector
    local offset = forwardVector * 1.9
    local platformPosition = rootPart.Position + offset
    
    local platform = Instance.new("TrussPart")
    platform.Size = Vector3.new(10, 100, 10) 
    platform.CFrame = CFrame.new(platformPosition, platformPosition + forwardVector)
    platform.Anchored = true
    platform.CanCollide = true
    platform.BrickColor = BrickColor.new("Bright blue") 
    platform.Material = Enum.Material.Glass
    platform.Parent = game.Workspace
    
    platform.Touched:Connect(function(other)
        local character = other.Parent
        if character and character:IsA("Model") and character:FindFirstChild("Humanoid") then
            local humanoid = character:FindFirstChild("Humanoid")
            humanoid:Move(Vector3.new(0, 3, 0))
        end
    end)
    
    return platform
end

local function togglePlatform()
    if generatedPlatform then
        generatedPlatform:Destroy()
        generatedPlatform = nil
        button.Text = "Generar Plataforma"
    else
        generatedPlatform = createPlatform()
        if generatedPlatform then
            button.Text = "Eliminar Plataforma"
        else
            button.Text = "Generar Plataforma"
        end
    end
end

local function addButtonFunctionality()
    button.MouseButton1Click:Connect(togglePlatform)

    button.MouseButton1Down:Connect(function(mouseX, mouseY)
        dragging = true
        offset = button.Position - UDim2.new(0, mouseX, 0, mouseY)
    end)

    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local newPosition = UDim2.new(0, input.Position.X, 0, input.Position.Y) + offset
            button.Position = newPosition
        end
    end)

    game:GetService("UserInputService").InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
end

addButtonFunctionality()

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 20, 0, 20)
closeButton.Position = UDim2.new(1, -25, 0, 5)
closeButton.Text = "x"
closeButton.Parent = gui

closeButton.MouseButton1Click:Connect(function()
    if gui then
        gui:Destroy()
        gui = nil
    end
end)
