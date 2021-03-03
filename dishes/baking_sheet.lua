
-- node box {x=0, y=0, z=0}
node_box_baking_sheet = {
  type = "fixed",
  fixed = {
    {-0.1875,-0.5,-0.375,0.1875,-0.3125,-0.3125},
    {-0.25,-0.5,-0.3125,0.25,-0.4375,0.3125},
    {-0.25,-0.4375,-0.3125,-0.1875,-0.3125,0.3125},
    {0.1875,-0.4375,-0.3125,0.25,-0.3125,0.3125},
    {-0.1875,-0.5,0.3125,0.1875,-0.3125,0.375},
  },
}

-- node box {x=0, y=0, z=0}
node_box_part_fill = {
  type = "fixed",
  fixed = {
    {-0.1875,-0.5,-0.375,0.1875,-0.3125,-0.3125},
    {-0.25,-0.5,-0.3125,0.25,-0.4375,0.3125},
    {-0.25,-0.4375,-0.3125,-0.1875,-0.3125,0.3125},
    {0.1875,-0.4375,-0.3125,0.25,-0.3125,0.3125},
    {-0.1875,-0.5,0.3125,0.1875,-0.3125,0.375},
    -- part fill
    {-0.125,-0.4375,-0.25,0.0,-0.375,-0.1875},
    {0.0625,-0.4375,-0.25,0.125,-0.375,-0.125},
    {-0.125,-0.4375,-0.125,0.0,-0.375,-0.0625},
    {0.0625,-0.4375,-0.0625,0.125,-0.375,0.0625},
    {-0.125,-0.4375,0.0625,0.0,-0.375,0.125},
    {0.0625,-0.4375,0.125,0.125,-0.375,0.25},
    {-0.125,-0.4375,0.1875,0.0,-0.375,0.25},
  },
}

-- node box {x=0, y=0, z=0}
node_box_fill = {
  type = "fixed",
  fixed = {
    {-0.1875,-0.5,-0.375,0.1875,-0.3125,-0.3125},
    {-0.25,-0.5,-0.3125,0.25,-0.4375,0.3125},
    {-0.25,-0.4375,-0.3125,-0.1875,-0.3125,0.3125},
    {0.1875,-0.4375,-0.3125,0.25,-0.3125,0.3125},
    {-0.1875,-0.5,0.3125,0.1875,-0.3125,0.375},
    -- fill
    {-0.1875,-0.4375,-0.3125,0.1875,-0.375,0.3125},
  },
}

local S = cooking.translator;

minetest.register_node( "cooking:baking_sheet", {
  description = S("Baking sheet"),
  drawtype = "mesh",
  paramtype  = "light",
  paramtype2 = "facedir",
  mesh = "cooking_baking_sheet.obj",
  selection_box = node_box_baking_sheet,
  collision_box = node_box_baking_sheet,
  tiles = {"cooking_baking_sheet_top.png", "cooking_baking_sheet_bottom.png"},
  --sunlight_propagates = true,
  groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = cooking.use_not_in_creative_inventory, on_burner_top = 1},
})

if (cooking.dirty_dishes) then
  minetest.register_node( "cooking:baking_sheet_dirty", {
    description = S("Dirty baking sheet"),
    drawtype = "mesh",
    paramtype  = "light",
    paramtype2 = "facedir",
    mesh = "cooking_baking_sheet.obj",
    selection_box = node_box_baking_sheet,
    collision_box = node_box_baking_sheet,
    tiles = {"cooking_baking_sheet_top.png", "cooking_baking_sheet_bottom.png"},
    --sunlight_propagates = true,
    groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = cooking.use_not_in_creative_inventory, on_burner_top = 1},
  })
  minetest.register_alias("cooking:baking_sheet_dirty_node", "cooking:baking_sheet_dirty");
else
  minetest.register_alias("cooking:baking_sheet_dirty", "farming:baking_sheet");
  minetest.register_alias("cooking:baking_sheet_dirty_node", "cooking:baking_sheet");
end

