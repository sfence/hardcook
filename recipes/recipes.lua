
local modpath = minetest.get_modpath(minetest.get_current_modname())

--
-- use _cooking[item] = {}
--
-- punch_recipe:
--   new_name    -> new name of punched node,
--   use_meta    -> name of meta or nil,
--   target_meta -> target meta value to process,
--   drop        -> drop item back to stack
--
dofile(modpath.."/recipes/juices.lua");

cooking.recipes_on_punch = function(pos, node, puncher, pointed_thing)
  local node_def = minetest.registered_nodes[node.name];
  if node_def and puncher then
    local _cooking = node_def._cooking;
    if _cooking then
      local wielded_item = puncher:get_wielded_item();
      local wielded_name = wielded_item:get_name();
      local punch_recipe = _cooking.punch_recipes[wielded_name];
      if punch_recipe then
        local swap_it = true;
        local take_it = true;
        local drop_it = true;
        
        if punch_recipe.use_meta then
          local meta = minetest.get_meta(pos);
          local value = meta:get_int(punch_recipe.use_meta) or 0;
          value = value + 1;
          if (value<punch_recipe.target_meta) then
            swap_it = false;
            drop_it = false;
            take_it = false;
            if punch_recipe.take_always then
              take_it = true;
            end
            meta:set_int(punch_recipe.use_meta, value);
          else
            meta:set_int(punch_recipe.use_meta, 0);
          end
        end
        
        if swap_it then
          node.name = punch_recipe.new_name;
          minetest.swap_node(pos, node);
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

