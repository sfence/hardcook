-- oven

hardcook.electrical_oven = appliances.appliance:new(
    {
      node_name_inactive = "hardcook:electrical_oven",
      node_name_active = "hardcook:electrical_oven_active",
      
      node_description = "Electrical oven",
      node_help = "Connect to power (LV)".."\n".."Use it for hardcook.".."\n",
      
      input_stack_size = 0,
      usa_stack_size = 0,
      output_stack_size = 2,
      have_usage = false,
      
      need_water = false,
      power_data = {
        ["LV"] = {
            demand = 600,
            run_speed = 1,
          },
      },
    }
  );

local electrical_oven = hardcook.electrical_oven;

local temp_cooker_min = 25;
local temp_cooker_max = 240;
local temp_oven_min = 25;
local temp_oven_max = 250;

local power_levels = {
  0.0, 0.1, 0.2, 0.3,
  0.4, 0.5, 0.6, 0.7,
  0.8, 0.9, 1.0
}
local oven_temps = {
    0, 50, 60, 70,
   80, 90,100,110,
  120,130,140,150,
  160,170,180,190,
  200,210,220,230,
  240,250
}
local oven_levels = {
     0, 0.11, 0.16, 0.20,
	0.24, 0.29, 0.33, 0.38,
	0.42, 0.47, 0.51, 0.55,
	0.60, 0.64, 0.69, 0.73,
	0.78, 0.82, 0.87, 0.91,
	0.95, 1.00
}

--------------
-- Formspec --
--------------

function electrical_oven:get_formspec(meta, production_percent, consumption_percent)
  local power_level = hardcook.get_meta_int(meta, "power_level", 1);
  local cooker_temp = hardcook.get_meta_int(meta, "cooker_temp", temp_cooker_min);
  local oven_temp_set = hardcook.get_meta_int(meta, "oven_temp_set", 1);
  local oven_temp = hardcook.get_meta_int(meta, "oven_temp", temp_oven_min);
  local percent_cooker = math.floor(((cooker_temp-temp_cooker_min)/(temp_cooker_max-temp_cooker_min))*100)
  local percent_oven = math.floor(((oven_temp-temp_oven_min)/(temp_oven_max-temp_oven_min))*100)
  local powers ="image[3,0.25;0.8,2.25;hardcook_power_bar.png^[lowpart:" ..
                (percent_cooker) ..
                ":hardcook_power_bar_max.png]]"..
                "image[6.2,0.25;1,2.25;hardcook_power_bar.png^[lowpart:" ..
                (percent_oven) ..
                ":hardcook_power_bar_max.png]]";
  local formspec =  "formspec_version[3]" .. "size[12.75,8.5]" ..
                    "background[-1.25,-1.25;15,10;appliances_appliance_formspec.png]" ..
                    powers..
                    "list[current_player;main;1.5,3;8,4;]" ..
                    "list[context;output;9.0,0.25;1,2;]" ..
                    "textlist[1.5,0.25;1,2.25;power_level;0,1,2,3,4,5,6,7,8,9,10;"..tostring(power_level)..";false]" ..
                    "textlist[5,0.25;1,2.25;oven_temp_set;0,50,60,70,80,90,100,110,120,130,140,150,160,170,180,190,200,210,220,230,240,250;"..tostring(oven_temp_set)..";false]" ..
                    "listring[current_player;main]" ..
                    "listring[context;output]" ..
                    "listring[current_player;main]"
  return formspec;
end

local fields_keys = {
  power_level = true,
  oven_temp_set = true,
}

function electrical_oven:cb_on_receive_fields(pos, formname, fields, sender)
  minetest.log("warning", dump(fields));
  local meta = minetest.get_meta(pos);
  for key, value in pairs(fields) do
    if fields_keys[key] then
      local data = value:split(":");
      meta:set_int(key, tonumber(data[2]))
    end
  end
  -- check valid keys
  local power_off = true;
  for key, value in pairs(fields_keys) do
    local data = meta:get_int(key) or 1;
    if (data>1) then
      power_off = false;
    end
  end
  if power_off then
    local cooker_temp = hardcook.get_meta_int(meta, "cooker_temp", temp_cooker_min);
    local oven_temp = hardcook.get_meta_int(meta, "oven_temp", temp_oven_min);
    if (cooker_temp > (temp_cooker_min+1)) then
      power_off = false;
    end
    if (oven_temp > (temp_oven_min+1)) then
      power_off = false;
    end
  end
  if power_off then
    self:deactivate(pos, meta);
  else
    self:power_need(meta);
    self:activate(pos, meta);
  end
  self:update_formspec(meta, 0, 1, 0, 1)
