require("/dynamic/hypercube/settings.lua")
local ph = require("/dynamic/helpers/player_helper.lua")
local hc = require("/dynamic/hypercube/code.lua")

--local size = 1000fx
--pewpew.set_level_size(size, size)

--local ship = ph.new_player_ship(width/2fx, height/2fx, 0)

pewpew.configure_player(0, {camera_distance = -300fx})

local function hypercube_initiate() 
    hc.new(100fx,0fx, true)
    hc.new(-100fx,0fx, false)
end

hypercube_initiate()