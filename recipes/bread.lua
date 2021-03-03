
local grains = {
  wheat = "farming:flour",
  barley = "cooking:flour_barley",
  oat = "cooking:flour_oat",
  rye = "cooking:flour_rye",
  multigrain = "farming:flour_multigrain",
}

for key, value in pairs(grains) do
  -- flour to bowl
  cooking.add_punch_recipe("cooking:mixing_glass_bowl", value, {
      new_name = "cooking:mixing_glass_bowl_with_flour_"..key,
    }, "pouring_mixing_bowl")
end

local grains = {
  wheat = "wheat",
  barley = "barley",
  oat = "oat",
  rye = "rye",
  multigrain = "multigrain",
}

for key, value in pairs(grains) do
  -- bread base
  cooking.add_punch_recipe("cooking:mixing_glass_bowl_with_flour_"..key, "farming:salt", {
      new_name = "cooking:mixing_glass_bowl_with_flour_"..key.."_salt",
    }, "pouring_mixing_bowl")
  cooking.add_punch_recipe("cooking:mixing_glass_bowl_with_flour_"..key.."_salt", "cooking:glass_bottle_with_water", {
      new_name = "cooking:mixing_glass_bowl_with_flour_"..key.."_salt_water",
      drop = "cooking:glass_bottle",
    }, "pouring_mixing_bowl")
  cooking.add_punch_recipe("cooking:mixing_glass_bowl_with_flour_"..key.."_salt_water", "cooking:mixing_glass_bowl_with_sourdough", {
      new_name = "cooking:mixing_glass_bowl_with_flour_"..key.."_salt_water_sourdough",
      drop = "cooking:mixing_glass_bowl_with_sourdough_half",
    }, "pouring_mixing_bowl")
  cooking.add_punch_recipe("cooking:mixing_glass_bowl_with_flour_"..key.."_water", "farming:salt", {
      new_name = "cooking:mixing_glass_bowl_with_flour_"..key.."_salt_water",
    }, "pouring_mixing_bowl")
end

local grains = {
  wheat = "wheat",
  barley = "barley",
  oat = "oat",
  rye = "rye",
}

for key, value in pairs(grains) do
  -- normal bread pancake
  cooking.add_punch_recipe("cooking:mixing_glass_bowl_with_flour_"..key.."_salt_water", "cooking:stirring_spoon", {
      new_name = "cooking:mixing_glass_bowl_with_bread_pancake_dough",
      use_meta = "mixing",
      target_meta = 3,
      no_take = true,
    }, "pouring_mixing_bowl")
end

for key, value in pairs(grains) do
  -- normal bread
  cooking.add_punch_recipe("cooking:mixing_glass_bowl_with_flour_"..key.."_salt_water", "cooking:mixing_glass_bowl_with_sourdough_half", {
      new_name = "cooking:mixing_glass_bowl_with_flour_"..key.."_salt_water_sourdough",
      drop = "cooking:mixing_glass_bowl_dirty",
    }, "pouring_mixing_bowl")
  cooking.add_punch_recipe("cooking:mixing_glass_bowl_with_flour_"..key.."_salt_water_sourdough", "cooking:stirring_spoon", {
      new_name = "cooking:mixing_glass_bowl_with_bread_dough",
      use_meta = "mixing",
      target_meta = 3,
      no_take = true,
    }, "mixing_stirring_spoon")
end
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
cooking.add_punch_recipe("cooking:mixing_glass_bowl_with_bread_dough_leavened", "", {
    new_name = "cooking:mixing_glass_bowl_dirty_node",
    drop = "cooking:unbaked_bread",
  }, "take_hand")
cooking.add_punch_recipe("cooking:cake_pan", "cooking:unbaked_bread", {
    new_name = "cooking:cake_pan_with_unbaked_bread",
  }, "take_hand")
