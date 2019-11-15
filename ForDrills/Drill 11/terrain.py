import game_framework
from pico2d import *
from ball import Ball;
from boy import Boy;



class Terrain:
    WIDTH = 0;
    HEIGHT = 0;

    def __init__(self):
        self.x, self.y = 1600 // 2, 200;
        self.image = load_image('brick180x40.png')
        self.dir = 1
        self.velocity = 1;
        Terrain.WIDTH = self.image.w;
        Terrain.HEIGHT = self.image.h;
        return;

    def get_bb(self):
        return self.x - Terrain.WIDTH//2, self.y +20, self.x + Terrain.WIDTH//2, self.y + 20;

    def update(self):
        if self.x > (1600 -1) or self.x < 0:
            self.dir *= -1;
        self.x += (self.dir * self.velocity);

    def draw(self):
        self.image.draw(self.x , self.y , Terrain.WIDTH, Terrain.HEIGHT );
        #self.image.draw(*self.get_bb());
        draw_rectangle(*self.get_bb());

    
