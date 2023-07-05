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
local alturaGuardada -- Variable para almacenar la altura

ActivarImagen.MouseButton1Down:Connect(function()
    ActivarImagen.Visible = false
    DesactivarImagen.Visible = true

    if not plataforma then
        if not alturaGuardada then
            alturaGuardada = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y -- Guardar la altura actual
        end

        plataforma = Instance.new("Part")
        plataforma.Size = Vector3.new(5, 1, 5)
        plataforma.BrickColor = BrickColor.new("Sand blue")
        plataforma.Anchored = true
        plataforma.Position = Vector3.new(
            game.Players.LocalPlayer.Character.HumanoidRootPart.Position.X,
            alturaGuardada - 3.5,
            game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z
        ) -- Utilizar la altura guardada para generar la plataforma
        plataforma.Parent = workspace

        game.Players.LocalPlayer.Character.Humanoid.Running:Connect(function(speed)
            if speed > 0 then
                plataforma.Position = Vector3.new(
                    game.Players.LocalPlayer.Character.HumanoidRootPart.Position.X,
                    alturaGuardada - 3.5,
                    game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Z
                ) -- Actualizar la posición de la plataforma mientras el jugador se mueve
            end
        end)

        game.Players.LocalPlayer.Character.Humanoid.Jumping:Connect(function()
            if plataforma then
                plataforma:Destroy()
                plataforma = nil
                DesactivarImagen.Visible = false
                ActivarImagen.Visible = true
                alturaGuardada = nil -- Restablecer la altura guardada al saltar
            end
        end)
    end
end)

DesactivarImagen.MouseButton1Down:Connect(function()
    ActivarImagen.Visible = true
    DesactivarImagen.Visible = false

    if plataforma then
        plataforma:Destroy()
        plataforma = nil
    end

    alturaGuardada = nil -- Eliminar la altura guardada
end)
