
local S = hardcook.translator;

function hardcook.help_register_dishes_burnt(burnt_def, shared_def)
  -- burnt
  local node_def = table.copy(shared_def);
  node_def.description = S("Burnt "..burnt_def.desc);
  node_def.mesh = burnt_def.mesh_fill_half;
  node_def.selection_box = burnt_def.node_box_fill_half;
  node_def.collision_box = burnt_def.node_box_fill_half;
  table.insert(node_def.tiles, "hardcook_fill_burnt.png");
  
  minetest.register_node( "hardcook:"..burnt_def.name.."_burnt", node_def)

  local node_def = table.copy(shared_def);
  node_def.description = S("Burnt "..burnt_def.desc.." with salt");
  node_def.mesh = burnt_def.mesh_fill_half;
  node_def.selection_box = burnt_def.node_box_fill_half;
  node_def.collision_box = burnt_def.node_box_fill_half;
  table.insert(node_def.tiles, "hardcook_fill_burnt_salt.png");
  
  minetest.register_node( "hardcook:"..burnt_def.name.."_burnt_salt", node_def)

  local node_def = table.copy(shared_def);
  node_def.description = S("Burnt "..burnt_def.desc.." with salt and water");
  node_def.mesh = burnt_def.mesh_fill;
  node_def.selection_box = burnt_def.node_box_fill;
  node_def.collision_box = burnt_def.node_box_fill;
  table.insert(node_def.tiles, "hardcook_fill_burnt.png^default_river_water.png");
  
  minetest.register_node( "hardcook:"..burnt_def.name.."_burnt_salt_water", node_def)

  local node_def = table.copy(shared_def);
  node_def.description = S("Burnt "..burnt_def.desc.." boiled down");
  node_def.mesh = burnt_def.mesh_fill;
  node_def.selection_box = burnt_def.node_box_fill;
  node_def.collision_box = burnt_def.node_box_fill;
  table.insert(node_def.tiles, "hardcook_fill_boil_away_burnt.png");
  
  minetest.register_node( "hardcook:"..burnt_def.name.."_boil_away_burnt", node_def)
  
  if burnt_def.have_potlid then
    local node_def = table.copy(shared_def);
    node_def.description = S("Burnt "..burnt_def.desc.." with potlid");
    node_def.mesh = burnt_def.mesh_potlid;
    node_def.selection_box = burnt_def.node_box_potlid;
    node_def.collision_box = burnt_def.node_box_potlid;
    table.insert(node_def.tiles, "hardcook_"..burnt_def.name.."_potlid_top.png");
    table.insert(node_def.tiles, "hardcook_"..burnt_def.name.."_potlid_bottom.png");
    table.insert(node_def.tiles, "hardcook_"..burnt_def.name.."_potlid_side.png");
    
    minetest.register_node( "hardcook:"..burnt_def.name.."_burnt_potlid", node_def)
    
    local node_def = table.copy(shared_def);
    node_def.description = S("Burnt "..burnt_def.desc.." with salt, water and potlid");
    node_def.mesh = burnt_def.mesh_potlid;
    node_def.selection_box = burnt_def.node_box_potlid;
    node_def.collision_box = burnt_def.node_box_potlid;
    table.insert(node_def.tiles, "hardcook_"..burnt_def.name.."_potlid_top.png");
    table.insert(node_def.tiles, "hardcook_"..burnt_def.name.."_potlid_bottom.png");
    table.insert(node_def.tiles, "hardcook_"..burnt_def.name.."_potlid_side.png");
    
    minetest.register_node( "hardcook:"..burnt_def.name.."_burnt_salt_water_potlid", node_def)
    
    local node_def = table.copy(shared_def);
    node_def.description = S("Burnt "..burnt_def.desc.." boiled down with potlid");
    node_def.mesh = burnt_def.mesh_potlid;
    node_def.selection_box = burnt_def.node_box_potlid;
    node_def.collision_box = burnt_def.node_box_potlid;
    table.insert(node_def.tiles, "hardcook_"..burnt_def.name.."_potlid_top.png");
    table.insert(node_def.tiles, "hardcook_"..burnt_def.name.."_potlid_bottom.png");
    table.insert(node_def.tiles, "hardcook_"..burnt_def.name.."_potlid_side.png");
    
    minetest.register_node( "hardcook:"..burnt_def.name.."_boil_away_burnt_potlid", node_def)
  end
end