end

function electrical_oven:is_powered(meta)
  -- check if node is powered LV
  local eu_data = self.power_data["LV"];
  if (eu_data~=nil) then
    local eu_demand = meta:get_int("LV_EU_demand");
    local eu_input = meta:get_int("LV_EU_input");
    if ((eu_demand~=0) and (eu_input>=eu_demand)) then
      return eu_data.run_speed;
    end
  end
  return 0;
end

function electrical_oven:power_need(meta)
  local demand = 0;
  
  local power_level = hardcook.get_meta_int(meta, "power_level", 1);
  local oven_temp_set = hardcook.get_meta_int(meta, "oven_temp_set", 1);
  
  demand = demand + power_levels[power_level]*120;
  
  local oven_level = oven_levels[oven_temp_set];
  demand = demand + oven_level*200;
  
  meta:set_int("LV_EU_demand", demand)
end

-- (temp_from-temp_to)*temp_coef = move_energy
-- max_temp = add_energy/temp_coef+temp_to
--
-- lost_heater = (temp_heater-25)*coef_heater_lost
-- move_air = (temp_heater-temp_air)*coef_heater_air
-- lost_air = (temp_air-25)*coef_air_lost
--
-- temp_heater = (move_air/coef_heater_air)+temp_air
--
--[[
coef_heater_lost = 31;
coef_heater_air = 11;
coef_air_lost = 50;
max_add_energy = 50000;
for temp_air = [50,60,70,80,90,100,110,120,130,140,150,160,170,180,190,200,210,220,230,240,250]
  lost_air = (temp_air-25)*coef_air_lost;
  temp_heater = (lost_air/coef_heater_air)+temp_air;
  lost_heater = (temp_heater-25)*coef_heater_lost;
  (lost_heater+lost_air)/max_add_energy
end
--]]
local oven_def = {
  cooker_max_add_energy = 30000,
  cooker_degree_energy = 30000/hardcook.time_divider,
  cooker_energy_lost_coef = 140, -- 239.29 for 30k input
  
  oven_max_add_energy = 50000,
  oven_heater_degree_energy = 50000/hardcook.time_divider, --  
  oven_heater_energy_lost_coef = 31, -- 1274 for 50k input -> include max transfer to oven air
  oven_heater_to_air_coef = 11, -- max transfer 11.275k
  oven_air_degree_energy = 10000/hardcook.time_divider, -- 1k per kg
  oven_air_energy_lost_coef = 50, -- 250 for 11.25k input
}

