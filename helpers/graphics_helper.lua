local color_helpers = require("/dynamic/helpers/color_helper.lua")
local helper = {}

--- Creates a new empty mesh.
function helper.new_mesh()
  local mesh = {}
  mesh.vertexes = {}
  mesh.segments = {}
  mesh.colors = {}
  return mesh
end

--- Adds a line to a mesh.
-- @params mesh table: a properly formated mesh. Possibly created with `new_mesh`.
-- @params vertex table: a list of either 2D or 3D vertexes. The coordinates of the vertexes are floats.
-- @params colors table: a list of colors. There should be as many colors as there are vertexes.
-- @params close_loop boolean: whether the line should be a closed loop, with the first vertex being linked with the last vertex.
function helper.add_line_to_mesh(mesh, vertexes, colors, close_loop)
  local vertex_count = #mesh.vertexes
  local color_count = #mesh.colors
  local segment_count = #mesh.segments
  local number_of_new_segments = #vertexes - 1
  local segments = {}

  for i = 1, #vertexes do
    table.insert(mesh.vertexes, vertexes[i])
    table.insert(mesh.colors, colors[i])
  end

  table.insert(segments, vertex_count)
  for i = 1, number_of_new_segments do
    table.insert(segments, vertex_count + i)
  end
  if close_loop then
    table.insert(segments, vertex_count)
  end
  table.insert(mesh.segments, segments)
end

function helper.add_poly(mesh, center, sides, color, radius)
  if sides > 2 then
    local x = center[1]
    local y = center[2]
    local z = center[3]
    local vertices = {} 
    local colors = {}

    --Plots the vertices
    for i = 1, sides do
      local angle = (math.pi * 2 * i)/sides
      table.insert(vertices, {x, y + radius * math.sin(angle), z + radius * math.cos(angle)})
      table.insert(colors, color)
    end

    --Draws the segments between each vertex
    helper.add_line_to_mesh(mesh, vertices, colors ,true)
  end
end

return helper