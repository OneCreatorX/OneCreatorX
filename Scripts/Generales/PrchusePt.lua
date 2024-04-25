local Plrs = game:GetService("Players")
local p = Plrs.LocalPlayer
local pg = p:WaitForChild("PlayerGui")
local sg

for _, g in ipairs(pg:GetChildren()) do
    if g:IsA("ScreenGui") and not g.ResetOnSpawn and g.Enabled then
        sg = g
        break
    end
end

if not sg then
    sg = Instance.new("ScreenGui", pg)
    sg.ResetOnSpawn = false
    sg.Enabled = true
end

local f = Instance.new("Frame", sg)
f.Name = "CF"
f.Size = UDim2.new(0, 250, 0, 150)
f.Position = UDim2.new(0.5, -125, 0.3, -60)
f.BackgroundColor3 = Color3.fromRGB(40, 20, 10)
f.BorderSizePixel = 1
f.Style = Enum.FrameStyle.DropShadow
f.Active = true
f.Draggable = true

local t = Instance.new("TextLabel", f)
t.Name = "T"
t.Text = "YT:@OneCreatorX"
t.Size = UDim2.new(1, 0, 0, 30)
t.Position = UDim2.new(0, 0, 0, 0)
t.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
t.TextColor3 = Color3.fromRGB(255, 255, 255)
t.Font = Enum.Font.GothamBold
t.TextSize = 20

local function CI()
    local selId
    local isLoop = false

    local devP = game:GetService("MarketplaceService"):GetDeveloperProductsAsync():GetCurrentPage()

function p(text)
    selId = text
end

local bb = Instance.new("TextButton", f)
    bb.Name = "BB"
    bb.Text = "Buy GPass (1)"
    bb.Size = UDim2.new(0.5, -5, 0, 30)
    bb.Position = UDim2.new(0, 0, 0.2, 40)
    bb.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    bb.TextColor3 = Color3.fromRGB(255, 255, 255)
    bb.Font = Enum.Font.Gotham
    bb.TextSize = 14

local tbq = Instance.new("TextBox", f)
tbq.Name = "TBx"
tbq.Text = "ID or write all/escribe all"
tbq.Size = UDim2.new(1, -5, 0, 30)
tbq.Position = UDim2.new(0, 5, 0.45, 40)
tbq.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
tbq.TextColor3 = Color3.fromRGB(255, 255, 255)
tbq.Font = Enum.Font.Gotham
tbq.TextSize = 12
tbq.FocusLost:Connect(function()
    local userInput = tbq.Text
    if type(userInput) == "string" then
        p(userInput:lower())
    else
       p(userInput)
    end
end)


local tb = Instance.new("TextButton", f)
    tb.Name = "TB"
    tb.Text = "Auto Buy: OFF"
    tb.Size = UDim2.new(0.5, -5, 0, 30)
    tb.Position = UDim2.new(0.5, 5, 0.2, 40)
    tb.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    tb.TextColor3 = Color3.fromRGB(255, 255, 255)
    tb.Font = Enum.Font.Gotham
    tb.TextSize = 14


local ddg = Instance.new("TextLabel", f)
    ddg.Name = "DD"
    ddg.Text = "Loading GamePass or possible error"
    ddg.Size = UDim2.new(1, 0, 0, 30)
    ddg.Position = UDim2.new(0, 0, 0.27, 0)
    ddg.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    ddg.TextColor3 = Color3.fromRGB(255, 255, 255)
    ddg.Font = Enum.Font.Gotham
    ddg.TextSize = 11

    local function PSG()
    if selId ~= "all" then
        game:GetService("MarketplaceService"):SignalPromptProductPurchaseFinished(game.Players.LocalPlayer.UserId, selId, true)
    else
        for _, p in pairs(game:GetService("MarketplaceService"):GetDeveloperProductsAsync():GetCurrentPage()) do
            for f, v in pairs(p) do
                if f == "DeveloperProductId" or f == "ProductId" then
                    task.defer(function()
                        game:GetService("MarketplaceService"):SignalPromptProductPurchaseFinished(game.Players.LocalPlayer.UserId, v, true)
                    end)
                end
            end
        end
    end
end

local function PIL()
    isLoop = not isLoop
    tb.Text = isLoop and "Auto Buy: ON" or " Auto Buy: OFF"
    if selId and isLoop then
        while isLoop do
            if selId ~= "all" then
                game:GetService("MarketplaceService"):SignalPromptProductPurchaseFinished(game.Players.LocalPlayer.UserId, selId, true)
            else
                for _, p in pairs(game:GetService("MarketplaceService"):GetDeveloperProductsAsync():GetCurrentPage()) do
                    for f, v in pairs(p) do
                        if f == "DeveloperProductId" or f == "ProductId" then
                            task.defer(function()
                                game:GetService("MarketplaceService"):SignalPromptProductPurchaseFinished(game.Players.LocalPlayer.UserId, v, true)
                            end)
                        end
                    end
                end
            end
            task.wait(0.1)
        end
    end
end

    bb.MouseButton1Click:Connect(PSG)

    tb.MouseButton1Click:Connect(PIL)

local opts = {}

    for _, p in pairs(devP) do
        table.insert(opts, p.Name)
    end

    local dd = Instance.new("TextButton", f)
    dd.Name = "DD"
    dd.Text = "Select GamePass"
    dd.Size = UDim2.new(1, 0, 0, 30)
    dd.Position = UDim2.new(0, 0, 0.27, 0)
    dd.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    dd.TextColor3 = Color3.fromRGB(255, 255, 255)
    dd.Font = Enum.Font.Gotham
    dd.TextSize = 14

    local ddm = Instance.new("ScrollingFrame", dd)
    ddm.Name = "DDM"
    ddm.Size = UDim2.new(1, 0, 5, 0)
    ddm.Position = UDim2.new(0, 0, 2.3, 30)
    ddm.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    ddm.BorderSizePixel = 0
    ddm.ScrollBarThickness = 8
    ddm.ScrollingDirection = Enum.ScrollingDirection.Y
    ddm.CanvasSize = UDim2.new(0, 0, 0, #opts * 30) 

    for i, o in ipairs(opts) do
        local ob = Instance.new("TextButton", ddm)
        ob.Name = "OB"
        ob.Text = o
        ob.Size = UDim2.new(1, 0, 0, 30)
        ob.Position = UDim2.new(0, 0, 0, (i - 1) * 30)
        ob.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
        ob.TextColor3 = Color3.fromRGB(255, 255, 255)
        ob.Font = Enum.Font.Gotham
        ob.TextSize = 14

        ob.MouseButton1Click:Connect(function()
            selId = devP[i].ProductId
            ddm.Visible = false
        end)
    end
 ddg.Visible = false
    ddm.Visible = false

    local function CD()
        ddm.Visible = not ddm.Visible
    end

    dd.MouseButton1Click:Connect(CD)

end

CI()
