local P,L,H,R,F,B,SG,Fr,BCA,BCI,Btn,Close,Act,CV,AC = game:GetService("Players"),P.LocalPlayer,L.Character:WaitForChild("Humanoid"),L.Character:WaitForChild("HumanoidRootPart"),false,Instance.new("BodyVelocity")
B.MaxForce,B.Velocity = Vector3.new(math.huge, math.huge, math.huge),Vector3.new(0, 0, 0)
SG = Instance.new("ScreenGui")
SG.ResetOnSpawn,SG.Parent = false,game.Players.LocalPlayer.PlayerGui
Fr = Instance.new("Frame")
Fr.Size,Fr.Position,Fr.BackgroundTransparency,Fr.Parent = UDim2.new(0,100,0,50),UDim2.new(0.25,0,0.5,-25),1,SG
BCA,BCI = Color3.fromRGB(0,200,0),Color3.fromRGB(150,150,150)
Btn = Instance.new("TextButton")
Btn.Size,Btn.Position,Btn.Text,Btn.TextSize,Btn.TextWrapped,Btn.BackgroundTransparency,Btn.BackgroundColor3,Btn.Parent = UDim2.new(0.8,0,1,0),UDim2.new(0.1,0,0,0),"bubble",14,true,0.5,BCI,Fr
Close = Instance.new("TextButton")
Close.Size,Close.Position,Close.Text,Close.TextSize,Close.BackgroundColor3,Close.TextColor3,Close.Parent = UDim2.new(0,20,0,20),UDim2.new(1,-20,0,0),"X",14,Color3.fromRGB(255,0,0),Color3.fromRGB(255,255,255),Fr

local function TB() Act = not Act Btn.BackgroundColor3 = Act and BCA or BCI end Btn.MouseButton1Click:Connect(TB)

local function DG() SG:Destroy() Btn.MouseButton1Click:Disconnect() Close.MouseButton1Click:Disconnect() game:GetService("RunService"):UnbindFromRenderStep("FlightModeUpdate") end Close.MouseButton1Click:Connect(DG)

local function TF() F = not F if F then H:ChangeState(Enum.HumanoidStateType.Physics) B.Parent = R else H:ChangeState(Enum.HumanoidStateType.GettingUp) B.Parent = nil end end Btn.MouseButton1Click:Connect(TF)

local function UF() if F then local MV = Vector3.new(game:GetService("UserInputService"):GetGamepadState(Enum.UserInputType.Gamepad1).ThumbstickDelta.x,0,game:GetService("UserInputService"):GetGamepadState(Enum.UserInputType.Gamepad1).ThumbstickDelta.y) CV = CV:Lerp(MV * 1000,AC * game:GetService("RunService").Heartbeat) B.Velocity = CV end end
game:GetService("UserInputService").Gamepad2Connected:Connect(function() game:GetService("RunService"):BindToRenderStep("FlightModeUpdate",Enum.RenderPriority.Input.Value,UF) end)
game:GetService("UserInputService").Gamepad2Disconnected:Connect(function() game:GetService("RunService"):UnbindFromRenderStep("FlightModeUpdate") B.Velocity,CV = Vector3.new(0,0,0),Vector3.new(0,0,0) end)
