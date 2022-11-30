# Name: Hayden Pott
# Date: 29 Sept 2022
# Desc: Use Ultrasonic sensor to find distances

import RPi.GPIO as GPIO
from time import sleep, time
# constants
DEBUG = False
SETTLE_TIME = 2  # seconds to let the sensor settle
CALIBRATIONS = 5  # number of calibration measurements to  take
CALIBRATION_DELAY = 1  # seconds to delay in between calibration measurements
# seconds needed to trigger the sensor (to get a measurement)
TRIGGER_TIME = 0.00001
SPEED_OF_SOUND = 343  # speed of sound in m/s set the RPi to the Broadcom pin layout
GPIO.setmode(GPIO.BCM)

# GPIO pins
TRIG = 16  # the sensor's TRIG pin
ECHO = 17  # the sensor's ECHO pin
GPIO.setup(TRIG, GPIO.OUT)  # TRIG is an output
GPIO.setup(ECHO, GPIO.IN)  # ECHO is an input

# calibrates the sensor
# technically, it returns a correction factor to use in our
# calculations


def calibrate():
    print('Calibrating...')
    # prompt the user for an object's known distance
    print('-Place the sensor a measured distance away from an object.')
    known_distance = float(input('-What is the measured distance (cm)? '))
    # measure the distance to the object with the sensor
    # do this several times and get an average
    print('-Getting calibration measurements...')
    dist_avg = 0
    for i in range(CALIBRATIONS):
        distance = getDistance()
        if DEBUG:
            print(f'[DEBUG] Got {distance}cm')
        dist_avg += distance
        # delay a short time before using the sensor again
        sleep(CALIBRATION_DELAY)
        # calculate the average of the distances
    dist_avg /= CALIBRATIONS
    if DEBUG:
        print(f'[DEBUG] Average is {distance_avg}cm')
    # calculate the correction factor
    correction_factor = known_distance / distance_avg
    if DEBUG:
        print(f'[DEBUG] Correction factor is {correction_factor}')
    print('Done.')
    print()
    return correction_factor
# uses the sensor to calculate the distance to an object


def getDistance():
    # trigger the sensor by setting it high for a short time and
    # then setting it low
    GPIO.output(TRIG, GPIO.HIGH)
    sleep(TRIGGER_TIME)
    GPIO.output(TRIG, GPIO.LOW)
    # wait for the ECHO pin to read high
    # once the ECHO pin is high, the start time is set
    # once the ECHO pin is low again, the end time is set
    while GPIO.input(ECHO) == GPIO.LOW:
        start = time()
    while GPIO.input(ECHO) == GPIO.HIGH:
        end = time()
    # calculate the duration that the ECHO pin was high
    # this is how long the pulse took to get from the sensor to
    # the object -- and back again
    duration = end - start
    # calculate the total distance that the pulse traveled by
    # factoring in the speed of sound (m/s)
    distance = duration * SPEED_OF_SOUND
    # the distance from the sensor to the object is half of the
    # total distance traveled
    distance /= 2
    # convert from meters to centimeters
    distance *= 100
    return distance


def sort_list(l):
    for i in range(len(l)):
        min_i = i
        for j in range(i + 1, len(l)):
            if l[j] < l[min_i]:
                min_i = j
        (l[i], l[min_i]) = (l[min_i], l[i])


########
# MAIN #
########
# first, allow the sensor to settle for a bit
print(f'Waiting for sensor to settle({SETTLE_TIME}s)...')
GPIO.output(TRIG, GPIO.LOW)
sleep(SETTLE_TIME)
# next, calibrate the sensor
correction_factor = calibrate()
# then, measure
input('Press enter to begin...')
print('Getting measurements:')
dists = []
while True:
    # get the distance to an object and correct it with the
    # correction factor
    print('-Measuring...')
    distance = getDistance() * correction_factor
    sleep(1)
    # and round to four decimal places
    distance = round(distance, 4)
    dists.append(distance)
    # display the distance measured/calculated
    print(f'--Distance measured: {distance}cm')

    i = input('--Get another measurement (Y/n)? ')
    if not i in ['y', 'Y', 'yes', 'Yes', 'YES', '']:
        break
# finally, cleanup the GPIO pins
print(f'Unsorted List:\n{dists}')
sort_list(dists)
print(f'Sorted List:\n{dists}')
print('Done.')
GPIO.cleanup()
