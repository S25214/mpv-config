function show_pan_zoom()
    local panx = mp.get_property_number("video-pan-x", 0)
    local pany = mp.get_property_number("video-pan-y", 0)
    local zoom = mp.get_property_number("video-zoom", 0)
    mp.osd_message(string.format("Pan-x: %.2f, Pan-y: %.2f, Zoom: %.2f", panx, pany, zoom))
end

mp.add_forced_key_binding(nil, "show_pan_zoom", show_pan_zoom)