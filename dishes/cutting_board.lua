
-- node box {x=0, y=0, z=0}
node_box_board = {
  type = "fixed",
  fixed = {
    {-0.4375,-0.5,-0.25,0.0625,-0.4375,0.25},
    {0.0625,-0.5,-0.1875,0.1875,-0.4375,0.1875},
    {0.1875,-0.5,-0.125,0.25,-0.4375,0.125},
    {0.25,-0.5,-0.0625,0.4375,-0.4375,0.0625},
  },
}

-- node box {x=0, y=0, z=0}
node_box_board_with_knife = {
  type = "fixed",
  fixed = {
    {-0.4375,-0.5,-0.25,0.0625,-0.4375,0.25},
    {0.0625,-0.5,-0.1875,0.1875,-0.4375,0.1875},
    {0.1875,-0.5,-0.125,0.25,-0.4375,0.125},
    {0.25,-0.5,-0.0625,0.4375,-0.4375,0.0625},
    -- knife
    {-0.125,-0.4375,-0.4375,0.0,-0.375,-0.25},
    {-0.1875,-0.4375,-0.25,0.0,-0.375,0.125},
    {-0.125,-0.4375,0.125,0.0,-0.375,0.1875},
  },
}
-- node box {x=0, y=0, z=0}
node_box_board_with_chopped = {
  type = "fixed",
  fixed = {
    {-0.4375,-0.5,-0.25,0.0625,-0.4375,0.25},
    {0.0625,-0.5,-0.1875,0.1875,-0.4375,0.1875},
    {0.1875,-0.5,-0.125,0.25,-0.4375,0.125},
    {0.25,-0.5,-0.0625,0.4375,-0.4375,0.0625},
    -- chopped
    {-0.375,-0.4375,-0.25,0.0,-0.375,0.25},
    {-0.4375,-0.4375,-0.1875,-0.375,-0.375,0.1875},
    {0.0,-0.4375,-0.1875,0.125,-0.375,0.1875},
    {-0.375,-0.375,-0.1875,0.0,-0.3125,0.1875},
    {0.125,-0.4375,-0.125,0.1875,-0.375,0.125},
    {0.0,-0.375,-0.125,0.125,-0.3125,0.125},
    {-0.3125,-0.3125,-0.125,0.0,-0.25,0.125},
    {0.0,-0.3125,-0.0625,0.0625,-0.25,0.0625},
    {-0.25,-0.25,-0.0625,0.0,-0.1875,0.0625},
  },
}
-- node box {x=0, y=0, z=0}
node_box_board_with_apple = {
  type = "fixed",
  fixed = {
    {-0.4375,-0.5,-0.25,0.0625,-0.4375,0.25},
    {0.0625,-0.5,-0.1875,0.1875,-0.4375,0.1875},
    {0.1875,-0.5,-0.125,0.25,-0.4375,0.125},
    {0.25,-0.5,-0.0625,0.4375,-0.4375,0.0625},
    -- apple
    {-0.25,-0.375,-0.25,0.0,0.0,0.25},
    {-0.3125,-0.3125,-0.25,-0.25,-0.0625,0.25},
    {0.0,-0.3125,-0.25,0.0625,-0.0625,0.25},
    {-0.25,-0.4375,-0.1875,0.0,-0.375,0.1875},
    {-0.3125,-0.375,-0.1875,-0.25,-0.3125,0.1875},
    {0.0,-0.375,-0.1875,0.0625,-0.3125,0.1875},
    {-0.375,-0.3125,-0.1875,-0.3125,-0.0625,0.1875},
    {0.0625,-0.3125,-0.1875,0.125,-0.0625,0.1875},
    {-0.3125,-0.0625,-0.1875,-0.25,0.0,0.1875},
    {0.0,-0.0625,-0.1875,0.0625,0.0,0.1875},
    {-0.25,0.0,-0.1875,0.0,0.0625,0.1875},
    {-0.3125,-0.4375,-0.125,-0.25,-0.375,0.125},
    {0.0,-0.4375,-0.125,0.0625,-0.375,0.125},
    {-0.375,-0.375,-0.125,-0.3125,-0.3125,0.125},
    {0.0625,-0.375,-0.125,0.125,-0.3125,0.125},
    {-0.375,-0.0625,-0.125,-0.3125,0.0,0.125},
    {0.0625,-0.0625,-0.125,0.125,0.0,0.125},
    {-0.3125,0.0,-0.125,-0.25,0.0625,0.125},
    {0.0,0.0,-0.125,0.0625,0.0625,0.125},
    {-0.1875,0.0625,-0.0625,-0.0625,0.125,0.0625},
  },
}
-- node box {x=0, y=0, z=0}
node_box_board_with_beetroot = {
  type = "fixed",
  fixed = {
    {-0.4375,-0.5,-0.25,0.0625,-0.4375,0.25},
    {0.0625,-0.5,-0.1875,0.1875,-0.4375,0.1875},
    {0.1875,-0.5,-0.125,0.25,-0.4375,0.125},
    {0.25,-0.5,-0.0625,0.4375,-0.4375,0.0625},
    -- beetroot
    {-0.25,-0.375,-0.1875,0.0625,-0.1875,0.1875},
    {-0.25,-0.4375,-0.125,0.0625,-0.375,0.125},
    {-0.3125,-0.375,-0.125,-0.25,-0.1875,0.125},
    {0.0625,-0.375,-0.125,0.125,-0.1875,0.125},
    {-0.375,-0.3125,-0.125,-0.3125,-0.1875,0.125},
    {-0.25,-0.1875,-0.125,0.0,-0.125,0.125},
    {0.125,-0.3125,-0.0625,0.1875,-0.25,0.0625},
    {0.1875,-0.25,-0.0625,0.25,-0.1875,0.0625},
    {-0.3125,-0.1875,-0.0625,-0.25,-0.125,0.0625},
    {0.0,-0.1875,-0.0625,0.0625,-0.125,0.0625},
  },
}
-- node box {x=0, y=0, z=0}
node_box_board_with_onion = {
  type = "fixed",
  fixed = {
    {-0.4375,-0.5,-0.25,0.0625,-0.4375,0.25},
    {0.0625,-0.5,-0.1875,0.1875,-0.4375,0.1875},
    {0.1875,-0.5,-0.125,0.25,-0.4375,0.125},
    {0.25,-0.5,-0.0625,0.4375,-0.4375,0.0625},
    -- onion
    {-0.1875,-0.3125,-0.1875,-0.0625,-0.125,0.1875},
    {-0.25,-0.25,-0.1875,-0.1875,-0.1875,0.1875},
    {-0.0625,-0.25,-0.1875,0.0,-0.125,0.1875},
    {-0.1875,-0.375,-0.125,-0.0625,-0.3125,0.125},
    {-0.3125,-0.3125,-0.125,-0.1875,-0.25,0.125},
    {-0.0625,-0.3125,-0.125,0.0625,-0.25,0.125},
    {-0.3125,-0.25,-0.125,-0.25,-0.1875,0.125},
    {0.0,-0.25,-0.125,0.0625,-0.125,0.125},
    {-0.25,-0.1875,-0.125,-0.1875,-0.125,0.125},
    {-0.1875,-0.125,-0.125,0.0,-0.0625,0.125},
    {-0.1875,-0.4375,-0.0625,-0.0625,-0.375,0.0625},
    {-0.3125,-0.375,-0.0625,-0.1875,-0.3125,0.0625},
    {-0.0625,-0.375,-0.0625,0.0625,-0.3125,0.0625},
    {-0.375,-0.3125,-0.0625,-0.3125,-0.1875,0.0625},
    {0.0625,-0.3125,-0.0625,0.125,-0.125,0.0625},
    {0.125,-0.25,-0.0625,0.25,-0.1875,0.0625},
    {-0.3125,-0.1875,-0.0625,-0.25,-0.125,0.0625},
    {-0.25,-0.125,-0.0625,-0.1875,-0.0625,0.0625},
    {0.0,-0.125,-0.0625,0.0625,-0.0625,0.0625},
  },
}

