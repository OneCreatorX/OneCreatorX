local function teleportPlayer(player, position)
    local character = player.Character
    if character then
        character:SetPrimaryPartCFrame(CFrame.new(position))
    end
end

local function createTransparentButton()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "TeleportGUI"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    local teleportButton = Instance.new("TextButton")
    teleportButton.Name = "TeleportButton"
    teleportButton.Size = UDim2.new(1, 0, 1, 0) -- Takes up the whole screen
    teleportButton.Position = UDim2.new(0, 0, 0, 0) -- Top-left corner
    teleportButton.BackgroundTransparency = 1 -- Fully transparent
    teleportButton.Text = ""
    teleportButton.Parent = screenGui

    local buttonActivated = true -- Start with the button activated

    local function updateButtonVisual()
        if buttonActivated then
            teleportButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Green when activated
        else
            teleportButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- White when deactivated
        end
    end

    local function onTeleportButtonClick()
        local mouse = game.Players.LocalPlayer:GetMouse()
        local targetPosition = mouse.Hit.p
        teleportPlayer(game.Players.LocalPlayer, targetPosition)
    end

    teleportButton.MouseButton1Click:Connect(function()
        buttonActivated = not buttonActivated
        updateButtonVisual()

        if buttonActivated then
            onTeleportButtonClick()
        end
    end)

    game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
        character:WaitForChild("Humanoid").Jump = false
        character:WaitForChild("Humanoid").WalkSpeed = buttonActivated and 0 or 16
    end)

    updateButtonVisual()

    -- Mini button to hide the teleport button
    local hideButton = Instance.new("TextButton")
    hideButton.Name = "HideButton"
    hideButton.Size = UDim2.new(0, 20, 0, 20) -- Mini button size
    hideButton.Position = UDim2.new(1, -50, 0, 10) -- Top-right corner
    hideButton.BackgroundTransparency = 0 -- Not fully transparent, so it's visible
    hideButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Green when activated (visible)
    hideButton.Text = ""
    hideButton.Parent = screenGui -- Parent the hideButton to the same screenGui

    local teleportButtonVisible = true -- Start with the teleport button visible

    local function updateHideButtonVisual()
        if teleportButtonVisible then
            hideButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0) -- Green when activated (visible)
        else
            hideButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- White when deactivated (hidden)
        end
    end

    hideButton.MouseButton1Click:Connect(function()
        teleportButton.Visible = not teleportButtonVisible -- Toggles the teleport button's visibility
        teleportButtonVisible = not teleportButtonVisible -- Toggle the teleport button's visibility state
        updateHideButtonVisual() -- Update the hide button's color to reflect its state
    end)

    updateHideButtonVisual() -- Initialize the hide button's color
end

createTransparentButton()
