
-- node box {x=0, y=0, z=0}
node_box_bowl = {
  type = "fixed",
  fixed = {
    {-0.125,-0.375,-0.3125,0.125,-0.3125,-0.25},
    {-0.125,-0.4375,-0.25,0.125,-0.375,-0.1875},
    {-0.1875,-0.375,-0.25,-0.125,-0.3125,-0.1875},
    {0.125,-0.375,-0.25,0.1875,-0.3125,-0.1875},
    {-0.125,-0.5,-0.1875,0.125,-0.4375,0.1875},
    {-0.1875,-0.4375,-0.1875,-0.125,-0.375,-0.125},
    {0.125,-0.4375,-0.1875,0.1875,-0.375,-0.125},
    {-0.25,-0.375,-0.1875,-0.1875,-0.3125,-0.125},
    {0.1875,-0.375,-0.1875,0.25,-0.3125,-0.125},
    {-0.1875,-0.5,-0.125,-0.125,-0.4375,0.125},
    {0.125,-0.5,-0.125,0.1875,-0.4375,0.125},
    {-0.25,-0.4375,-0.125,-0.1875,-0.375,0.125},
    {0.1875,-0.4375,-0.125,0.25,-0.375,0.125},
    {-0.3125,-0.375,-0.125,-0.25,-0.3125,0.125},
    {0.25,-0.375,-0.125,0.3125,-0.3125,0.125},
    {-0.1875,-0.4375,0.125,-0.125,-0.375,0.1875},
    {0.125,-0.4375,0.125,0.1875,-0.375,0.1875},
    {-0.25,-0.375,0.125,-0.1875,-0.3125,0.1875},
    {0.1875,-0.375,0.125,0.25,-0.3125,0.1875},
    {-0.125,-0.4375,0.1875,0.125,-0.375,0.25},
    {-0.1875,-0.375,0.1875,-0.125,-0.3125,0.25},
    {0.125,-0.375,0.1875,0.1875,-0.3125,0.25},
    {-0.125,-0.375,0.25,0.125,-0.3125,0.3125},
  },
}

node_box_fill = {
  type = "fixed",
  fixed = {
    {-0.125,-0.375,-0.3125,0.125,-0.3125,-0.25},
    {-0.125,-0.4375,-0.25,0.125,-0.375,-0.1875},
    {-0.1875,-0.375,-0.25,-0.125,-0.3125,-0.1875},
    {0.125,-0.375,-0.25,0.1875,-0.3125,-0.1875},
    {-0.125,-0.5,-0.1875,0.125,-0.4375,0.1875},
    {-0.1875,-0.4375,-0.1875,-0.125,-0.375,-0.125},
    {0.125,-0.4375,-0.1875,0.1875,-0.375,-0.125},
    {-0.25,-0.375,-0.1875,-0.1875,-0.3125,-0.125},
    {0.1875,-0.375,-0.1875,0.25,-0.3125,-0.125},
    {-0.1875,-0.5,-0.125,-0.125,-0.4375,0.125},
    {0.125,-0.5,-0.125,0.1875,-0.4375,0.125},
    {-0.25,-0.4375,-0.125,-0.1875,-0.375,0.125},
    {0.1875,-0.4375,-0.125,0.25,-0.375,0.125},
    {-0.3125,-0.375,-0.125,-0.25,-0.3125,0.125},
    {0.25,-0.375,-0.125,0.3125,-0.3125,0.125},
    {-0.1875,-0.4375,0.125,-0.125,-0.375,0.1875},
    {0.125,-0.4375,0.125,0.1875,-0.375,0.1875},
    {-0.25,-0.375,0.125,-0.1875,-0.3125,0.1875},
    {0.1875,-0.375,0.125,0.25,-0.3125,0.1875},
    {-0.125,-0.4375,0.1875,0.125,-0.375,0.25},
    {-0.1875,-0.375,0.1875,-0.125,-0.3125,0.25},
    {0.125,-0.375,0.1875,0.1875,-0.3125,0.25},
    {-0.125,-0.375,0.25,0.125,-0.3125,0.3125},
    -- fill
    {-0.125,-0.375,-0.25,0.125,-0.3125,0.25},
    {-0.125,-0.4375,-0.1875,0.125,-0.375,0.1875},
    {-0.1875,-0.375,-0.1875,-0.125,-0.3125,0.1875},
    {0.125,-0.375,-0.1875,0.1875,-0.3125,0.1875},
    {-0.1875,-0.4375,-0.125,-0.125,-0.375,0.125},
    {0.125,-0.4375,-0.125,0.1875,-0.375,0.125},
    {-0.25,-0.375,-0.125,-0.1875,-0.3125,0.125},
    {0.1875,-0.375,-0.125,0.25,-0.3125,0.125},
  },
}

local S = cooking.translator;

minetest.register_node( "cooking:wooden_bowl", {
  description = S("Wooden bowl"),
  drawtype = "mesh",
  paramtype  = "light",
  paramtype2 = "facedir",
  mesh = "cooking_wooden_bowl.obj",
  selection_box = node_box_bowl,
  collision_box = node_box_bowl,
  tiles = {"cooking_wooden_bowl.png"},
  --sunlight_propagates = true,
  groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = cooking.use_not_in_creative_inventory, on_burner_top = 1},
  drop = "farming:bowl",
})

cooking.set_on_place("farming:bowl", "cooking:wooden_bowl")

if (cooking.dirty_dishes) then
  minetest.register_node( "cooking:wooden_bowl_dirty", {
    description = "Dirty wooden bowl",
    drawtype = "mesh",
    paramtype  = "light",
    paramtype2 = "facedir",
    mesh = "cooking_wooden_bowl.obj",
    selection_box = node_box_bowl,
    collision_box = node_box_bowl,
    tiles = {"cooking_wooden_bowl_dirty.png"},
    --sunlight_propagates = true,
    groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = cooking.use_not_in_creative_inventory},
  })
else
  minetest.register_alias("cooking:wooden_bowl_dirty", "farming:bowl");
end

minetest.register_node( "cooking:wooden_bowl_with_beetroot_soup", {
  description = S("Wooden bowl with beetroot soup"),
  drawtype = "mesh",
  paramtype  = "light",
  paramtype2 = "facedir",
  mesh = "cooking_wooden_bowl_fill.obj",
  selection_box = node_box_fill,
  collision_box = node_box_fill,
  tiles = {"cooking_wooden_bowl.png", "cooking_fill_beetroot_soup.png"},
  --sunlight_propagates = true,
  groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = cooking.use_not_in_creative_inventory, on_burner_top = 1},
  drop = "farming:beetroot_soup",
})

