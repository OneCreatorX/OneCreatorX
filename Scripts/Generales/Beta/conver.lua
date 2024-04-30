print("Execute")
local function convertToNumber(priceString)
    local numericValue, suffix = priceString:match("(%d+%.?%d*)(%a*)")
    local multiplier = 1
    
    if suffix == "K" then
        multiplier = 1000
    elseif suffix == "M" then
        multiplier = 1000000
    elseif suffix == "B" then
        multiplier = 1000000000
    elseif suffix == "T" then
        multiplier = 1000000000000
    end
    
    local convertedPrice = tonumber(numericValue) * multiplier
    
    return convertedPrice
end