local S = cooking.translator;

minetest.register_craftitem( "cooking:cutting_knife", {
  description = S("Cutting knife"),
  inventory_image = "cooking_cutting_knife_inv.png",
  wield_image = "cooking_cutting_knife_inv.png^[transformFY",
  stack_max = 1,
});

minetest.register_node( "cooking:cutting_board_with_knife", {
  description = S("Cutting board with knife"),
  drawtype = "mesh",
  paramtype  = "light",
  paramtype2 = "facedir",
  mesh = "cooking_cutting_board_with_knife.obj",
  selection_box = node_box_board_with_knife,
  collision_box = node_box_board_with_knife,
  tiles = {"cooking_cutting_board.png", "cooking_cutting_knife.png"},
  --sunlight_propagates = true,
  groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = cooking.use_not_in_creative_inventory},
  drop = "farming:cutting_board",
})

cooking.set_on_place("farming:cutting_board", "cooking:cutting_board_with_knife")

minetest.register_node( "cooking:cutting_board", {
  description = S("Cutting board"),
  drawtype = "mesh",
  paramtype  = "light",
  paramtype2 = "facedir",
  mesh = "cooking_cutting_board.obj",
  selection_box = node_box_board,
  collision_box = node_box_board,
  tiles = {"cooking_cutting_board.png"},
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
  unified_inventory.register_craft_type("cutting_board", {
      description = S("cutting");
      icon = "farming_cutting_board.png",
      width = 2,
      height = 1,
    })
end

if (cooking.dirty_dishes) then
  minetest.register_craftitem( "cooking:cutting_knife_dirty", {
    description = S("Dirty cutting knife"),
    inventory_image = "cooking_cutting_knife_dirty_inv.png",
    wield_image = "cooking_cutting_knife_dirty_inv.png^[transformFY",
    stack_max = 1,
  });
  minetest.register_node( "cooking:cutting_board_dirty", {
    description = S("Dirty cutting board"),
    drawtype = "mesh",
    paramtype  = "light",
    paramtype2 = "facedir",
    mesh = "cooking_cutting_board.obj",
    selection_box = node_box_board,
    collision_box = node_box_board,
    tiles = {"cooking_cutting_board_dirty.png"},
    --sunlight_propagates = true,
    groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = cooking.use_not_in_creative_inventory},
  })
else
  minetest.register_alias("cooking:cutting_board_dirty", "cooking:cutting_board");
  minetest.register_alias("cooking:cutting_knife_dirty", "cooking:cutting_knife");
end
minetest.register_alias("cooking:cutting_board_dirty_node", "cooking:cutting_board");

-- apple
minetest.register_node( "cooking:cutting_board_with_apple", {
  description = S("Cutting board with apple"),
  stack_max = 1,
  drawtype = "mesh",
  paramtype  = "light",
  paramtype2 = "facedir",
  mesh = "cooking_cutting_board_with_apple.obj",
  selection_box = node_box_board_with_apple,
  collision_box = node_box_board_with_apple,
  tiles = {"cooking_cutting_board.png", "cooking_cutting_apple.png"},
  --sunlight_propagates = true,
  groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = cooking.use_not_in_creative_inventory},
})
minetest.register_node( "cooking:cutting_board_with_chopped_apple", {
  description = S("Cutting board with chopped apple"),
  stack_max = 1,
  drawtype = "mesh",
  paramtype  = "light",
  paramtype2 = "facedir",
  mesh = "cooking_cutting_board_with_chopped.obj",
  selection_box = node_box_board_with_chopped,
  collision_box = node_box_board_with_chopped,
  tiles = {"cooking_cutting_board.png", "cooking_cutting_chopped_apple.png"},
  --sunlight_propagates = true,
  groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = cooking.use_not_in_creative_inventory},
})

