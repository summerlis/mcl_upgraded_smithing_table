local mod = minetest.get_modpath("mcl_upgraded_smithing_table")

if mcl_armor.trims then
    dofile(mod.."/smithing_table.lua") -- Load Smithing Table Changes
else
    dofile(mod.."/smithing_table_old.lua") -- For older Mineclone2
end

dofile(mod.."/items.lua") -- Load Tool Overrides
