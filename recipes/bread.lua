
-- flour to bowl
cooking.add_punch_recipe("cooking:mixing_glass_bowl", "farming:flour", {
    new_name = "cooking:mixing_glass_bowl_with_flour",
  }, "pouring_mixing_bowl")

-- bread base
cooking.add_punch_recipe("cooking:mixing_glass_bowl_with_flour", "farming:salt", {
    new_name = "cooking:mixing_glass_bowl_with_flour_salt",
  }, "pouring_mixing_bowl")
cooking.add_punch_recipe("cooking:mixing_glass_bowl_with_flour_salt", "cooking:glass_bottle_with_water", {
    new_name = "cooking:mixing_glass_bowl_with_flour_salt_water",
    drop = "cooking:glass_bottle",
  }, "pouring_mixing_bowl")
cooking.add_punch_recipe("cooking:mixing_glass_bowl_with_flour_salt", "cooking:glass_bottle_cork_with_water", {
    new_name = "cooking:mixing_glass_bowl_with_flour_salt_water",
    drop = "vessels:glass_bottle",
  }, "pouring_mixing_bowl")
cooking.add_punch_recipe("cooking:mixing_glass_bowl_with_flour_salt_water", "cooking:mixing_glass_bowl_with_sourdough", {
    new_name = "cooking:mixing_glass_bowl_with_flour_salt_water_sourdough",
    drop = "cooking:mixing_glass_bowl_with_sourdough_half",
  }, "pouring_mixing_bowl")

-- normal bread pancake
cooking.add_punch_recipe("cooking:mixing_glass_bowl_with_flour_salt_water", "cooking:stirring_spoon", {
    new_name = "cooking:mixing_glass_bowl_with_bread_pancake_dough",
    use_meta = "mixing",
    target_meta = 3,
    no_take = true,
  }, "pouring_mixing_bowl")

-- normal bread
cooking.add_punch_recipe("cooking:mixing_glass_bowl_with_flour_salt_water", "cooking:mixing_glass_bowl_with_sourdough_half", {
    new_name = "cooking:mixing_glass_bowl_with_flour_salt_water_sourdough",
    drop = "cooking:mixing_glass_bowl_dirty",
  }, "pouring_mixing_bowl")
cooking.add_punch_recipe("cooking:mixing_glass_bowl_with_flour_salt_water_sourdough", "cooking:stirring_spoon", {
    new_name = "cooking:mixing_glass_bowl_with_bread_dough",
    use_meta = "mixing",
    target_meta = 3,
    no_take = true,
  }, "mixing_stirring_spoon")
cooking.add_punch_recipe("cooking:mixing_glass_bowl_with_bread_dough", "", {
    new_name = "cooking:mixing_glass_bowl_with_bread_dough_kneaded",
    use_meta = "kneading",
    target_meta = 3,
    no_take = true,
  }, "kneading_mixing_bowl")
cooking.add_timer_recipe("cooking:mixing_glass_bowl_with_bread_dough_kneaded", {
    new_name = "cooking:mixing_glass_bowl_with_bread_dough_leavened",
    use_meta = "waiting",
    target_meta = math.ceil((90*60)/cooking.time_divider),
  }, "waiting")
--minetest.clear_craft({
--    output = "farming:bread"
--  })

