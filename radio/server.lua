Citizen.CreateThread(function()

    local len = GetNumResourceMetadata("radio", "supersede_radio")
    print(len)
    local apis = {}
    for i=0,len-1 do
        local radioname = GetResourceMetadata("radio", "supersede_radio", i)
        local radio = GetResourceMetadata("radio", "supersede_radio_extra", i)
        print(radio)
        local apipos = string.find(radio, "api\"")
        local usearch = string.sub(radio, apipos+6)
        local urlpos = string.find(usearch, "\"")
        local api = string.sub(usearch, 0, urlpos-1)
        print(api)
        apis[radioname] = api
    end
    while true do -- Whist we have time to wait
        local i = 0
        for k in pairs(apis) do
            PerformHttpRequest(apis[k], function(err, json, headers)
                --print("Request Performed")
                local test = string.find(json, "gtav_artist")
                local test2 = string.find(json, "gtav_title")
                local artist = string.sub(json, test+14, test2-4)
                local test3 = string.find(json, "playing_next")
                local title = string.sub(json, test2+13, test3-7)
                SetConvarReplicated("current_artist" .. k, artist)
                SetConvarReplicated("current_title" .. k, title)
                end, 'GET', '')
                i = i + 1
            end
        Wait(1000)
    end
end)
