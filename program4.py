#########################################################################
# name: Hayden Pott
# date: 28 Sept 2022
# description:
#########################################################################

# A function to prompt the user for the number of levels that their
# pyramid will have and return it to the calling statement.
def prompt_int():
    return int(input('How many levels will your pyramid have? '))
# A function that receives the number of pyramid levels and the number
# of blocks as arguments, and prints the appropriate results to the
# screen.
def print_qty(level, blocks):
    print(f'For {level} level{"" if level == 1 else "s"}, you will need {blocks} block{"" if blocks == 1 else "s"}')
# A recursive function that receives the number of the level, calculates
# the number of blocks required, and returns the result to the calling
# statement.
def count_blocks(level):
    if level <= 0: return 0
    if level == 1: return 1
    return count_blocks(level - 1) + level ** 2

################################ MAIN ################################
# using the function(s) defined above, ask the user for the number of
# pyramid levels

# using the function(s) defined above, calculate and display the final results
n = prompt_int()
print_qty(n, count_blocks(n))
