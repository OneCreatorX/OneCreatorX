local function clickMoneyLoop(amount, buttonType, instanceType)
    while true do
        local args = {
            [1] = amount,
            [2] = buttonType,
            [3] = instanceType
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("ClickMoney"):InvokeServer(unpack(args))
        wait(0.15)
    end
end

local function collectMoneyLoop()
    while true do
        game:GetService("ReplicatedStorage").CollectMoney:InvokeServer()
        wait(2)
    end
end

local function clickMoneyLoop(amount, buttonType, instanceType)
    while true do
        local args = {
            [1] = amount,
            [2] = buttonType,
            [3] = instanceType
        }
        
        game:GetService("ReplicatedStorage"):WaitForChild("ClickMoney"):InvokeServer(unpack(args))
        wait(0.15)
    end
end

local function collectMoneyLoop()
    while true do
        game:GetService("ReplicatedStorage").CollectMoney:InvokeServer()
        wait(2)
    end
end

spawn(function()
    clickMoneyLoop(74, "TextButton", "Instance")
end)

spawn(collectMoneyLoop)
