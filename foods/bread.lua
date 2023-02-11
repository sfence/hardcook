
local S = hardcook.translator;

minetest.register_craftitem("hardcook:bread_pancake", {
  description = S("Bread pancake"),
  inventory_image = "hardcook_bread_flat_cake_inv.png",
  groups = {food_bread_pancake = 1},
  on_use = minetest.item_eat(math.floor(math.random(0,10)/8)),
});

minetest.register_craftitem("hardcook:unbaked_bread", {
  description = S("Unbaked bread"),
  inventory_image = "hardcook_unbaked_bread_inv.png",
});

minetest.register_craftitem("hardcook:unbaked_multigrain_bread", {
  description = S("Unbaked multigrain bread"),
  inventory_image = "hardcook_unbaked_multigrain_bread_inv.png",
});

