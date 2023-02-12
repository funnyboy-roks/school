######################################################################
# author: Hayden Pott  
# date: 08 Feb 2023 
# desc: Uhhh.... Something something simulation (?) 
#####################################################################
import random

DEBUG = False   # Activate intermediate output 

# Simple debug function that prints all given arguments when the `DEBUG` variable is set
def dbg(*args):
    if DEBUG:
        print('[DEBUG]', *args)

bank_count = int(input('What is the size of the questions bank? '))
studied_count = int(input('How many questions have you studied? '))
test_count = int(input('How many questions does the test have? '))
passing_count = int(input('How many questions are required to pass? '))

simulation_count = int(input('How many simulations would you like to run? '))

print('Running Simulations...')
sim_scores = []

for sim in range(simulation_count):
    dbg('Simulation', sim)

    bank = range(1, bank_count + 1)
    # Pick the sets of questions (sets is okay as they're guaranteed to be different
    # Not to mention that it makes the code so much nicer
    test_questions = set(random.sample(bank, test_count))
    studied_questions = set(random.sample(bank, studied_count))

    dbg('Test Questions:', test_questions)
    dbg('Studied Questions:', studied_questions)

    # Discrete maths is my favourite class >:D (Though I much prefer `∩`)
    passed_questions = test_questions & studied_questions
    dbg('Passed Questions:', passed_questions)
    dbg('Score:', len(passed_questions), '/', test_count)

    # Add this score to the list of scores
    sim_scores.append(len(passed_questions))

dbg('All Scores:', sim_scores)

# Calculate passing rate by finding the amount of scores which passed the test and dividing by the total number of sims
print(f'The test was passed {len(list(filter(lambda x: x >= passing_count, sim_scores))) * 100/simulation_count:.2f}% of the time.')
