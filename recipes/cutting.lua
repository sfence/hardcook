

cooking.add_punch_recipe("cooking:cutting_board", "default:apple", {
    new_name = "cooking:cutting_board_with_apple",
  }, "place_cutting_board")
cooking.add_punch_recipe("cooking:cutting_board_with_apple", "cooking:cutting_knife", {
    new_name = "cooking:cutting_board_with_chopped_apple",
    use_meta = "chopping",
    target_meta = 3,
    no_take = true,
  }, "cutting_board")
cooking.set_food_on_use("default:apple")

cooking.add_punch_recipe("cooking:cutting_board", "farming:beetroot", {
    new_name = "cooking:cutting_board_with_beetroot",
  }, "place_cutting_board")
cooking.add_punch_recipe("cooking:cutting_board_with_beetroot", "cooking:cutting_knife", {
    new_name = "cooking:cutting_board_with_chopped_beetroot",
    use_meta = "chopping",
    target_meta = 3,
    no_take = true,
  }, "cutting_board")
cooking.set_food_on_use("farming:beetroot")

cooking.add_punch_recipe("cooking:cutting_board", "farming:onion", {
    new_name = "cooking:cutting_board_with_onion",
  }, "place_cutting_board")
cooking.add_punch_recipe("cooking:cutting_board_with_onion", "cooking:cutting_knife", {
    new_name = "cooking:cutting_board_with_chopped_onion",
    use_meta = "chopping",
    target_meta = 3,
    no_take = true,
  }, "cutting_board")
cooking.set_food_on_use("farming:onion")

