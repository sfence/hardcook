
-- node box {x=0, y=0, z=0}
node_box_board = {
  type = "fixed",
  fixed = {
    {-0.4375,-0.5,-0.25,0.0625,-0.4375,0.25},
    {0.0625,-0.5,-0.1875,0.1875,-0.4375,0.1875},
    {0.1875,-0.5,-0.125,0.25,-0.4375,0.125},
    {0.25,-0.5,-0.0625,0.4375,-0.4375,0.0625},
  },
}

-- node box {x=0, y=0, z=0}
node_box_board_with_knife = {
  type = "fixed",
  fixed = {
    {-0.4375,-0.5,-0.25,0.0625,-0.4375,0.25},
    {0.0625,-0.5,-0.1875,0.1875,-0.4375,0.1875},
    {0.1875,-0.5,-0.125,0.25,-0.4375,0.125},
    {0.25,-0.5,-0.0625,0.4375,-0.4375,0.0625},
    -- knife
    {-0.125,-0.4375,-0.4375,0.0,-0.375,-0.25},
    {-0.1875,-0.4375,-0.25,0.0,-0.375,0.125},
    {-0.125,-0.4375,0.125,0.0,-0.375,0.1875},
  },
}
-- node box {x=0, y=0, z=0}
node_box_board_with_chopped = {
  type = "fixed",
  fixed = {
    {-0.4375,-0.5,-0.25,0.0625,-0.4375,0.25},
    {0.0625,-0.5,-0.1875,0.1875,-0.4375,0.1875},
    {0.1875,-0.5,-0.125,0.25,-0.4375,0.125},
    {0.25,-0.5,-0.0625,0.4375,-0.4375,0.0625},
    -- chopped
    {-0.375,-0.4375,-0.25,0.0,-0.375,0.25},
    {-0.4375,-0.4375,-0.1875,-0.375,-0.375,0.1875},
    {0.0,-0.4375,-0.1875,0.125,-0.375,0.1875},
    {-0.375,-0.375,-0.1875,0.0,-0.3125,0.1875},
    {0.125,-0.4375,-0.125,0.1875,-0.375,0.125},
    {0.0,-0.375,-0.125,0.125,-0.3125,0.125},
    {-0.3125,-0.3125,-0.125,0.0,-0.25,0.125},
    {0.0,-0.3125,-0.0625,0.0625,-0.25,0.0625},
    {-0.25,-0.25,-0.0625,0.0,-0.1875,0.0625},
  },
}
-- node box {x=0, y=0, z=0}
node_box_board_with_apple = {
  type = "fixed",
  fixed = {
    {-0.4375,-0.5,-0.25,0.0625,-0.4375,0.25},
    {0.0625,-0.5,-0.1875,0.1875,-0.4375,0.1875},
    {0.1875,-0.5,-0.125,0.25,-0.4375,0.125},
    {0.25,-0.5,-0.0625,0.4375,-0.4375,0.0625},
    -- apple
    {-0.25,-0.375,-0.25,0.0,0.0,0.25},
    {-0.3125,-0.3125,-0.25,-0.25,-0.0625,0.25},
    {0.0,-0.3125,-0.25,0.0625,-0.0625,0.25},
    {-0.25,-0.4375,-0.1875,0.0,-0.375,0.1875},
    {-0.3125,-0.375,-0.1875,-0.25,-0.3125,0.1875},
    {0.0,-0.375,-0.1875,0.0625,-0.3125,0.1875},
    {-0.375,-0.3125,-0.1875,-0.3125,-0.0625,0.1875},
    {0.0625,-0.3125,-0.1875,0.125,-0.0625,0.1875},
    {-0.3125,-0.0625,-0.1875,-0.25,0.0,0.1875},
    {0.0,-0.0625,-0.1875,0.0625,0.0,0.1875},
    {-0.25,0.0,-0.1875,0.0,0.0625,0.1875},
    {-0.3125,-0.4375,-0.125,-0.25,-0.375,0.125},
    {0.0,-0.4375,-0.125,0.0625,-0.375,0.125},
    {-0.375,-0.375,-0.125,-0.3125,-0.3125,0.125},
    {0.0625,-0.375,-0.125,0.125,-0.3125,0.125},
    {-0.375,-0.0625,-0.125,-0.3125,0.0,0.125},
    {0.0625,-0.0625,-0.125,0.125,0.0,0.125},
    {-0.3125,0.0,-0.125,-0.25,0.0625,0.125},
    {0.0,0.0,-0.125,0.0625,0.0625,0.125},
    {-0.1875,0.0625,-0.0625,-0.0625,0.125,0.0625},
  },
}
-- node box {x=0, y=0, z=0}
node_box_board_with_beetroot = {
  type = "fixed",
  fixed = {
    {-0.4375,-0.5,-0.25,0.0625,-0.4375,0.25},
    {0.0625,-0.5,-0.1875,0.1875,-0.4375,0.1875},
    {0.1875,-0.5,-0.125,0.25,-0.4375,0.125},
    {0.25,-0.5,-0.0625,0.4375,-0.4375,0.0625},
    -- beetroot
    {-0.25,-0.375,-0.1875,0.0625,-0.1875,0.1875},
    {-0.25,-0.4375,-0.125,0.0625,-0.375,0.125},
    {-0.3125,-0.375,-0.125,-0.25,-0.1875,0.125},
    {0.0625,-0.375,-0.125,0.125,-0.1875,0.125},
    {-0.375,-0.3125,-0.125,-0.3125,-0.1875,0.125},
    {-0.25,-0.1875,-0.125,0.0,-0.125,0.125},
    {0.125,-0.3125,-0.0625,0.1875,-0.25,0.0625},
    {0.1875,-0.25,-0.0625,0.25,-0.1875,0.0625},
    {-0.3125,-0.1875,-0.0625,-0.25,-0.125,0.0625},
    {0.0,-0.1875,-0.0625,0.0625,-0.125,0.0625},
  },
}
-- node box {x=0, y=0, z=0}
node_box_board_with_onion = {
  type = "fixed",
  fixed = {
    {-0.4375,-0.5,-0.25,0.0625,-0.4375,0.25},
    {0.0625,-0.5,-0.1875,0.1875,-0.4375,0.1875},
    {0.1875,-0.5,-0.125,0.25,-0.4375,0.125},
    {0.25,-0.5,-0.0625,0.4375,-0.4375,0.0625},
    -- onion
    {-0.1875,-0.3125,-0.1875,-0.0625,-0.125,0.1875},
    {-0.25,-0.25,-0.1875,-0.1875,-0.1875,0.1875},
    {-0.0625,-0.25,-0.1875,0.0,-0.125,0.1875},
    {-0.1875,-0.375,-0.125,-0.0625,-0.3125,0.125},
    {-0.3125,-0.3125,-0.125,-0.1875,-0.25,0.125},
    {-0.0625,-0.3125,-0.125,0.0625,-0.25,0.125},
    {-0.3125,-0.25,-0.125,-0.25,-0.1875,0.125},
    {0.0,-0.25,-0.125,0.0625,-0.125,0.125},
    {-0.25,-0.1875,-0.125,-0.1875,-0.125,0.125},
    {-0.1875,-0.125,-0.125,0.0,-0.0625,0.125},
    {-0.1875,-0.4375,-0.0625,-0.0625,-0.375,0.0625},
    {-0.3125,-0.375,-0.0625,-0.1875,-0.3125,0.0625},
    {-0.0625,-0.375,-0.0625,0.0625,-0.3125,0.0625},
    {-0.375,-0.3125,-0.0625,-0.3125,-0.1875,0.0625},
    {0.0625,-0.3125,-0.0625,0.125,-0.125,0.0625},
    {0.125,-0.25,-0.0625,0.25,-0.1875,0.0625},
    {-0.3125,-0.1875,-0.0625,-0.25,-0.125,0.0625},
    {-0.25,-0.125,-0.0625,-0.1875,-0.0625,0.0625},
    {0.0,-0.125,-0.0625,0.0625,-0.0625,0.0625},
  },
}

