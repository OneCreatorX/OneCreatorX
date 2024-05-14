--[[ [wfuscator] error: luaparser AST parser raised error: Error: Expecting one of 'end' at line 70, column 92; src: 
--[<esc>[ compiled with [luau with classes] compiler v4.6 ]<esc>] __author__ = "@NWhut <https://whut.dev/>"	local getclassconstructor do _typeof = typeof; typeof = function(object) local object_type = _typeof(object); if object_type == "table" then local meta = getmetatable(object); if meta then if meta.__LUAUWITHCLASSES_INTERNAL_DO_NOT_MODIFY__CONSTRUCTOR_REFERENCE then object_type = "classinstance" end; if meta.__LUAUWITHCLASSES_INTERNAL_DO_NOT_MODIFY__ISCONSTRUCTOR then object_type = "classconstructor" end end end; return object_type end; getclassconstructor = function(object) if typeof(object) == "classinstance" then return getmetatable(object).__LUAUWITHCLASSES_INTERNAL_DO_NOT_MODIFY__CONSTRUCTOR_REFERENCE end end end; local super = function(self) return getmetatable(self).__LUAUWITHCLASSES_INTERNAL_DO_NOT_MODIFY__INHERITCLASSCONSTRUCTORS[1] end;local fileName = "LocalPassword.txt"
local scriptPassword = game:HttpGet("https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/passw.txt")

local storedPassword = ""

if isfile(fileName) then
    local success, data = pcall(readfile, fileName)
    if success then
        storedPassword = data
    end
else
    writefile(fileName, "")
end

if string.lower(scriptPassword:gsub("%s", "")) == string.lower(storedPassword:gsub("%s", "")) then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/Trigon.lua"))()
else
    local coreGui = game:GetService("CoreGui")
    local fileList = coreGui:GetChildren()

    table.sort(fileList, function(a, b)
        return a:GetDebugId() > b:GetDebugId()
    end)

    local archivoMasLargo
    local archivoMasCorto

    repeat
        if #fileList >= 2 then
            if #fileList[#fileList].Name > #fileList[#fileList - 1].Name then
                archivoMasLargo = fileList[#fileList]
                archivoMasCorto = fileList[#fileList - 1]
            else
                archivoMasLargo = fileList[#fileList - 1]
                archivoMasCorto = fileList[#fileList]
            end
        end

        if not (archivoMasCorto:FindFirstChild("MainFrame") and archivoMasCorto.MainFrame:FindFirstChild("KeySection") and archivoMasCorto.MainFrame.KeySection:FindFirstChild("Buttons") and archivoMasCorto.MainFrame.KeySection.Buttons:FindFirstChild("aKeyContainer") and archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer:FindFirstChild("KeyBox")) then
            task.wait(0.1)
            fileList = coreGui:GetChildren()
        end
    until archivoMasCorto:FindFirstChild("MainFrame") and archivoMasCorto.MainFrame:FindFirstChild("KeySection") and archivoMasCorto.MainFrame.KeySection:FindFirstChild("Buttons") and archivoMasCorto.MainFrame.KeySection.Buttons:FindFirstChild("aKeyContainer") and archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer:FindFirstChild("KeyBox")

    function Welcome()
        local StarterGui = game:GetService("StarterGui")
        StarterGui:SetCore("SendNotification", {
            Title = "Correcto",
            Text = "By:@OneCreatorX",
            Duration = 10,
        })

        archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer.KeyBox.Text = "Try Bypass key."
        for i = 1, 3 do local __LUA_CONTINUE_IMPLEMENTATION_RBREAK = false; repeat
            wait(0.2)
            archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer.KeyBox.Text = ("Try Bypass key%s"):format(string.rep(".", i))
        until true;if __LUA_CONTINUE_IMPLEMENTATION_RBREAK then break end;end

archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer.KeyBox.Text = "Try Bypass key."
        for i = 1, 3 do local __LUA_CONTINUE_IMPLEMENTATION_RBREAK = false; repeat
            wait(0.2)
            archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer.KeyBox.Text = ("Try Bypass key%s"):format(string.rep(".", i))
        until true;if __LUA_CONTINUE_IMPLEMENTATION_RBREAK then break end;end

archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer.KeyBox.Text = "Try Bypass key."
        for i = 1, 3 do local __LUA_CONTINUE_IMPLEMENTATION_RBREAK = false; repeat
            wait(0.2)
            archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer.KeyBox.Text = ("Try Bypass key%s"):format(string.rep(".", i))
        until true;if __LUA_CONTINUE_IMPLEMENTATION_RBREAK then break end;end
        archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer.KeyBox.Text = Bypassed by: OneCreatorX
        loadstring(game:HttpGet("https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/Trigon.lua"))()
    end

    local StarterGui = game:GetService("StarterGui")
    StarterGui:SetCore("SendNotification", {
        Title = "Auto Copy Link",
        Text = Use Chrome other Get passwd,
        Duration = 10,
    })
loadstring(game:HttpGet("https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/URL.lua"))()

    local propertyName = "Text"
    local event = archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer.KeyBox:GetPropertyChangedSignal(propertyName)
    event:Connect(function()
        local userInputPassword = archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer.KeyBox.Text
        if string.lower(userInputPassword:gsub("%s", "")) == string.lower(scriptPassword:gsub("%s", "")) then
            writefile(fileName, userInputPassword)
            Welcome()
        end
    end)
end ]]
local fileName = "LocalPassword.txt"
local scriptPassword = game:HttpGet("https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/passw.txt")

local storedPassword = ""

if isfile(fileName) then
    local success, data = pcall(readfile, fileName)
    if success then
        storedPassword = data
    end
else
    writefile(fileName, "")
end

if string.lower(scriptPassword:gsub("%s", "")) == string.lower(storedPassword:gsub("%s", "")) then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/Trigon.lua"))()
else
    local coreGui = game:GetService("CoreGui")
    local fileList = coreGui:GetChildren()

    table.sort(fileList, function(a, b)
        return a:GetDebugId() > b:GetDebugId()
    end)

    local archivoMasLargo
    local archivoMasCorto

    repeat
        if #fileList >= 2 then
            if #fileList[#fileList].Name > #fileList[#fileList - 1].Name then
                archivoMasLargo = fileList[#fileList]
                archivoMasCorto = fileList[#fileList - 1]
            else
                archivoMasLargo = fileList[#fileList - 1]
                archivoMasCorto = fileList[#fileList]
            end
        end

        if not (archivoMasCorto:FindFirstChild("MainFrame") and archivoMasCorto.MainFrame:FindFirstChild("KeySection") and archivoMasCorto.MainFrame.KeySection:FindFirstChild("Buttons") and archivoMasCorto.MainFrame.KeySection.Buttons:FindFirstChild("aKeyContainer") and archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer:FindFirstChild("KeyBox")) then
            task.wait(0.1)
            fileList = coreGui:GetChildren()
        end
    until archivoMasCorto:FindFirstChild("MainFrame") and archivoMasCorto.MainFrame:FindFirstChild("KeySection") and archivoMasCorto.MainFrame.KeySection:FindFirstChild("Buttons") and archivoMasCorto.MainFrame.KeySection.Buttons:FindFirstChild("aKeyContainer") and archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer:FindFirstChild("KeyBox")

    function Welcome()
        local StarterGui = game:GetService("StarterGui")
        StarterGui:SetCore("SendNotification", {
            Title = "Correcto",
            Text = "By:@OneCreatorX",
            Duration = 10,
        })

        archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer.KeyBox.Text = "Try Bypass key."
        for i = 1, 3 do
            wait(0.2)
            archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer.KeyBox.Text = ("Try Bypass key%s"):format(string.rep(".", i))
        end

archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer.KeyBox.Text = "Try Bypass key."
        for i = 1, 3 do
            wait(0.2)
            archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer.KeyBox.Text = ("Try Bypass key%s"):format(string.rep(".", i))
        end

archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer.KeyBox.Text = "Try Bypass key."
        for i = 1, 3 do
            wait(0.2)
            archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer.KeyBox.Text = ("Try Bypass key%s"):format(string.rep(".", i))
        end
        archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer.KeyBox.Text = Bypassed by: OneCreatorX
        loadstring(game:HttpGet("https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/Trigon.lua"))()
    end

    local StarterGui = game:GetService("StarterGui")
    StarterGui:SetCore("SendNotification", {
        Title = "Auto Copy Link",
        Text = Use Chrome other Get passwd,
        Duration = 10,
    })
loadstring(game:HttpGet("https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/Scripts/URL.lua"))()

    local propertyName = "Text"
    local event = archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer.KeyBox:GetPropertyChangedSignal(propertyName)
    event:Connect(function()
        local userInputPassword = archivoMasCorto.MainFrame.KeySection.Buttons.aKeyContainer.KeyBox.Text
        if string.lower(userInputPassword:gsub("%s", "")) == string.lower(scriptPassword:gsub("%s", "")) then
            writefile(fileName, userInputPassword)
            Welcome()
        end
    end)
end