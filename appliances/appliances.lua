
local modpath = minetest.get_modpath(minetest.get_current_modname())


if cooking.have_technic then
  dofile(modpath.."/appliances/electrical_oven.lua");
end