-- node box {x=0, y=0, z=0}
node_box_board_with_cabbage = {
  type = "fixed",
  fixed = {
    {-0.4375,-0.5,-0.25,0.0625,-0.4375,0.25},
    {0.0625,-0.5,-0.1875,0.1875,-0.4375,0.1875},
    {0.1875,-0.5,-0.125,0.25,-0.4375,0.125},
    {0.25,-0.5,-0.0625,0.4375,-0.4375,0.0625},
    -- cabbage
    {-0.125,-0.25,-0.375,0.0,0.0,0.375},
    {-0.1875,-0.1875,-0.375,-0.125,-0.0625,0.375},
    {0.0,-0.1875,-0.375,0.0625,-0.0625,0.375},
    {-0.125,-0.3125,-0.3125,0.0,-0.25,0.3125},
    {-0.1875,-0.25,-0.3125,-0.125,-0.1875,0.3125},
    {0.0,-0.25,-0.3125,0.0625,-0.1875,0.3125},
    {-0.3125,-0.1875,-0.3125,-0.1875,-0.0625,0.3125},
    {0.0625,-0.1875,-0.3125,0.1875,-0.0625,0.3125},
    {-0.1875,-0.0625,-0.3125,-0.125,0.0,0.3125},
    {0.0,-0.0625,-0.3125,0.0625,0.0,0.3125},
    {-0.125,0.0,-0.3125,0.0,0.0625,0.3125},
    {-0.125,-0.375,-0.25,0.0,-0.3125,0.25},
    {-0.1875,-0.3125,-0.25,-0.125,-0.25,0.25},
    {0.0,-0.3125,-0.25,0.0625,-0.25,0.25},
    {-0.3125,-0.25,-0.25,-0.1875,-0.1875,0.25},
    {0.0625,-0.25,-0.25,0.1875,-0.1875,0.25},
    {-0.375,-0.1875,-0.25,-0.3125,-0.0625,0.25},
    {0.1875,-0.1875,-0.25,0.25,-0.0625,0.25},
    {-0.3125,-0.0625,-0.25,-0.1875,0.0,0.25},
    {0.0625,-0.0625,-0.25,0.1875,0.0,0.25},
    {-0.25,0.0,-0.25,-0.125,0.0625,0.25},
    {0.0,0.0,-0.25,0.125,0.0625,0.25},
    {-0.1875,0.0625,-0.25,0.0625,0.125,0.25},
    {-0.125,-0.4375,-0.1875,0.0,-0.375,0.1875},
    {-0.1875,-0.375,-0.1875,-0.125,-0.3125,0.1875},
    {0.0,-0.375,-0.1875,0.0625,-0.3125,0.1875},
    {-0.25,-0.3125,-0.1875,-0.1875,-0.25,0.1875},
    {0.0625,-0.3125,-0.1875,0.125,-0.25,0.1875},
    {-0.3125,0.0,-0.1875,-0.25,0.0625,0.1875},
    {0.125,0.0,-0.1875,0.1875,0.0625,0.1875},
    {-0.25,0.0625,-0.1875,-0.1875,0.125,0.1875},
    {0.0625,0.0625,-0.1875,0.125,0.125,0.1875},
    {-0.125,0.125,-0.1875,0.0,0.1875,0.1875},
    {-0.1875,-0.4375,-0.125,-0.125,-0.375,0.125},
    {0.0,-0.4375,-0.125,0.0625,-0.375,0.125},
    {-0.25,-0.375,-0.125,-0.1875,-0.3125,0.125},
    {0.0625,-0.375,-0.125,0.125,-0.3125,0.125},
    {-0.3125,-0.3125,-0.125,-0.25,-0.25,0.125},
    {0.125,-0.3125,-0.125,0.1875,-0.25,0.125},
    {-0.375,-0.25,-0.125,-0.3125,-0.1875,0.125},
    {0.1875,-0.25,-0.125,0.25,-0.1875,0.125},
    {-0.4375,-0.1875,-0.125,-0.375,-0.0625,0.125},
    {0.25,-0.1875,-0.125,0.3125,-0.0625,0.125},
    {-0.375,-0.0625,-0.125,-0.3125,0.0,0.125},
    {0.1875,-0.0625,-0.125,0.25,0.0,0.125},
    {-0.3125,0.0625,-0.125,-0.25,0.125,0.125},
    {0.125,0.0625,-0.125,0.1875,0.125,0.125},
    {-0.1875,0.125,-0.125,-0.125,0.1875,0.125},
    {0.0,0.125,-0.125,0.0625,0.1875,0.125},
    {-0.25,-0.4375,-0.0625,-0.1875,-0.375,0.0625},
    {0.0625,-0.4375,-0.0625,0.125,-0.375,0.0625},
    {-0.3125,-0.375,-0.0625,-0.25,-0.3125,0.0625},
    {0.125,-0.375,-0.0625,0.1875,-0.3125,0.0625},
    {-0.375,-0.3125,-0.0625,-0.3125,-0.25,0.0625},
    {0.1875,-0.3125,-0.0625,0.25,-0.25,0.0625},
    {-0.4375,-0.25,-0.0625,-0.375,-0.1875,0.0625},
    {0.25,-0.25,-0.0625,0.3125,-0.1875,0.0625},
    {-0.4375,-0.0625,-0.0625,-0.375,0.0,0.0625},
    {0.25,-0.0625,-0.0625,0.3125,0.0,0.0625},
    {-0.375,0.0,-0.0625,-0.3125,0.0625,0.0625},
    {0.1875,0.0,-0.0625,0.25,0.0625,0.0625},
    {-0.25,0.125,-0.0625,-0.1875,0.1875,0.0625},
    {0.0625,0.125,-0.0625,0.125,0.1875,0.0625},
  },
}

