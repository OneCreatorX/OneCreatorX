local p=game.Players.LocalPlayer
local n="Backpack"
local o={"Wooden Rod"}
local function e()local b=p:FindFirstChild(n)if not b then warn("La mochila del jugador no se encontró.")return end for _,o in pairs(o)do local c=b:FindFirstChild(o)if c then c.Parent=p.Character local d=p.Character:FindFirstChild("RightHand")or p.Character:FindFirstChild("LeftHand")if d then c.Handle.CFrame=d.CFrame else warn("No se encontraron las manos del personaje para colocar el objeto "..o)end else warn("El objeto "..o.." no se encontró en la mochila del jugador.")end end end
local s=p:WaitForChild("Backpack")
local e=s:FindFirstChild("ObjetoAgregadoSignal")or Instance.new("BindableEvent",s)
local function onObjectAdded(objectName)table.insert(o, objectName)print("Nuevo objeto agregado a la lista de rods:", objectName)end
e.Event:Connect(onObjectAdded)
local function c()for _,i in pairs(s:GetChildren())do if i:IsA("Model")then local o=i.Name if not table.find(o,o)then table.insert(o,o)end end c(i)end end
local function m()local p={}c(game.Workspace)for _,i in ipairs(p)do mv(i)wait()end end
m()
e.Event:Connect(onObjectAdded) 
