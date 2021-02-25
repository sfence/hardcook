
local S = cooking.translator;

cooking.recipes_on_cooking = function(pos, cooking_data)
  local node = minetest.get_node(pos);
  local node_def = minetest.registered_nodes[node.name];
  if (node_def._cooking) then
    local cooking_recipe = node_def._cooking.cooking_recipe;
    if cooking_recipe then
      local meta = minetest.get_meta(pos);
      local temp = cooking.get_meta_float(meta, "temp", 25);
      local energy = cooking.get_meta_int(meta, "energy", 0);
      
      --minetest.log("warning", dump(node_def._cooking))
      --minetest.log("warning", dump(cooking_recipe))
    
      -- deltaT = t_target - t_cooker
      -- tc -> thermal conductivity * contact surface
      -- added_energy = deltaT * tc
      
      local deltaT = cooking_data.cooker_temp - temp;
      local added_energy = deltaT * cooking_recipe.conductivity.from_cooker;
      local lost_energy = (temp - 25) * cooking_recipe.conductivity.to_air;
      local add_energy = added_energy - lost_energy;
      
      minetest.log("warning", "temp: "..temp.." cooker_temp: "..cooking_data.cooker_temp)
      minetest.log("warning", "added: "..added_energy.." lost: "..lost_energy)
      
      local step_energy = 0;
      if (temp>cooking_recipe.min_temp) then
        local help = (temp-cooking_recipe.min_temp)/(cooking_recipe.cook_temp-cooking_recipe.min_temp)*2-1;
        local step_part = (math.pow(2, help)-0.5)/1.5;
        step_energy = cooking_recipe.step_energy*step_part;
      end
      
      local temp_energy = 0;
      
      if (add_energy>0) then
        if (temp<cooking_recipe.cook_temp) then
          temp_energy = (cooking_recipe.cook_temp-temp)*cooking_recipe.degree_energy;
        end
        if (add_energy<temp_energy) then
          temp_energy = add_energy;
        end
      else
        temp_energy = add_energy;
      end
      
      local temp_change = (temp_energy)/cooking_recipe.degree_energy;
      
      temp = temp + temp_change;
      energy = energy + step_energy;
      
      if (temp<25) then
        temp = 25;
      end
      
      meta:set_float("temp", temp);
      meta:set_int("energy", energy);
      
      minetest.log("warning", "temp: "..temp.." energy: "..energy);
      
      if (energy>=cooking_recipe.cooked_energy) then
        node.name = cooking_recipe.new_name;
        minetest.set_node(pos, node);
        meta:set_string("infotext", minetest.registered_nodes[node.name].description)
      end
    end
  end
end
cooking.recipes_on_baking = function(itemstack, meta, baking_data)
end
