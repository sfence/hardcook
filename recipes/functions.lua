
function hardcook.help_register_potlib_recipes(name, pouring_type)
  hardcook.add_punch_recipe("hardcook:"..name, "hardcook:potlid", {
      new_name = "hardcook:cooking_pot_burnt_salt_water_potlid",
      use_swap = true,
    }, pouring_type)

  hardcook.add_punch_recipe("hardcook:"..name.."_potlid", "", {
      new_name = "hardcook:cooking_pot_burnt_salt_water",
      use_swap = true,
      drop = "hardcook:potlid",
    }, "hardcook_take_hand")
end

function hardcook.help_register_potlib_dirty_recipes(name, pouring_type)
  hardcook.add_punch_recipe("hardcook:"..name, "hardcook:potlid", {
      new_name = "hardcook:cooking_pot_burnt_salt_water_potlid",
      use_swap = true,
    }, pouring_type)
  
  hardcook.add_punch_recipe("hardcook:"..name, "hardcook:potlid_dirty", {
      new_name = "hardcook:cooking_pot_burnt_salt_water_potlid",
      use_swap = true,
    }, pouring_type)

  hardcook.add_punch_recipe("hardcook:"..name.."_potlid", "", {
      new_name = "hardcook:cooking_pot_burnt_salt_water",
      use_swap = true,
      drop = "hardcook:potlid_dirty",
    }, "hardcook_take_hand")
end

function hardcook.help_register_hardcook(cook_def, shared_def)
  local hardcook_def = table.copy(shared_def);
  hardcook_def.new_name = cook_def.cooked_name;
  hardcook_def.burnt_name = cook_def.burnt_name;
  hardcook_def.cb_config.conductivity.to_air = cook_def.to_air_open;
  
  hardcook.add_hardcook_recipe(cook_def.uncooked_name, hardcook_def, "hardcook_cooker")
  
  local hardcook_def = table.copy(shared_def);
  hardcook_def.burnt_name = cook_def.burnt_name;
  hardcook_def.cb_config.conductivity.to_air = cook_def.to_air_open;
  
  hardcook.add_hardcook_recipe(cook_def.cooked_name, hardcook_def, nil)
  
  if cook_def.have_potlid then
    local hardcook_def = table.copy(shared_def);
    hardcook_def.new_name = cook_def.cooked_name.."_potlid";
    hardcook_def.burnt_name = cook_def.burnt_name.."_potlid";
    hardcook_def.cb_config.conductivity.to_air = cook_def.to_air_potlid;
    
    hardcook.add_hardcook_recipe(cook_def.uncooked_name.."_potlid", hardcook_def, "hardcook_cooker")
    
    local hardcook_def = table.copy(shared_def);
    hardcook_def.burnt_name = cook_def.burnt_name.."_potlid";
    hardcook_def.cb_config.conductivity.to_air = cook_def.to_air_potlid;
    
    hardcook.add_hardcook_recipe(cook_def.cooked_name.."_potlid", hardcook_def, nil)
  end
end

