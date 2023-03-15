#####################
# name: Hayden Pott #
# date: Today       #
# desc: Something   #
#####################

# This game is very similar to a game that I used to teach in an introductory javascript course
# We did it more ninja-themed since it was for younger children and we were called "Code Ninjas"
#
# This has also informed me on how right I am to avoid python and pygame at all costs for any purpose.
# This little bit of messing with pygame that I've done for program 2 and this one have been literal Hell
# pygame is not all all friendly to work with and there's so many small nuances that don't do anything but
# frustrate the user...

import pygame
from pygame import freetype
from time import sleep
from Constants import *
import math

WIDTH, HEIGHT = 800, 600

tuple_add = lambda a, b: (a[0] + b[0], a[1] + b[1])
constrain = lambda n, l, h: min(h, max(l, n))

class Player(pygame.sprite.Sprite):
    """ The class for the player """
    COLOUR = 0x0000ff
    HEIGHT = 80
    WIDTH = 50

    def __init__(self):
        self.pos = (WIDTH / 2 - Player.WIDTH / 2, HEIGHT - Player.HEIGHT)
        # Delta Y or Velocity
        self.dy = 0
        # Acceleration for Y
        self.ay = 3

        self.jumping = False

        # Prep the surface for the player
        self.surf = pygame.surface.Surface((Player.WIDTH, Player.HEIGHT))
        self.surf.fill(Player.COLOUR)

    def move(self, amount):
        """ Move the player left/right by the given amount """

        self.pos = tuple_add(self.pos, (amount, 0))
        new_x = constrain(self.pos[0], 0, WIDTH - Player.WIDTH)
        self.pos = (new_x, self.pos[1])

    def tick(self):
        """ Update a player's information/position """

        # Update the player's height based on dy and ay
        self.pos = (self.pos[0], self.pos[1] + self.dy)
        self.dy += self.ay

        # Prevent the player from leaving the screen
        new_x = constrain(self.pos[0], 0, WIDTH - Player.WIDTH)
        new_y = constrain(self.pos[1], 0, HEIGHT - Player.HEIGHT)

        # If the player is on the ground, reset the jumping state to false
        if new_y == HEIGHT - Player.HEIGHT:
            self.jumping = False
        self.pos = (new_x, new_y)

    def jump(self):
        """ Apply a jump force to the player """

        if self.jumping: return # Prevent from jumping while already jumping

        self.dy = -30
        self.jumping = True


class Bullet(pygame.sprite.Sprite):
    """ The class for each bullet """

    COLOUR = 0x55ff77 # The colour that the bullet will be
    SPEED = 50        # The speed at which the bullet travels
    WIDTH = 5
    HEIGHT = 15

    def __init__(self, pos):
        self.pos = pos
        self.surf = pygame.surface.Surface((Bullet.WIDTH, Bullet.HEIGHT))
        self.surf.fill(Bullet.COLOUR)

    def tick(self, screen):
        self.pos = (self.pos[0], self.pos[1] - Bullet.SPEED)
        screen.blit(self.surf, self.pos)
        # The rect is taller than the bullet itself so that we don't accidentally skip over anything (when Bullet.SPEED > Spider.HEIGHT)
        #     The maths in the height makes the hitbox extend to the top of this bullet in the previous frame
        self.rect = pygame.Rect(self.pos, (Bullet.WIDTH, Bullet.HEIGHT + Bullet.SPEED + Bullet.HEIGHT))
        return self.pos[1] < 0

class Spider(pygame.sprite.Sprite):
    """ Handles the display of the spiders """

    WIDTH = 30
    HEIGHT = 30
    
    @classmethod
    def rand_colour(cls):
        """ Get a random colour for the spider """
        return (randint(0x77, 0xff), randint(0x00, 0x55), randint(0x00, 0x55))

    def __init__(self, speed, y):
        self.speed = speed
        self.pos = (-Spider.WIDTH, y);

        self.surf = pygame.surface.Surface((Spider.WIDTH, Spider.HEIGHT))
        self.surf.fill(Spider.rand_colour())

    def tick(self, screen):
        """ Update the spider's position """
        self.pos = tuple_add(self.pos, (self.speed, 0));
        screen.blit(self.surf, self.pos)
        self.rect = pygame.Rect(self.pos, (Spider.WIDTH, Spider.HEIGHT))
        return self.pos[0] > WIDTH

