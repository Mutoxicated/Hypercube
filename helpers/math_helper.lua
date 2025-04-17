-- alias Parameter = struct{number x, y, ParamType pt}
-- alias Parameters = list<Parameter>

-- pub SineWave = [
--     struct{x, y = 0, 0     ; pt = ParamType.Linear},
--     struct{x, y = 0.25, 0.5; pt = ParamType.Linear},
--     struct{x, y = 0.5, 1   ; pt = ParamType.Rooted},
--     struct{x, y = 0.75, 0.5; pt = ParamType.Rooted},
--     struct{x, y = 1, 0     ; pt = ParamType.Linear}
-- ]

local mh = {}

function mh.clamp(min, max, v) 
    if v > max then
        return max
    end
    if v < min then
        return min
    end
    return v
end

function mh.wrap(min, max, v)
    if v > max or v < -max then
        local remaining = v % max
        return min+remaining
    elseif v < min then
        return max+v
    end
end

function mh.lerp(a, b, t, inter) 
    local inter_type = inter or 0
    if inter == 1 then
        t = t*t
    elseif inter == 2 then
        t = math.sqrt(t)
    end
    return a+(b-a)*t
end

function mh.invlerp(a,b,v) 
    if b-a ~= 0 then
        return (v-a)/(b-a)
    else
        return 0
    end
end

-- a: min, b: max, v: value from a to b
-- c: min, d: max
function mh.remap(a,b, v, c,d) 
    local t = mh.invlerp(a,b,v)
    return mh.lerp(c,d,t)
end

-- params: list of {max:int, inter:INTERPOLATION_TYPE}, max should be between 0 and 1
function mh.parametric_remap(a,b, v, c,d, params) 
    local t = mh.invlerp(a, b, v)

    for i = 1, #params do  

        local param = params[i]

        if i <= param.max then 
            if param.inter == 1 then 
                t = math.sqrt(t)
            elseif param.inter == 2 then
                t = t*t
            end
        end

        return mh.lerp(c,d,t)
    end
end

--[[
ENUM INTERPOLATION_TYPE:
0: Linear
1: Rooted
2: Squared
]]