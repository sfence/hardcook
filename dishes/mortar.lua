
-- node box {x=0, y=0, z=0}
node_box_mortar = {
  type = "fixed",
  fixed = {
    {-0.0625,-0.375,-0.1875,0.0625,-0.1875,-0.125},
    {-0.0625,-0.5,-0.125,0.0625,-0.375,0.125},
    {-0.125,-0.375,-0.125,-0.0625,-0.1875,-0.0625},
    {0.0625,-0.375,-0.125,0.125,-0.1875,-0.0625},
    {-0.125,-0.5,-0.0625,-0.0625,-0.375,0.0625},
    {0.0625,-0.5,-0.0625,0.125,-0.375,0.0625},
    {-0.1875,-0.375,-0.0625,-0.125,-0.1875,0.0625},
    {0.125,-0.375,-0.0625,0.1875,-0.1875,0.0625},
    {-0.125,-0.375,0.0625,-0.0625,-0.1875,0.125},
    {0.0625,-0.375,0.0625,0.125,-0.1875,0.125},
    {-0.0625,-0.375,0.125,0.0625,-0.1875,0.1875},
  },
}

-- node box {x=0, y=0, z=0}
node_box_mortar_pestle = {
  type = "fixed",
  fixed = {
    {-0.0625,-0.375,-0.1875,0.0625,-0.1875,-0.125},
    {-0.0625,-0.5,-0.125,0.0625,-0.375,0.125},
    {-0.125,-0.375,-0.125,-0.0625,-0.1875,-0.0625},
    {0.0625,-0.375,-0.125,0.125,-0.1875,-0.0625},
    {-0.125,-0.5,-0.0625,-0.0625,-0.375,0.0625},
    {0.0625,-0.5,-0.0625,0.125,-0.375,0.0625},
    {-0.1875,-0.375,-0.0625,-0.125,-0.1875,0.0625},
    {0.125,-0.375,-0.0625,0.1875,-0.1875,0.0625},
    {-0.125,-0.375,0.0625,-0.0625,-0.1875,0.125},
    {0.0625,-0.375,0.0625,0.125,-0.1875,0.125},
    {-0.0625,-0.375,0.125,0.0625,-0.1875,0.1875},
    -- pestle
    {0.25,-0.5,-0.4375,0.375,-0.375,-0.1875},
    {-0.25,-0.5,-0.375,0.25,-0.375,-0.25},
  },
}

-- node box {x=0, y=0, z=0}
node_box_fill = {
  type = "fixed",
  fixed = {
    {-0.0625,-0.375,-0.1875,0.0625,-0.1875,-0.125},
    {-0.0625,-0.5,-0.125,0.0625,-0.375,0.125},
    {-0.125,-0.375,-0.125,-0.0625,-0.1875,-0.0625},
    {0.0625,-0.375,-0.125,0.125,-0.1875,-0.0625},
    {-0.125,-0.5,-0.0625,-0.0625,-0.375,0.0625},
    {0.0625,-0.5,-0.0625,0.125,-0.375,0.0625},
    {-0.1875,-0.375,-0.0625,-0.125,-0.1875,0.0625},
    {0.125,-0.375,-0.0625,0.1875,-0.1875,0.0625},
    {-0.125,-0.375,0.0625,-0.0625,-0.1875,0.125},
    {0.0625,-0.375,0.0625,0.125,-0.1875,0.125},
    {-0.0625,-0.375,0.125,0.0625,-0.1875,0.1875},
    -- fill
    {-0.0625,-0.375,-0.125,0.0625,-0.25,0.125},
    {-0.125,-0.375,-0.0625,-0.0625,-0.25,0.0625},
    {0.0625,-0.375,-0.0625,0.125,-0.25,0.0625},
  },
}

local S = cooking.translator;

minetest.register_craftitem( "cooking:pestle", {
  description = S("Pestle"),
  inventory_image = "cooking_pestle_inv.png",
  wield_image = "cooking_pestle_inv.png^[transformFY",
  stack_max = 1,
});

minetest.register_node( "cooking:mortar_with_pestle", {
  description = S("Mortar with pestle"),
  drawtype = "mesh",
  paramtype  = "light",
  paramtype2 = "facedir",
  mesh = "cooking_mortar_with_pestle.obj",
  selection_box = node_box_mortar_pestle,
  collision_box = node_box_mortar_pestle,
  tiles = {"default_stone.png", "cooking_pestle.png"},
  --sunlight_propagates = true,
  groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = cooking.use_not_in_creative_inventory},
  drop = "farming:cutting_board",
})

cooking.set_on_place("farming:mortar_pestle", "cooking:mortar_with_pestle")

minetest.register_node( "cooking:mortar", {
  description = S("Mortar"),
  drawtype = "mesh",
  paramtype  = "light",
  paramtype2 = "facedir",
  mesh = "cooking_mortar.obj",
  selection_box = node_box_mortar,
  collision_box = node_box_mortar,
  tiles = {"default_stone.png"},
  --sunlight_propagates = true,
  groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = cooking.use_not_in_creative_inventory},
})

if (cooking.have_unified) then
  unified_inventory.register_craft_type("place_cutting_board", {
      description = S("place");
      icon = "farming_cutting_board.png",
      width = 2,
      height = 1,
    })
