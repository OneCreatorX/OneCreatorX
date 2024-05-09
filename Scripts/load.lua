archivoMasCorto.Enabled = false

            local screenGui = Instance.new("ScreenGui")
            screenGui.Name = "ControlGui"
            screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

            local screenHeight = game:GetService("GuiService"):GetScreenResolution().Y
            local offset = screenHeight * 0.05

            if archivoMasLargo then
                for _, h in ipairs(archivoMasLargo.MainFrame.homeFrame.localscriptsFrame:GetDescendants()) do
                    if h.Name == "scriptTitle" then
                        if h.Text == "Bypassed" then
                            h.Parent.Visible = false
                        end
                    end
                end 

                local imageButton = Instance.new("ImageButton")
                imageButton.Image = "rbxassetid://15844306310"
                imageButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0) 
                imageButton.Parent = screenGui
                imageButton.Position = UDim2.new(0, 0, 0, offset)
                imageButton.Size = UDim2.new(0, 30, 0, 30)  

                imageButton.MouseButton1Click:Connect(function()
                    archivoMasLargo.Enabled = not archivoMasLargo.Enabled
                end)
