################################################################################
# Name: Hayden Pott
# Date: 19 Sept 2022
# Description: Calculuate the average between two test scores
################################################################################

# A function that prompts the user for a name and returns it to the
# calling statement.
def prompt_name():
    return input('Please enter your name: ')

# A function that prompts the user for a score and returns it to the
# calling statement. 
def prompt_score():
    return int(input('Enter your score: '))

# A function that receives two numbers and returns the average of those
# two values to the calling statement.
def avg(num1, num2):
    return (num1 + num2) / 2

# A function that receives a string and a number (the name and the
# average score) and prints it out on the screen in the appropriate format.
def print_score(name, score):
    print(f'Hi, {name}. Your average score is {score}')

#############################################################################
#       MAIN PART OF PROGRAM
# Functions that were defined above should be executed below in an order
# that satisfies the problem statement. Additional statements can be
# included below as well if needed.
#############################################################################

# prompt for name
name = prompt_name()

# prompt for two scores
test1 = prompt_score()
test2 = prompt_score()

# calculate the average
average = avg(test1, test2)

# display the final output
print_score(name, average)

