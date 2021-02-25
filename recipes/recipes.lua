
local modpath = minetest.get_modpath(minetest.get_current_modname())

--
-- use _cooking[item] = {}
--
-- punch_recipe:
--   new_name    -> new name of punched node,
--   use_swap    -> swap node without reseting meta data
--   use_meta    -> name of meta or nil,
--   target_meta -> target meta value to process,
--   no_take     -> prevent take on finish
--   take_value  -> used for taking items
--   drop        -> drop item back to stack
--
-- timer_recipe:
--   new_name    -> new name after time,
--   use_meta    -> name of meta,
--   target_meta -> target meta value in seconds,
--
-- cooking_recipe:
--   new_name       -> new name after cooked,
--   cook_temp      -> cooking temperature
--   degree_energy  -> energy to cook,
--   cooked_energy  -> optimal cooking time,
--   conductivity   -> thermal conductivity (include contact surface)
--     from_cooker  -> from cooker to pot, etc.
--     to_air       -> from pot, etc. to air
--
-- baking_recipe:
--   new_name    -> new name after baked,
--   temp        -> optimal baking temp,
--   time        -> optimal baking time,
--   energy      -> energu per degree of celsius (non-easy mode)
--   conditions  -> table
--     meta_name -> condition meta name
--     meta_min  -> condition meta value, Can be nil.
--     meta_max  -> condition meta value, Can be nil.
--   effects     -> tale
--     meta_name -> effects meta name
--

local S = cooking.translator;

if (cooking.have_unified) then
  cooking.inventory_dynamic_display_size = function (craft)
    local width = 1;
    if (craft.items[2]) then
      width = 2;
    end
    return {width = width, height = 1};
  end
  
  unified_inventory.register_craft_type("take_hand", {
      description = S("take");
      icon = "wieldhand.png";
      width = 2,
      height = 1,
      dynamic_display_size = cooking.inventory_dynamic_display_size,
    })
  unified_inventory.register_craft_type("place_hand", {
      description = S("place");
      icon = "wieldhand.png";
      width = 2,
      height = 1,
      dynamic_display_size = cooking.inventory_dynamic_display_size,
    })
  unified_inventory.register_craft_type("waiting", {
      description = S("in some time");
      icon = "cooking_clock.png",
      width = 1,
      height = 1,
    })
  unified_inventory.register_craft_type("cooking_cooker", {
      description = S("cooking on cooker");
      width = 1,
      height = 1,
    })
  unified_inventory.register_craft_type("baking", {
      description = S("baking");
      width = 1,
      height = 1,
    })
end

cooking.recipes_on_punch = function(pos, node, puncher, pointed_thing)
  local node_def = minetest.registered_nodes[node.name];
  if node_def and puncher then
    local _cooking = node_def._cooking;
    if _cooking then
      local wielded_item = puncher:get_wielded_item();
      local wielded_name = wielded_item:get_name();
      local punch_recipe = cooking.check_item(wielded_name, _cooking.punch_recipes);
      if punch_recipe then
        local swap_it = true;
        local take_it = true;
        local drop_it = true;
        
        if punch_recipe.no_take then
          take_it = false;
        end
        
        if punch_recipe.use_meta then
          local meta = minetest.get_meta(pos);
          local value = meta:get_int(punch_recipe.use_meta) or 0;
          value = value + 1;
          if (value<punch_recipe.target_meta) then
            swap_it = false;
            drop_it = false;
            take_it = false;
            if punch_recipe.take_value then
              if ((value%punch_recipe.take_value)==0) then
                take_it = true;
                drop_it = true;
              end
            end
            meta:set_int(punch_recipe.use_meta, value);
          else
            meta:set_int(punch_recipe.use_meta, 0);
          end
        end
        
        if swap_it then
          node.name = punch_recipe.new_name;
          if (punch_recipe.use_swap) then
            minetest.swap_node(pos, node);
          else
            minetest.set_node(pos, node);
          end
          local meta = minetest.get_meta(pos);
          meta:set_string("infotext", minetest.registered_nodes[node.name].description)
        end
        
        if take_it then
          wielded_item:take_item(1);
          puncher:set_wielded_item(wielded_item);
        end
        if drop_it then
          if (punch_recipe.drop) then
            local drop = ItemStack(punch_recipe.drop);
            local inv = puncher:get_inventory();
            local list = puncher:get_wield_list();
            if (inv:room_for_item(list, drop)) then
              inv:add_item(list, drop);
            else
              minetest.add_item(puncher:get_pos(), drop);
            end
          end
        end
        
        return;
      end
    end
  end
  
  return minetest.node_punch(pos, node, puncher, pointed_thing);
end

cooking.recipes_on_construct = function(pos)
  local node = minetest.get_node(pos);
  local node_def = minetest.registered_nodes[node.name];
  
  if node_def._cooking then
    local meta = minetest.get_meta(pos);
    meta:set_string("infotext", node_def.description);
    if node_def._cooking.timer_recipe then
      local timer = minetest.get_node_timer(pos);
      timer:start(1)
    end
  end
end
cooking.recipes_on_timer = function(pos, elapsed)
  local node = minetest.get_node(pos);
  local node_def = minetest.registered_nodes[node.name];
  if node_def then
    local _cooking = node_def._cooking;
    if _cooking then
      local timer_recipe = _cooking.timer_recipe;
      if timer_recipe then
        local meta = minetest.get_meta(pos);
        local value = meta:get_int(timer_recipe.use_meta) or 0;
        value = value + 1;
        if (value<timer_recipe.target_meta) then
          meta:set_int(timer_recipe.use_meta, value)
          --minetest.log("warning", dump(value));
          return true;
        end
        meta:set_int(timer_recipe.use_meta, 0)
        node.name = timer_recipe.new_name;
        minetest.set_node(pos, node);
        local meta = minetest.get_meta(pos);
        meta:set_string("infotext", minetest.registered_nodes[node.name].description)
      end
    end
  end
  return false;
end
if (cooking.easy_mode) then
  dofile(modpath.."/recipes/easy.lua");
else
  dofile(modpath.."/recipes/hard.lua");
end

dofile(modpath.."/recipes/dishes.lua");
dofile(modpath.."/recipes/cutting.lua");
dofile(modpath.."/recipes/juices.lua");
dofile(modpath.."/recipes/sourdough.lua");
dofile(modpath.."/recipes/bread.lua");
dofile(modpath.."/recipes/soup.lua");

