
local S = cooking.translator;

minetest.register_node( "cooking:cake_pan", {
  description = S("Empty cake pan"),
  drawtype = "nodebox",
  paramtype  = "light",
  paramtype2 = "facedir",
  node_box = node_box,
  selection_box = node_box,
  collision_box = node_box,
  tiles = {"cooking_cup.png"},
  --sunlight_propagates = true,
  groups = {oddly_breakable_by_hand = 1, dig_immediate = 2},
})
