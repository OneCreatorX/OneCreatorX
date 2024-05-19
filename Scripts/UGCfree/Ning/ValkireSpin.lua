local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")


local Following = ReplicatedStorage:WaitForChild("Events"):WaitForChild("Following")


local followIDs = {}
local createdButtons = {}


local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")


local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 150, 0, 0)
Frame.Position = UDim2.new(0.1, -150, 0.1, 0)
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.Parent = ScreenGui
Frame.Active = true
Frame.Draggable = true


local function copyToClipboard(text)
setclipboard(text)
StarterGui:SetCore("SendNotification", {
Title = "Enlace copiado",
Text = "El enlace del perfil ha sido copiado al portapapeles.",
Duration = 3
})
end


local function createFollowButton(userID)
if followIDs[userID] then
return -- No crear el botón si ya existe
end


local Button = Instance.new("TextButton")
Button.Size = UDim2.new(1, -20, 0, 30)
Button.Position = UDim2.new(0, 10, 0, #followIDs * 40 + 10)
Button.Text = "Seguir a ID: " .. userID
Button.BackgroundColor3 = Color3.fromRGB(0, 122, 204)
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.Font = Enum.Font.SourceSans
Button.TextSize = 18
Button.Parent = Frame

Button.MouseButton1Click:Connect(function()
    local url = "https://www.roblox.com/users/" .. userID .. "/profile"
    copyToClipboard(url)
    Button:Destroy() -- Destruir el botón después de copiar el enlace
    followIDs[userID] = nil -- Eliminar la referencia del ID
    createdButtons[userID] = nil -- Eliminar la referencia del botón
end)

Frame.Size = UDim2.new(0, 150, 0, (#followIDs + 1) * 30)
followIDs[userID] = true
createdButtons[userID] = Button

end


-- Hook para interceptar las llamadas al RemoteEvent
local mt = getrawmetatable(game)
local oldNamecall = mt.__namecall
setreadonly(mt, false)


mt.__namecall = newcclosure(function(self, ...)
local method = getnamecallmethod()
if method == "InvokeServer" and self == Following then
local args = {...}
local userID = args[1]
createFollowButton(userID)
end
return oldNamecall(self, ...)
end)


setreadonly(mt, true)