end

if (cooking.dirty_dishes) then
  minetest.register_craftitem( "cooking:pestle_dirty", {
    description = S("Dirty pestle"),
    inventory_image = "cooking_pestle_dirty_inv.png",
    wield_image = "cooking_pestle_dirty_inv.png^[transformFY",
    stack_max = 1,
  });
  minetest.register_node( "cooking:mortar_dirty", {
    description = S("Dirty mortar"),
    drawtype = "mesh",
    paramtype  = "light",
    paramtype2 = "facedir",
    mesh = "cooking_mortar.obj",
    selection_box = node_box_mortar,
    collision_box = node_box_mortar,
    tiles = {"default_stone.png^cooking_mortar_dirty.png"},
    --sunlight_propagates = true,
    groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = cooking.use_not_in_creative_inventory},
  })
else
  minetest.register_alias("cooking:mortar_dirty", "cooking:mortar");
  minetest.register_alias("cooking:pestle_dirty", "cooking:pestle");
end
minetest.register_alias("cooking:mortar_dirty_node", "cooking:mortar");

-- wheat
minetest.register_node( "cooking:mortar_with_wheat", {
  description = S("Mortar with wheat grain"),
  drawtype = "mesh",
  paramtype  = "light",
  paramtype2 = "facedir",
  mesh = "cooking_mortar_fill.obj",
  selection_box = node_box_fill,
  collision_box = node_box_fill,
  tiles = {"default_stone.png", "cooking_fill_wheat.png"},
  --sunlight_propagates = true,
  groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = cooking.use_not_in_creative_inventory},
})

minetest.register_node( "cooking:mortar_with_wheat_flour", {
  description = S("Mortar with wheat flour"),
  drawtype = "mesh",
  paramtype  = "light",
  paramtype2 = "facedir",
  mesh = "cooking_mortar_fill.obj",
  selection_box = node_box_fill,
  collision_box = node_box_fill,
  tiles = {"default_stone.png", "cooking_fill_wheat_flour.png"},
  --sunlight_propagates = true,
  groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = cooking.use_not_in_creative_inventory},
})

-- barley
minetest.register_node( "cooking:mortar_with_barley", {
  description = S("Mortar with barley grain"),
  drawtype = "mesh",
  paramtype  = "light",
  paramtype2 = "facedir",
  mesh = "cooking_mortar_fill.obj",
  selection_box = node_box_fill,
  collision_box = node_box_fill,
  tiles = {"default_stone.png", "cooking_fill_barley.png"},
  --sunlight_propagates = true,
  groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = cooking.use_not_in_creative_inventory},
})

minetest.register_node( "cooking:mortar_with_barley_flour", {
  description = S("Mortar with barley flour"),
  drawtype = "mesh",
  paramtype  = "light",
  paramtype2 = "facedir",
  mesh = "cooking_mortar_fill.obj",
  selection_box = node_box_fill,
  collision_box = node_box_fill,
  tiles = {"default_stone.png", "cooking_fill_barley_flour.png"},
  --sunlight_propagates = true,
  groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = cooking.use_not_in_creative_inventory},
})

-- oat
minetest.register_node( "cooking:mortar_with_oat", {
  description = S("Mortar with oat grain"),
  drawtype = "mesh",
  paramtype  = "light",
  paramtype2 = "facedir",
  mesh = "cooking_mortar_fill.obj",
  selection_box = node_box_fill,
  collision_box = node_box_fill,
  tiles = {"default_stone.png", "cooking_fill_oat.png"},
  --sunlight_propagates = true,
  groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = cooking.use_not_in_creative_inventory},
})

minetest.register_node( "cooking:mortar_with_oat_flour", {
  description = S("Mortar with oat flour"),
  drawtype = "mesh",
  paramtype  = "light",
  paramtype2 = "facedir",
  mesh = "cooking_mortar_fill.obj",
  selection_box = node_box_fill,
  collision_box = node_box_fill,
  tiles = {"default_stone.png", "cooking_fill_oat_flour.png"},
  --sunlight_propagates = true,
  groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = cooking.use_not_in_creative_inventory},
})

-- rye
minetest.register_node( "cooking:mortar_with_rye", {
  description = S("Mortar with rye grain"),
  drawtype = "mesh",
  paramtype  = "light",
  paramtype2 = "facedir",
  mesh = "cooking_mortar_fill.obj",
  selection_box = node_box_fill,
  collision_box = node_box_fill,
  tiles = {"default_stone.png", "cooking_fill_rye.png"},
  --sunlight_propagates = true,
  groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = cooking.use_not_in_creative_inventory},
})

minetest.register_node( "cooking:mortar_with_rye_flour", {
  description = S("Mortar with rye flour"),
  drawtype = "mesh",
  paramtype  = "light",
  paramtype2 = "facedir",
  mesh = "cooking_mortar_fill.obj",
  selection_box = node_box_fill,
  collision_box = node_box_fill,
  tiles = {"default_stone.png", "cooking_fill_rye_flour.png"},
  --sunlight_propagates = true,
  groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = cooking.use_not_in_creative_inventory},
})

