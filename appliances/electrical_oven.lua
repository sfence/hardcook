-- oven

cooking.electrical_oven = appliances.appliance:new(
    {
      node_name_inactive = "cooking:electrical_oven",
      node_name_active = "cooking:electrical_oven_active",
      
      node_description = "Electrical oven",
      
      input_stack_size = 0,
      usa_stack_size = 0,
      output_stack_size = 2,
      
      need_water = false,
      pipe_side = "top",
      power_data = {
        ["LV"] = {
            demand = 600,
            run_speed = 1,
          },
      },
    }
  );

local electrical_oven = cooking.electrical_oven;

local temp_burner_min = 25;
local temp_burner_max = 240;
local temp_oven_min = 25
local temp_oven_max = 250

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

--------------
-- Formspec --
--------------

function electrical_oven:get_formspec(meta, production_percent, consumption_percent)
  local powers;
  
  local power_level_1 = meta:get_int("power_level_1") or 1;
  local power_level_2 = meta:get_int("power_level_2") or 1;
  local oven_temp_set = meta:get_int("oven_temp_set") or 1;
  local oven_temp = oven_temps[oven_temp_set];
  if cooking.easy_mode then
    local percent_1 = math.floor(((power_level_1-1)/10)*100)
    local percent_2 = math.floor(((power_level_2-1)/10)*100)
    local percent_3 = math.floor(((oven_temp-temp_oven_min)/(temp_oven_max-temp_oven_min))*100)
    powers =  "image[3,0.25;0.8,2.25;cooking_power_bar.png^[lowpart:" ..
              (percent_1) ..
              ":cooking_power_bar_max.png]]"..
              "image[4,0.25;0.8,2.25;cooking_power_bar.png^[lowpart:" ..
              (percent_2) ..
              ":cooking_power_bar_max.png]]"..
              "image[6.2,0.25;1,2.25;cooking_power_bar.png^[lowpart:" ..
              (percent_3) ..
              ":cooking_power_bar_max.png]]";
  else
    local burner_temp_1 = meta:get_int("burner_temp_1") or temp_burner_min;
    local burner_temp_2 = meta:get_int("burner_temp_2") or temp_burner_min;
    local percent_1 = math.floor(((burner_temp_1-temp_burner_min)/(temp_burner_max-temp_burner_min))*100)
    local percent_2 = math.floor(((burner_temp_2-temp_burner_min)/(temp_burner_max-temp_burner_min))*100)
    powers =  "image[3,0.25;0.8,2.25;cooking_power_bar.png^[lowpart:" ..
              (percent_1) ..
              ":cooking_power_bar_max.png]]"..
              "image[4,0.25;0.8,2.25;cooking_power_bar.png^[lowpart:" ..
              (percent_2) ..
              ":cooking_power_bar_max.png]]";
  end
  local formspec =  "formspec_version[3]" .. "size[12.75,8.5]" ..
                    "background[-1.25,-1.25;15,10;appliances_appliance_formspec.png]" ..
                    powers..
                    "list[current_player;main;1.5,3;8,4;]" ..
                    "list[context;output;9.0,0.25;1,2;]" ..
                    "textlist[1.5,0.25;1,1;power_level_1;0,1,2,3,4,5,6,7,8,9,10;"..tostring(power_level_1)..";false]" ..
                    "textlist[1.5,1.5;1,1;power_level_2;0,1,2,3,4,5,6,7,8,9,10;"..tostring(power_level_2)..";false]" ..
                    "textlist[5,0.25;1,2.25;oven_temp_set;0,50,60,70,80,90,100,110,120,130,140,150,160,170,180,190,200,210,220,230,240,250;"..tostring(oven_temp_set)..";false]" ..
                    "listring[current_player;main]" ..
                    "listring[context;output]" ..
                    "listring[current_player;main]"
  return formspec;
end

local fields_keys = {
  power_level_1 = true,
  power_level_2 = true,
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
    self:deactivate(pos, meta);
  else
    self:activate(pos, meta)
  end
  self:update_formspec(meta, 0, 1, 0, 1)
end

function electrical_oven:power_need(meta)
  local demand = 0;
  
  local power_level_1 = meta:get_int("power_level_1") or 1;
  local power_level_2 = meta:get_int("power_level_2") or 1;
  local oven_temp_set = meta:get_int("oven_temp_set") or 1;
  
  demand = demand + power_levels[power_level_1]*600;
  demand = demand + power_levels[power_level_2]*600;
  
  if cooking.easy_mode then
    local oven_temp = oven_temps[oven_temp_set];
    local percents = math.floor(((oven_temp-temp_oven_min)/(temp_oven_max-temp_oven_min))*100)
    demand = demand + percents*500;
  else
    minetest.log("warning", "TODO")
  end
  
  meta:set_int("LV_EU_demand", eu_data.demand)
end

function electrical_oven:cb_on_timer(pos, elapsed)
  
end

----------
-- Node --
----------
local node_def = {
    _tt_help = "Connect to power (LV)".."\n".."Use it for cooking.".."\n",
    paramtype2 = "facedir",
    groups = {cracky = 2,},
    legacy_facedir_simple = true,
    is_ground_content = false,
    sounds = default.node_sound_stone_defaults(),
    drawtype = "node",
    
    on_receive_fields = function(pos, formname, fields, sender)
        electrical_oven:cb_on_receive_fields(pos, formname, fields, sender);
      end,
  }
local inactive_def = {
    tiles = {
      "cooking_electrical_oven_top.png",
      "cooking_electrical_oven_bottom.png",
      "cooking_electrical_oven_side.png",
      "cooking_electrical_oven_side.png",
      "cooking_electrical_oven_side.png",
      "cooking_electrical_oven_front.png",
    },
  }
local active_def = {
    tiles = {
      "cooking_electrical_oven_top.png",
      "cooking_electrical_oven_bottom.png",
      "cooking_electrical_oven_side.png",
      "cooking_electrical_oven_side.png",
      "cooking_electrical_oven_side.png",
      "cooking_electrical_oven_front_active.png",
    },
  }

electrical_oven:register_nodes(node_def, inactive_def, active_def)

-------------------------
-- Recipe Registration --
-------------------------
  
electrical_oven:recipe_register_usage(
  "hades_laboratory:steel_bottle_of_distilled_water",
  {
    outputs = {"vessels:steel_bottle"},
    consumption_time = 3300,
    production_step_size = 1,
  });

electrical_oven:recipe_register_input(
  "hades_laboratory:gas_cylinder",
  {
    inputs = 2,
    outputs = {{"hades_laboratory:gas_cylinder_oxygen", "hades_laboratory:gas_cylinder_hydrogen"}},
    production_time = 3300,
    consumption_step_size = 1,
  });

--minetest.log("warning", dump(electrical_oven))
minetest.log("warning", "Electrical oven")


