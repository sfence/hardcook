
-- wheat
cooking.add_punch_recipe("cooking:mortar", "farming:seed_wheat", {
    new_name = "cooking:mortar_with_wheat",
    use_meta = "filling",
    target_meta = 4,
  }, "place_cutting_board")
cooking.add_punch_recipe("cooking:mortar_with_wheat", "cooking:pestle", {
    new_name = "cooking:mortar_with_wheat_flour",
    use_meta = "grinding",
    target_meta = 3,
    drop = "cooking:pestle_dirty",
  }, "grinding_mortar")
cooking.add_punch_recipe("cooking:mortar_with_wheat_flour", "", {
    new_name = "cooking:mortar_dirty_node",
    drop = "farming:flour",
  }, "take_hand")

-- barley
cooking.add_punch_recipe("cooking:mortar", "farming:seed_barley", {
    new_name = "cooking:mortar_with_barley",
    use_meta = "filling",
    target_meta = 4,
  }, "place_cutting_board")
cooking.add_punch_recipe("cooking:mortar_with_barley", "cooking:pestle", {
    new_name = "cooking:mortar_with_barley_flour",
    use_meta = "grinding",
    target_meta = 3,
    drop = "cooking:pestle_dirty",
  }, "grinding_mortar")
cooking.add_punch_recipe("cooking:mortar_with_barley_flour", "", {
    new_name = "cooking:mortar_dirty_node",
    drop = "cooking:flour_barley",
  }, "take_hand")

-- oat
cooking.add_punch_recipe("cooking:mortar", "farming:seed_oat", {
    new_name = "cooking:mortar_with_oat",
    use_meta = "filling",
    target_meta = 4,
  }, "place_cutting_board")
cooking.add_punch_recipe("cooking:mortar_with_oat", "cooking:pestle", {
    new_name = "cooking:mortar_with_oat_flour",
    use_meta = "grinding",
    target_meta = 3,
    drop = "cooking:pestle_dirty",
  }, "grinding_mortar")
cooking.add_punch_recipe("cooking:mortar_with_oat_flour", "", {
    new_name = "cooking:mortar_dirty_node",
    drop = "cooking:flour_oat",
  }, "take_hand")

-- rye
cooking.add_punch_recipe("cooking:mortar", "farming:seed_rye", {
    new_name = "cooking:mortar_with_rye",
    use_meta = "filling",
    target_meta = 4,
  }, "place_cutting_board")
cooking.add_punch_recipe("cooking:mortar_with_rye", "cooking:pestle", {
    new_name = "cooking:mortar_with_rye_flour",
    use_meta = "grinding",
    target_meta = 3,
    drop = "cooking:pestle_dirty",
  }, "grinding_mortar")
cooking.add_punch_recipe("cooking:mortar_with_rye_flour", "", {
    new_name = "cooking:mortar_dirty_node",
    drop = "cooking:flour_rye",
  }, "take_hand")

minetest.clear_craft({
    output = "farming:flour"
  })

-- multigrain flour

minetest.clear_craft({
    output = "farming:flour_multigrain"
  })

--[[
minetest.register_craft({
  type = "shapeless",
  output = "farming:flour_multigrain",
  recipe = {
    {"farming:flour"},
    {"cooking:flour_barley"},
    {"cooking:flour_oat"},
    {"cooking:flour_rye"},
  },
});
--]]


