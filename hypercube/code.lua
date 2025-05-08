local hc = {}

function hc.new(x, y, rotate) 
    local id = pewpew.new_customizable_entity(x, y)
    pewpew.customizable_entity_set_mesh(id, "/dynamic/hypercube/graphics.lua", 0)
    
    local time = 0
    local frame_counter = 0
    pewpew.entity_set_update_callback(id, function(id)
        time = time + 1
        if time < 60 then return end
        pewpew.customizable_entity_set_mesh(id, "/dynamic/hypercube/graphics.lua", frame_counter % (HYPERCUBE_FRAMES-1))
        frame_counter = frame_counter + 1
        if rotate then 
            pewpew.customizable_entity_add_rotation_to_mesh(id, fmath.tau()/90, 1fx, 1fx, 0fx)
        end
    end)
end

return hc