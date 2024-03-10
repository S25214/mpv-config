local utils = require 'mp.utils'

-- Function to display the current A-B loop as a string in hour:minute:second format
function display_ab_loop()
    local ab_loop_a = mp.get_property_number("ab-loop-a")
    local ab_loop_b = mp.get_property_number("ab-loop-b")
    local ab_loop_str = "A-B Loop: "
    if ab_loop_a and ab_loop_b then
        ab_loop_str = ab_loop_str .. os.date("!%H:%M:%S", ab_loop_a) .. " - " .. os.date("!%H:%M:%S", ab_loop_b)
    else
        ab_loop_str = ab_loop_str .. "Not set"
    end
    mp.osd_message(ab_loop_str, 2)
end

-- Function to modify the A-B loop and display the new times
function modify_ab_loop(add, which)
    local prop = which == "start" and "ab-loop-a" or "ab-loop-b"
    local current_time = mp.get_property_number(prop)

    -- Check if current_time is valid, otherwise don't modify
    if current_time then
        local new_time = current_time + (add and 1 or -1)
        mp.set_property_number(prop, new_time)
        display_ab_loop()  -- Display the updated A-B loop points
    end
end

-- This script allows you to jump back to the A-B loop in MPV if you've gone past it.

-- Listener for when 'F4' is pressed.
function on_key_press()
    local ab_loop_a = mp.get_property_number("ab-loop-a", -1)
    local ab_loop_b = mp.get_property_number("ab-loop-b", -1)
    local current_pos = mp.get_property_number("time-pos", -1)

    -- Check if A-B loop is set and if the current position is beyond the loop
    if ab_loop_a ~= -1 and current_pos > ab_loop_b then
        -- Seek to the beginning of the loop
        mp.set_property_number("time-pos", ab_loop_a)
    end
end

-- Key bindings to adjust A-B loop points and display messages
mp.add_key_binding("ctrl+]", "add-ab-loop-start", function() modify_ab_loop(true, "start") end)
mp.add_key_binding("alt+]", "add-ab-loop-end", function() modify_ab_loop(true, "end") end)
mp.add_key_binding("ctrl+[", "subtract-ab-loop-start", function() modify_ab_loop(false, "start") end)
mp.add_key_binding("alt+[", "subtract-ab-loop-end", function() modify_ab_loop(false, "end") end)

-- Key bindings to show loop
mp.add_key_binding(nil, "display-ab-loop", display_ab_loop)

-- Key bindings to go back to loop
mp.add_key_binding(nil, "go_back_to_ab_loop", on_key_press)