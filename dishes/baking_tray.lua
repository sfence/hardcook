
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


local S = hardcook.translator;

minetest.register_node( "hardcook:baking_tray", {
  description = S("Baking tray"),
  drawtype = "mesh",
  paramtype  = "light",
  paramtype2 = "facedir",
  mesh = "hardcook_baking_tray.obj",
  selection_box = node_box_baking_tray,
  collision_box = node_box_baking_tray,
  tiles = {"hardcook_baking_tray_top.png", "hardcook_baking_tray_bottom.png"},
  use_texture_alpha = "clip",
  --sunlight_propagates = true,
  groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = hardcook.use_not_in_creative_inventory, on_burner_top = 1},
  drop = "farming:baking_tray",
})

hardcook.set_on_place("farming:baking_tray", "hardcook:baking_tray")

if (hardcook.dirty_dishes) then
  minetest.register_node( "hardcook:baking_tray_dirty", {
    description = S("Dirty baking tray"),
    drawtype = "mesh",
    paramtype  = "light",
    paramtype2 = "facedir",
    mesh = "hardcook_baking_tray.obj",
    selection_box = node_box_baking_tray,
    collision_box = node_box_baking_tray,
    tiles = {"hardcook_baking_tray_top.png", "hardcook_baking_tray_bottom.png"},
    use_texture_alpha = "clip",
    --sunlight_propagates = true,
    groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = hardcook.use_not_in_creative_inventory, on_burner_top = 1},
  })
  minetest.register_alias("hardcook:baking_tray_dirty_node", "hardcook:baking_tray_dirty");
else
  minetest.register_alias("hardcook:baking_tray_dirty", "farming:baking_tray");
  minetest.register_alias("hardcook:baking_tray_dirty_node", "hardcook:baking_tray");
end

