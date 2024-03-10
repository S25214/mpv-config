local blacklist = {'cue', 'txt', 'pdf', 'log', 'sfv', 'md5', 'nfo', 'm3u', 'm3u8', 'accurip', 'jpg', 'jpeg', 'png', 'gif', 'webp', 'jxl', 'bmp', 'dib', 'part', 'url', 'html', 'htm', 'vtx', 'ffp'}

local temp = {}
for _, ext in pairs(blacklist) do
    temp[ext] = true
end
blacklist = temp

mp.observe_property('playlist-count', 'native', function ()
    local playlist = mp.get_property_native('playlist')
    for i = #playlist, 1, -1 do
        if blacklist[playlist[i].filename:lower():match('%.(%w+)$')] then
            mp.commandv('playlist-remove', i-1)
        end
    end
end)