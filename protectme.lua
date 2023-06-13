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


local startedTime = tick();
Script = dumpstring(Script);

Script = Script:gsub(".", function(x)
   return "\\" .. x:byte();
end);

setclipboard(([[
-- Simple protection
-- Bytecode Hash: %s
loadstring('%s')()
]]):format(syn.crypt.hash(Script), Script));

print(("Finished in %s sec"):format(tick() - startedTime))
