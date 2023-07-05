-- Create a RemoteEvent to receive requests from other players
local ImmortalityEvent = Instance.new("RemoteEvent")
ImmortalityEvent.Name = "ImmortalityEvent"
ImmortalityEvent.Parent = game:GetService("ReplicatedStorage")

-- Function to handle the request
local function handleImmortalityRequest(player)
    -- Disable the ability to receive damage from other players
    player.CharacterAdded:Connect(function(character)
        character:WaitForChild("Humanoid").Died:Connect(function()
            -- Respawn the player immediately
            game:GetService("Players"):Respawn(player)
        end)
    end)
end

-- Connect the function to the event
ImmortalityEvent.OnServerEvent:Connect(handleImmortalityRequest)
