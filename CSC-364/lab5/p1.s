.data
str: .asciiz "Do you like Huey Lewis and the News?"
.text
.globl __start
__start:
    la $a0, my_str
    jal strlen

    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 10
    syscall

# Registers used:
# $t0 – holds a counter
# $a0 – holds the address of the string
# $v0 - count of chars
# Load the string’s address into a0
strlen:
    li $t0, 0

.loop:
    lb $t1, 0($a0)
    beqz $t1, .done
    addi $a0, $a0, 1
    addi $t0, $t0, 1
    j .loop
.done:

    move $t0, $v0

    jr $ra


