
-- sourdough

hardcook.add_punch_recipe("hardcook:mixing_glass_bowl_with_flour_rye", "hardcook:glass_bottle_with_water", {
    new_name = "hardcook:mixing_glass_bowl_with_flour_water",
    drop = "hardcook:glass_bottle"
  }, "pouring_mixing_bowl")

hardcook.add_punch_recipe("hardcook:mixing_glass_bowl_with_flour_rye_water", "hardcook:stirring_spoon", {
    new_name = "hardcook:mixing_glass_bowl_with_flour_rye_water_mixed",
    no_take = true,
  }, "mixing_stirring_spoon")

hardcook.add_timer_recipe("hardcook:mixing_glass_bowl_with_flour_rye_water_mixed", {
    new_name = "hardcook:mixing_glass_bowl_with_sourdough_1_add_fuel",
    use_meta = "waiting",
    target_meta = math.ceil((24*60*60)/hardcook.time_divider),
  }, "waiting")

hardcook.add_punch_recipe("hardcook:mixing_glass_bowl_with_sourdough_1_add_fuel", "farming:flour", {
    new_name = "hardcook:mixing_glass_bowl_with_sourdough_1",
    drop = "hardcook:glass_bottle"
  }, "pouring_mixing_bowl")

hardcook.add_timer_recipe("hardcook:mixing_glass_bowl_with_sourdough_1", {
    new_name = "hardcook:mixing_glass_bowl_with_sourdough_2_add_fuel",
    use_meta = "waiting",
    target_meta = math.ceil((24*60*60)/hardcook.time_divider),
  }, "waiting")

hardcook.add_punch_recipe("hardcook:mixing_glass_bowl_with_sourdough_2_add_fuel", "farming:flour", {
    new_name = "hardcook:mixing_glass_bowl_with_sourdough_2",
    drop = "hardcook:glass_bottle"
  }, "pouring_mixing_bowl")

hardcook.add_timer_recipe("hardcook:mixing_glass_bowl_with_sourdough_2", {
    new_name = "hardcook:mixing_glass_bowl_with_sourdough_3_add_fuel",
    use_meta = "waiting",
    target_meta = math.ceil((24*60*60)/hardcook.time_divider),
  }, "waiting")

hardcook.add_punch_recipe("hardcook:mixing_glass_bowl_with_sourdough_3_add_fuel", "farming:flour", {
    new_name = "hardcook:mixing_glass_bowl_with_sourdough_3",
    drop = "hardcook:glass_bottle"
  }, "pouring_mixing_bowl")

hardcook.add_timer_recipe("hardcook:mixing_glass_bowl_with_sourdough_3", {
    new_name = "hardcook:mixing_glass_bowl_with_sourdough",
    use_meta = "waiting",
    target_meta = math.ceil((24*60*60)/hardcook.time_divider),
  }, "waiting")

hardcook.add_punch_recipe("hardcook:mixing_glass_bowl", "hardcook:mixing_glass_bowl_with_sourdough", {
    new_name = "hardcook:mixing_glass_bowl_with_sourdough_half",
    drop = "hardcook:mixing_glass_bowl_with_sourdough_half"
  }, "pouring_mixing_bowl")

hardcook.add_punch_recipe("hardcook:mixing_glass_bowl_with_sourdough_half", "farming:flour", {
    new_name = "hardcook:mixing_glass_bowl_with_sourdough_3",
    drop = "hardcook:glass_bottle"
  }, "pouring_mixing_bowl")

