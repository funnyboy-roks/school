####################################
# author: Hayden Pott              #
# date: Today                      #
# description: Person or something #
####################################

# global Constants to restrict the maximum x and y values that a person object
# can have.
MAX_X = 800
MAX_Y = 600

# Returns closest value to `n` that's in `[l, h]`
constrain = lambda n, l, h: min(h, max(l, n))

# A class representing a person. A person can be initialized with a
# name, as well as x and y coordinates. However, there are default
# values for all those (i.e. player 1, 0 and 0 respectively). A person
# also has a size which is set to 1 by default. A person can go left, 
# go right, go up and go down. A person also has a string function 
# that prints out their name location, and size. A person also has a 
# function that calculates the euclidean distance from another person 
# object.
class Person:
    def __init__(self, name='player 1', x=0, y=0):
        self.name = name
        self.x = x
        self.y = y
        self.size = 1

    @property
    def x(self): return self._x

    @x.setter
    def x(self, x): self._x = constrain(x, 0, MAX_X)

    @property
    def y(self): return self._y

    @y.setter
    def y(self, y): self._y = constrain(y, 0, MAX_Y)

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
