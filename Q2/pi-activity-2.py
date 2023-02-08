##########################################################################
# author: Hayden Pott
# date: 1 Feb 2023
# desc: Binary or something, idrk
##########################################################################
# Assignment: Implement the half adder and full adder using bitwise operators.

# import RPi.GPIO as GPIO
from random import randint


class EightBitAdder:

    def __init__(self, output_pins, debug_on: bool = False):
        self.debug_on = debug_on
        self.output_pins = output_pins
        # self.setup_gpio()

    def debug(self, message: str) -> None:
        """Prints a message if self.debug_on is True"""
        if self.debug_on:
            print(message)

    def setup_gpio(self) -> None:
        """Handle GPIO setup"""
        GPIO.setmode(GPIO.BCM)
        GPIO.setup(self.output_pins, GPIO.OUT)

        self.debug(f"GPIO setup on pins {self.output_pins}")

    def generate_binary_list(self):
        """Generate a random list of length 8 of 1s and 0s. Returns a list."""
        bit_list = []
        for _ in range(8):
            random_bit = randint(0, 1)
            bit_list.append(random_bit)

        self.debug(f"Generated list {''.join(map(lambda x: str(x), bit_list))} ({int(''.join(map(lambda x: str(x), bit_list)), base=2)})")
        return bit_list
    
    def to_int(self, bit_list_thing):
        return int(''.join(map(lambda x: str(x), bit_list_thing)), base=2)

    def illuminate(self, number: int) -> None:
        """
        Displays a bit_list by turning LEDs on
        Reads the number as u8
        """
        for i in range(0, 8):
            # Grab the bit at the ith position from the top
            GPIO.output(self.output_pins[i], number & (1 << (7 - i))) # I haven't tested this, so 🤞

        self.debug(f"Illuminated {number:08b}")

    def half_adder(self, a: int, b: int) -> tuple[int, int]:
        """Takes inputs A and B and returns a tuple of S and C."""
        """Left for homework using the bitwise operators"""
        a &= 1  # Confirm that we have only the bottom bit (idk why we're not using booleans, but whatever :P)
        b &= 1
        return (a ^ b, a & b)

    def full_adder(self, cin: int, a: int, b: int):
        """Takes in Cin, A, and B, and returns S and Cout"""
        """Left for homework using the bitwise operators"""
        cin &= 1  # Grab just the bottom bit (just in case :P)
        a &= 1
        b &= 1
        s1, c1 = self.half_adder(a, b)
        s2, c2 = self.half_adder(s1, cin)
        return (s2, c1 | c2)

    def add(self, bit_list_1, bit_list_2):
        """Takes in two bit_lists, and finds the sum as a list"""
        sum_bit_list = [0, 0, 0, 0,    0, 0, 0, 0]
        position = len(bit_list_1) - 1

        carry_out = 0
        while position >= 0:

            carry_in = carry_out
            input_a = bit_list_1[position]
            input_b = bit_list_2[position]

            sum_bit, carry_out = self.full_adder(carry_in, input_a, input_b)
            self.debug(f"Added Column: {carry_in}, {input_a}, {input_b}")
            sum_bit_list[position] = sum_bit

            position -= 1

        sum_bit_list.insert(0, carry_out)

        self.debug(
            f"Finished Adding:\n         {self.to_int(bit_list_1):08b} ({self.to_int(bit_list_1):>3})\n +       {self.to_int(bit_list_2):08b} ({self.to_int(bit_list_2):>3})")
        self.debug(f"Result: {self.to_int(sum_bit_list):09b} ({self.to_int(sum_bit_list):>3})")

        return sum_bit_list

    def wait_to_cleanup(self):
        """Wait for the user to press ENTER to cleanup the GPIO."""
        input("Press ENTER to terminate")
        GPIO.cleanup()

    def run(self):
        """Call run to make everything happen."""
        bit_list_1 = self.generate_binary_list()
        bit_list_2 = self.generate_binary_list()
        sum_bit_list = self.add(bit_list_1, bit_list_2)
        self.illuminate(self.to_int(sum_bit_list))
        # self.wait_to_cleanup()


output_pins = [17, 18, 27, 22, 26, 12, 16, 20, 21]
adder = EightBitAdder(output_pins, debug_on=True)
adder.run()
