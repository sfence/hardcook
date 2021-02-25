
local function fixNodePunch(node_def)
  local on_construct = node_def.on_construct;
  local on_punch = node_def.on_punch;
  local _cooking = node_def._cooking;
  
  if (_cooking==nil) then
    _cooking = {};
    
    if on_construct then
      local old_construct = on_construct;
      on_construct = function(pos)
          old_construct(pos);
          cooking.recipes_on_construct(pos);
        end
    else
      on_construct = cooking.recipes_on_construct;
    end
  end
  if (_cooking.punch_recipes==nil) then
    _cooking.punch_recipes = {};
    if on_punch then
      local old_punch = on_punch;
      on_punch = function(pos, node, puncher, pointed_thing)
          cooking.recipes_on_punch(pos, node, puncher, pointed_thing);
          old_punch(pos, node, puncher, pointed_thing);
        end
    else
      on_punch = cooking.recipes_on_punch;
    end
  end
  
  return on_construct, on_punch, _cooking;
end

local function fixNodeTimer(node_def)
  local on_construct = node_def.on_construct;
  local on_timer = node_def.on_timer;
  local _cooking = node_def._cooking;
  
  if (_cooking==nil) then
    _cooking = {};
    
    if on_construct then
      local old_construct = on_construct;
      on_construct = function(pos)
          old_construct(pos);
          cooking.recipes_on_construct(pos);
        end
    else
      on_construct = cooking.recipes_on_construct;
    end
  end
  if (_cooking.timer_recipe==nil) then
    _cooking.timer_recipe = {};
    if on_timer then
      local old_timer = on_timer;
      on_timer = function(pos, elapsed)
          old_timer(pos, elapsed);
          cooking.recipes_on_timer(pos, elapsed);
        end
    else
      on_timer = cooking.recipes_on_timer;
    end
  end
   
  return on_construct, on_timer, _cooking;
end

local function fixNodeCooking(node_def)
  local on_construct = node_def.on_construct;
  local _cooking = node_def._cooking;
  
  if (_cooking==nil) then
    _cooking = {};
    
    if on_construct then
      local old_construct = on_construct;
      on_construct = function(pos)
          old_construct(pos);
          cooking.recipes_on_construct(pos);
        end
    else
      on_construct = cooking.recipes_on_construct;
    end
  end
  if (_cooking.cooking_recipe==nil) then
    _cooking.cooking_recipe = {};
  end
   
  return on_construct, _cooking;
end

local function fixNodeBaking(node_def)
  local on_construct = node_def.on_construct;
  local _cooking = node_def._cooking;
  
  if (_cooking==nil) then
    _cooking = {};
    
    if on_construct then
      local old_construct = on_construct;
      on_construct = function(pos)
          old_construct(pos);
          cooking.recipes_on_construct(pos);
        end
    else
      on_construct = cooking.recipes_on_construct;
    end
  end
  if (_cooking.baking_recipe==nil) then
    _cooking.baking_recipe = {};
  end
   
  return on_construct, _cooking;
end

function cooking.check_item(item_name, want_name)
  if (type(want_name)=="table") then
    if (want_name[item_name]) then
      return want_name[item_name];
    end
    for key, value in pairs(want_name) do
      if (key:sub(1, 7) == "group:") then
        if (minetest.get_item_group(item_name, key:sub(8,-1))~=0) then
          return value;
        end
      end
    end
    
    return nil;
  else
    if (item_name==want_name) then
      return true;
    end
    if (want_name:sub(1, 7) == "group:") then
      if (minetest.get_item_group(item_name, want_name:sub(8,-1))~=0) then
        return true;
      end
    end
    
    return false;
  end
end

function cooking.get_meta_int(meta, name, default_value)
  local value = meta:get_int(name);
  if (value==0) then return default_value; end;
  return value;
end
function cooking.get_meta_float(meta, name, default_value)
  local value = meta:get_float(name);
  if (value==0) then return default_value; end;
  return value;
end

function cooking.item_to_inventory(user, item)
  local inv = user:get_inventory();
  local list = user:get_wield_list();
  if (inv:room_for_item(list, item)) then
    inv:add_item(list, item);
  else
    local pos = user:get_pos();
    pos.y = pos.y + 0.5;
    minetest.add_item(pos, item);
  end
end

function cooking.add_punch_recipe( node_name, wielded_name, action_def, type_name)
  local node_def = minetest.registered_nodes[node_name];
  
  local on_construct, on_punch, _cooking = fixNodePunch(node_def);
  
  _cooking.punch_recipes[wielded_name] = action_def;
  
  minetest.override_item(node_name, {
      on_construct = on_construct,
      on_punch = on_punch,
      _cooking = _cooking,
    });
  
  if (cooking.have_unified~=nil) and (type_name~=nil) then
    local items = {};
    if (wielded_name~="") then
      table.insert(items,ItemStack(wielded_name):to_string())
    end
    table.insert(items,  ItemStack(node_name):to_string());
    unified_inventory.register_craft({
        type = type_name,
        output = ItemStack(action_def.new_name):to_string(),
        items = items,
        width = 0,
      })
  end
end
function cooking.add_timer_recipe( node_name, action_def, type_name)
  local node_def = minetest.registered_nodes[node_name];
  
  local on_construct, on_timer, _cooking = fixNodeTimer(node_def);
  
  _cooking.timer_recipe = action_def;
  
  minetest.override_item(node_name, {
      on_construct = on_construct,
      on_timer = on_timer,
      _cooking = _cooking,
    });
  
  if (cooking.have_unified~=nil) and (type_name~=nil) then
    unified_inventory.register_craft({
        type = type_name,
        output = ItemStack(action_def.new_name):to_string(),
        items = {ItemStack(node_name):to_string()},
        width = 0,
      })
  end
end
function cooking.add_cooking_recipe( node_name, action_def, type_name)
  local node_def = minetest.registered_nodes[node_name];
  
  local on_construct, _cooking = fixNodeCooking(node_def);
  
  _cooking.cooking_recipe = action_def;
  
  minetest.override_item(node_name, {
      on_construct = on_construct,
      _cooking = _cooking,
    });
  
  if (cooking.have_unified~=nil) and (type_name~=nil) then
    unified_inventory.register_craft({
        type = type_name,
        output = ItemStack(action_def.new_name):to_string(),
        items = {ItemStack(node_name):to_string()},
        width = 0,
      })
  end
end
function cooking.add_baking_recipe( node_name, action_def, type_name)
  local node_def = minetest.registered_nodes[node_name];
  
  local on_construct, _cooking = fixNodeBaking(node_def);
  
  _cooking.baking_recipe = action_def;
  
  minetest.override_item(node_name, {
      on_construct = on_construct,
      _cooking = _cooking,
    });
  
  if (cooking.have_unified~=nil) and (type_name~=nil) then
    unified_inventory.register_craft({
        type = type_name,
        output = ItemStack(action_def.new_name):to_string(),
        items = {ItemStack(node_name):to_string()},
        width = 0,
      })
  end
end

function cooking.set_on_place(item_name, place_name)
  local item_def = minetest.registered_items[item_name];
  local on_place = function(itemstack, placer, pointed_thing)
    local item = ItemStack(place_name);
    if (item:get_count()>0) then
      minetest.item_place(item, placer, pointed_thing)
      itemstack:take_item(1);
    end
    return itemstack, nil;
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

