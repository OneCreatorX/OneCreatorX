local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer.PlayerGui

local buttonCount = 6
local buttons = {} -- Tabla para almacenar los botones

local function findHead(obj)
    if obj.Name == "Head" then
        return obj
    else
        for _, child in ipairs(obj:GetChildren()) do
            local foundObj = findHead(child)
            if foundObj then
                return foundObj
            end
        end
    end
end

local player = game.Players.LocalPlayer
local character = player.Character

for i = 1, buttonCount do
    local companyName = "Company " .. i

    local button = Instance.new("TextButton")
    button.Name = companyName
    button.Text = companyName
    button.Position = UDim2.new(0, 10, 0, (i-1) * 30)
    button.Size = UDim2.new(0, 100, 0, 20)
    button.Parent = screenGui

    -- Agregar el botón a la tabla
    buttons[companyName] = button

    button.MouseButton1Click:Connect(function()
        while true do
            local directory = game.Workspace.Tycoon.Tycoons[companyName].Buttons

            local leftFoot = character:WaitForChild("LeftFoot")
            local newPosition = leftFoot.Position

            for _, button in pairs(directory:GetChildren()) do
                -- Reemplazar por el objeto correcto
                local head = findHead(button)
                if head then
                    head.Position = newPosition
                end
            end

            wait(5)

game.Workspace.Tycoon.Tycoons[companyName].Buttons["Buy Red Laser Gun - [$10000]"]:Remove()

            if not screenGui:IsDescendantOf(game) then
                break
            end
        end
    end)
end
