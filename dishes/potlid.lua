
local S = hardcook.translator;
  
minetest.register_craftitem( "hardcook:potlid", {
  description = S("Potlid"),
  inventory_image = "cooking_potlid_inv.png",
  stack_max = 1,
});

if (hardcook.dirty_dishes) then
  minetest.register_craftitem( "hardcook:potlid_dirty", {
    description = S("Dirty potlid"),
    inventory_image = "cooking_potlid_inv.png",
    stack_max = 1,
  });
else
  minetest.register_alias("hardcook:potlid_dirty", "hardcook:potlid");
end

minetest.register_craft({
  output = "hardcook:potlid",
  recipe = {
    {"group:stick"},
    {"default:steel_ingot"},
  },
});

