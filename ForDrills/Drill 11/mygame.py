import game_framework
import pico2d
import os;

import main_state

os.chdir("D:\\_git\\2016184041-Drills\\ForDrills\\Lecture14_Collision");
pico2d.open_canvas(1600, 600)
game_framework.run(main_state)
pico2d.close_canvas()