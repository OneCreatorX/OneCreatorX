local p = game.Players.LocalPlayer
local t = game:GetService("TeleportService")
local rs = game:GetService("ReplicatedStorage")

local function j()
    p.Character:WaitForChild("Humanoid").Jump = true
end

local function tp(pos)
    p.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(pos)
    wait(1)
end

local function s(args, event)
    local e = rs.Events:WaitForChild(event)
    e:FireServer(unpack(args))
end

local function f(msg)
    local sg = p.PlayerGui:FindFirstChild("FSG") or Instance.new("ScreenGui", p.PlayerGui)
    sg.Name = "FSG"
    
    local f = Instance.new("Frame", sg)
    f.Size, f.Position, f.BackgroundColor3, f.BorderSizePixel = UDim2.new(0, 200, 0, 50), UDim2.new(0.5, -100, 0.5, -25), Color3.new(0, 0, 0), 0

    local tl = Instance.new("TextLabel", f)
    tl.Size, tl.Text, tl.TextColor3, tl.BackgroundTransparency = UDim2.new(1, 0, 1, 0), msg, Color3.new(1, 1, 1), 1

    wait(5)
    f:Destroy()
end

while true do
    local pId = game.PlaceId

    if pId == 11696357981 then
        s({"Chakra"}, "QuestGiverInteract")

        for i = 1, 10 do
            s({"Strength"}, "Training")
            s({"Chakra"}, "QuestGiverInteract")
            wait(0.3)
        end

        wait(5)
        f("¡Secuencia completada!")

    elseif pId == 11268121492 then
        tp(Vector3.new(287, 14, -343))
        wait(1)
        
        local court = rs:WaitForChild("Court")
        court.ServerStartServe:InvokeServer()

        while true do
            local args = {[1] = Vector3.new(241.35153198242188, 0, -329.5710144042969), [2] = false}
            rs.Court_ClientHitBall:InvokeServer(unpack(args))
            wait(0.05)  -- Utilizando wait para controlar el intervalo
        end

        wait(5)
        f("¡Secuencia completada!")

    elseif pId == 447452406 then
        s({workspace.BlingObby.Office_Chair_Key.Seat}, "Seat.Sit")
        wait(11)
        j()
        s({}, "BlingObby.EventClassroomKey.PickUp")
        tp(Vector3.new(145, 8, -337))
        wait(1)
        tp(Vector3.new(882, -286, 7984))
        wait(2)
        wait(5)
        f("¡Secuencia completada!")

    else
        warn("Script no configurado para el juego actual.")
    end
end
