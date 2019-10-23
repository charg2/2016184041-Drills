import game_framework;
import pico2d
import os;

import start_state;
import pause_state;

os.chdir("assets");


pico2d.open_canvas();
game_framework.run(start_state);
pico2d.close_canvas();
# fill here
