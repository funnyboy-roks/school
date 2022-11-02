####################################################################
# author: Hayden Pott
# date: 28 Sept 2022
# desc: Grades stuff
###################################################################
from random import randint

# constants defined to limit the scope of the randomly generated grades.
LOWEST_GRADE = 65
HIGHEST_GRADE = 100

# A function that prompts the user for the number of students in the
# class and returns that value to the calling statement.


def prompt_count():
    return int(input('How many students? '))

# A function that receives the number of students as an argument, and
# creates a list of random integers of that size. The complete list is
# returned to the calling statement.


def gen_grades(count):
    return list(map(lambda _: randint(65, 100), range(count)))

# A function that receives a single grade as its argument, and returns a
# letter corresponding to the correct letter grade.


def letter_grade(g):
    if g >= 90:
        return 'A'
    elif g >= 80:
        return 'B'
    elif g >= 70:
        return 'C'
    elif g >= 60:
        return 'D'
    else:
        return 'F'

# A function that receives a list of values, and prints them in order
# separated by a tab space.


def print_list(l):
    print(''.join(map(lambda n: str(n) + '\t', l)))

# A function that recieves a list of numerical values (corresponding to
# the numerical grades), and creates a list of corresponding letter
# grades. This list of letter grades is then returned to the calling
# statement.


def letter_grades(l):
    return list(map(letter_grade, l))

# A function that recieves a list of numerical values, and returns the
# mean/average of that list.


def average(l):
    return sum(l) / len(l)

############################# main ############################


# using functions defined above, get the class size, numerical grade
# list, and letter grade list.
count = prompt_count()

print('Numerical Grades: ')
grades = gen_grades(count)
print_list(grades)

print('Letter Grades:')
letters = letter_grades(grades)
print_list(letters)

avg = average(grades)
print(f'The average grade for the class is {avg} ({letter_grade(avg)})')
