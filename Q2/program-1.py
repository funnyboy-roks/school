#######################################################################
# author: Hayden Pott
# date: 30 Nov 2022
# desc: Prime Stuff
########################################################################

# A function to prompt the user for a number and return that value to
# the calling statement.
def prompt():
    return int(input('What limit are you interested in? '))

# A function that receives a number and tests that number to see whether
# it is prime or not. It returns the boolean response to the calling
# statement.
def is_prime(num):
    for n in range(2, int(num ** 0.5) + 1):
        if num % n == 0:
            return False
    return True

################### MAIN ######################################
# Using the functions declared above, ask the user for a number, then
# create a list of all the prime numbers less than that number. Proceed
# to print out the relevant information related to that list.

out = []

max = prompt()

for n in range(2, max):
    if is_prime(n):
        out.append(n)

print(f'There are {len(out)} prime numbers between less than {max}:')
print(out)