cooking.add_baking_recipe("cooking:cake_pan_with_unbaked_bread", {
    new_name = "cooking:cake_pan_with_baked_bread",
    min_temp = 220,
    bake_temp = 250,
    step_energy = 100,
    baked_energy = math.ceil(180000/cooking.time_divider),
    degree_energy = math.ceil(50000/cooking.time_divider),
    conductivity = {
      from_air = 50,
      to_air = 60,
    },
  }, "baking")
cooking.add_punch_recipe("cooking:cake_pan_with_baked_bread", "", {
    new_name = "cooking:cake_pan_dirty_node",
    drop = "farming:bread",
  }, "take_hand")
minetest.clear_craft({
    output = "farming:bread"
  })

-- multigrain bread
cooking.add_punch_recipe("cooking:mixing_glass_bowl_with_flour_multigrain", "farming:salt", {
    new_name = "cooking:mixing_glass_bowl_with_flour_multigrain_salt",
  }, "pouring_mixing_bowl")
cooking.add_punch_recipe("cooking:mixing_glass_bowl_with_flour_multigrain_salt", "cooking:glass_bottle_with_water", {
    new_name = "cooking:mixing_glass_bowl_with_flour_multigrain_salt_water",
    drop = "cooking:glass_bottle",
  }, "pouring_mixing_bowl")
cooking.add_punch_recipe("cooking:mixing_glass_bowl_with_flour_multigrain_salt_water", "cooking:mixing_glass_bowl_with_sourdough", {
    new_name = "cooking:mixing_glass_bowl_with_flour_multigrain_salt_water_sourdough",
    drop = "cooking:mixing_glass_bowl_with_sourdough_half",
  }, "pouring_mixing_bowl")
cooking.add_punch_recipe("cooking:mixing_glass_bowl_with_flour_multigrain_salt_water_sourdough", "cooking:stirring_spoon", {
    new_name = "cooking:mixing_glass_bowl_with_multigrain_bread_dough",
    use_meta = "mixing",
    target_meta = 3,
    no_take = true,
  }, "mixing_stirring_spoon")
cooking.add_punch_recipe("cooking:mixing_glass_bowl_with_multigrain_bread_dough", "", {
    new_name = "cooking:mixing_glass_bowl_with_multigrain_bread_dough_kneaded",
    use_meta = "kneading",
    target_meta = 3,
    no_take = true,
  }, "kneading_mixing_bowl")
cooking.add_timer_recipe("cooking:mixing_glass_bowl_with_multigrain_bread_dough_kneaded", {
    new_name = "cooking:mixing_glass_bowl_with_multigrain_bread_dough_leavened",
    use_meta = "waiting",
    target_meta = math.ceil((90*60)/cooking.time_divider),
  }, "waiting")
cooking.add_punch_recipe("cooking:mixing_glass_bowl_with_multigrain_bread_dough_leavened", "", {
    new_name = "cooking:mixing_glass_bowl_dirty_node",
    drop = "cooking:unbaked_multigrain_bread",
  }, "take_hand")
cooking.add_punch_recipe("cooking:cake_pan", "cooking:unbaked_multigrain_bread", {
    new_name = "cooking:cake_pan_with_unbaked_multigrain_bread",
  }, "take_hand")
cooking.add_baking_recipe("cooking:cake_pan_with_unbaked_multigrain_bread", {
    new_name = "cooking:cake_pan_with_baked_multigrain_bread",
    min_temp = 220,
    bake_temp = 250,
    step_energy = 100,
    baked_energy = math.ceil(180000/cooking.time_divider),
    degree_energy = math.ceil(50000/cooking.time_divider),
    conductivity = {
      from_air = 50,
      to_air = 60,
    },
  }, "baking")
cooking.add_punch_recipe("cooking:cake_pan_with_baked_multigrain_bread", "", {
    new_name = "cooking:cake_pan_dirty_node",
    drop = "farming:bread_multigrain",
  }, "take_hand")
minetest.clear_craft({
    output = "farming:bread_multigrain"
  })
