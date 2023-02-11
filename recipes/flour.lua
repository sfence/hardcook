
-- wheat
hardcook.add_punch_recipe("hardcook:mortar", "farming:seed_wheat", {
    new_name = "hardcook:mortar_with_wheat",
    use_meta = "filling",
    target_meta = 4,
  }, "place_mortar")
hardcook.add_punch_recipe("hardcook:mortar_with_wheat", "hardcook:pestle", {
    new_name = "hardcook:mortar_with_wheat_flour",
    use_meta = "grinding",
    target_meta = 3,
    drop = "hardcook:pestle_dirty",
  }, "grinding_mortar")
hardcook.add_punch_recipe("hardcook:mortar_with_wheat_flour", "", {
    new_name = "hardcook:mortar_dirty_node",
    drop = "farming:flour",
  }, "take_hand")

-- barley
hardcook.add_punch_recipe("hardcook:mortar", "farming:seed_barley", {
    new_name = "hardcook:mortar_with_barley",
    use_meta = "filling",
    target_meta = 4,
  }, "place_mortar")
hardcook.add_punch_recipe("hardcook:mortar_with_barley", "hardcook:pestle", {
    new_name = "hardcook:mortar_with_barley_flour",
    use_meta = "grinding",
    target_meta = 3,
    drop = "hardcook:pestle_dirty",
  }, "grinding_mortar")
hardcook.add_punch_recipe("hardcook:mortar_with_barley_flour", "", {
    new_name = "hardcook:mortar_dirty_node",
    drop = "hardcook:flour_barley",
  }, "take_hand")

-- oat
hardcook.add_punch_recipe("hardcook:mortar", "farming:seed_oat", {
    new_name = "hardcook:mortar_with_oat",
    use_meta = "filling",
    target_meta = 4,
  }, "place_mortar")
hardcook.add_punch_recipe("hardcook:mortar_with_oat", "hardcook:pestle", {
    new_name = "hardcook:mortar_with_oat_flour",
    use_meta = "grinding",
    target_meta = 3,
    drop = "hardcook:pestle_dirty",
  }, "grinding_mortar")
hardcook.add_punch_recipe("hardcook:mortar_with_oat_flour", "", {
    new_name = "hardcook:mortar_dirty_node",
    drop = "hardcook:flour_oat",
  }, "take_hand")

-- rye
hardcook.add_punch_recipe("hardcook:mortar", "farming:seed_rye", {
    new_name = "hardcook:mortar_with_rye",
    use_meta = "filling",
    target_meta = 4,
  }, "place_mortar")
hardcook.add_punch_recipe("hardcook:mortar_with_rye", "hardcook:pestle", {
    new_name = "hardcook:mortar_with_rye_flour",
    use_meta = "grinding",
    target_meta = 3,
    drop = "hardcook:pestle_dirty",
  }, "grinding_mortar")
hardcook.add_punch_recipe("hardcook:mortar_with_rye_flour", "", {
    new_name = "hardcook:mortar_dirty_node",
    drop = "hardcook:flour_rye",
  }, "take_hand")

minetest.clear_craft({
    output = "farming:flour"
  })

-- multigrain flour

minetest.clear_craft({
    output = "farming:flour_multigrain"
  })

minetest.register_craft({
  type = "shapeless",
  output = "farming:flour_multigrain 4",
  recipe = {
    "farming:flour",
    "hardcook:flour_barley",
    "hardcook:flour_oat",
    "hardcook:flour_rye",
  },
});


