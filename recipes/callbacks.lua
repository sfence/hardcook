-- default hardcook callback for boiling
--
-- cb_config = {
--   meta_prefix    -> prefix for meta
--   cook_temp      -> hardcook temperature
--   degree_energy  -> energy to rise temperature,
--   cooked_energy  -> energy to cook,
--   burnt_energy   -> energy to burned
--   -- (coef^temp)/proportion
--   coef           -> coeficient for calculate step use value from (1.07 -> 1.15), use proportion to set optimal hardcook time on cook_temp.
--   proportion     -> coeficient for calculate step
--   conductivity   -> thermal conductivity (include contact surface)
--     from_cooker  -> from cooker to pot, etc.
--     to_air       -> from pot, etc. to air
--   }
-- 
-- by google:
--   hardcook speed depend on temp, change of temp +10 degree, cause hardcook speed to rise 2x -4x.
--   a^x/a^(x+10) = 1/2 -> a = 2^(1/10) = 1.0717734625362931642130063
--   a^x/a^(x+10) = 1/4 -> a = 4^(1/10) = 1.1486983549970350067986269

function hardcook.callback_hardcook_boiling_default(meta, cb_config, hardcook_data)
  local prefix = hardcook_data.meta_prefix or "";
  local temp = hardcook.get_meta_float(meta, prefix.."temp", 25);
  local energy = hardcook.get_meta_int(meta, prefix.."energy", 0);
  local burnt_energy = hardcook.get_meta_int(meta, prefix.."burnt_energy", 0);
  
  -- deltaT = t_target - t_cooker
  -- tc -> thermal conductivity * contact surface
  -- added_energy = deltaT * tc
  
  local deltaT = hardcook_data.cooker_temp - temp;
  local added_energy = deltaT * cb_config.conductivity.from_cooker;
  local lost_energy = (temp - 25) * cb_config.conductivity.to_air;
  -- modify added_energy and lost_energy
  local limit_energy = hardcook_data.cooker_degree_energy*deltaT;
  if (limit_energy<added_energy) then
    added_energy = limit_energy;
  end
  hardcook_data.cooker_taken_energy = added_energy;
  
  minetest.log("warning", "temp: "..temp.." cooker_temp: "..hardcook_data.cooker_temp)
  minetest.log("warning", "added: "..added_energy.." lost: "..lost_energy)
  
  -- (coef^temp)/proportion
  local step_energy = math.pow(cb_config.coef, temp)/cb_config.proportion;
  step_energy = math.floor(step_energy+0.5);
  
  local add_energy = added_energy - lost_energy - step_energy;
  
  local temp_energy = 0;
  
  if (add_energy>0) then
    if (temp<cb_config.cook_temp) then
      temp_energy = (cb_config.cook_temp-temp)*cb_config.degree_energy;
    end
    if (add_energy<temp_energy) then
      temp_energy = add_energy;
    end
  else
    temp_energy = add_energy;
  end
  
  local temp_change = (temp_energy)/cb_config.degree_energy;
  
  local burning_energy = add_energy - temp_energy;
  if (burning_energy<0) then
    burning_energy = 0;
  end
  
  temp = temp + temp_change;
  energy = energy + step_energy;
  burnt_energy = burnt_energy + burning_energy;
  
  if (temp<25) then
    temp = 25;
  end
  
  meta:set_float(prefix.."temp", temp);
  meta:set_int(prefix.."energy", energy);
  if (hardcook.easy_mode==false) then
    meta:set_int(prefix.."burnt_energy", burnt_energy);
  end
  
  minetest.log("warning", "temp: "..temp.." energy: "..energy.." burnt: "..burnt_energy);
  
  local hardcook_done = (energy>cb_config.cooked_energy);
  local burnt_done = (burnt_energy>cb_config.burnt_energy) and (hardcook.easy_mode==false);
  
  return hardcook_done, burnt_done;
end

