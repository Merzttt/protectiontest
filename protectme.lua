local HWID = game:GetService("RbxAnalyticsService"):GetClientId()

local function checkHWID()
    local HWIDTable = loadstring(game:HttpGet("https://pastebin.com/raw/pmiPfU0r"))()

    for i, v in pairs(HWIDTable) do
        if v == HWID then
            return true
        end
    end

    return false
end

local function validateWhitelist()
    if checkHWID() then
        print("Whitelisted")
    else
        warn("Not whitelisted")
    end
end

local function initialize()
    local whitelistChecked = false
    
    if syn and syn.request then
        local req = syn.request
    elseif request then
        local req = request
    end
    if islclosure(req) then
        while true do end
    end
    
    if game:GetService("RunService"):IsStudio() and not checkHWID() then
        warn("Unauthorized access detected")
    else
        whitelistChecked = true
        validateWhitelist()
    end

    if not whitelistChecked then
        return
    end
end

initialize()
