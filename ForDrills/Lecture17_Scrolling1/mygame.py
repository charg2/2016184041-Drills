import game_framework
import pico2d
import os;

import main_state

os.chdir("Lecture17_Scrolling1");
pico2d.open_canvas(800, 600)
game_framework.run(main_state)
pico2d.close_canvas()