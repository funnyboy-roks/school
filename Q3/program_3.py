#####################################################################
# author:       
# date:         
# description:  
#####################################################################

# import the abc library to make abstract classes
from abc import ABC, abstractmethod

constrain = lambda n, l, h: min(h, max(l, n))

######################################################################
# An employee class. Its constructor takes the first name, last name and
# pay. It also has email and position as instance variables. It contains
# a single abstract method i.e. applyRaise, and a createEmail function
# that creates an appropriate email address from the employee's first
# and last names.
######################################################################
class Employee(ABC):

    def __init__(self, firstname, lastname, pay):
        self.firstname = firstname
        self.lastname = lastname
        self.pay = pay
        self.email = self.create_email()
        self.position = None

    @property
    def firstname(self): return self._firstname

    @firstname.setter
    def firstname(self, firstname):
        firstname = firstname.strip()
        self._firstname = firstname[0].upper() + firstname.lower()[1:]


    @property
    def lastname(self): return self._lastname

    @lastname.setter
    def lastname(self, lastname):
        lastname = lastname.strip()
        self._lastname = lastname[0].upper() + lastname.lower()[1:]


    @property
    def pay(self): return self._pay

    @pay.setter
    def pay(self, pay): self._pay = pay if pay >= 20_000 else 20_000


    @property
    def email(self): return self._email

    @email.setter
    def email(self, email): self._email = email if email.endswith('@latech.edu') else self._email

    def create_email(self):
        return f'{self.firstname}.{self.lastname}@latech.edu'.lower()

    def __str__(self):
        return f'{self.lastname}, {self.firstname} ({self.email})'

    @abstractmethod
    def applyRaise(self, rate):
        raise NotImplementedError



######################################################################
# A faculty class is a subclass of the Employee class above. Its
# constructor receives both names as well as the position. The Faculty
# class also overrides the applyRaise function by multiplying the pay by
# the rate provided as an argument. It also slightly tweaks the __str__
# function in the super class.
######################################################################
class Faculty(Employee):
    def __init__(self, firstname, lastname, position):
        Employee.__init__(self, firstname, lastname, 50_000);
        self.position = position

    def applyRaise(self, rate):
        if rate <= 0: return
        self.pay *= rate 

    def __str__(self):
        return f'{Employee.__str__(self)} -- {self.position}'


######################################################################
# A Staff class is a subclass of the Employee class above. Its
# constructor only receives both names. It also overrides the applyraise
# function but adding the increase (provided as the argument) to the
# pay. It doesn't change anything else from the Employee class.
######################################################################
class Staff(Employee):
    def __init__(self, firstname, lastname):
        Employee.__init__(self, firstname, lastname, 40_000);

    def applyRaise(self, rate):
        if rate <= 0: return
        self.pay += rate 
