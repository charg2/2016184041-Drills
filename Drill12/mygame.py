import game_framework
import pico2d
import os;
import main_state


os.chdir("Lecture15_AI");
pico2d.open_canvas(1280, 1024)
game_framework.run(main_state)
pico2d.close_canvas()