def show_score(screen, score):
    """ Show the score UI element """

    font = freetype.SysFont('Anonymous Pro', 30)
    font.render_to(screen, (0, 0), f'Score: {score}', 0xf4f4f4ff)

def show_health(screen, hearts, max_hearts):
    """ Show the health UI element """

    HEART_SIZE = 20  # The size of the heart icon
    PADDING = 3      # The padding around each heart icon

    # Create the `Health: ` text
    font = freetype.SysFont('Anonymous Pro', 30)
    text, rect = font.render(f'Health: ', 0xf4f4f4ff)
    screen.blit(text, (0, 30))

    # Create the surface for the hearts to show and fill it with black
    surf = pygame.surface.Surface(((HEART_SIZE + PADDING) * max_hearts + PADDING, HEART_SIZE + 2 * PADDING))
    surf.fill(0x000000)

    # Create each heart and have it display on the surface
    for i in range(max_hearts):
        heart_surf = pygame.surface.Surface((HEART_SIZE, HEART_SIZE))
        heart_surf.fill(0xff0000 if i < hearts else 0x440000)
        surf.blit(
            heart_surf,
            (
                i * (HEART_SIZE + PADDING) + PADDING, # x
                PADDING # y
            )
        )

    # Put the hearts UI element on the screen
    screen.blit(surf, (rect.x + rect.width, 30))

def display_death(screen, score, frame_count):
    """ Show the death UI element """

    # Draw the "You Died" text the centre
    font = freetype.SysFont('Anonymous Pro', 150)
    text, rect = font.render(f'You Died!', 0xff0000ff)
    screen.blit(text, (WIDTH / 2 - rect.width / 2, HEIGHT / 2 - rect.height))

    # Draw the score just below the centre
    font = freetype.SysFont('Anonymous Pro', 30)
    text, rect = font.render(f'Score: {score}', 0xf4f4f4ff)
    screen.blit(text, (WIDTH / 2 - rect.width / 2, HEIGHT / 2 + 50))

    # Draw the play again prompt just above the bottom
    s = math.sin(frame_count * .002) / 2 + .5  # This makes the frame count into a sine wave for the opacity
    text, rect = font.render(f'Press <Space> to play again', (0xaa, 0xaa, 0xaa, int(s * 0xff)))
    screen.blit(text, (WIDTH / 2 - rect.width / 2, HEIGHT - rect.height - 20))

def show_help(screen):
    """ Show the help UI element in the top-right corner """

    font = freetype.SysFont('Anonymous Pro', 20)

    # These are the lines that will be output for the "help"
    lines = """
        Keys are based on VIM
        Use <l>/<h> to move
        Use <k> to jump
        Use <Space> to shoot
        Use <q> to exit
        Shoot to hide...
    """.strip().split('\n') # Strip and split to convert this into an array

    # Spacing between each line and from the top/right of the screen
    PADDING = 10

    # The y-value to draw the text
    y = PADDING
    for line in lines:
        line = line.strip() # Clear the extra padding from stupid mutli-line strings

        text, rect = font.render(line, 0xf4f4f4ff)
        screen.blit(text, (WIDTH - rect.width - PADDING, y))

        # Increase the y-value so that the next line goes below
        y += rect.height + PADDING

