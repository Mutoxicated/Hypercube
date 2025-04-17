
local hc = {}

function hc.new(x, y) 
    local id = pewpew.new_customizable_entity(x, y)
    pewpew.customizable_entity_set_mesh(id, "/dynamic/hypercube/graphics.lua", 0)
    

end

return hc