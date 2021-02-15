
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

minetest.register_craftitem( "cooking:cutting_knife", {
  description = "Cutting knife",
  inventory_image = "cooking_cutting_knife_inv.png",
  stack_max = 1,
});

minetest.register_node( "cooking:cutting_board_with_knife", {
  description = "Cutting board with knife",
  drawtype = "mesh",
  paramtype  = "light",
  paramtype2 = "facedir",
  mesh = "cooking_cutting_board_with_knife.obj",
  selection_box = node_box_board_with_knife,
  tiles = {"cooking_cutting_board.png", "cooking_cutting_knife.png"},
  --sunlight_propagates = true,
  groups = {oddly_breakable_by_hand = 1, not_in_creative_inventory = cooking.use_not_in_creative_inventory},
  drop = "farming:cutting_board",
  on_punch = function(pos, node, puncher, pointed_thing)
      if (puncher:get_wielded_item():get_name()=="") then
        puncher:set_wielded_item(ItemStack("cooking:cutting_knife"));
        node.name = "cooking:cutting_board";
        minetest.swap_node(pos, node);
        return;
      end
      --minetest.node_punch(pos, node, puncher, pointed_thing);
    end,
})

cooking.set_on_place("farming:cutting_board", "cooking:cutting_board_with_knife")

minetest.register_node( "cooking:cutting_board", {
  description = "Cutting board",
  drawtype = "mesh",
  paramtype  = "light",
  paramtype2 = "facedir",
  mesh = "cooking_cutting_board.obj",
  selection_box = node_box_board,
  tiles = {"cooking_cutting_board.png"},
  --sunlight_propagates = true,
  groups = {oddly_breakable_by_hand = 1, not_in_creative_inventory = cooking.use_not_in_creative_inventory},
  on_punch = function(pos, node, puncher, pointed_thing)
      if (puncher:get_wielded_item():get_name()=="cooking:cutting_knife") then
        puncher:set_wielded_item(ItemStack("farming:cutting_board"));
        minetest.remove_node(pos);
        return;
      end
      --minetest.node_punch(pos, node, puncher, pointed_thing);
    end,
})
if (cooking.dirty_dishes) then
  minetest.register_node( "cooking:cutting_board_dirty", {
    description = "Dirty cutting board",
    drawtype = "mesh",
    paramtype  = "light",
    paramtype2 = "facedir",
    mesh = "cooking_cutting_board.obj",
    selection_box = node_box_board,
    tiles = {"cooking_cutting_board_dirty.png"},
    --sunlight_propagates = true,
    groups = {oddly_breakable_by_hand = 1, not_in_creative_inventory = cooking.use_not_in_creative_inventory},
    on_punch = function(pos, node, puncher, pointed_thing)
        if (puncher:get_wielded_item():get_name()=="cooking:cutting_knife") then
          puncher:set_wielded_item(ItemStack("farming:cutting_board_dirty"));
          minetest.remove_node(pos);
          return;
        end
        --minetest.node_punch(pos, node, puncher, pointed_thing);
      end,
  })
else
  minetest.register_alias("cooking:cutting_board_dirty", "farming:cutting_board");
end

-- apple
minetest.register_node( "cooking:cutting_board_apple", {
  description = "Cutting board with apple",
  drawtype = "mesh",
  paramtype  = "light",
  paramtype2 = "facedir",
  mesh = "cooking_cutting_board_with_apple.obj",
  selection_box = node_box_board_with_apple,
  tiles = {"cooking_cutting_board.png", "cooking_cutting_apple.png"},
  --sunlight_propagates = true,
  groups = {oddly_breakable_by_hand = 1, not_in_creative_inventory = cooking.use_not_in_creative_inventory},
})
minetest.register_node( "cooking:cutting_board_with_chopped_apple", {
  description = "Cutting board with chopped apple",
  drawtype = "mesh",
  paramtype  = "light",
  paramtype2 = "facedir",
  mesh = "cooking_cutting_board_with_chopped.obj",
  selection_box = node_box_board_with_chopped,
  tiles = {"cooking_cutting_board.png", "cooking_cutting_chopped_apple.png"},
  --sunlight_propagates = true,
  groups = {oddly_breakable_by_hand = 1, not_in_creative_inventory = cooking.use_not_in_creative_inventory},
})

