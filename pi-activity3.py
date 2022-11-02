# Name: Hayden Pott
# Date: 29 Sept 2022
# Desc: Blink an LED

from time import sleep
import RPi.GPIO as GPIO

led = 17
button = 16

GPIO.setmode(GPIO.BCM)
GPIO.setup(led, GPIO.OUT)
GPIO.setup(button, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)

i=0

while True:
    GPIO.output(led, i % 2)
    i += 1
    sleep(.1 if GPIO.input(button) else 1)