--binary search fnuc.
local function slice(list,start, stop)
    local templist = {}
    if start == stop then
        return {list[start]}
    end
    for i=start,stop do
        table.insert(templist, list[i])
    end
    return templist
end

local function search(float_list, nearest_value)
    local mid_index = math.floor(#float_list / 2) + 1
    local mid_value = float_list[mid_index]
    local half_list
    --escape
    if #float_list == 2 then
        local f1 = math.abs(nearest_value - float_list[1])
        local f2 = math.abs(nearest_value - float_list[2])
        if f1 <= f2 then
            return 1
        else
            return 2
        end
    elseif #float_list == 1 then
        return 1
    end
    
    if mid_value >= nearest_value then
        half_list = slice(float_list,1,mid_index)
        return search(half_list,nearest_value)
    else
        half_list = slice(float_list,mid_index,#float_list)
        return mid_index + search(half_list,nearest_value) - 1
    end
    
end