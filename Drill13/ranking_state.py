
import random
import json
import pickle
import os

from pico2d import *
import game_framework
import game_world

import main_state
import world_build_state

from zombie import Zombie


font = None


name = "rankingState"

menu = None;
ranking = [];

def enter():
    global menu, font;

    menu = load_image('menu.png');
    font = load_font('ENCR10B.TTF');
    
    hide_cursor()
    hide_lattice()

    load_ranking();
    add_boy_record();


def exit():
    # 저장.
    print("exit")
    global menu;
    del menu;
    save_ranking();

def pause():
    pass

def resume():
    pass

def get_boy():
    return boy







def handle_events():
    events = get_events()
    for event in events:
        if event.type == SDL_QUIT:
            game_framework.quit()
        elif event.type == SDL_KEYDOWN and event.key == SDLK_ESCAPE:
            game_framework.change_state(world_build_state);

def update():
    pass

def draw():
    global font, ranking;
    clear_canvas()
    menu.clip_draw(0, 0 , 10, 10, get_canvas_width()//2, get_canvas_height()//2, 800, 1000);

    font.draw(300, 850, "[Total Ranking]",(255, 255, 255));

    if 10 <= len(ranking):
        for i in range(10):
            string = "#{0}. {1}".format(i+1, ranking[i]);
            font.draw(300, 80 * (10 - i), string );
    else :
        i = 0;
        for r in ranking:
            string = "#{0}. {1}".format(i+1, r);
            i +=1;
            font.draw(300, 80 * (10 - i), string );

    update_canvas()


def add_boy_record():
    global ranking;
    from boy import Boy;

    ranking.append(get_time() - Boy.my_boy.start_time);
    ranking.sort(reverse = True);
    top_ten_ranking = ranking[:10];
    ranking = top_ten_ranking;


def save_ranking():
    from boy import Boy;

    global objects, ranking;
    
    top_ten_ranking = ranking[:10];

    ranking_dict = {};
    for idx in range(len(top_ten_ranking)): 
        ranking_dict[idx] = top_ten_ranking[idx];

    with open('ranking.json', 'w') as f:
        json.dump(ranking_dict , f);

def load_ranking():
    global ranking;

    ranking_dict = {};
    with open('ranking.json', 'r') as f:
        ranking_dict = json.load(f);
    print(ranking_dict);

    loaded_ranking = [];
    for i in range(len(ranking_dict)):
        loaded_ranking.append(ranking_dict[str(i)]);

    ranking = loaded_ranking;





