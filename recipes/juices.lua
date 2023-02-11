
-- cactus juice
hardcook.add_punch_recipe("hardcook:juicer", "default:cactus", {
    new_name = "hardcook:juicer_with_cactus_juice",
    use_meta = "cactus_juice",
    target_meta = 3,
  }, "squeezing")
hardcook.add_punch_recipe("hardcook:drinking_glass", "hardcook:juicer_with_cactus_juice", {
    new_name = "hardcook:drinking_glass_of_cactus_juice",
    drop = "hardcook:juicer_with_cactus_juice_2",
  }, "pouring_drinking_glass")
hardcook.add_punch_recipe("hardcook:drinking_glass", "hardcook:juicer_with_cactus_juice_2", {
    new_name = "hardcook:drinking_glass_of_cactus_juice",
    drop = "hardcook:juicer_dirty",
  }, "pouring_drinking_glass")
minetest.clear_craft({
    output = "farming:cactus_juice"
  })

-- carrot juice
hardcook.add_punch_recipe("hardcook:juicer", "farming:carrot", {
    new_name = "hardcook:juicer_with_carrot_juice",
    use_meta = "carrot_juice",
    target_meta = 3,
  }, "squeezing")
hardcook.add_punch_recipe("hardcook:drinking_glass", "hardcook:juicer_with_carrot_juice", {
    new_name = "hardcook:drinking_glass_of_carrot_juice",
    drop = "hardcook:juicer_dirty",
  }, "pouring_drinking_glass")
minetest.clear_craft({
    output = "farming:carrot_juice"
  })

-- pineapple juice
hardcook.add_punch_recipe("hardcook:juicer", "farming:pineapple", {
    new_name = "hardcook:juicer_with_pineapple_juice",
    use_meta = "pineapple_juice",
    target_meta = 3,
  }, "squeezing")
hardcook.add_punch_recipe("hardcook:juicer", "farming:pineapple_ring", {
    new_name = "hardcook:juicer_with_pineapple_juice_2",
    use_meta = "pineapple_ring_juice",
    target_meta = 3,
    take_value = 1,
  }, "squeezing")
hardcook.add_punch_recipe("hardcook:juicer_with_pineapple_juice_2", "farming:pineapple_ring", {
    new_name = "hardcook:juicer_with_pineapple_juice",
    use_meta = "pineapple_ring_juice",
    target_meta = 3,
    take_value = 1,
  }, "squeezing")
hardcook.add_punch_recipe("hardcook:drinking_glass", "hardcook:juicer_with_pineapple_juice", {
    new_name = "hardcook:drinking_glass_of_pineapple_juice",
    drop = "hardcook:juicer_with_pineapple_juice_2",
  }, "pouring_drinking_glass")
hardcook.add_punch_recipe("hardcook:drinking_glass", "hardcook:juicer_with_pineapple_juice_2", {
    new_name = "hardcook:drinking_glass_of_pineapple_juice",
    drop = "hardcook:juicer_dirty",
  }, "pouring_drinking_glass")
minetest.clear_craft({
    output = "farming:pineapple_juice"
  })

hardcook.set_food_on_use("farming:pineapple_ring")

