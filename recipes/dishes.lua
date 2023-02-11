
-- bottle
hardcook.add_punch_recipe("hardcook:glass_bottle_cork", "", {
    new_name = "hardcook:glass_bottle",
    drop = "hardcook:bottle_cork",
  }, "take_hand")

hardcook.add_punch_recipe("hardcook:glass_bottle", "hardcook:bottle_cork", {
    new_name = "hardcook:glass_bottle_cork",
  }, "place_hand")

-- cutting board
hardcook.add_punch_recipe("hardcook:cutting_board_with_knife", "", {
    new_name = "hardcook:cutting_board",
    drop = "hardcook:cutting_knife",
  }, "take_hand")

hardcook.add_punch_recipe("hardcook:cutting_board", "hardcook:cutting_knife", {
    new_name = "air",
    drop = "farming:cutting_board",
  }, "take_hand")

-- mortar and pestle
hardcook.add_punch_recipe("hardcook:mortar_with_pestle", "", {
    new_name = "hardcook:mortar",
    drop = "hardcook:pestle",
  }, "take_hand")

hardcook.add_punch_recipe("hardcook:mortar", "hardcook:pestle", {
    new_name = "air",
    drop = "farming:mortar_pestle",
  }, "take_hand")

-- skillet

hardcook.add_punch_recipe("hardcook:skillet", "farming:hemp_oil", {
    new_name = "hardcook:skillet_greased",
    drop = "vessels:glass_bottle",
  }, "take_hand")

hardcook.add_punch_recipe("hardcook:skillet", "mobs:butter", {
    new_name = "hardcook:skillet_greased",
  }, "take_hand")

-- hardcook pot

hardcook.help_register_potlib_dirty_recipes("cooking_pot_burnt_salt_water", "hardcook_pouring_cooking_pot")

local cook_def = {
    uncooked_name = "hardcook:cooking_pot_burnt_salt_water",
    cooked_name = "hardcook:cooking_pot_boil_away_burnt",
    burnt_name = "hardcook:cooking_pot_burnt",
    
    to_air_open = 60,
    to_air_potlid = 40,
    
    have_potlid = true,
  }

hardcook.help_register_hardcook(cook_def, {
    callback = hardcook.callback_hardcook_boiling_default,
    cb_config = {
      cook_temp = 100,
      cooked_energy = math.ceil(360000/hardcook.time_divider),
      degree_energy = math.ceil(55000/hardcook.time_divider),
      burnt_energy = math.ceil(720000/hardcook.time_divider),
      coef = 1.1161,
      proportion = 197, -- step 100 on 100 degree
      conductivity = {
        from_cooker = 50,
      },
    },
  })

hardcook.add_punch_recipe("hardcook:cooking_pot_boil_away_burnt_potlid", "", {
    new_name = "hardcook:cooking_pot_boil_away_burnt",
    use_swap = true,
    drop = "hardcook:potlid_dirty",
  }, "take_hand")

