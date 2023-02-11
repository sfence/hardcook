
-- node box {x=0, y=0, z=0}
node_box = {
  type = "fixed",
  fixed = {
    {-0.125,-0.5,-0.1875,0.125,-0.0625,-0.125},
    {-0.1875,-0.5,-0.125,0.1875,-0.4375,0.125},
    {-0.1875,-0.4375,-0.125,-0.125,-0.0625,0.125},
    {0.125,-0.4375,-0.125,0.1875,-0.0625,0.125},
    {-0.125,-0.5,0.125,0.125,-0.0625,0.1875},
  },
}

minetest.register_node( "hardcook:drinking_glass", {
  description = "Empty drinking glass",
  drawtype = "mesh",
  paramtype  = "light",
  paramtype2 = "facedir",
  mesh = "hardcook_drinking_glass.obj",
  selection_box = node_box,
  collision_box = node_box,
  tiles = {"hardcook_drinking_glass.png"},
  use_texture_alpha = "clip",
  --sunlight_propagates = true,
  groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = hardcook.use_not_in_creative_inventory},
  drop = "vessels:drinking_glass",
})

hardcook.set_on_place("vessels:drinking_glass", "hardcook:drinking_glass")

if (hardcook.have_unified) then
  unified_inventory.register_craft_type("pouring_drinking_glass", {
      description = "pouring";
      icon = "vessels_drinking_glass_inv.png",
      width = 2,
      height = 1,
    })
end

-- cactus juice
minetest.register_node( "hardcook:drinking_glass_of_cactus_juice", {
  description = "Drinking glass fill of cactus juice",
  stack_max = 1,
  drawtype = "mesh",
  paramtype  = "light",
  paramtype2 = "facedir",
  mesh = "hardcook_drinking_glass_full.obj",
  selection_box = node_box,
  collision_box = node_box,
  tiles = {"hardcook_drinking_glass.png", "hardcook_juice_cactus.png"},
  use_texture_alpha = "clip",
  --sunlight_propagates = true,
  groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = hardcook.use_not_in_creative_inventory},
  drop = "farming:cactus_juice",
})

hardcook.set_on_place("farming:cactus_juice", "hardcook:drinking_glass_of_cactus_juice")

-- carrot juice
minetest.register_node( "hardcook:drinking_glass_of_carrot_juice", {
  description = "Drinking glass fill of carrot juice",
  stack_max = 1,
  drawtype = "mesh",
  paramtype  = "light",
  paramtype2 = "facedir",
  mesh = "hardcook_drinking_glass_full.obj",
  selection_box = node_box,
  collision_box = node_box,
  tiles = {"hardcook_drinking_glass.png", "hardcook_juice_carrot.png"},
  use_texture_alpha = "clip",
  --sunlight_propagates = true,
  groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = hardcook.use_not_in_creative_inventory},
  drop = "farming:carrot_juice",
})

hardcook.set_on_place("farming:carrot_juice", "hardcook:drinking_glass_of_carrot_juice")

-- pineapple juice
minetest.register_node( "hardcook:drinking_glass_of_pineapple_juice", {
  description = "Drinking glass fill of pineapple juice",
  stack_max = 1,
  drawtype = "mesh",
  paramtype  = "light",
  paramtype2 = "facedir",
  mesh = "hardcook_drinking_glass_full.obj",
  selection_box = node_box,
  collision_box = node_box,
  tiles = {"hardcook_drinking_glass.png", "hardcook_juice_pineapple.png"},
  use_texture_alpha = "clip",
  --sunlight_propagates = true,
  groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = hardcook.use_not_in_creative_inventory},
  drop = "farming:pineapple_juice",
})

hardcook.set_on_place("farming:pineapple_juice", "hardcook:drinking_glass_of_pineapple_juice")