-- node box {x=0, y=0, z=0}
node_box_board_with_carrot = {
  type = "fixed",
  fixed = {
    {-0.4375,-0.5,-0.25,0.0625,-0.4375,0.25},
    {0.0625,-0.5,-0.1875,0.1875,-0.4375,0.1875},
    {0.1875,-0.5,-0.125,0.25,-0.4375,0.125},
    {0.25,-0.5,-0.0625,0.4375,-0.4375,0.0625},
    -- carrot
    {-0.3125,-0.375,-0.125,0.1875,-0.25,0.125},
    {-0.3125,-0.4375,-0.0625,0.1875,-0.375,0.0625},
    {-0.4375,-0.375,-0.0625,-0.3125,-0.25,0.0625},
    {0.1875,-0.375,-0.0625,0.25,-0.25,0.0625},
    {-0.3125,-0.25,-0.0625,0.1875,-0.1875,0.0625},
  },
}

-- node box {x=0, y=0, z=0}
node_box_board_with_mushroom = {
  type = "fixed",
  fixed = {
    {-0.4375,-0.5,-0.25,0.0625,-0.4375,0.25},
    {0.0625,-0.5,-0.1875,0.1875,-0.4375,0.1875},
    {0.1875,-0.5,-0.125,0.25,-0.4375,0.125},
    {0.25,-0.5,-0.0625,0.4375,-0.4375,0.0625},
    -- mushroom
    {-0.3125,-0.375,-0.1875,-0.25,-0.125,-0.125},
    {-0.3125,-0.4375,-0.125,-0.25,-0.375,0.125},
    {-0.375,-0.375,-0.125,-0.3125,-0.125,0.125},
    {-0.3125,-0.125,-0.125,-0.25,-0.0625,0.125},
    {0.0625,-0.4375,-0.0625,0.25,-0.3125,0.0625},
    {-0.125,-0.375,-0.0625,0.0625,-0.25,0.0625},
    {-0.3125,-0.3125,-0.0625,-0.125,-0.1875,0.0625},
    {-0.3125,-0.375,0.125,-0.25,-0.125,0.1875},
  },
}

