-- Define a function that will be called when the 'Activar' button is clicked
local function onActivarButtonClicked()
    -- Get the local player
    local player = game.Players.LocalPlayer

    -- Get all the players in the game
    local players = game.Players:GetPlayers()

    -- Initialize variables to store the player in front and behind
    local playerInFront = nil
    local playerBehind = nil
    local closestDistance = math.huge

    -- Iterate through each player in the game
    for _, otherPlayer in ipairs(players) do
        -- Exclude the local player from consideration
        if otherPlayer ~= player then
            -- Calculate the direction vector from the local player to the other player
            local direction = (otherPlayer.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).unit

            -- Calculate the angle between the local player's forward vector and the direction to the other player
            local angle = math.acos(direction.Z)

            -- Check if the other player is in front or behind the local player
            if math.deg(angle) < 90 then
                -- Player is in front
                if angle < closestDistance then
                    closestDistance = angle
                    playerInFront = otherPlayer
                end
            else
                -- Player is behind
                playerBehind = otherPlayer
                break -- Stop iterating after finding a player behind
            end
        end
    end

    -- Check if a player in front and a player behind were found
    if playerInFront and playerBehind then
        -- Calculate the distance to move the local player behind the player in front
        local distanceToMove = -1 -- Adjust this value as desired

        -- Calculate the new position for the local player
        local newPosition = playerInFront.Character.HumanoidRootPart.Position + playerInFront.Character.HumanoidRootPart.CFrame.LookVector * distanceToMove

        -- Calculate the rotation needed for the local player to face the player in front
        local lookVector = playerInFront.Character.HumanoidRootPart.Position - newPosition
        local rotation = CFrame.lookAt(Vector3.new(), lookVector)

        -- Set the local player's position and orientation
        player.Character.HumanoidRootPart.CFrame = CFrame.new(newPosition) * rotation
    elseif playerBehind then
        -- Calculate the distance to move the local player closer to the player behind
        local distanceToMove = -1 -- Adjust this value as desired

        -- Calculate the new position for the local player
        local newPosition = playerBehind.Character.HumanoidRootPart.Position + playerBehind.Character.HumanoidRootPart.CFrame.LookVector * distanceToMove

        -- Calculate the rotation needed for the local player to face the player behind
        local lookVector = playerBehind.Character.HumanoidRootPart.Position - newPosition
        local rotation = CFrame.lookAt(Vector3.new(), lookVector)

        -- Set the local player's position and orientation
        player.Character.HumanoidRootPart.CFrame = CFrame.new(newPosition) * rotation
    end
end

-- Create a ScreenGui within the StarterGui
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ActivarButtonScreenGui"
screenGui.Parent = game.Players.LocalPlayer.PlayerGui

-- Create an "Activar" button within the ScreenGui
local activarButton = Instance.new("TextButton")
activarButton.Name = "Activar"
activarButton.Text = "TP Mod🥷"
activarButton.Size = UDim2.new(0, 100, 0, 40) -- Adjust the size as desired
activarButton.Position = UDim2.new(0.15, 0, 0.6, -20) -- Adjust the position as desired
activarButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Set the button background color to red
activarButton.BorderSizePixel = 2 -- Add a border
activarButton.BorderColor3 = Color3.fromRGB(0, 0, 0) -- Set the border color to black
activarButton.Font = Enum.Font.SourceSans -- Use a different font
activarButton.FontSize = Enum.FontSize.Size24 -- Adjust the font size
activarButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- Set the text color to white
activarButton.AutoButtonColor = false -- Prevent automatic button color changes

-- Parent the button to the ScreenGui
activarButton.Parent = screenGui

-- Connect the 'Activar' button click event to the function
activarButton.MouseButton1Click:Connect(onActivarButtonClicked)
