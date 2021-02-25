
-- bottle
cooking.add_punch_recipe("cooking:glass_bottle_cork", "", {
    new_name = "cooking:glass_bottle",
    drop = "cooking:bottle_cork",
  }, "take_hand")

cooking.add_punch_recipe("cooking:glass_bottle", "cooking:bottle_cork", {
    new_name = "cooking:glass_bottle_cork",
  }, "place_hand")

-- cutting board
cooking.add_punch_recipe("cooking:cutting_board_with_knife", "", {
    new_name = "cooking:cutting_board",
    drop = "cooking:cutting_knife",
  }, "take_hand")

cooking.add_punch_recipe("cooking:cutting_board", "cooking:cutting_knife", {
    new_name = "air",
    drop = "farming:cutting_board",
  }, "take_hand")


