local UILibrary = {}

UILibrary.Colors = {
    Background = Color3.fromRGB(25, 25, 25),  
    Text = Color3.fromRGB(255, 255, 255),     
    Button = Color3.fromRGB(50, 50, 50),      
    ButtonHover = Color3.fromRGB(105, 215, 80),
    Input = Color3.fromRGB(35, 35, 35),       
    Border = Color3.fromRGB(150, 150, 150),   
    Button3D = Color3.fromRGB(90, 105, 210)   
}

UILibrary.Fonts = {
    Main = Enum.Font.SourceSans,       
    Button = Enum.Font.SourceSansBold     
}

UILibrary.Sizes = {
    Window = UDim2.new(0.2, 0, 0.4, 0),  
    Button = UDim2.new(0.8, 0, 0.12, 0),  
    TextBox = UDim2.new(0.8, 0, 0.12, 0)   
}

UILibrary.Transparency = {
    Background = 0.9,           
    Button = 0.8                
}

UILibrary.TextSizes = {
    Button = 10,            
    TextBox = 10                
}

UILibrary.Padding = {
    Element = 10,             
    Frame = 10            
}

function UILibrary:CreateScreenGui(name)
    local existingGui = game.Players.LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild(name)
    if (existingGui) then
        existingGui:Destroy()
    end

    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = name
    screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    screenGui.ResetOnSpawn = false
    return screenGui
end

function UILibrary:CreateWindow(parent, title)
    local frame = Instance.new("Frame")
    frame.Parent = parent
    frame.Active = true
    frame.Draggable = true
    frame.Size = UILibrary.Sizes.Window
    frame.BackgroundColor3 = UILibrary.Colors.Background
    frame.BackgroundTransparency = UILibrary.Transparency.Background

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Parent = frame
    titleLabel.Text = title
    titleLabel.Size = UDim2.new(1, 0, 0, UILibrary.Padding.Frame)
    titleLabel.BackgroundColor3 = UILibrary.Colors.Background
    titleLabel.TextColor3 = UILibrary.Colors.Text
    titleLabel.Font = UILibrary.Fonts.Main
    titleLabel.TextScaled = true
    titleLabel.BackgroundTransparency = UILibrary.Transparency.Background

    return frame
end

local function adjustFrameSize(frame)
    local totalHeight = UILibrary.Padding.Frame
    for _, child in ipairs(frame:GetChildren()) do
        if child:IsA("GuiObject") and child ~= frame then
            totalHeight = totalHeight + child.Size.Y.Offset + UILibrary.Padding.Element 
        end
    end
    frame.Size = UDim2.new(frame.Size.X.Scale, frame.Size.X.Offset, 0, totalHeight)
end

local function positionElement(parent, element)
    local lastElement = nil
    for _, child in ipairs(parent:GetChildren()) do
        if child:IsA("GuiObject") and child ~= parent then
            lastElement = child
        end
    end
    if lastElement then
        element.Position = UDim2.new(0.1, 0, 0, lastElement.Position.Y.Offset + lastElement.Size.Y.Offset + UILibrary.Padding.Element)
    else
        element.Position = UDim2.new(0.1, 0, 0, UILibrary.Padding.Frame + UILibrary.Padding.Element)
    end
    adjustFrameSize(parent)
end

local Window = {}
Window.__index = Window

function Window:Button(text, onClick)
    local button = Instance.new("TextButton")
    button.Parent = self.frame
    button.Text = text
    button.Size = UILibrary.Sizes.Button
    button.BackgroundColor3 = UILibrary.Colors.Button
    button.TextColor3 = UILibrary.Colors.Text
    button.Font = UILibrary.Fonts.Button
    button.TextSize = UILibrary.TextSizes.Button
    button.AutoButtonColor = false

    button.BorderSizePixel = 1
    button.BorderColor3 = UILibrary.Colors.Border

    button.MouseButton1Click:Connect(onClick)

    button.MouseEnter:Connect(function()
        button.BackgroundColor3 = UILibrary.Colors.ButtonHover
    end)

    button.MouseLeave:Connect(function()
        button.BackgroundColor3 = UILibrary.Colors.Button
    end)

    button.MouseButton1Down:Connect(function()
        button.BorderColor3 = UILibrary.Colors.Button3D
    end)

    button.MouseButton1Up:Connect(function()
        button.BorderColor3 = UILibrary.Colors.Border
    end)

    positionElement(self.frame, button)

    return self
end

function Window:TextBox(placeholderText, onEnter)
    local textBox = Instance.new("TextBox")
    textBox.Parent = self.frame
    textBox.PlaceholderText = placeholderText
    textBox.Text = placeholderText
    textBox.Size = UILibrary.Sizes.TextBox
    textBox.BackgroundColor3 = UILibrary.Colors.Input
    textBox.TextColor3 = UILibrary.Colors.Text
    textBox.Font = UILibrary.Fonts.Main
    textBox.TextSize = UILibrary.TextSizes.TextBox
    textBox.BackgroundTransparency = UILibrary.Transparency.Button

    textBox.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            onEnter(textBox.Text)
        end
    end)

    positionElement(self.frame, textBox)

    return self
end

function Window:Toggle(text, onToggle)
    local buttonToggle = Instance.new("TextButton")
    buttonToggle.Parent = self.frame
    buttonToggle.Text = text
    buttonToggle.Size = UILibrary.Sizes.Button
    buttonToggle.BackgroundColor3 = UILibrary.Colors.Button
    buttonToggle.TextColor3 = UILibrary.Colors.Text
    buttonToggle.Font = UILibrary.Fonts.Button
    buttonToggle.TextSize = UILibrary.TextSizes.Button
    buttonToggle.AutoButtonColor = false

    buttonToggle.BorderSizePixel = 1
    buttonToggle.BorderColor3 = UILibrary.Colors.Border

    local toggled = false

    buttonToggle.MouseButton1Click:Connect(function()
        toggled = not toggled
        if toggled then
            buttonToggle.BackgroundColor3 = UILibrary.Colors.ButtonHover
        else
            buttonToggle.BackgroundColor3 = UILibrary.Colors.Button
        end
        onToggle(toggled)
    end)

    positionElement(self.frame, buttonToggle)

    return self
end

local ScreenGui = {}
ScreenGui.__index = ScreenGui

function ScreenGui:Window(title)
    local frame = UILibrary:CreateWindow(self.gui, title)
    local window = setmetatable({ frame = frame }, Window)
    return window
end

function UILibrary:ScreenGui(name)
    local gui = UILibrary:CreateScreenGui(name)
    local screenGui = setmetatable({ gui = gui }, ScreenGui)
    return screenGui
end

return UILibrary