-- beetroot
minetest.register_node( "cooking:cutting_board_with_beetroot", {
  description = S("Cutting board with beetroot"),
  stack_max = 1,
  drawtype = "mesh",
  paramtype  = "light",
  paramtype2 = "facedir",
  mesh = "cooking_cutting_board_with_beetroot.obj",
  selection_box = node_box_board_with_beetroot,
  collision_box = node_box_board_with_beetroot,
  tiles = {"cooking_cutting_board.png", "cooking_cutting_beetroot.png"},
  --sunlight_propagates = true,
  groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = cooking.use_not_in_creative_inventory},
})
minetest.register_node( "cooking:cutting_board_with_chopped_beetroot", {
  description = S("Cutting board with chopped beetroot"),
  stack_max = 1,
  drawtype = "mesh",
  paramtype  = "light",
  paramtype2 = "facedir",
  mesh = "cooking_cutting_board_with_chopped.obj",
  selection_box = node_box_board_with_chopped,
  collision_box = node_box_board_with_chopped,
  tiles = {"cooking_cutting_board.png", "cooking_cutting_chopped_beetroot.png"},
  --sunlight_propagates = true,
  groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = cooking.use_not_in_creative_inventory},
})

-- onion
minetest.register_node( "cooking:cutting_board_with_onion", {
  description = S("Cutting board with onion"),
  stack_max = 1,
  drawtype = "mesh",
  paramtype  = "light",
  paramtype2 = "facedir",
  mesh = "cooking_cutting_board_with_onion.obj",
  selection_box = node_box_board_with_onion,
  collision_box = node_box_board_with_onion,
  tiles = {"cooking_cutting_board.png", "cooking_cutting_onion.png"},
  --sunlight_propagates = true,
  groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = cooking.use_not_in_creative_inventory},
})
minetest.register_node( "cooking:cutting_board_with_chopped_onion", {
  description = S("Cutting board with chopped onion"),
  stack_max = 1,
  drawtype = "mesh",
  paramtype  = "light",
  paramtype2 = "facedir",
  mesh = "cooking_cutting_board_with_chopped.obj",
  selection_box = node_box_board_with_chopped,
  collision_box = node_box_board_with_chopped,
  tiles = {"cooking_cutting_board.png", "cooking_cutting_chopped_onion.png"},
  --sunlight_propagates = true,
  groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = cooking.use_not_in_creative_inventory},
})

