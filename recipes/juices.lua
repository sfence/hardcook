
-- cactus juice
cooking.add_punch_recipe("cooking:juicer", "default:cactus", {
    new_name = "cooking:juicer_with_cactus_juice",
    use_meta = "cactus_juice",
    target_meta = 3,
  }, "squeezing")
cooking.add_punch_recipe("cooking:drinking_glass", "cooking:juicer_with_cactus_juice", {
    new_name = "cooking:drinking_glass_of_cactus_juice",
    drop = "cooking:juicer_with_cactus_juice_2",
  }, "pouring_drinking_glass")
cooking.add_punch_recipe("cooking:drinking_glass", "cooking:juicer_with_cactus_juice_2", {
    new_name = "cooking:drinking_glass_of_cactus_juice",
    drop = "cooking:juicer_dirty",
  }, "pouring_drinking_glass")
minetest.clear_craft({
    output = "farming:cactus_juice"
  })

-- carrot juice
cooking.add_punch_recipe("cooking:juicer", "farming:carrot", {
    new_name = "cooking:juicer_with_carrot_juice",
    use_meta = "carrot_juice",
    target_meta = 3,
  }, "squeezing")
cooking.add_punch_recipe("cooking:drinking_glass", "cooking:juicer_with_carrot_juice", {
    new_name = "cooking:drinking_glass_of_carrot_juice",
    drop = "cooking:juicer_dirty",
  }, "pouring_drinking_glass")
minetest.clear_craft({
    output = "farming:carrot_juice"
  })

-- pineapple juice
cooking.add_punch_recipe("cooking:juicer", "farming:pineapple", {
    new_name = "cooking:juicer_with_pineapple_juice",
    use_meta = "pineapple_juice",
    target_meta = 3,
  }, "squeezing")
cooking.add_punch_recipe("cooking:juicer", "farming:pineapple_ring", {
    new_name = "cooking:juicer_with_pineapple_juice_2",
    use_meta = "pineapple_ring_juice",
    target_meta = 3,
    take_always = true,
  }, "squeezing")
cooking.add_punch_recipe("cooking:juicer_with_pineapple_juice_2", "farming:pineapple_ring", {
    new_name = "cooking:juicer_with_pineapple_juice",
    use_meta = "pineapple_ring_juice",
    target_meta = 3,
    take_always = true,
  }, "squeezing")
cooking.add_punch_recipe("cooking:drinking_glass", "cooking:juicer_with_pineapple_juice", {
    new_name = "cooking:drinking_glass_of_pineapple_juice",
    drop = "cooking:juicer_with_pineapple_juice_2",
  }, "pouring_drinking_glass")
cooking.add_punch_recipe("cooking:drinking_glass", "cooking:juicer_with_pineapple_juice_2", {
    new_name = "cooking:drinking_glass_of_pineapple_juice",
    drop = "cooking:juicer_dirty",
  }, "pouring_drinking_glass")
minetest.clear_craft({
    output = "farming:pineapple_juice"
  })

cooking.set_food_on_use("farming:pineapple_ring")