-- node box {x=0, y=0, z=0}
node_box_board_with_tomato = {
  type = "fixed",
  fixed = {
    {-0.4375,-0.5,-0.25,0.0625,-0.4375,0.25},
    {0.0625,-0.5,-0.1875,0.1875,-0.4375,0.1875},
    {0.1875,-0.5,-0.125,0.25,-0.4375,0.125},
    {0.25,-0.5,-0.0625,0.4375,-0.4375,0.0625},
    -- tomato
    {-0.1875,-0.1875,-0.375,0.0,0.125,0.4375},
    {-0.25,-0.125,-0.375,-0.1875,0.0625,0.4375},
    {0.0,-0.125,-0.375,0.0625,0.0625,0.4375},
    {-0.25,-0.25,-0.3125,0.0625,-0.1875,0.375},
    {-0.3125,-0.1875,-0.3125,-0.1875,-0.125,0.375},
    {0.0,-0.1875,-0.3125,0.125,-0.125,0.375},
    {-0.3125,-0.125,-0.3125,-0.25,0.125,0.375},
    {0.0625,-0.125,-0.3125,0.125,0.125,0.375},
    {-0.25,0.0625,-0.3125,-0.1875,0.1875,0.375},
    {0.0,0.0625,-0.3125,0.0625,0.1875,0.375},
    {-0.1875,0.125,-0.3125,0.0,0.1875,0.125},
    {-0.25,-0.3125,-0.25,0.0625,-0.25,0.3125},
    {-0.3125,-0.25,-0.25,-0.25,-0.1875,0.3125},
    {0.0625,-0.25,-0.25,0.125,-0.1875,0.3125},
    {-0.375,-0.1875,-0.25,-0.3125,0.125,0.3125},
    {0.125,-0.1875,-0.25,0.1875,0.125,0.3125},
    {-0.3125,0.125,-0.25,-0.25,0.1875,0.3125},
    {0.0625,0.125,-0.25,0.125,0.1875,0.3125},
    {-0.25,0.1875,-0.25,0.0625,0.25,0.3125},
    {-0.25,-0.375,-0.1875,0.0625,-0.3125,0.25},
    {-0.3125,-0.3125,-0.1875,-0.25,-0.25,0.25},
    {0.0625,-0.3125,-0.1875,0.125,-0.25,0.25},
    {-0.375,-0.25,-0.1875,-0.3125,-0.1875,0.25},
    {0.125,-0.25,-0.1875,0.1875,-0.1875,0.25},
    {-0.4375,-0.1875,-0.1875,-0.375,0.125,0.25},
    {0.1875,-0.1875,-0.1875,0.25,0.125,0.25},
    {-0.375,0.125,-0.1875,-0.3125,0.1875,0.25},
    {0.125,0.125,-0.1875,0.1875,0.1875,0.25},
    {-0.3125,0.1875,-0.1875,-0.25,0.25,0.25},
    {0.0625,0.1875,-0.1875,0.125,0.25,0.25},
    {-0.25,0.25,-0.1875,0.0625,0.3125,0.25},
    {-0.125,0.3125,-0.1875,-0.0625,0.375,-0.125},
    {-0.1875,-0.4375,-0.125,0.0,-0.375,0.1875},
    {-0.3125,-0.375,-0.125,-0.25,-0.3125,0.1875},
    {0.0625,-0.375,-0.125,0.125,-0.3125,0.1875},
    {-0.375,-0.3125,-0.125,-0.3125,-0.25,0.1875},
    {0.125,-0.3125,-0.125,0.1875,-0.25,0.1875},
    {-0.4375,-0.25,-0.125,-0.375,-0.1875,0.1875},
    {0.1875,-0.25,-0.125,0.25,-0.1875,0.1875},
    {-0.5,-0.125,-0.125,-0.4375,0.0625,0.1875},
    {0.25,-0.125,-0.125,0.3125,0.0625,0.1875},
    {-0.4375,0.125,-0.125,-0.375,0.1875,0.1875},
    {0.1875,0.125,-0.125,0.25,0.1875,0.1875},
    {-0.375,0.1875,-0.125,-0.3125,0.25,0.1875},
    {0.125,0.1875,-0.125,0.1875,0.25,0.1875},
    {-0.3125,0.25,-0.125,-0.25,0.3125,0.1875},
    {0.0625,0.25,-0.125,0.125,0.3125,0.1875},
    {-0.1875,0.3125,-0.125,0.0,0.375,0.1875},
    {-0.125,0.375,-0.125,-0.0625,0.4375,0.1875},
    {-0.25,-0.4375,-0.0625,-0.1875,-0.375,0.125},
    {0.0,-0.4375,-0.0625,0.0625,-0.375,0.125},
    {-0.5,-0.1875,-0.0625,-0.4375,-0.125,0.125},
    {0.25,-0.1875,-0.0625,0.3125,-0.125,0.125},
    {-0.5,0.0625,-0.0625,-0.4375,0.125,0.125},
    {0.25,0.0625,-0.0625,0.3125,0.125,0.125},
    {-0.3125,0.3125,-0.0625,-0.25,0.375,0.0},
    {-0.25,0.3125,-0.0625,-0.1875,0.375,0.125},
    {0.0,0.3125,-0.0625,0.0625,0.375,0.125},
    {-0.25,0.375,-0.0625,-0.1875,0.4375,0.0},
    {0.0625,0.3125,0.0,0.125,0.375,0.0625},
    {-0.1875,0.375,0.0,-0.125,0.4375,0.125},
    {-0.0625,0.375,0.0,0.0625,0.4375,0.0625},
    {-0.125,0.4375,0.0,-0.0625,0.5,0.125},
    {-0.3125,0.3125,0.0625,-0.25,0.375,0.125},
    {-0.25,0.375,0.0625,-0.1875,0.4375,0.125},
    {-0.0625,0.4375,0.0625,0.0,0.5,0.1875},
    {-0.1875,0.125,0.125,-0.0625,0.1875,0.375},
    {0.0,0.4375,0.125,0.0625,0.5,0.1875},
    {-0.0625,0.125,0.1875,0.0,0.1875,0.375},
    {-0.125,0.3125,0.1875,-0.0625,0.375,0.25},
  },
}

