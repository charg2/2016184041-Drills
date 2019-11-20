import game_framework
import pico2d
import os;
import main_state


os.chdir("C:\\_Git\\2016184041-Drills\\Lecture15_AI");
pico2d.open_canvas(1280, 1024)
game_framework.run(main_state)
pico2d.close_canvas()