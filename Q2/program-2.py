##########################################################################
# author: Hayden Pott 
# date: 30 Nov 2022
# desc: Sig Digits
#########################################################################
from random import randint, seed
SHOWLIST = False 	# a boolean to determine whether to show the list
MIN = 0			    # the smallest random number that can be created.
MAX = 1000		    # the largest random number that can be created.

# A function that prompts the user for two pieces of information i.e.
# the size of the list they want to create, and the seed that will be
# used for the list creation. It then returns both pieces of information to the
# calling statement.
def prompt():
    size = int(input('How many values? '))
    seed = int(input('Seed: '))
    return (size, seed)

# A function that prints out a list. It receives two pieces of data. The
# first is a string representing the name of the list. The second is a
# list containing all the relevant data. It proceeds to print out the
# name, and then all the elements of the data separated using a tab
# space. Both the name and the entire list are printed on a single line.
def print_list(name: str, l: list):
    print(f'{name}: {list}')

# A function that creates the list of random numbers. It receives two
# arguments: one for the size of list to be created, and another for the
# seed that will be used to create the list. The function creates the
# list using the global variables MIN and MAX to form a bound for the
# kinds of numbers that are added to the list. The list is then returned
# to the calling statement.
def gen_list(size: int, s: int) -> list:
    out = []
    seed(s)
    for i in range(size):
        out.append(randint(MIN, MAX))
    return out

# A function that ~~recieves~~(receives :P) a list of numbers and returns another list
# containing the frequency of the lists Most Significant Digits (MSD). The
# list created by the function has 10 elements with each value
# corresponding to a different possible MSD i.e. the value in index 0
# shows the number of values in the original number list that have 0 as
# their most significant digit; the value in index 1 shows the number of
# values with 1 as their MSD; and so on and so forth. This 10 element
# list is returned to the calling statemet.
def msd(l: list) -> list: # Gross, but I don't think anything says I can't use strings :P
    out = [0] * 10
    for n in l:
        out[int(str(n)[0])] += 1
    return out

# Similar to the function above, a function that recieves a list of
# numbers, and returns another list of 10 elements where each element
# represents the frequency of a specific Least Significant Digit in the
# original list.
def lsd(l: list) -> list:
    out = [0] * 10
    for n in l:
        out[n % 10] += 1
    return out

###################################### MAIN ############################
# using the functions defined above:
#   prompt the user for the size of the list to be created as well as the seed.

(size, s) = prompt()

#   create the list of random numbers

nums = gen_list(size, s)

#   If SHOWLIST is selected, print out the list of numbers
if SHOWLIST:
    print_list('Original List', nums)

#   print the head of the table which just shows the numbers 0-9
print('     0    1    2    3    4    5    6    7    8    9')
print('-------------------------------------------------------')

#   Calculate the MSD and LSD, and print out their statistics.
m = msd(nums)
l = lsd(nums)

print(f'MSD  {"".join(map(lambda n: str(n).ljust(5), m))}')
print(f'LSD  {"".join(map(lambda n: str(n).ljust(5), l))}')