local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local humanoid = LocalPlayer.Character:WaitForChild("Humanoid")
local rootPart = LocalPlayer.Character:WaitForChild("HumanoidRootPart")

local flying = false
local bodyVelocity = Instance.new("BodyVelocity")
bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
bodyVelocity.Velocity = Vector3.new(0, 0, 0)

-- Create a ScreenGui to hold the button
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer.PlayerGui

-- Create a Frame to hold the button and the close button
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 100, 0, 50)
frame.Position = UDim2.new(0.25, 0, 0.5, -25) -- Position on the left side at the middle of the screen
frame.BackgroundTransparency = 1 -- Make the frame background transparent
frame.Parent = screenGui

-- Define colors for the button when it's active and inactive
local buttonColorActive = Color3.fromRGB(0, 200, 0) -- Green when active
local buttonColorInactive = Color3.fromRGB(150, 150, 150) -- Gray when inactive

-- Create a TextButton for the main button
local button = Instance.new("TextButton")
button.Size = UDim2.new(0.8, 0, 1, 0) -- Reduce the width of the button
button.Position = UDim2.new(0.1, 0, 0, 0) -- Center the button text
button.Text = "bubble"
button.TextSize = 14 -- Adjust the text size
button.TextWrapped = true -- Allow the text to wrap if it's too long
button.BackgroundTransparency = 0.5 -- Adjust the transparency for a more minimalistic look
button.BackgroundColor3 = buttonColorInactive -- Set the initial background color
button.Parent = frame

-- Create a small red button in the top-right corner to destroy the interface
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 20, 0, 20)
closeButton.Position = UDim2.new(1, -20, 0, 0)
closeButton.Text = "X"
closeButton.TextSize = 14
closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0) -- Set the color to red
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- Set the text color to white for better visibility
closeButton.Parent = frame

-- Flag to keep track of the button's state (active or inactive)
local buttonActive = false

-- Function to toggle the button's state and update the appearance
local function toggleButton()
    buttonActive = not buttonActive
    button.BackgroundColor3 = buttonActive and buttonColorActive or buttonColorInactive
end

-- Connect the toggleButton function to the button's MouseButton1Click event
button.MouseButton1Click:Connect(toggleButton)

-- Function to destroy the ScreenGui when the close button is clicked
closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- Function to toggle flight mode
local function toggleFlightMode()
    flying = not flying
    
    if flying then
        humanoid:ChangeState(Enum.HumanoidStateType.Physics)
        bodyVelocity.Parent = rootPart
    else
        humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
        bodyVelocity.Parent = nil
    end
end

-- Bind the toggleFlightMode function to button click
button.MouseButton1Click:Connect(toggleFlightMode)

-- Update the BodyVelocity to match the movement input
game:GetService("RunService").Heartbeat:Connect(function()
    if flying then
        local moveVector = Vector3.new(
            game:GetService("UserInputService"):GetGamepadState(Enum.UserInputType.Gamepad1).ThumbstickDelta.x,
            0,
            game:GetService("UserInputService"):GetGamepadState(Enum.UserInputType.Gamepad1).ThumbstickDelta.y
        )
        
        bodyVelocity.Velocity = moveVector * 1000 -- Embrace the ludicrous speed!
    end
end)
