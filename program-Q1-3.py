#################################################################################
# name: Hayden Pott
# date: 28 Sept 2022
# description: 
#################################################################################

# A function that prompts the user for a number and returns it.
def get_int():
    return int(input('Enter a number: '))
# A function that receives two numbers as arguments, and returns the
# larger of the two numbers.
def max2(a,b):
    return a if a > b else b
# A function that receives three numbers as arguments, and returns the
# largest of the three numbers.
def max3(a,b,c):
    return max(a,max(b,c))
# A function that receives three numbers as arguments, and returns the
# product of the two largest arguments.
def product(a,b,c):
    abs_max = max3(a,b,c)
    max_2 = max2(b,c) if abs_max == a else max2(a,c) if abs_max == b else max2(a,b)
    return abs_max * max_2
# A function that receives an argument and returns a string representing
# whether that argument is even or odd.
def even_odd(n):
    return 'even' if n % 2 == 0 else 'odd'
# A function that receives an argument and determines whether that
# argument is a prime number.
def is_prime(num):
    for n in range(2,int(num**0.5)+1):
        if num%n==0:
            return False
    return True
##################################### MAIN PROGRAM #######################
# Functions that were defined above should be executed below in an order
# that satisfies the original problem statement. Additional statements
# can be included if needed.
##########################################################################

# Prompt for three different numbers and store them appropriately.
a = get_int()
b = get_int()
c = get_int()
nums=[a,b,c]
# Print out the table header information.
print('--------------------')
print('Num   Even Prime')
print('--------------------')
# Print out the table contents for each of the three numbers.
for num in nums:
    print(str(num).ljust(5,' '),even_odd(num).ljust(4, ' '),is_prime(num))
# Print out the identity of the largest number and the largest product
# from the given numbers.
print(f'The largest number is {max3(a,b,c)}')
print(f'The largest possible product is {product(a,b,c)}')
