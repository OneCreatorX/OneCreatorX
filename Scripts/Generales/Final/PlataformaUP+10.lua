
-- Obtiene una instancia de la partición de trabajo
local workspace = game:GetService("Workspace")

-- Posición actual del jugador local
local player = game.Players.LocalPlayer
local playerPos = player.Character.HumanoidRootPart.Position

-- Crea una nueva instancia de la plataforma
local platform = Instance.new("Part")
platform.Size = Vector3.new(10, 1, 10) -- dimensiones de la plataforma
platform.Position = Vector3.new(playerPos.X, playerPos.Y + 10, playerPos.Z) -- posición elevada de la plataforma
platform.Anchored = true -- bloquea la plataforma en su lugar
platform.Parent = workspace -- agrega la plataforma a la partición de trabajo

-- Configura el material y color de la plataforma
local platformMaterial = Enum.Material.Concrete
local platformColor = Color3.fromRGB(85, 170, 255)
platform.Material = platformMaterial
platform.Color = platformColor

-- Mueve al jugador local a la cima de la plataforma
player.Character.HumanoidRootPart.CFrame = platform.CFrame + Vector3.new(0, platform.Size.Y/2, 0)
