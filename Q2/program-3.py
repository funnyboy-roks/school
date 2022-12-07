#############################################################
# author: Hayden Pott
# date: 30 Nov 2022
# desc: Classes Stuff
#############################################################

# The patient class has a name, age, and weight. Only the name and age
# are provided as arguments to the constructor. The weight is set to 150
# by default for all objects. A Patient also has an increaseAge function
# that increases the age by 1.
class Patient:
    def __init__(self, name: str, age: int):
        self._name = name
        self._age = age
        self._weight = 150
        
    @property
    def name(self):
        return self._name
    
    @name.setter
    def name(self, name):
        self._name = name
        
    @property
    def age(self):
        return self._age
    
    @age.setter
    def age(self, age):
        self._age = age if age > 0 else 0
        
    @property
    def weight(self):
        return self._weight
    
    @weight.setter
    def weight(self, weight):
        return 1400 if weight > 1400 else 0 if weight < 0 else weight
    
    def increaseAge(self):
        self._age += 1




################################################################
#****    DO NOT MODIFY ANYTHING BELOW THIS POINT!    ****
################################# MAIN #########################

# Create three patient objects and print them out
p1 = Patient("Ben Dover", 22)
p2 = Patient("Helen Hywater", 16)
p3 = Patient("Amanda Lynn", 45)

print ("\tName\t\tAge\tWeight")
print ("-" * 40)
print ("p1:\t{}\t{}\t{}".format(p1.name, p1.age, p1.weight))
print ("p2:\t{}\t{}\t{}".format(p2.name, p2.age, p2.weight))
print ("p3:\t{}\t{}\t{}".format(p3.name, p3.age, p3.weight))
print ("-" * 40)

# Change their ages and print them out
p1.age = -5
p2.age = 100
p3.increaseAge()
p3.increaseAge()

print ("p1:\t{}\t{}\t{}".format(p1.name, p1.age, p1.weight))
print ("p2:\t{}\t{}\t{}".format(p2.name, p2.age, p2.weight))
print ("p3:\t{}\t{}\t{}".format(p3.name, p3.age, p3.weight))
print ("-" * 40)

# Change other instance variables and print them out
p1.weight = 2000
p2.name = "Justin Thyme"
p2.weight = 220
p3.weight = -50

print ("p1:\t{}\t{}\t{}".format(p1.name, p1.age, p1.weight))
print ("p2:\t{}\t{}\t{}".format(p2.name, p2.age, p2.weight))
print ("p3:\t{}\t{}\t{}".format(p3.name, p3.age, p3.weight))
print ("-" * 40)
