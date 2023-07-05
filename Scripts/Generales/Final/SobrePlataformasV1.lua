local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local ActivarImagen = Instance.new("ImageButton")
ActivarImagen.Size = UDim2.new(0, 100, 0, 50)
ActivarImagen.Position = UDim2.new(0, 10, 0, 10)
ActivarImagen.Image = "http://www.roblox.com/asset/?id=4953528537"
ActivarImagen.Parent = ScreenGui

local DesactivarImagen = Instance.new("ImageButton")
DesactivarImagen.Size = UDim2.new(0, 100, 0, 50)
DesactivarImagen.Position = UDim2.new(0, 10, 0, 10)
DesactivarImagen.Image = "http://www.roblox.com/asset/?id=4953529287"
DesactivarImagen.Visible = false
DesactivarImagen.Parent = ScreenGui

local plataforma

local colors = {
    BrickColor.new("Sand blue"),
    BrickColor.new("Bright red"),
    BrickColor.new("Lime green"),
    BrickColor.new("Bright yellow"),
    BrickColor.new("Cyan"),
    BrickColor.new("Magenta"),
    BrickColor.new("Bright orange"),
    BrickColor.new("Light green"),
    BrickColor.new("Dark indigo"),
    BrickColor.new("Really black"),
    BrickColor.new("Deep orange"),
    BrickColor.new("Toothpaste"),
    BrickColor.new("Dusty rose"),
    BrickColor.new("Light blue"),
    BrickColor.new("Teal"),
}

local colorIndex = 1

local function generatePlatform(position)
    local newPlatform = Instance.new("Part")
    newPlatform.Size = Vector3.new(5.5, 1, 5.5)
    newPlatform.BrickColor = colors[colorIndex]
    newPlatform.Anchored = true

    colorIndex = colorIndex + 1
    if colorIndex > #colors then
        colorIndex = 1
    end

    if plataforma then
        local previousPlatformHeight = plataforma.Position.Y + (plataforma.Size.Y / 2)
        newPlatform.Position = Vector3.new(position.X, previousPlatformHeight, position.Z)
    else
        newPlatform.Position = position
    end

    newPlatform.Parent = workspace

    return newPlatform
end

local function checkGrounded(character)
    local rootPart = character:FindFirstChild("HumanoidRootPart")
    if not rootPart then
        return false
    end

    local ray = Ray.new(rootPart.Position, Vector3.new(0, -5, 0))
    local part, position = workspace:FindPartOnRay(ray, character)
    return part ~= nil
end

ActivarImagen.MouseButton1Down:Connect(function()
    ActivarImagen.Visible = false
    DesactivarImagen.Visible = true

    if not plataforma then
        local player = game.Players.LocalPlayer
        local character = player.Character

        if character then
            local humanoid = character:WaitForChild("Humanoid")

            plataforma = generatePlatform(character.HumanoidRootPart.Position - Vector3.new(0, 3.5, 0))

            local prevPosition = character.HumanoidRootPart.Position

            game:GetService("RunService").RenderStepped:Connect(function()
                if plataforma and character.Parent == nil then
                    plataforma:Destroy()
                    plataforma = nil
                    DesactivarImagen.Visible = false
                    ActivarImagen.Visible = true
                end

                if plataforma and character.HumanoidRootPart.Position ~= prevPosition then
                    local grounded = checkGrounded(character)
                    if not grounded then
                        plataforma = generatePlatform(character.HumanoidRootPart.Position - Vector3.new(0, 3.5, 0))
                    end
                    prevPosition = character.HumanoidRootPart.Position
                end
            end)
        end
    end
end)

DesactivarImagen.MouseButton1Down:Connect(function()
    ActivarImagen.Visible = true
    DesactivarImagen.Visible = false

    if plataforma then
        plataforma:Destroy()
        plataforma = nil
    end
end)
