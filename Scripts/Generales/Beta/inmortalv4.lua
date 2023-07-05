-- Variables
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

-- Function to make the player immortal
local function makePlayerImmortal()
    -- Disable character removal
    character.Archivable = false

    -- Disable death through damage
    character.Humanoid:ClearAllChildren()

    -- Disable deletion of files
    local function preventDeletion(instance)
        instance.Changed:Connect(function(property)
            if property == "Parent" and instance.Parent == nil then
                wait() -- Wait for the deletion to complete
                instance.Parent = game.Players.LocalPlayer.Character -- Reassign the instance back to the player's character
            end
        end)
    end

    -- Recursively prevent deletion of all instances in the character hierarchy
    local function preventHierarchyDeletion(instance)
        preventDeletion(instance)
        for _, child in ipairs(instance:GetChildren()) do
            preventHierarchyDeletion(child)
        end
    end

    preventHierarchyDeletion(character)
end

-- Make the player immortal
makePlayerImmortal()
