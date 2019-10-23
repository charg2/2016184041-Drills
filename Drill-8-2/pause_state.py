import game_framework
import main_state;
from pico2d import *


name = "PauseState"
image = None
boy = None;
grass = None;
logo_time = 0.0;

def enter():
    global image;
    image = load_image('pause.png');
    #boy = main_state.boy;
    #grass = main_state.grass;

def exit():
    global image;
    del(image);


def update():
    pass;


def draw():
    global image;
    global logo_time;
    clear_canvas();

    # 8-2
    if logo_time > 0.1:
        logo_time = 0;
        image.draw(400, 300);
    delay(0.01);
    logo_time += 0.01;

    main_state.boy.draw();
    main_state.grass.draw();
   # 8 -2
    update_canvas();




def handle_events():
    events = get_events();
    for event in events:
        if event.type == SDL_QUIT:
            game_framework.quit();
        else:
            if (event.type, event.key) == (SDL_KEYDOWN, SDLK_ESCAPE):
                game_framework.quit();
            elif event.type == SDL_KEYDOWN and event.key == SDLK_p:
                game_framework.pop_state();



def pause(): pass


def resume(): pass




