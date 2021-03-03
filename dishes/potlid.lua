
local S = cooking.translator;
  
minetest.register_craftitem( "cooking:potlid", {
  description = S("Potlid"),
  inventory_image = "cooking_potlid_inv.png",
  stack_max = 1,
});

if (cooking.dirty_dishes) then
  minetest.register_craftitem( "cooking:potlid_dirty", {
    description = S("Dirty potlid"),
    inventory_image = "cooking_potlid_inv.png",
    stack_max = 1,
  });
else
  minetest.register_alias("cooking:potlid_dirty", "cooking:potlid");
end

minetest.register_craft({
  output = "cooking:potlid",
  recipe = {
    {"group:stick"},
    {"default:steel_ingot"},
  },
});

