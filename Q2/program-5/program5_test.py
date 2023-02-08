##################################################################
# Patient Test file. DO NOT CHANGE ANYTHING in this file. If your
# Patient file is appropriately named and in the same directory, then
# running this program should automatically use your file and produce
# the expected output.
#################################################################
from Patient import *

# Create three patient objects and print them out
p1 = ICU("Horace Scope", 0)
p2 = ICU("Helen Hywater", -15)
p3 = CheckUp("Amanda Lynn", 45)
p4 = ICU("Chester Minit", 12)
p5 = In("Don Keigh", 89, 10)
p6 = Out("Kay Oss ", 45)
print ("\tStatus\tName\t\tAge\tWeight\tStay")
print ("-" * 55)
print ("p1:\t{}".format(p1))
print ("p2:\t{}".format(p2))
print ("p3:\t{}".format(p3))
print ("p4:\t{}".format(p4))
print ("p5:\t{}".format(p5))
print ("p6:\t{}".format(p6))

print ("-" * 55)

# Change their ages and print them out
p1.age = -5
p2.age = 100
for i in range(6):
    p3.increaseAge()
p4.age = 0
p5.increaseAge()
p6.age = 42

print ("p1:\t{}".format(p1))
print ("p2:\t{}".format(p2))
print ("p3:\t{}".format(p3))
print ("p4:\t{}".format(p4))
print ("p5:\t{}".format(p5))
print ("p6:\t{}".format(p6))
print ("-" * 55)

# Change other instance variables and print them out
p1.weight = 2000
p1.stay = 3
p2.name = "Justin Thyme"
p2.weight = 220
p2.stay = 0
p3.weight = -50
p4.weight = 1400
p5.weight = 0
p5.stay = 21
p6.weight = 1401

print ("p1:\t{}".format(p1))
print ("p2:\t{}".format(p2))
print ("p3:\t{}".format(p3))
print ("p4:\t{}".format(p4))
print ("p5:\t{}".format(p5))
print ("p6:\t{}".format(p6))
print ("-" * 55)