-- node box {x=0, y=0, z=0}
node_box_board_with_cucumber = {
  type = "fixed",
  fixed = {
    {-0.4375,-0.5,-0.25,0.0625,-0.4375,0.25},
    {0.0625,-0.5,-0.1875,0.1875,-0.4375,0.1875},
    {0.1875,-0.5,-0.125,0.25,-0.4375,0.125},
    {0.25,-0.5,-0.0625,0.4375,-0.4375,0.0625},
    -- cucumber
    {-0.375,-0.375,-0.125,0.3125,-0.25,0.125},
    {-0.375,-0.4375,-0.0625,0.3125,-0.375,0.0625},
    {-0.4375,-0.375,-0.0625,-0.375,-0.25,0.0625},
    {0.3125,-0.375,-0.0625,0.375,-0.25,0.0625},
    {-0.375,-0.25,-0.0625,0.3125,-0.1875,0.0625},
  },
}

-- node box {x=0, y=0, z=0}
node_box_board_with_lettuce = {
  type = "fixed",
  fixed = {
    {-0.4375,-0.5,-0.25,0.0625,-0.4375,0.25},
    {0.0625,-0.5,-0.1875,0.1875,-0.4375,0.1875},
    {0.1875,-0.5,-0.125,0.25,-0.4375,0.125},
    {0.25,-0.5,-0.0625,0.4375,-0.4375,0.0625},
    -- lettuce
    {0.125,-0.25,-0.25,0.25,-0.125,-0.1875},
    {-0.25,-0.375,-0.1875,0.25,-0.25,-0.125},
    {-0.25,-0.25,-0.1875,0.125,-0.125,0.1875},
    {0.125,-0.125,-0.1875,0.25,-0.0625,-0.125},
    {-0.25,-0.4375,-0.125,0.25,-0.375,0.125},
    {-0.375,-0.375,-0.125,0.125,-0.25,0.125},
    {-0.4375,-0.3125,-0.125,-0.375,-0.1875,0.125},
    {-0.375,-0.25,-0.125,-0.25,-0.125,0.125},
    {-0.25,-0.125,-0.125,0.125,-0.0625,0.125},
    {0.125,-0.0625,-0.125,0.25,0.0,0.125},
    {-0.4375,-0.375,-0.0625,-0.375,-0.3125,0.0625},
    {0.125,-0.3125,-0.0625,0.25,-0.25,0.0},
    {0.125,-0.25,-0.0625,0.1875,-0.1875,0.0625},
    {-0.4375,-0.1875,-0.0625,-0.375,-0.125,0.0625},
    {0.125,-0.3125,0.0,0.1875,-0.25,0.0625},
    {0.1875,-0.25,0.0,0.25,-0.1875,0.0625},
    {-0.25,-0.375,0.125,0.25,-0.25,0.1875},
    {0.125,-0.125,0.125,0.25,-0.0625,0.1875},
    {0.125,-0.25,0.1875,0.25,-0.125,0.25},
  },
}

