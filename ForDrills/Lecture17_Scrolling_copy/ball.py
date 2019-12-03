import random
from pico2d import *
import game_world
import game_framework
from background import FixedBackground as Background;


class Ball:
    image = None

    def __init__(self):
        if Ball.image == None:
            Ball.image = load_image('ball21x21.png')
        self.x, self.y, self.fall_speed = random.randint(0, Background.get_instance().w-1), random.randint(0, Background.get_instance().h-1), 0
        self.bg = None;
        self.canvas_width = get_canvas_width()
        self.canvas_height = get_canvas_height()

    def set_background(self, bg):
        self.bg = bg;

    def get_bb(self):
        return self.x - 10, self.y - 10, self.x + 10, self.y + 10

    def draw(self):
        #x  =  clamp( 0, self.x - self.bg.window_left, self.bg.w);
        x  =  self.x - self.bg.window_left;
        y  =  self.y - self.bg.window_bottom;

        self.image.draw(x, y)
        draw_rectangle(x-10, y-10 ,x+10,y +10)

    def update(self):
        self.y -= self.fall_speed * game_framework.frame_time

