
cooking = {};

local modpath = minetest.get_modpath(minetest.get_current_modname())

cooking.easy_mode = minetest.settings:get_bool("cooking_easy_mode", false)
cooking.dirty_dishes = minetest.settings:get_bool("cooking_dirty_dishes", false)
cooking.time_divider = tonumber(minetest.settings:get("cooking_time_divider")) or 72

cooking.have_technic = minetest.get_modpath("technic");
cooking.have_unified = minetest.get_modpath("unified_inventory");

-- use 0 for depugging, developing
-- TODO: move this to 1
cooking.use_not_in_creative_inventory = 0;

dofile(modpath.."/functions.lua");

dofile(modpath.."/appliances/appliances.lua");

dofile(modpath.."/dishes/dishes.lua");

dofile(modpath.."/recipes/recipes.lua");

