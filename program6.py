##############################################################################
# author: Hayden Pott
# date: 28 Sept 2022
# description: Listing ages and their details
#############################################################################

# A function that prompts the user for the number of people this program
# will be comparing.
import sys


def prompt_count():
    return int(input('How many people are you comparing? '))

# A function that receives the size of a list, and repeatedly prompts the user
# for that number of names. It then returns the complete list of names.


def prompt_names(count):
    names = []
    for i in range(count):
        names.append(input(f'Name {i + 1}: '))
    return names

# A function that receives the size of a list, and repeatedly prompts
# the user for that number of ages. It then returns the complete list of
# ages.


def prompt_ages(names):
    ages = []
    for name in names:
        ages.append(int(input(f'Age of {name}: ')))
    return ages


################################ MAIN ################################
# Ask for the number of people using one of the functions defined above.
count = prompt_count()
print('-'*25)

# Ask for the names of the people using one of the functions defined
# above.
names = prompt_names(count)
print('-'*25)

# Ask for the ages of the people using one of the functions defined
# above.
ages = prompt_ages(names)
print('-'*25)

# Identify the names of the youngest and oldest people in the list.
min = sys.maxsize
minI = 0

max = 0
maxI = 0

sum = 0

for i in range(len(ages)):
    if ages[i] < min:
        min = ages[i]
        minI = i
    if ages[i] > max:
        max = ages[i]
        maxI = i
    sum += ages[i]
# Display information about the lists.

print(f'{names[minI]} is the youngest at {min} years old')
print(f'{names[maxI]} is the oldest at {max} years old')
print(f'The average ages is {sum / len(names)}')
