
local modpath = minetest.get_modpath(minetest.get_current_modname())


dofile(modpath.."/ovens/functions.lua");
dofile(modpath.."/ovens/fire_oven.lua");
if hardcook.have_technic then
  dofile(modpath.."/ovens/electrical_oven.lua");
end

