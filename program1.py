################################################################################
# Name: Hayden Pott
# Date: 19 Sept 2022
# Description: Calculuate the average between two test scores read from user input
################################################################################

# a statement that prompts the user for his name
name = input('Please enter your name: ')

# statement(s) that prompts the user for two test scores.
test1 = int(input(f'Hi {name}. What did you score on your first test? '))
test2 = int(input('What did you score on your second test? '))

# display the final output
print(f'The average of {test1} and {test2} is {(test1 + test2) / 2}')

