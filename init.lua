
hardcook = {};

local modpath = minetest.get_modpath(minetest.get_current_modname())

hardcook.translator = minetest.get_translator("hardcook")

hardcook.easy_mode = minetest.settings:get_bool("hardcook_easy_mode", false)
hardcook.dirty_dishes = minetest.settings:get_bool("hardcook_dirty_dishes", false)
hardcook.use_normal_water = minetest.settings:get_bool("hardcook_use_normal_water", false)
hardcook.time_divider = tonumber(minetest.settings:get("hardcook_time_divider")) or 72

hardcook.have_technic = minetest.get_modpath("technic");
hardcook.have_unified = minetest.get_modpath("unified_inventory");

-- use 0 for depugging, developing
-- TODO: move this to 1
hardcook.use_not_in_creative_inventory = 0;

dofile(modpath.."/functions.lua");

dofile(modpath.."/ovens/appliances.lua");

dofile(modpath.."/dishes/dishes.lua");

dofile(modpath.."/foods/foods.lua");

dofile(modpath.."/recipes/recipes.lua");

