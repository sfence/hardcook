
-- sourdough

cooking.add_punch_recipe("cooking:mixing_glass_bowl_with_flour", "cooking:glass_bottle_with_water", {
    new_name = "cooking:mixing_glass_bowl_with_flour_water",
    drop = "cooking:glass_bottle"
  }, "pouring_mixing_bowl")

cooking.add_punch_recipe("cooking:mixing_glass_bowl_with_flour", "cooking:glass_bottle_cork_with_water", {
    new_name = "cooking:mixing_glass_bowl_with_flour_water",
    drop = "vessels:glass_bottle"
  }, "pouring_mixing_bowl")

cooking.add_punch_recipe("cooking:mixing_glass_bowl_with_flour_water", "cooking:stirring_spoon", {
    new_name = "cooking:mixing_glass_bowl_with_flour_water_mixed",
    no_take = true,
  }, "mixing_stirring_spoon")

cooking.add_timer_recipe("cooking:mixing_glass_bowl_with_flour_water_mixed", {
    new_name = "cooking:mixing_glass_bowl_with_sourdough_1_add_fuel",
    use_meta = "waiting",
    target_meta = math.ceil((24*60*60)/cooking.time_divider),
  }, "waiting")

cooking.add_punch_recipe("cooking:mixing_glass_bowl_with_sourdough_1_add_fuel", "farming:flour", {
    new_name = "cooking:mixing_glass_bowl_with_sourdough_1",
    drop = "cooking:glass_bottle"
  }, "pouring_mixing_bowl")

cooking.add_timer_recipe("cooking:mixing_glass_bowl_with_sourdough_1", {
    new_name = "cooking:mixing_glass_bowl_with_sourdough_2_add_fuel",
    use_meta = "waiting",
    target_meta = math.ceil((24*60*60)/cooking.time_divider),
  }, "waiting")

cooking.add_punch_recipe("cooking:mixing_glass_bowl_with_sourdough_2_add_fuel", "farming:flour", {
    new_name = "cooking:mixing_glass_bowl_with_sourdough_2",
    drop = "cooking:glass_bottle"
  }, "pouring_mixing_bowl")

cooking.add_timer_recipe("cooking:mixing_glass_bowl_with_sourdough_2", {
    new_name = "cooking:mixing_glass_bowl_with_sourdough_3_add_fuel",
    use_meta = "waiting",
    target_meta = math.ceil((24*60*60)/cooking.time_divider),
  }, "waiting")

cooking.add_punch_recipe("cooking:mixing_glass_bowl_with_sourdough_3_add_fuel", "farming:flour", {
    new_name = "cooking:mixing_glass_bowl_with_sourdough_3",
    drop = "cooking:glass_bottle"
  }, "pouring_mixing_bowl")

cooking.add_timer_recipe("cooking:mixing_glass_bowl_with_sourdough_3", {
    new_name = "cooking:mixing_glass_bowl_with_sourdough",
    use_meta = "waiting",
    target_meta = math.ceil((24*60*60)/cooking.time_divider),
  }, "waiting")

cooking.add_punch_recipe("cooking:mixing_glass_bowl_with_sourdough_half", "farming:flour", {
    new_name = "cooking:mixing_glass_bowl_with_sourdough_3_add_fuel",
    drop = "cooking:glass_bottle"
  }, "pouring_mixing_bowl")

