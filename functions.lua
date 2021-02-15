
local function fixNode(node_def)
  local on_punch = node_def.on_punch;
  local _cooking = node_def._cooking;
  
  if (_cooking==nil) then
    if on_punch then
      local old_punch = on_punch;
      on_punch = function(pos, node, puncher, pointed_thing)
          cooking.recipes_on_punch(pos, node, puncher, pointed_thing);
          old_punch(pos, node, puncher, pointed_thing);
        end
    else
      on_punch = cooking.recipes_on_punch(pos, node, puncher, pointed_thing);
    end
    _cooking = {
        punch_recipes = {},
      };
  end
  
  return on_punch, _cooking;
end

function cooking.add_punch_recipe( node_name, wielded_name, action_def, type_name)
  local node_def = minetest.registered_nodes[node_name];
  
  local on_punch, _cooking = fixNode(node_def);
  
  _cooking.punch_recipes[wielded_name] = action_def;
  
  minetest.override_item(node_name, {
      on_punch = on_punch,
      _cooking = _cooking,
    });
  
  if (cooking.have_unified~=nil) and (type_name~=nil) then
    unified_inventory.register_craft({
        type = type_name,
        output = ItemStack(action_def.new_name):to_string(),
        items = {ItemStack(wielded_name):to_string()},
        width = 0,
      })
  end
end

function cooking.set_on_place(item_name, place_name)
  local item_def = minetest.registered_items[item_name];
  local on_place = function(itemstack, placer, pointed_thing)
    local item = ItemStack(place_name);
    minetest.item_place(item, placer, pointed_thing)
    if (item:get_count()==0) then
      itemstack:take_item(1);
    end
  end
  
  minetest.override_item(item_name, {
      on_place = on_place,
    });
end

function cooking.set_food_on_use(item_name)
  local item_def = minetest.registered_items[item_name];
  
  local old_use = item_def.on_use;
  if old_use then
    minetest.override_item(item_name, {
        on_use = function (itemstack, user, pointed_thing)
            if (pointed_thing.type=="node") then
              local node = minetest.get_node(pointed_thing.under);
              local node_def = minetest.registered_nodes[node.name];
              if node_def and node_def._cooking and node_def.on_punch then
                node_def.on_punch(pointed_thing.under, node, user, pointed_thing)
                return user:get_wielded_item();
              end
            end
            return old_use(itemstack, user, pointed_thing);
          end,
      });
  end
end

