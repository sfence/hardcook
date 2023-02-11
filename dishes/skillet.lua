
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


local S = hardcook.translator;

minetest.register_node( "hardcook:skillet", {
  description = S("Skillet"),
  drawtype = "mesh",
  paramtype  = "light",
  paramtype2 = "facedir",
  mesh = "hardcook_skillet.obj",
  selection_box = node_box_skillet,
  collision_box = node_box_skillet,
  tiles = {"hardcook_skillet_top.png", "hardcook_skillet_bottom.png"},
  use_texture_alpha = "clip",
  --sunlight_propagates = true,
  groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = hardcook.use_not_in_creative_inventory, on_burner_top = 1},
  drop = "farming:skillet",
})

hardcook.set_on_place("farming:skillet", "hardcook:skillet")

if (hardcook.dirty_dishes) then
  minetest.register_node( "hardcook:skillet_dirty", {
    description = S("Dirty skillet"),
    drawtype = "mesh",
    paramtype  = "light",
    paramtype2 = "facedir",
    mesh = "hardcook_skillet.obj",
    selection_box = node_box_skillet,
    collision_box = node_box_skillet,
    tiles = {"hardcook_skillet_dirty_top.png", "hardcook_skillet_bottom.png"},
    use_texture_alpha = "clip",
    --sunlight_propagates = true,
    groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = hardcook.use_not_in_creative_inventory, on_burner_top = 1},
  })
  minetest.register_alias("hardcook:skillet_dirty_node", "hardcook:skillet_dirty");
else
  minetest.register_alias("hardcook:skillet_dirty", "farming:skillet");
  minetest.register_alias("hardcook:skillet_dirty_node", "hardcook:skillet");
end

-- burnt 
local burnt_def = {
    name = "skillet",
    desc = "skillet",
    mesh_potlid = "hardcook_skillet_potlid.obj",
    mesh_fill_half = "hardcook_skillet_fill.obj",
    mesh_fill = "hardcook_skillet_fill.obj",
    node_box_potlid = nil,
    node_box_fill_half = node_box_fill,
    node_box_fill = node_box_fill,
    have_potlid = false,
  }
hardcook.help_register_dishes_burnt(burnt_def, {
    drawtype = "mesh",
    paramtype  = "light",
    paramtype2 = "facedir",
    tiles = {"hardcook_skillet_dirty_top.png", "hardcook_skillet_bottom.png"},
    use_texture_alpha = "clip",
    --sunlight_propagates = true,
    groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = hardcook.use_not_in_creative_inventory},
  })

--
minetest.register_node( "hardcook:skillet_greased", {
  description = S("Greased skillet"),
  drawtype = "mesh",
  paramtype  = "light",
  paramtype2 = "facedir",
  mesh = "hardcook_skillet.obj",
  selection_box = node_box_skillet,
  collision_box = node_box_skillet,
  tiles = {"hardcook_skillet_greased_top.png", "hardcook_skillet_bottom.png"},
  use_texture_alpha = "clip",
  --sunlight_propagates = true,
  groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = hardcook.use_not_in_creative_inventory, on_burner_top = 1},
})

minetest.register_node( "hardcook:skillet_with_brown_mushroom", {
  description = S("Skillet with brown mushroom"),
  drawtype = "mesh",
  paramtype  = "light",
  paramtype2 = "facedir",
  mesh = "hardcook_skillet_fill.obj",
  selection_box = node_box_fill,
  collision_box = node_box_fill,
  tiles = {"hardcook_skillet_top.png", "hardcook_skillet_bottom.png", "hardcook_fill_brown_mushroom.png"},
  use_texture_alpha = "clip",
  --sunlight_propagates = true,
  groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = hardcook.use_not_in_creative_inventory, on_burner_top = 1},
})

