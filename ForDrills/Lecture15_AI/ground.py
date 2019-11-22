from pico2d import *
from const import *;

class Ground:
    def __init__(self):
        self.image = load_image('KPU_GROUND.png')

    def update(self):
        pass

    def draw(self):
        self.image.draw(Const.WIN_WIDTH // 2, Const.WIN_HEIGHT // 2)

