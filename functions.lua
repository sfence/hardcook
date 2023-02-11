
local function fixNodePunch(node_def)
  local on_construct = node_def.on_construct;
  local on_punch = node_def.on_punch;
  local _hardcook = node_def._hardcook;
  
  if (_hardcook==nil) then
    _hardcook = {};
    
    if on_construct then
      local old_construct = on_construct;
      on_construct = function(pos)
          old_construct(pos);
          hardcook.recipes_on_construct(pos);
        end
    else
      on_construct = hardcook.recipes_on_construct;
    end
  end
  if (_hardcook.punch_recipes==nil) then
    _hardcook.punch_recipes = {};
    if on_punch then
      local old_punch = on_punch;
      on_punch = function(pos, node, puncher, pointed_thing)
          hardcook.recipes_on_punch(pos, node, puncher, pointed_thing);
          old_punch(pos, node, puncher, pointed_thing);
        end
    else
      on_punch = hardcook.recipes_on_punch;
    end
  end
  
  return on_construct, on_punch, _hardcook;
end

local function fixNodeTimer(node_def)
  local on_construct = node_def.on_construct;
  local on_timer = node_def.on_timer;
  local _hardcook = node_def._hardcook;
  
  if (_hardcook==nil) then
    _hardcook = {};
    
    if on_construct then
      local old_construct = on_construct;
      on_construct = function(pos)
          old_construct(pos);
          hardcook.recipes_on_construct(pos);
        end
    else
      on_construct = hardcook.recipes_on_construct;
    end
  end
  if (_hardcook.timer_recipe==nil) then
    _hardcook.timer_recipe = {};
    if on_timer then
      local old_timer = on_timer;
      on_timer = function(pos, elapsed)
          old_timer(pos, elapsed);
          hardcook.recipes_on_timer(pos, elapsed);
        end
    else
      on_timer = hardcook.recipes_on_timer;
    end
  end
   
  return on_construct, on_timer, _hardcook;
end

local function fixNodeCooking(node_def)
  local on_construct = node_def.on_construct;
  local _hardcook = node_def._hardcook;
  
  if (_hardcook==nil) then
    _hardcook = {};
    
    if on_construct then
      local old_construct = on_construct;
      on_construct = function(pos)
          old_construct(pos);
          hardcook.recipes_on_construct(pos);
        end
    else
      on_construct = hardcook.recipes_on_construct;
    end
  end
  if (_hardcook.hardcook_recipe==nil) then
    _hardcook.hardcook_recipe = {};
  end
   
  return on_construct, _hardcook;
end

local function fixNodeBaking(node_def)
  local on_construct = node_def.on_construct;
  local _hardcook = node_def._hardcook;
  
  if (_hardcook==nil) then
    _hardcook = {};
    
    if on_construct then
      local old_construct = on_construct;
      on_construct = function(pos)
          old_construct(pos);
          hardcook.recipes_on_construct(pos);
        end
    else
      on_construct = hardcook.recipes_on_construct;
    end
  end
  if (_hardcook.baking_recipe==nil) then
    _hardcook.baking_recipe = {};
  end
   
  return on_construct, _hardcook;
end

function hardcook.check_item(item_name, want_name)
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

function hardcook.get_meta_int(meta, name, default_value)
  local value = meta:get_int(name);
  if (value==0) then return default_value; end;
  return value;
end
function hardcook.get_meta_float(meta, name, default_value)
  local value = meta:get_float(name);
  if (value==0) then return default_value; end;
  return value;
end

function hardcook.item_to_inventory(user, item)
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

function hardcook.add_punch_recipe( node_name, wielded_name, action_def, type_name)
  local node_def = minetest.registered_nodes[node_name];
  
  local on_construct, on_punch, _hardcook = fixNodePunch(node_def);
  
  _hardcook.punch_recipes[wielded_name] = action_def;
  
  minetest.override_item(node_name, {
      on_construct = on_construct,
      on_punch = on_punch,
      _hardcook = _hardcook,
    });
  
  if (hardcook.have_unified~=nil) and (type_name~=nil) then
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
    if (action_def.drop~=nil) then
      unified_inventory.register_craft({
          type = "hardcook_drop",
          output = ItemStack(action_def.drop):to_string(),
          items = items,
          width = 0,
        })
    end
  end
end
function hardcook.add_timer_recipe( node_name, action_def, type_name)
  local node_def = minetest.registered_nodes[node_name];
  
  local on_construct, on_timer, _hardcook = fixNodeTimer(node_def);
  
  _hardcook.timer_recipe = action_def;
  
  minetest.override_item(node_name, {
      on_construct = on_construct,
      on_timer = on_timer,
      _hardcook = _hardcook,
    });
  
  if (hardcook.have_unified~=nil) and (type_name~=nil) then
    unified_inventory.register_craft({
        type = type_name,
        output = ItemStack(action_def.new_name):to_string(),
        items = {ItemStack(node_name):to_string()},
        width = 0,
      })
  end
end
function hardcook.add_hardcook_recipe( node_name, action_def, type_name)
  local node_def = minetest.registered_nodes[node_name];
  
  local on_construct, _hardcook = fixNodeCooking(node_def);
  
  _hardcook.hardcook_recipe = action_def;
  
  minetest.override_item(node_name, {
      on_construct = on_construct,
      _hardcook = _hardcook,
    });
  
  if (hardcook.have_unified~=nil) and (type_name~=nil) then
    unified_inventory.register_craft({
        type = type_name,
        output = ItemStack(action_def.new_name):to_string(),
        items = {ItemStack(node_name):to_string()},
        width = 0,
      })
  end
end
function hardcook.add_baking_recipe( node_name, action_def, type_name)
  local node_def = minetest.registered_nodes[node_name];
  
  local on_construct, _hardcook = fixNodeBaking(node_def);
  
  _hardcook.baking_recipe = action_def;
  
  minetest.override_item(node_name, {
      on_construct = on_construct,
      _hardcook = _hardcook,
    });
  
  if (hardcook.have_unified~=nil) and (type_name~=nil) then
    unified_inventory.register_craft({
        type = type_name,
        output = ItemStack(action_def.new_name):to_string(),
        items = {ItemStack(node_name):to_string()},
        width = 0,
      })
  end
end

-- more recipes registration 

--
function hardcook.set_on_place(item_name, place_name)
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

function hardcook.set_food_on_use(item_name)
  local item_def = minetest.registered_items[item_name];
  
  local old_use = item_def.on_use;
  if old_use then
    minetest.override_item(item_name, {
        on_use = function (itemstack, user, pointed_thing)
            if (pointed_thing.type=="node") then
              local node = minetest.get_node(pointed_thing.under);
              local node_def = minetest.registered_nodes[node.name];
              if node_def and node_def._hardcook and node_def.on_punch then
                node_def.on_punch(pointed_thing.under, node, user, pointed_thing)
                return user:get_wielded_item();
              end
            end
            return old_use(itemstack, user, pointed_thing);
          end,
      });
  end
end

