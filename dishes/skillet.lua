
-- node box {x=0, y=0, z=0}
node_box_skillet = {
  type = "fixed",
  fixed = {
    {-0.125,-0.5,-0.3125,0.125,-0.3125,-0.25},
    {-0.1875,-0.5,-0.25,0.1875,-0.4375,0.25},
    {-0.1875,-0.4375,-0.25,-0.125,-0.3125,-0.1875},
    {0.125,-0.4375,-0.25,0.1875,-0.3125,-0.1875},
    {-0.25,-0.5,-0.1875,-0.1875,-0.3125,-0.125},
    {0.1875,-0.5,-0.1875,0.25,-0.3125,-0.125},
    {-0.3125,-0.5,-0.125,-0.1875,-0.4375,0.125},
    {0.1875,-0.5,-0.125,0.3125,-0.4375,0.125},
    {-0.3125,-0.4375,-0.125,-0.25,-0.3125,0.125},
    {0.25,-0.4375,-0.125,0.3125,-0.3125,0.125},
    {-0.25,-0.5,0.125,-0.1875,-0.3125,0.1875},
    {0.1875,-0.5,0.125,0.25,-0.3125,0.1875},
    {-0.1875,-0.4375,0.1875,-0.125,-0.3125,0.25},
    {0.125,-0.4375,0.1875,0.1875,-0.3125,0.25},
    {0.1875,-0.375,0.1875,0.25,-0.3125,0.25},
    {-0.125,-0.5,0.25,0.125,-0.3125,0.3125},
    {0.25,-0.375,0.25,0.3125,-0.3125,0.3125},
    {0.3125,-0.375,0.3125,0.375,-0.3125,0.375},
    {0.375,-0.375,0.375,0.4375,-0.3125,0.4375},
    {0.4375,-0.375,0.4375,0.5,-0.3125,0.5},
  },
}

-- node box {x=0, y=0, z=0}
node_box_fill = {
  type = "fixed",
  fixed = {
    {-0.125,-0.5,-0.3125,0.125,-0.3125,-0.25},
    {-0.1875,-0.5,-0.25,0.1875,-0.4375,0.25},
    {-0.1875,-0.4375,-0.25,-0.125,-0.3125,-0.1875},
    {0.125,-0.4375,-0.25,0.1875,-0.3125,-0.1875},
    {-0.25,-0.5,-0.1875,-0.1875,-0.3125,-0.125},
    {0.1875,-0.5,-0.1875,0.25,-0.3125,-0.125},
    {-0.3125,-0.5,-0.125,-0.1875,-0.4375,0.125},
    {0.1875,-0.5,-0.125,0.3125,-0.4375,0.125},
    {-0.3125,-0.4375,-0.125,-0.25,-0.3125,0.125},
    {0.25,-0.4375,-0.125,0.3125,-0.3125,0.125},
    {-0.25,-0.5,0.125,-0.1875,-0.3125,0.1875},
    {0.1875,-0.5,0.125,0.25,-0.3125,0.1875},
    {-0.1875,-0.4375,0.1875,-0.125,-0.3125,0.25},
    {0.125,-0.4375,0.1875,0.1875,-0.3125,0.25},
    {0.1875,-0.375,0.1875,0.25,-0.3125,0.25},
    {-0.125,-0.5,0.25,0.125,-0.3125,0.3125},
    {0.25,-0.375,0.25,0.3125,-0.3125,0.3125},
    {0.3125,-0.375,0.3125,0.375,-0.3125,0.375},
    {0.375,-0.375,0.375,0.4375,-0.3125,0.4375},
    {0.4375,-0.375,0.4375,0.5,-0.3125,0.5},
    -- fill
    {-0.125,-0.4375,-0.25,0.125,-0.375,0.25},
    {-0.1875,-0.4375,-0.1875,-0.125,-0.375,0.1875},
    {0.125,-0.4375,-0.1875,0.1875,-0.375,0.1875},
    {-0.25,-0.4375,-0.125,-0.1875,-0.375,0.125},
    {0.1875,-0.4375,-0.125,0.25,-0.375,0.125},
  },
}


local S = cooking.translator;

minetest.register_node( "cooking:skillet", {
  description = S("Skillet"),
  drawtype = "mesh",
  paramtype  = "light",
  paramtype2 = "facedir",
  mesh = "cooking_skillet.obj",
  selection_box = node_box_skillet,
  collision_box = node_box_skillet,
  tiles = {"cooking_skillet_top.png", "cooking_skillet_bottom.png"},
  --sunlight_propagates = true,
  groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = cooking.use_not_in_creative_inventory, on_burner_top = 1},
  drop = "farming:skillet",
})

cooking.set_on_place("farming:skillet", "cooking:skillet")

if (cooking.dirty_dishes) then
  minetest.register_node( "cooking:skillet_dirty", {
    description = S("Dirty skillet"),
    drawtype = "mesh",
    paramtype  = "light",
    paramtype2 = "facedir",
    mesh = "cooking_skillet.obj",
    selection_box = node_box_skillet,
    collision_box = node_box_skillet,
    tiles = {"cooking_skillet_top.png", "cooking_skillet_bottom.png"},
    --sunlight_propagates = true,
    groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = cooking.use_not_in_creative_inventory, on_burner_top = 1},
  })
  minetest.register_alias("cooking:skillet_dirty_node", "cooking:skillet_dirty");
else
  minetest.register_alias("cooking:skillet_dirty", "farming:skillet");
  minetest.register_alias("cooking:skillet_dirty_node", "cooking:skillet");
end

