########################################################################
# author: Hayden Pott
# date: 28 Sept 2022
# description: Log Tables
########################################################################

# A function that prompts the user for the minimum value and returns it
# to the calling statement. Function to also deal with range checking to
# make sure that minimum value provided is greater than 0
from math import log10


def prompt_min():
    n = 0
    while n <= 0:
        n = float(input('Min: '))
    return n
# A function that prompts the user for the maximum value and returns it
# to the calling statement. Function receives argument that is used in
# range checking to make sure maximum value provided by user is greater
# than minimum value (provided in function argument)
def prompt_max(min):
    n = min
    while n <= min:
        n = float(input('Max: '))
    return n
# A function that prompts the user for the step size and returns it to
# the calling statement. Function also deals with range checking to make
# sure that step size provided is greater than 0.
def prompt_step():
    n = 0
    while n <= 0:
        n = float(input('Step: '))
    return n

# A function that receives a number as an argument and returns the log
# of that number rounded to 4 decimal places.
def log4(n):
    return f'{log10(n) : .4f}'
# A function that receives the value at the left size of the log table
# (i.e. the value whose logarithms should be calculated). The function
# then creates a row of logarithmic values for that argument counting
# upwards in steps of 1 significant figure more than the argument. i.e.
# if the argument is 1.3, then the row gives values of the logs for
# 1.30, 1.31, 1.32, 1.33, ..., 1.39. If the argument is 2.456, then it
# gives logs for 2.4560, 2.4561, 2.4562, 2.4563, ..., 2.4569
def log_row(n: float):
    out = ''
    for i in range(10):
        num = float(str(n) + str(i))
        out += log4(num) + ' '
    return out.strip()

def get_row(n):
    return f' {n : .4f} | {log_row(n)}'

# A function that receives the minimum, maximum and step size as
# arguments, and prints the table (making use of the function that
# creates a single row defined earlier)

####################### MAIN #########################################
# Get the minimum, maximum and step size from the user using functions
# defined earlier.
min = prompt_min()
max = prompt_max(min)
step = prompt_step()
# create the table using the function defined eariler.
max_row = get_row(max)
print(' ' * (max_row.index('|')+2) + '0       1       2       3       4       5       6       7       8       9')
print('-' * len(get_row(max)))
n = min;
while n < max:
    print(get_row(n))
    n += step
