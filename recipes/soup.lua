
cooking.add_punch_recipe("cooking:cooking_pot", "cooking:glass_bottle_with_water", {
    new_name = "cooking:cooking_pot_with_water",
    drop = "cooking:glass_bottle",
  }, "pouring_cooking_pot")

cooking.add_punch_recipe("cooking:cooking_pot_with_water", "cooking:cutting_board_with_chopped_beetroot", {
    new_name = "cooking:cooking_pot_with_water_beetroot",
    use_meta = "add_beetroot",
    target_meta = 6,
    take_value = 1,
    
    drop = "cooking:cutting_board_dirty",
  }, "pouring_cooking_pot")

cooking.add_punch_recipe("cooking:cooking_pot_with_water_beetroot", "farming:salt", {
    new_name = "cooking:cooking_pot_with_water_beetroot_salt",
  }, "pouring_cooking_pot")

cooking.add_punch_recipe("cooking:cooking_pot_with_water_beetroot_salt", "cooking:potlid", {
    new_name = "cooking:cooking_pot_with_water_beetroot_salt_potlid",
    use_swap = true,
  }, "pouring_cooking_pot")

cooking.add_punch_recipe("cooking:cooking_pot_with_water_beetroot_salt_potlid", "", {
    new_name = "cooking:cooking_pot_with_water_beetroot_salt",
    use_swap = true,
    drop = "cooking:potlid",
  }, "take_hand")

cooking.add_cooking_recipe("cooking:cooking_pot_with_water_beetroot_salt", {
    new_name = "cooking:cooking_pot_with_beetroot_soup",
    min_temp = 90,
    cook_temp = 100,
    step_energy = 100,
    cooked_energy = math.ceil(180000/cooking.time_divider),
    degree_energy = math.ceil(50000/cooking.time_divider),
    conductivity = {
      from_cooker = 50,
      to_air = 60,
    },
  }, "cooking_cooker")

cooking.add_cooking_recipe("cooking:cooking_pot_with_water_beetroot_salt_potlid", {
    new_name = "cooking:cooking_pot_with_beetroot_soup_potlid",
    min_temp = 90,
    cook_temp = 100,
    step_energy = 100,
    cooked_energy = math.ceil(180000/cooking.time_divider),
    degree_energy = math.ceil(50000/cooking.time_divider),
    conductivity = {
      from_cooker = 50,
      to_air = 40,
    },
  }, "cooking_cooker")

cooking.add_punch_recipe("cooking:cooking_pot_with_beetroot_soup_potlid", "", {
    new_name = "cooking:cooking_pot_with_beetroot_soup",
    use_swap = true,
    drop = "cooking:potlid_dirty",
  }, "take_hand")

cooking.add_punch_recipe("cooking:wooden_bowl", "cooking:cooking_pot_with_beetroot_soup", {
    new_name = "cooking:wooden_bowl_with_beetroot_soup",
    drop = "cooking:cooking_pot_dirty",
  }, "take_hand")

minetest.clear_craft({
    output = "farming:beetroot_soup"
  })

