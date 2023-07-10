local Scripts = game.HttpService:JSONDecode(game:HttpGet("https://raw.githubusercontent.com/OneCreatorX/OneCreatorX/main/UIs/Loady/Comunidad/Links.lua"))

local Library = loadstring(game:HttpGet("https://bitbucket.org/cat__/uis/raw/Loady/Module"))()
local Window = Library:Window("Loady", function(Script, Func)
    Func:TryExecuteURL(Script)
end, {
    Start = Color3.fromRGB(0, 147, 233),
    End = Color3.fromRGB(128, 208, 199)
})

for i, v in pairs(Scripts) do
    if i ~= "Updated" then
        if tonumber(i) then
            i = tonumber(i)
        end

        if typeof(i) == "number" then
            Window:Game({
                Place = i,
                Status = v.Status,
                Script = v.Url,
                Creator = v.Creator,
                UpdateDate = Window:GetDate("Local", v.Updated == nil and Scripts.Updated or v.Updated),
            })
        elseif typeof(i) == "string" then
            Window:Game({
                Status = v.Status,
                Script = v.Url,
                Creator = v.Creator,
                Custom = {
                    Name = i,
                    Image = v.Image or ""
                },
                UpdateDate = Window:GetDate("Local", v.Updated == nil and Scripts.Updated or v.Updated),
            })
        end
    end
end

Window:Initiate()