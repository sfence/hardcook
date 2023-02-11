
-- pie base
local grains = {
  wheat = "wheat",
  barley = "barley",
  oat = "oat",
  rye = "rye",
}

for key, value in pairs(grains) do
  hardcook.add_punch_recipe("hardcook:mixing_glass_bowl_with_flour_"..key, "group:sugar", {
      new_name = "hardcook:mixing_glass_bowl_with_flour_"..key.."_sugar",
    }, "pouring_mixing_bowl")
  hardcook.add_punch_recipe("hardcook:mixing_glass_bowl_with_flour_"..key.."_sugar", "hardcook:glass_bottle_with_water", {
      new_name = "hardcook:mixing_glass_bowl_with_flour_"..key.."_sugar_water",
      drop = "hardcook:glass_bottle",
    }, "pouring_mixing_bowl")
  hardcook.add_punch_recipe("hardcook:mixing_glass_bowl_with_flour_"..key.."_sugar_water", "hardcook:stirring_spoon", {
      new_name = "hardcook:mixing_glass_bowl_with_pie_dough",
      use_meta = "mixing",
      target_meta = 3,
      no_take = true,
    }, "mixing_stirring_spoon")
end

hardcook.add_punch_recipe("hardcook:mixing_glass_bowl_with_pie_dough", "", {
    new_name = "hardcook:mixing_glass_bowl_dirty_node",
    drop = "hardcook:unbaked_pie",
  }, "take_hand")
hardcook.add_punch_recipe("hardcook:cake_pan", "hardcook:unbaked_pie", {
    new_name = "hardcook:cake_pan_with_unbaked_pie",
  }, "take_hand")

--- apple pie
hardcook.add_punch_recipe("hardcook:cake_pan_with_unbaked_pie", "group:food_apple", {
    new_name = "hardcook:cake_pan_with_unbaked_apple_pie",
  }, "take_hand")
hardcook.add_baking_recipe("hardcook:cake_pan_with_unbaked_apple_pie", {
    new_name = "hardcook:cake_pan_with_baked_apple_pie",
    min_temp = 220,
    bake_temp = 250,
    step_energy = 100,
    baked_energy = math.ceil(180000/hardcook.time_divider),
    degree_energy = math.ceil(50000/hardcook.time_divider),
    conductivity = {
      from_air = 50,
      to_air = 60,
    },
  }, "baking")

--- blueberry pie
hardcook.add_punch_recipe("hardcook:cake_pan_with_unbaked_pie", "group:food_blueberries", {
    new_name = "hardcook:cake_pan_with_unbaked_blueberry_pie",
  }, "take_hand")
hardcook.add_baking_recipe("hardcook:cake_pan_with_unbaked_blueberry_pie", {
    new_name = "hardcook:cake_pan_with_baked_blueberry_pie",
    min_temp = 220,
    bake_temp = 250,
    step_energy = 100,
    baked_energy = math.ceil(180000/hardcook.time_divider),
    degree_energy = math.ceil(50000/hardcook.time_divider),
    conductivity = {
      from_air = 50,
      to_air = 60,
    },
  }, "baking")

--- rhubarb pie
hardcook.add_punch_recipe("hardcook:cake_pan_with_unbaked_pie", "hardcook:cake_pan_with_unbaked_pie", {
    new_name = "hardcook:cake_pan_with_unbaked_triple_pie",
    use_meta = "pie",
    target_meta = 2,
  }, "take_hand")
hardcook.add_punch_recipe("hardcook:cake_pan_with_unbaked_triple_pie", "group:food_rhubarb", {
    new_name = "hardcook:cake_pan_with_unbaked_rhubarb_pie",
    use_meta = "thubarb",
    target_meta = 3,
  }, "take_hand")
hardcook.add_baking_recipe("hardcook:cake_pan_with_unbaked_rhubarb_pie", {
    new_name = "hardcook:cake_pan_with_baked_rhubarb_pie",
    min_temp = 220,
    bake_temp = 250,
    step_energy = 100,
    baked_energy = math.ceil(180000/hardcook.time_divider),
    degree_energy = math.ceil(50000/hardcook.time_divider),
    conductivity = {
      from_air = 50,
      to_air = 60,
    },
  }, "baking")
