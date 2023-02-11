
local function max_move_energy(e1, de1, e2, de2, coef)
  t1 = e1/de1;
  t2 = e2/de2;
  move_energy = (t1-t2)*coef;
  t = (e1 + e2)/(de1 + de2);
  move_max = t*de2 - t2*de2;
  if (t1>t2) then
    if (move_energy>move_max) then
      move_energy = move_max;
    end
  else
    if (move_energy<move_max) then
      move_energy = move_max;
    end
  end
end

-- oven_def
--   cooker_degree_energy = ,
--   cooker_energy_lost_coef = ,
--
--   oven_heater_degree_energy = ,
--   oven_heater_energy_lost_coef = ,
--   oven_heater_to_air_coef = ,
--   oven_air_degree_energy = ,
--   oven_air_energy_lost_coef = ,

function hardcook.help_cooker_step(oven_def, oven_data)
  -- deltaT = t_target - t_cooker
  -- tc -> thermal conductivity * contact surface
  -- added_energy = deltaT * tc
  
  local cooker_lost_energy = (oven_data.cooker_temp - 25) * oven_def.cooker_energy_lost_coef;
  local cooker_change_energy = cooker_lost_energy - oven_data.cooker_added_energy + oven_data.cooker_taken_energy;
  local cooker_temp_change = cooker_change_energy/oven_def.cooker_degree_energy;
  oven_data.cooker_temp = oven_data.cooker_temp - cooker_temp_change;
end
  
function hardcook.help_oven_step(oven_def, oven_data)
  -- deltaT = t_target - t_cooker
  -- tc -> thermal conductivity * contact surface
  -- added_energy = deltaT * tc
  
  -- heater lost energy
  local oven_heater_lost_energy = (oven_data.oven_heater_temp - 25) * oven_def.oven_heater_energy_lost_coef;
  
  -- air lost energy
  local oven_air_lost_energy = (oven_data.oven_temp - 25) * oven_def.oven_air_energy_lost_coef;
  local oven_air_add_energy = (oven_data.oven_heater_temp - oven_data.oven_temp) * oven_def.oven_heater_to_air_coef;
  
  -- heater temp change
  local oven_heater_change_energy = oven_heater_lost_energy + oven_air_add_energy- oven_data.oven_heater_added_energy;
  local oven_heater_temp_change = oven_heater_change_energy/oven_def.oven_heater_degree_energy;
  
  -- air temp change
  local oven_air_change_energy = oven_air_lost_energy-oven_air_add_energy+oven_data.oven_taken_energy;
  local oven_air_temp_change = oven_air_change_energy/oven_def.oven_air_degree_energy;
  
  oven_data.oven_heater_temp = oven_data.oven_heater_temp - oven_heater_temp_change;
  oven_data.oven_temp = oven_data.oven_temp - oven_air_temp_change;
end

