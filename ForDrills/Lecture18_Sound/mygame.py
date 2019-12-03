import game_framework
import pico2d
import os;

import main_state

os.chdir("Lecture18_Sound");
pico2d.open_canvas(1600, 600)
game_framework.run(main_state)
pico2d.close_canvas()