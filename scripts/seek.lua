mp.add_forced_key_binding("left", nil, function(kevent)
    if (kevent["event"] == "down") then
        mp.command('no-osd cycle-values play-direction -')
        mp.osd_message("<<")
        mp.command('no-osd set speed 2.0')
        mp.set_property_bool("pause", false)
    elseif kevent["event"] == "up" then
        mp.command('no-osd cycle-values play-direction +')
        mp.command('no-osd set speed 1.0')
        mp.set_property_bool("pause", false)
    end
end, {
    repeatable = false,
    complex = true
})

mp.add_forced_key_binding("right", nil, function(kevent)
    if (kevent["event"] == "down") then
        mp.command('no-osd cycle-values play-direction +')
        mp.osd_message(">>")
        mp.command('no-osd set speed 2.0')
        mp.set_property_bool("pause", false)
    elseif kevent["event"] == "up" then
        mp.command('no-osd set speed 1.0')
        mp.set_property_bool("pause", false)
    end
end, {
    repeatable = false,
    complex = true
})

mp.add_forced_key_binding("shift+left", nil, function(kevent)
    if (kevent["event"] == "down") then
        mp.command('no-osd cycle-values play-direction -')
        mp.osd_message("<<<<<")
        mp.command('no-osd set speed 5.0')
        mp.set_property_bool("pause", false)
    elseif kevent["event"] == "up" then
        mp.command('no-osd cycle-values play-direction +')
        mp.command('no-osd set speed 1.0')
        mp.set_property_bool("pause", false)
    end
end, {
    repeatable = false,
    complex = true
})

mp.add_forced_key_binding("shift+right", nil, function(kevent)
    if (kevent["event"] == "down") then
        mp.command('no-osd cycle-values play-direction +')
        mp.osd_message(">>>>>")
        mp.command('no-osd set speed 5.0')
        mp.set_property_bool("pause", false)
    elseif kevent["event"] == "up" then
        mp.command('no-osd set speed 1.0')
        mp.set_property_bool("pause", false)
    end
end, {
    repeatable = false,
    complex = true
})




mp.add_forced_key_binding(",", nil, function(kevent)
    if (kevent["event"] == "down") then
        mp.command('no-osd cycle-values play-direction -')
        mp.osd_message("<")
        mp.command('no-osd set speed 1.0')
        mp.set_property_bool("pause", false)
    elseif kevent["event"] == "up" then
        mp.command('no-osd cycle-values play-direction +')
        mp.command('no-osd set speed 1.0')
        mp.set_property_bool("pause", true)
    end
end, {
    repeatable = false,
    complex = true
})

mp.add_forced_key_binding(".", nil, function(kevent)
    if (kevent["event"] == "down") then
        mp.command('no-osd cycle-values play-direction +')
        mp.osd_message(">")
        mp.command('no-osd set speed 1.0')
        mp.set_property_bool("pause", false)
    elseif kevent["event"] == "up" then
        mp.command('no-osd set speed 1.0')
        mp.set_property_bool("pause", true)
    end
end, {
    repeatable = false,
    complex = true
})
