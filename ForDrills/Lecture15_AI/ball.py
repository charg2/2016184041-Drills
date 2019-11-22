import random
from pico2d import *
import game_world
import game_framework

from const import *;


class Ball:
    image = None

    def __init__(self):
        if Ball.image == None:
            Ball.image = load_image('ball21x21.png')
            
        self.x, self.y, self.fall_speed = random.randint(0, Const.WIN_WIDTH), random.randint(0, Const.WIN_HEIGHT), 0
        self.backup_fall_speed = self.fall_speed;
        self.hp = 100;

    def get_bb(self):
        return self.x - 10, self.y - 10, self.x + 10, self.y +10;

    def draw(self):
        self.image.draw(self.x, self.y)
        draw_rectangle(*self.get_bb())

    def update(self):
        pass;


