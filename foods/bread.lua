
local S = cooking.translator;

minetest.register_craftitem("cooking:bread_pancake", {
  description = S("Bread pancake"),
  inventory_image = "cooking_bread_flat_cake",
  groups = {food_bread_pancake = 1},
  on_use = minetest.item_eat(math.floor(math.random(0,10)/8)),
});