local S = hardcook.translator;

minetest.register_craftitem( "hardcook:cutting_knife", {
  description = S("Cutting knife"),
  inventory_image = "hardcook_cutting_knife_inv.png",
  wield_image = "hardcook_cutting_knife_inv.png^[transformFY",
  stack_max = 1,
});

minetest.register_node( "hardcook:cutting_board_with_knife", {
  description = S("Cutting board with knife"),
  drawtype = "mesh",
  paramtype  = "light",
  paramtype2 = "facedir",
  mesh = "hardcook_cutting_board_with_knife.obj",
  selection_box = node_box_board_with_knife,
  collision_box = node_box_board_with_knife,
  tiles = {"hardcook_cutting_board.png", "hardcook_cutting_knife.png"},
  use_texture_alpha = "clip",
  --sunlight_propagates = true,
  groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = hardcook.use_not_in_creative_inventory},
  drop = "farming:cutting_board",
})

hardcook.set_on_place("farming:cutting_board", "hardcook:cutting_board_with_knife")

minetest.register_node( "hardcook:cutting_board", {
  description = S("Cutting board"),
  drawtype = "mesh",
  paramtype  = "light",
  paramtype2 = "facedir",
  mesh = "hardcook_cutting_board.obj",
  selection_box = node_box_board,
  collision_box = node_box_board,
  tiles = {"hardcook_cutting_board.png"},
  use_texture_alpha = "clip",
  --sunlight_propagates = true,
  groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = hardcook.use_not_in_creative_inventory},
})

if (hardcook.have_unified) then
  unified_inventory.register_craft_type("place_cutting_board", {
      description = S("place");
      icon = "farming_cutting_board.png",
      width = 2,
      height = 1,
    })
  unified_inventory.register_craft_type("cutting_board", {
      description = S("cutting");
      icon = "farming_cutting_board.png",
      width = 2,
      height = 1,
    })
end

if (hardcook.dirty_dishes) then
  minetest.register_craftitem( "hardcook:cutting_knife_dirty", {
    description = S("Dirty cutting knife"),
    inventory_image = "hardcook_cutting_knife_dirty_inv.png",
    wield_image = "hardcook_cutting_knife_dirty_inv.png^[transformFY",
    stack_max = 1,
  });
  minetest.register_node( "hardcook:cutting_board_dirty", {
    description = S("Dirty cutting board"),
    drawtype = "mesh",
    paramtype  = "light",
    paramtype2 = "facedir",
    mesh = "hardcook_cutting_board.obj",
    selection_box = node_box_board,
    collision_box = node_box_board,
    tiles = {"hardcook_cutting_board_dirty.png"},
    --sunlight_propagates = true,
    groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = hardcook.use_not_in_creative_inventory},
  })
else
  minetest.register_alias("hardcook:cutting_board_dirty", "hardcook:cutting_board");
  minetest.register_alias("hardcook:cutting_knife_dirty", "hardcook:cutting_knife");
end
minetest.register_alias("hardcook:cutting_board_dirty_node", "hardcook:cutting_board");

-- apple
minetest.register_node( "hardcook:cutting_board_with_apple", {
  description = S("Cutting board with apple"),
  stack_max = 1,
  drawtype = "mesh",
  paramtype  = "light",
  paramtype2 = "facedir",
  mesh = "hardcook_cutting_board_with_apple.obj",
  selection_box = node_box_board_with_apple,
  collision_box = node_box_board_with_apple,
  tiles = {"hardcook_cutting_board.png", "hardcook_cutting_apple.png"},
  use_texture_alpha = "clip",
  --sunlight_propagates = true,
  groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = hardcook.use_not_in_creative_inventory},
})
minetest.register_node( "hardcook:cutting_board_with_chopped_apple", {
  description = S("Cutting board with chopped apple"),
  stack_max = 1,
  drawtype = "mesh",
  paramtype  = "light",
  paramtype2 = "facedir",
  mesh = "hardcook_cutting_board_with_chopped.obj",
  selection_box = node_box_board_with_chopped,
  collision_box = node_box_board_with_chopped,
  tiles = {"hardcook_cutting_board.png", "hardcook_cutting_chopped_apple.png"},
  --sunlight_propagates = true,
  groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = hardcook.use_not_in_creative_inventory},
})

