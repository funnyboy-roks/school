#################################
#      author: Hayden Pott      #
#        date: Today            #
# description: Person but in 2d #
#################################
import pygame
from random import randint, choice
from Constants import *

# (This is just my submission from program 1, but I don't want to put it in another file :P

constrain = lambda n, l, h: min(h, max(l, n))
class Item:
    MAX_X = 800
    MAX_Y = 600

    def __init__(self, name='player 1', x=0, y=0):
        self.name = name
        self.x = x
        self.y = y
        self.size = 1

    @property
    def x(self): return self._x

    @x.setter
    def x(self, x): self._x = constrain(x, 0, Item.MAX_X)

    @property
    def y(self): return self._y

    @y.setter
    def y(self, y): self._y = constrain(y, 0, Item.MAX_Y)

    @property
    def name(self): return self._name

    @name.setter
    def name(self, name): self._name = name if len(name) > 2 else 'player 1'

    @property
    def size(self): return self._size

    @size.setter
    def size(self, size): self._size = size if size >= 1 else self._size

    def __str__(self):
        return f'Person({self.name}):\tsize = {self.size},\tx = {self.x}\ty = {self.y}'

    # This should be go_left :'(
    def goLeft(self, amt=1): self.x -= amt

    # This should be go_right :'(
    def goRight(self, amt=1): self.x += amt

    # This should be go_up :'(
    def goUp(self, amt=1): self.y -= amt

    # This should be go_down :'(
    def goDown(self, amt=1): self.y += amt

    # This should be get_distance :'(
    def getDistance(self, other):
        return ((self.x - other.x) ** 2 + (self.y - other.y) ** 2) ** (1/2)

class Person(pygame.sprite.Sprite, Item):
    def __init__(self):
        Item.__init__(self)
        self.set_colour()
        self.surf = pygame.surface.Surface((self.size, self.size))
        self.surf.fill(self.colour)

    def set_colour(self):
        self.colour = [randint(0, 255), randint(0, 255), randint(0, 255)]

    def set_size(self):
        self.size = randint(10, 100)
        self.surf = pygame.surface.Surface((self.size, self.size))
        self.surf.fill(self.colour)

    def rand_pos(self):
        self.x = randint(0, WIDTH);
        self.y = randint(0, HEIGHT);

    def get_pos(self): return (self.x, self.y)

    def update(self, d):
        if d[K_UP]:
            self.goUp()
        if d[K_DOWN]:
            self.goDown()
        if d[K_LEFT]:
            self.goLeft()
        if d[K_RIGHT]:
            self.goRight()
        if d[K_SPACE]:
            self.set_size()
            self.set_colour()

###############-main-game-###############
# DON'T CHANGE ANYTHING BELOW THIS LINE #
###############-----------###############
# No promises ;)

# Initialize pygame library and display
pygame.init()
screen = pygame.display.set_mode((WIDTH, HEIGHT))

# Create a person object
p = Person()
RUNNING = True  # A variable to determine whether to get out of the
                # infinite game loop

while (RUNNING):
    # Look through all the events that happened in the last frame to see
    # if the user tried to exit.
    for event in pygame.event.get():
        if (event.type == KEYDOWN and event.key == K_ESCAPE):
            RUNNING = False
        elif (event.type == QUIT):
            RUNNING = False
        elif (event.type == KEYDOWN and event.key == K_SPACE):
            print(p)

    # Otherwise, collect the list/dictionary of all the keys that were
    # pressed
    pressedKeys = pygame.key.get_pressed()
    
    # and then send that dictionary to the Person object for them to
    # update themselves accordingly.
    p.update(pressedKeys)

    # fill the screen with a color
    screen.fill(WHITE)
    # then transfer the person to the screen
    screen.blit(p.surf, p.get_pos())
    pygame.display.flip()