function electrical_oven:cb_on_timer(pos, elapsed)
  local meta = minetest.get_meta(pos);
  local inv = meta:get_inventory();
  
  local power_level = hardcook.get_meta_int(meta, "power_level", temp_cooker_min);
  local cooker_temp = hardcook.get_meta_float(meta, "cooker_temp", temp_cooker_min);
  local oven_temp_set = hardcook.get_meta_int(meta, "oven_temp_set", 1);
  local oven_heater_temp = hardcook.get_meta_float(meta, "oven_heater_temp", temp_oven_min);
  local oven_temp = hardcook.get_meta_float(meta, "oven_temp", temp_oven_min);
  
  --minetest.log("warning", "on_timer")
  
  local oven_data = {
    meta_prefix = "",
    
    cooker_temp = cooker_temp,
    cooker_taken_energy = 0,
    oven_heater_temp = oven_heater_temp,
    oven_temp = oven_temp,
    oven_taken_energy = 0,
    
    -- conf
    cooker_degree_energy = oven_def.cooker_degree_energy,
    oven_degree_energy = oven_def.oven_air_degree_energy,
  };
  
  --minetest.log("warning", "hardcook")
  pos.y = pos.y + 1;
  hardcook.recipes_on_hardcook(pos, oven_data);
  pos.y = pos.y - 1;
  
  --minetest.log("warning", "baking")
  oven_data.meta_prefix = "oven1_";
  local stack = inv:get_stack(self.output_stack, 1);
  hardcook.recipes_on_baking(stack, meta, oven_data);
  inv:set_stack(self.output_stack, 1, stack);
  oven_data.meta_prefix = "oven2_";
  local stack = inv:get_stack(self.output_stack, 2);
  hardcook.recipes_on_baking(stack, meta, oven_data);
  inv:set_stack(self.output_stack, 2, stack);
  
  --
  oven_data.cooker_added_energy = power_levels[power_level]*oven_def.cooker_max_add_energy;
  oven_data.oven_heater_added_energy = oven_levels[oven_temp_set]*oven_def.oven_max_add_energy;
  
  hardcook.help_cooker_step(oven_def, oven_data);
  hardcook.help_oven_step(oven_def, oven_data);
  
  minetest.log("warning", dump(oven_data));
  
  meta:set_float("cooker_temp", oven_data.cooker_temp);
  meta:set_float("oven_heater_temp", oven_data.oven_heater_temp);
  meta:set_float("oven_temp", oven_data.oven_temp);
  -- check if node is powered
  local speed, have_power = self:have_power(pos, meta, inv)
  if (not have_power) then
    local next_timer_step = false;
    if (power_level>1) then
      next_timer_step = true;
    end
    if (oven_temp_set>1) then
      next_timer_step = true;
    end
    if (cooker_temp > (temp_cooker_min+1)) then
      next_timer_step = true;
    end
    if (oven_temp > (temp_oven_min+1)) then
      next_timer_step = true;
    end
    if next_timer_step then
      self:no_power(pos, meta);
    else
      self:deactivate(pos, meta);
    end
    return next_timer_step;
  end
  
  
  return true;
end

function electrical_oven:cb_allow_metadata_inventory_put(pos, listname, index, stack, player)
  local item_def = stack:get_definition();
  if item_def then
    if (item_def._hardcook) and (item_def._hardcook.baking_recipe) then
      local meta = minetest.get_meta(pos);
      local inv = meta:get_inventory();
      local have = inv:get_stack(listname, index);
      if (have:get_name()~=stack:get_name()) then
        return 1;
      end
    end
  end
  return 0;
end

function electrical_oven:cb_allow_metadata_inventory_take(pos, listname, index, stack, player)
  return stack:get_count();
end

----------
-- Node --
----------
local node_def = {
    paramtype2 = "facedir",
    groups = {cracky = 2,},
    legacy_facedir_simple = true,
    is_ground_content = false,
    sounds = default.node_sound_stone_defaults(),
    drawtype = "node",
    
    on_receive_fields = function(pos, formname, fields, sender)
        electrical_oven:cb_on_receive_fields(pos, formname, fields, sender);
      end,
    on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
        if (minetest.get_item_group(itemstack:get_name(), "hardcook_on_stove")~=0) then
          minetest.item_place_node(itemstack, clicker, pointed_thing);
        end
      end,
  }
local inactive_def = {
    tiles = {
      "hardcook_electrical_oven_top.png",
      "hardcook_electrical_oven_bottom.png",
      "hardcook_electrical_oven_side.png",
      "hardcook_electrical_oven_side.png",
      "hardcook_electrical_oven_side.png",
      "hardcook_electrical_oven_front.png",
    },
  }
local active_def = {
    tiles = {
      "hardcook_electrical_oven_top.png",
      "hardcook_electrical_oven_bottom.png",
      "hardcook_electrical_oven_side.png",
      "hardcook_electrical_oven_side.png",
      "hardcook_electrical_oven_side.png",
      "hardcook_electrical_oven_front_active.png",
    },
  }

electrical_oven:register_nodes(node_def, inactive_def, active_def)

-------------------------
-- Recipe Registration --
-------------------------

--minetest.log("warning", dump(electrical_oven))
minetest.log("warning", "Electrical oven")


