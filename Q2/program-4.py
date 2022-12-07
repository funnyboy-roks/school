############################################################################
# name: Hayden Pott
# date: 30 Nov 2022
# description: Complex Numbers
###########################################################################

# Don't forget to name this file Complex.py and place it in the same
# folder as the provided ComplexTest.py file so that they can
# automatically find and use each other.

class Complex:
    # A constructor that takes two values for the real and imaginary
    # portions respectively. Default values for both parameters are 0.
    def __init__(real=0, imaginary=0):
        self._real = real
        self._i = imaginary

    # Accessors and Mutators for the instance variables
    @property
    def real(self) -> float:
        return self._real
    
    @real.setter
    def real(self, real):
        self._real = real
    
    @property
    def imaginary(self, imaginary) -> float:
        self._i = imaginary

    # Overloaded mathematical operators i.e. ==, +, -, *, /
    
    def __add__(self, other):
        return Complex(self._i + other.imaginary, self._real + other.real)
    
    def __sub__(self, other):
        return Complex(self._i - other.imaginary, self._real - other.real)
    
    def __mul__(self, other):
        a = self._real
        b = self._i
        c = other.real
        d = other.imaginary
        
        return Complex(a * c - b * d, a * d + b * c)
    
    def __truediv__(self, other):
        a = self._real
        b = self._i
        c = other.real
        d = other.imaginary
        
        #TODO: This Garbage
        
    def __eq__(self, other):
        return self._i == other.imaginary and self._real == other.real

    # Other functions e.g. reciprocal, conjugate, and __str__
    
    def __str__(self):
        return f'{self._real} {"-" if self._i < 0 else "+"} {abs(self._i)}'
    
    def reciprocal(self):
        