-- beetroot
minetest.register_node( "hardcook:cutting_board_with_beetroot", {
  description = S("Cutting board with beetroot"),
  stack_max = 1,
  drawtype = "mesh",
  paramtype  = "light",
  paramtype2 = "facedir",
  mesh = "hardcook_cutting_board_with_beetroot.obj",
  selection_box = node_box_board_with_beetroot,
  collision_box = node_box_board_with_beetroot,
  tiles = {"hardcook_cutting_board.png", "hardcook_cutting_beetroot.png"},
  use_texture_alpha = "clip",
  --sunlight_propagates = true,
  groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = hardcook.use_not_in_creative_inventory},
})
minetest.register_node( "hardcook:cutting_board_with_chopped_beetroot", {
  description = S("Cutting board with chopped beetroot"),
  stack_max = 1,
  drawtype = "mesh",
  paramtype  = "light",
  paramtype2 = "facedir",
  mesh = "hardcook_cutting_board_with_chopped.obj",
  selection_box = node_box_board_with_chopped,
  collision_box = node_box_board_with_chopped,
  tiles = {"hardcook_cutting_board.png", "hardcook_cutting_chopped_beetroot.png"},
  --sunlight_propagates = true,
  groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = hardcook.use_not_in_creative_inventory},
})

-- onion
minetest.register_node( "hardcook:cutting_board_with_onion", {
  description = S("Cutting board with onion"),
  stack_max = 1,
  drawtype = "mesh",
  paramtype  = "light",
  paramtype2 = "facedir",
  mesh = "hardcook_cutting_board_with_onion.obj",
  selection_box = node_box_board_with_onion,
  collision_box = node_box_board_with_onion,
  tiles = {"hardcook_cutting_board.png", "hardcook_cutting_onion.png"},
  use_texture_alpha = "clip",
  --sunlight_propagates = true,
  groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = hardcook.use_not_in_creative_inventory},
})
minetest.register_node( "hardcook:cutting_board_with_chopped_onion", {
  description = S("Cutting board with chopped onion"),
  stack_max = 1,
  drawtype = "mesh",
  paramtype  = "light",
  paramtype2 = "facedir",
  mesh = "hardcook_cutting_board_with_chopped.obj",
  selection_box = node_box_board_with_chopped,
  collision_box = node_box_board_with_chopped,
  tiles = {"hardcook_cutting_board.png", "hardcook_cutting_chopped_onion.png"},
  --sunlight_propagates = true,
  groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = hardcook.use_not_in_creative_inventory},
})

-- cabbage
minetest.register_node( "hardcook:cutting_board_with_cabbage", {
  description = S("Cutting board with cabbage"),
  stack_max = 1,
  drawtype = "mesh",
  paramtype  = "light",
  paramtype2 = "facedir",
  mesh = "hardcook_cutting_board_with_cabbage.obj",
  selection_box = node_box_board_with_cabbage,
  collision_box = node_box_board_with_cabbage,
  tiles = {"hardcook_cutting_board.png", "hardcook_cutting_cabbage.png"},
  use_texture_alpha = "clip",
  --sunlight_propagates = true,
  groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = hardcook.use_not_in_creative_inventory},
})
minetest.register_node( "hardcook:cutting_board_with_chopped_cabbage", {
  description = S("Cutting board with chopped cabbage"),
  stack_max = 1,
  drawtype = "mesh",
  paramtype  = "light",
  paramtype2 = "facedir",
  mesh = "hardcook_cutting_board_with_chopped.obj",
  selection_box = node_box_board_with_chopped,
  collision_box = node_box_board_with_chopped,
  tiles = {"hardcook_cutting_board.png", "hardcook_cutting_chopped_cabbage.png"},
  --sunlight_propagates = true,
  groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = hardcook.use_not_in_creative_inventory},
})

-- carrot
minetest.register_node( "hardcook:cutting_board_with_carrot", {
  description = S("Cutting board with carrot"),
  stack_max = 1,
  drawtype = "mesh",
  paramtype  = "light",
  paramtype2 = "facedir",
  mesh = "hardcook_cutting_board_with_carrot.obj",
  selection_box = node_box_board_with_carrot,
  collision_box = node_box_board_with_carrot,
  tiles = {"hardcook_cutting_board.png", "hardcook_cutting_carrot.png"},
  use_texture_alpha = "clip",
  --sunlight_propagates = true,
  groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = hardcook.use_not_in_creative_inventory},
})
minetest.register_node( "hardcook:cutting_board_with_chopped_carrot", {
  description = S("Cutting board with chopped carrot"),
  stack_max = 1,
  drawtype = "mesh",
  paramtype  = "light",
  paramtype2 = "facedir",
  mesh = "hardcook_cutting_board_with_chopped.obj",
  selection_box = node_box_board_with_chopped,
  collision_box = node_box_board_with_chopped,
  tiles = {"hardcook_cutting_board.png", "hardcook_cutting_chopped_carrot.png"},
  --sunlight_propagates = true,
  groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = hardcook.use_not_in_creative_inventory},
})

