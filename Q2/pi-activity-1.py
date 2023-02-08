#############################################
# Name: Hayden Pott                         #
# Date: 02 Feb 2023                         #
# Desc: Something Something Rooms Something #
#############################################
class Room:
    def __init__(self, name):
        self.name = name
        self.exits = []
        self.exit_locations = []
        self.items = []
        self.item_descriptions = []
        self.grabbables = []

    def add_exit(self, ex, room):
        self.exits.append(ex)
        self.exit_locations.append(room)

    def add_item(self, item, desc):
        self.items.append(item)
        self.item_descriptions.append(desc)

    def add_grabbable(self, grababble):
        self.grabbables.append(grababble)

    def rm_grabbable(self, item):
        self.grabbables.remove(item)

    def __str__(self):
        return f'You are in {self.name}\nYou see: {", ".join(self.items)}\nYou can grab: {", ".join(self.grabbables)}\nExits: {", ".join(self.exits)}'


def create_rooms():
    global current_room

    r1 = Room('Room 1')
    r2 = Room('Room 2')
    r3 = Room('Room 3')
    r4 = Room('Room 4')

    r1.add_exit('East', r2)
    r1.add_exit('South', r3)

    r1.add_grabbable('key')
    r1.add_item('chair', 'It is made of wicker and no one is sitting on it.')
    r1.add_item('table', 'It is made of oak. A golden key rests on it.')

    r2.add_exit('West', r1)
    r2.add_exit('South', r4)

    r2.add_item('rug', 'It is nice and Indian.  It also needs to be vacuumed.')
    r2.add_item('fireplace', 'It is full of ashes.')

    r3.add_exit('North', r1)
    r3.add_exit('East', r4)
    r3.add_grabbable('book')

    r3.add_item('book shelf', 'It is empty. Go figure.')
    r3.add_item('statue', 'There is nothing special about it.')
    r3.add_item('desk', 'The statue is resting on it. So is a book.')

    r4.add_exit('north', r2)
    r4.add_exit('west', r3)
    r4.add_exit('south', None)

    r4.add_grabbable('knife') # Added
    r4.add_grabbable('cutting board') # Added
    r4.add_grabbable('wooden spoon') # Added
    r4.add_item('sink', 'A simple sink, used for washing stuff...') # Added
    r4.add_item('stovetop', 'Still warm to the touch, someone was here recently') # Added

    current_room = r1


def death():
    # I'm not typing/copying that, I don't care enough, here's a skull for you
    print('💀')


create_rooms()
inventory = []
while True:
    status = f'Room: {current_room}\nYou are carrying {inventory}'

    if current_room == None:
        death()
        break

    print('=' * 60)
    print(status)
    action = input('What would you like to do?\n> ').lower().strip()

    if action in ['quit', 'exit', 'bye']:
        break

    response = 'Invalid input.'
    if ' ' in action:
        # There, now one can use spaces
        space_pos = action.index(' ')
        verb, noun = action[:space_pos], action[space_pos+1:]

        if verb == 'go':
            response = 'Invalid exit'
            for i in range(len(current_room.exits)):
                if noun == current_room.exits[i].lower():
                    current_room = current_room.exit_locations[i]
                    response = 'Room changed'
                    break
        elif verb == 'look':
            response = 'Item not found.'
            for i in range(len(current_room.items)):
                if noun == current_room.items[i]:
                    response = current_room.item_descriptions[i]
                    break
        elif verb == 'take':
            response = 'Item not found.'
            for grabbable in current_room.grabbables:
                if noun == grabbable:
                    inventory.append(grabbable)
                    current_room.del_grabbable(grabbable)
                    response = "Item taken."
                    break
    print(response)

print('\nGoodbye')
