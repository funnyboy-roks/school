######################################################################
# name: Hayden Pott
# date: 30 Nov 2022
# desc: Patient Class
####################################################################

# A patient class. A patient has a name, age and weight. Only the name
# and age are provided as arguments for the constructor. On top of
# accessors and mutators for those variables, the patient class also has
# an increaseAge function that increases the age by 1.

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

# An In class which is a subclass of the Patient class and refers to an
# in-patient. An in-patient also contains a "stay" instance variable 
# that stores the number of days that that patient will stay in the
# hospital. Its constructor receives the name, age and stay duration as
# arguments. On top of appropriate accessors and mutators, the In class
# also has a __str__ function to define how an In object would be printed.

class In(Patient):
    
    def __init__(self, name, age, stay):
        super(name, age)
        self._stay = stay
        
    @property
    def stay(self):
        return self._stay
    
    @stay.setter
    def stay(self, stay):
        self._stay = stay if stay > 0 else 0
        
    def __str__(self):
        return f'IN-{(self._name, self._age, self._weight, self._stay)}'

# An Out class, which is a subclass of the Patient class and refers to
# an out-patient. An outpatient receives the name and age as arguments
# to its constructor. It also has a __str__ function that defines how an
# Out object would be printed.



class In(Patient):
    
    def __init__(self, name, age):
        super(name, age)
        
    def __str__(self):
        return f'OUT-{(self._name, self._age, self._weight)}'

# An ICU class which is a subclass of the In class and refers to a
# patient in the ICU. The ICU class receives the name and age as
# arguments to its constructor. It also has a class variable called days
# with the value 5 stored in it. This class variable is used to
# determine what the stay of the patient will be.

# A CheckUp class which is a subclass of the Out class and refers to a
# patient who is getting a checkup at the hospital. It receives the name
# and age as arguments for its constructor.