-- brown_mushroom
minetest.register_node( "hardcook:cutting_board_with_brown_mushroom", {
  description = S("Cutting board with brown_mushroom"),
  stack_max = 1,
  drawtype = "mesh",
  paramtype  = "light",
  paramtype2 = "facedir",
  mesh = "hardcook_cutting_board_with_mushroom.obj",
  selection_box = node_box_board_with_mushroom,
  collision_box = node_box_board_with_mushroom,
  tiles = {"hardcook_cutting_board.png", "hardcook_cutting_brown_mushroom.png"},
  use_texture_alpha = "clip",
  --sunlight_propagates = true,
  groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = hardcook.use_not_in_creative_inventory},
})
minetest.register_node( "hardcook:cutting_board_with_chopped_brown_mushroom", {
  description = S("Cutting board with chopped brown_mushroom"),
  stack_max = 1,
  drawtype = "mesh",
  paramtype  = "light",
  paramtype2 = "facedir",
  mesh = "hardcook_cutting_board_with_chopped.obj",
  selection_box = node_box_board_with_chopped,
  collision_box = node_box_board_with_chopped,
  tiles = {"hardcook_cutting_board.png", "hardcook_cutting_chopped_brown_mushroom.png"},
  --sunlight_propagates = true,
  groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = hardcook.use_not_in_creative_inventory},
})

-- tomato
minetest.register_node( "hardcook:cutting_board_with_tomato", {
  description = S("Cutting board with tomato"),
  stack_max = 1,
  drawtype = "mesh",
  paramtype  = "light",
  paramtype2 = "facedir",
  mesh = "hardcook_cutting_board_with_tomato.obj",
  selection_box = node_box_board_with_tomato,
  collision_box = node_box_board_with_tomato,
  tiles = {"hardcook_cutting_board.png", "hardcook_cutting_tomato.png"},
  use_texture_alpha = "clip",
  --sunlight_propagates = true,
  groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = hardcook.use_not_in_creative_inventory},
})
minetest.register_node( "hardcook:cutting_board_with_chopped_tomato", {
  description = S("Cutting board with chopped tomato"),
  stack_max = 1,
  drawtype = "mesh",
  paramtype  = "light",
  paramtype2 = "facedir",
  mesh = "hardcook_cutting_board_with_chopped.obj",
  selection_box = node_box_board_with_chopped,
  collision_box = node_box_board_with_chopped,
  tiles = {"hardcook_cutting_board.png", "hardcook_cutting_chopped_tomato.png"},
  --sunlight_propagates = true,
  groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = hardcook.use_not_in_creative_inventory},
})

-- cucumber
minetest.register_node( "hardcook:cutting_board_with_cucumber", {
  description = S("Cutting board with cucumber"),
  stack_max = 1,
  drawtype = "mesh",
  paramtype  = "light",
  paramtype2 = "facedir",
  mesh = "hardcook_cutting_board_with_cucumber.obj",
  selection_box = node_box_board_with_cucumber,
  collision_box = node_box_board_with_cucumber,
  tiles = {"hardcook_cutting_board.png", "hardcook_cutting_cucumber.png"},
  use_texture_alpha = "clip",
  --sunlight_propagates = true,
  groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = hardcook.use_not_in_creative_inventory},
})
minetest.register_node( "hardcook:cutting_board_with_chopped_cucumber", {
  description = S("Cutting board with chopped cucumber"),
  stack_max = 1,
  drawtype = "mesh",
  paramtype  = "light",
  paramtype2 = "facedir",
  mesh = "hardcook_cutting_board_with_chopped.obj",
  selection_box = node_box_board_with_chopped,
  collision_box = node_box_board_with_chopped,
  tiles = {"hardcook_cutting_board.png", "hardcook_cutting_chopped_cucumber.png"},
  --sunlight_propagates = true,
  groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = hardcook.use_not_in_creative_inventory},
})

-- lettuce
minetest.register_node( "hardcook:cutting_board_with_lettuce", {
  description = S("Cutting board with lettuce"),
  stack_max = 1,
  drawtype = "mesh",
  paramtype  = "light",
  paramtype2 = "facedir",
  mesh = "hardcook_cutting_board_with_lettuce.obj",
  selection_box = node_box_board_with_lettuce,
  collision_box = node_box_board_with_lettuce,
  tiles = {"hardcook_cutting_board.png", "hardcook_cutting_lettuce1.png", "hardcook_cutting_lettuce2.png"},
  use_texture_alpha = "clip",
  --sunlight_propagates = true,
  groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = hardcook.use_not_in_creative_inventory},
})
minetest.register_node( "hardcook:cutting_board_with_chopped_lettuce", {
  description = S("Cutting board with chopped lettuce"),
  stack_max = 1,
  drawtype = "mesh",
  paramtype  = "light",
  paramtype2 = "facedir",
  mesh = "hardcook_cutting_board_with_chopped.obj",
  selection_box = node_box_board_with_chopped,
  collision_box = node_box_board_with_chopped,
  tiles = {"hardcook_cutting_board.png", "hardcook_cutting_chopped_lettuce.png"},
  --sunlight_propagates = true,
  groups = {oddly_breakable_by_hand = 1, dig_immediate = 2, not_in_creative_inventory = hardcook.use_not_in_creative_inventory},
})

