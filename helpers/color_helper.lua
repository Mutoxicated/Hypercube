local helper = {}

--- Returns a integer encoding a color.
-- @params r,g,b,a (integers in the [0,255] range): the red, green, blue, and alpha components of the color.
function helper.make_color(r, g, b, a)
  local color = (r // 1) * 256 + (g // 1)
  color = color * 256 + (b // 1)
  color = color * 256 + a
  return color
end

return helper