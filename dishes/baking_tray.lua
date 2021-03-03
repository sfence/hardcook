
-- node box {x=0, y=0, z=0}
node_box_baking_tray = {
  type = "fixed",
  fixed = {
    {-0.3125,-0.5,-0.375,0.3125,-0.375,-0.3125},
    {-0.375,-0.5,-0.3125,0.375,-0.4375,0.3125},
    {-0.375,-0.4375,-0.3125,-0.3125,-0.375,0.3125},
    {0.3125,-0.4375,-0.3125,0.375,-0.375,0.3125},
    {-0.3125,-0.5,0.3125,0.3125,-0.375,0.375},
  },
}

-- node box {x=0, y=0, z=0}
node_box_pieces = {
  type = "fixed",
  fixed = {
    {-0.3125,-0.5,-0.375,0.3125,-0.375,-0.3125},
    {-0.375,-0.5,-0.3125,0.375,-0.4375,0.3125},
    {-0.375,-0.4375,-0.3125,-0.3125,-0.375,0.3125},
    {0.3125,-0.4375,-0.3125,0.375,-0.375,0.3125},
    {-0.3125,-0.5,0.3125,0.3125,-0.375,0.375},
    -- pieces
    {-0.25,-0.4375,-0.25,-0.125,-0.375,-0.125},
    {-0.0625,-0.4375,-0.25,0.0625,-0.375,-0.125},
    {0.125,-0.4375,-0.25,0.25,-0.375,-0.125},
    {-0.25,-0.4375,-0.0625,-0.125,-0.375,0.0625},
    {-0.0625,-0.4375,-0.0625,0.0625,-0.375,0.0625},
    {0.125,-0.4375,-0.0625,0.25,-0.375,0.0625},
    {-0.25,-0.4375,0.125,-0.125,-0.375,0.25},
    {-0.0625,-0.4375,0.125,0.0625,-0.375,0.25},
    {0.125,-0.4375,0.125,0.25,-0.375,0.25},
  },
}

-- node box {x=0, y=0, z=0}
node_box_fill = {
  type = "fixed",
  fixed = {
    {-0.3125,-0.5,-0.375,0.3125,-0.375,-0.3125},
    {-0.375,-0.5,-0.3125,0.375,-0.4375,0.3125},
    {-0.375,-0.4375,-0.3125,-0.3125,-0.375,0.3125},
    {0.3125,-0.4375,-0.3125,0.375,-0.375,0.3125},
    {-0.3125,-0.5,0.3125,0.3125,-0.375,0.375},
    -- fill
    {-0.3125,-0.4375,-0.3125,0.3125,-0.375,0.3125},
  },
}


local S = cooking.translator;

minetest.register_node( "cooking:baking_tray", {
  description = S("Baking tray"),
  drawtype = "mesh",
  paramtype  = "light",
  paramtype2 = "facedir",
  mesh = "cooking_baking_tray.obj",
  selection_box = node_box_baking_tray,
  collision_box = node_box_baking_tray,
  tiles = {"cooking_baking_tray_top.png", "cooking_baking_tray_bottom.png"},
  --sunlight_propagates = true,
  groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = cooking.use_not_in_creative_inventory, on_burner_top = 1},
  drop = "farming:baking_tray",
})

cooking.set_on_place("farming:baking_tray", "cooking:baking_tray")

if (cooking.dirty_dishes) then
  minetest.register_node( "cooking:baking_tray_dirty", {
    description = S("Dirty baking tray"),
    drawtype = "mesh",
    paramtype  = "light",
    paramtype2 = "facedir",
    mesh = "cooking_baking_tray.obj",
    selection_box = node_box_baking_tray,
    collision_box = node_box_baking_tray,
    tiles = {"cooking_baking_tray_top.png", "cooking_baking_tray_bottom.png"},
    --sunlight_propagates = true,
    groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = cooking.use_not_in_creative_inventory, on_burner_top = 1},
  })
  minetest.register_alias("cooking:baking_tray_dirty_node", "cooking:baking_tray_dirty");
else
  minetest.register_alias("cooking:baking_tray_dirty", "farming:baking_tray");
  minetest.register_alias("cooking:baking_tray_dirty_node", "cooking:baking_tray");
end

