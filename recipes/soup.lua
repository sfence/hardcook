
hardcook.add_punch_recipe("hardcook:cooking_pot", "hardcook:glass_bottle_with_water", {
    new_name = "hardcook:cooking_pot_with_water",
    drop = "hardcook:glass_bottle",
  }, "hardcook_pouring_cooking_pot")

hardcook.add_punch_recipe("hardcook:cooking_pot_with_water", "hardcook:cutting_board_with_chopped_beetroot", {
    new_name = "hardcook:cooking_pot_with_water_beetroot",
    use_meta = "add_beetroot",
    target_meta = 6,
    take_value = 1,
    
    drop = "hardcook:cutting_board_dirty",
  }, "hardcook_pouring_cooking_pot")

hardcook.add_punch_recipe("hardcook:cooking_pot_with_water_beetroot", "farming:salt", {
    new_name = "hardcook:cooking_pot_with_water_beetroot_salt",
  }, "hardcook_pouring_cooking_pot")

hardcook.add_punch_recipe("hardcook:cooking_pot_with_water_beetroot_salt", "hardcook:potlid", {
    new_name = "hardcook:cooking_pot_with_water_beetroot_salt_potlid",
    use_swap = true,
  }, "hardcook_pouring_cooking_pot")

hardcook.add_punch_recipe("hardcook:cooking_pot_with_water_beetroot_salt_potlid", "", {
    new_name = "hardcook:cooking_pot_with_water_beetroot_salt",
    use_swap = true,
    drop = "hardcook:potlid",
  }, "hardcook_take_hand")

local cook_def = {
    uncooked_name = "hardcook:cooking_pot_with_water_beetroot_salt",
    cooked_name = "hardcook:cooking_pot_with_beetroot_soup",
    burnt_name = "hardcook:cooking_pot_burnt",
    
    to_air_open = 60,
    to_air_potlid = 40,
    
    have_potlid = true,
  }

hardcook.help_register_hardcook(cook_def, {
    callback = hardcook.callback_hardcook_boiling_default,
    cb_config = {
      cook_temp = 100,
      cooked_energy = math.ceil(180000/hardcook.time_divider),
      degree_energy = math.ceil(50000/hardcook.time_divider),
      burnt_energy = math.ceil(360000/hardcook.time_divider),
      coef = 1.1161,
      proportion = 197, -- step 100 on 100 degree
      conductivity = {
        from_cooker = 50,
      },
    },
  })

hardcook.add_punch_recipe("hardcook:cooking_pot_with_beetroot_soup_potlid", "", {
    new_name = "hardcook:cooking_pot_with_beetroot_soup",
    use_swap = true,
    drop = "hardcook:potlid_dirty",
  }, "hardcook_take_hand")

hardcook.add_punch_recipe("hardcook:wooden_bowl", "hardcook:cooking_pot_with_beetroot_soup", {
    new_name = "hardcook:wooden_bowl_with_beetroot_soup",
    drop = "hardcook:cooking_pot_dirty",
  }, "hardcook_take_hand")

minetest.clear_craft({
    output = "farming:beetroot_soup"
  })

