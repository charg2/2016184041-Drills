import game_framework
from pico2d import *

import game_world

# Bird Run Speed
# fill expressions correctly
# 1px == 1cm 
# width 183
# heigt 168

PIXEL_PER_METER = (10.0 / 0.10) ;   #  10 pixel 당 10cm
RUN_SPEED_KMPH = 20.0               #  Km / Hour
RUN_SPEED_MPM = ( RUN_SPEED_KMPH * 1000.0 / 60.0 )
RUN_SPEED_MPS = ( RUN_SPEED_MPM / 60.0)
RUN_SPEED_PPS = ( RUN_SPEED_MPS * PIXEL_PER_METER);

BIRD_PIXEL_WIDTH  = 1.0 * PIXEL_PER_METER;
BIRD_PIXEL_HEIGHT = 1.0 * PIXEL_PER_METER;

# Bird Action Speed
# fill expressions correctly
TIME_PER_ACTION = 1.0;
ACTION_PER_TIME = 1.0 / TIME_PER_ACTION;
FRAMES_PER_ACTION = 14

frame_table = { 0 : (0, 0),  1 : (1, 0), 2  : (2, 0), 3  : (3, 0), 4 : (4, 0), 
                5 : (0, 1),  6 : (1, 1), 7  : (2, 1), 8  : (3, 1), 9 : (4, 1) ,
               10 : (0, 2), 11 : (1, 2), 12 : (2, 2), 13 : (3, 2)  }


class RunState:

    @staticmethod
    def enter(bird, event):
        bird.velocity += RUN_SPEED_PPS;
        bird.dir = 1;

    @staticmethod
    def exit(bird, event):
        pass;

    @staticmethod
    def do(bird):
        bird.frame = (bird.frame + FRAMES_PER_ACTION * ACTION_PER_TIME * game_framework.frame_time) % 14
        
        bird.x += bird.velocity * game_framework.frame_time;
        print(bird.x);
        if bird.x > 1550 or bird.x < 25 :
            bird.velocity *= -1;
            bird.dir *= -1;


    @staticmethod
    def draw(bird):
        xy = frame_table[int(bird.frame)];
        print("{0}-({1},{2})".format(int(bird.frame),xy[0], xy[1]));
        if bird.dir == 1:
            bird.image.clip_composite_draw(xy[0]  * 183, xy[1] * 168, 183, 168, 0, '' ,bird.x, bird.y,BIRD_PIXEL_WIDTH, BIRD_PIXEL_HEIGHT);
        else :
            bird.image.clip_composite_draw(xy[0]  * 183, xy[1] * 168, 183, 168, 0, 'h' ,bird.x, bird.y,BIRD_PIXEL_WIDTH, BIRD_PIXEL_HEIGHT);
        #bird.image.clip_draw(xy[0]  * 183, xy[1] * 168, 183, 168, bird.x, bird.y);
        return;


class Bird:
    def __init__(self):
        self.x, self.y = 1600 // 2, 390;
        self.image = load_image('bird_animation.png');
        self.dir = 1;
        self.velocity = 0;
        self.frame = 0;
        self.event_que = [];
        self.cur_state = RunState;
        self.cur_state.enter(self, None);
        self.xx, self.yy = 0, 0;

    def update(self):
        self.cur_state.do(self)

    def draw(self):
        self.cur_state.draw(self)