def main():
    """
    Run the game

    _Note: This is only in a `main` fn because of habit/practice with other languages, no specific reason_
    """

    pygame.init()
    screen = pygame.display.set_mode((WIDTH, HEIGHT))

    MAX_HEALTH = 3 # The max health that a player can have

    # Init the gamestate
    bullets = []
    spiders = []
    score = 0
    health = MAX_HEALTH
    seen_help = False

    player = Player()

    dead_flash_time = 0x11

    frame_count = 0
    running = True
    while running:
        # Handle events
        for event in pygame.event.get():
            # Reset Game
            if event.type == KEYDOWN and event.key == K_q:
                running = False

            elif event.type == QUIT:
                running = False

            elif event.type == KEYDOWN and event.key == K_SPACE:
                if health == 0:
                    # Reset the gamestate
                    bullets = []
                    spiders = []
                    score = 0
                    health = MAX_HEALTH
                    player = Player()
                    dead_flash_time = 0x11
                    frame_count = 0
                    running = True
                    seen_help = False
                else:
                    # Create a new bullet and acknowledge help
                    bullets.append(Bullet(tuple_add(player.pos, (Player.WIDTH / 2 - Bullet.WIDTH / 2, 0))))
                    seen_help = True


        # Health == 0 if dead
        if health == 0:

            # Fill the screen & flash the background
            screen.fill((dead_flash_time, 0x11, 0x11))
            if dead_flash_time > 0x11: dead_flash_time -= 5
            if dead_flash_time < 0x11: dead_flash_time = 0x11

            display_death(screen, score, frame_count)

            pygame.display.flip()
            frame_count += 1

            # prevent other codestuffs from running
            continue

        # Movement
        pressed_keys = pygame.key.get_pressed()
        if pressed_keys[K_h]:
            player.move(-20)

        if pressed_keys[K_l]:
            player.move(20)

        if pressed_keys[K_k]:
            player.jump()

        # Update the player
        player.tick()

        # Wipe the screen & do death flash
        screen.fill((dead_flash_time, 0x11, 0x11))
        if dead_flash_time > 0x11: dead_flash_time -= 5
        if dead_flash_time < 0x11: dead_flash_time = 0x11

        # Display the various UI elements
        show_health(screen, health, MAX_HEALTH)
        show_score(screen, score)
        if not seen_help: show_help(screen)

        # Create a new spider every few seconds (speeding up when score gets higher but never more than 3 per second)
        if frame_count % constrain(180 - score * 10, 10, 1000) == 0:
            spiders.append(Spider(frame_count / 120 + 5, randint(0, 200)))

        # The Spiders that need to be yeeted after this frame (or is it "yote"?)
        spiders_to_yeet = set()

        # Iterate over the spiders
        for i, spider in enumerate(spiders):
            # Confirm that it's not already in the set to prevent double counting
            # Spider.tick returns true if the spider has left the screen
            if spider not in spiders_to_yeet and spider.tick(screen):
                spiders_to_yeet.add(i);
                health -= 1
                dead_flash_time = 100


        # The bullets that need to be yeeted after this frame
        bullets_to_yeet = set()
        for i, bullet in enumerate(bullets):
            # Ignore bullets that have been yeeted
            if bullet in bullets_to_yeet: continue
            # Bullet.tick return true if the bullet has left the frame
            if bullet.tick(screen):
                bullets_to_yeet.add(i);

            # Check for collisions with all spiders
            for i, spider in enumerate(spiders):
                # Confirm that it's not already in the set to prevent double counting
                if spider not in spiders_to_yeet and bullet.rect.colliderect(spider.rect):
                    spiders_to_yeet.add(i)
                    score += 1

        # Yeet the bullets (Yes, yeet is the technical term)
        for i in bullets_to_yeet: del bullets[i]
        # Yeet the spiders
        for i in spiders_to_yeet: del spiders[i]

        screen.blit(player.surf, player.pos)
        pygame.display.flip()

        # Give us an actually decent framerate
        #   (~30 fps [Not quite perfect, since it doesn't take into account the execution time of each frame, but I couldn't be bothered])
        sleep(1 / 30)
        frame_count += 1

# Run the game
main()
