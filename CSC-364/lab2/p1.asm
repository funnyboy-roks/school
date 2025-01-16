# Hayden Pott, Enrique Leonel Claros-Turcios, Javen Wilson, Patrick McCoy
# CSC 364 Lab 1
# 1/16/25
# add2.asm-- A program that computes and prints the sum
# of two numbers specified at runtime by the user.
# Registers used:
# $t0 - used to hold the first number.
# $t1 - used to hold the second number.
# $t2 - used to hold the sum of the $t0 and $t1.
# $v0 - syscall parameter and sometimes return value.
# $a0 - syscall parameter.
main:
    # Get first number from user, put into $t0.
    li $v0, 5           # Load 5 into $v0 for syscall to read int
    syscall             # execute that syscall
    add $t0, $v0, $zero # move $v0 to $t0

    # Get second number from user, put into $t1.
    li $v0, 5           # Load 5 into $v0 for syscall to read int
    syscall             # execute that syscall
    add $t1, $v0, $zero # move $v0 to $t1

    # Compute the sum.
    add $t2, $t1, $t0   # compute $t2 = $t0 + $t1

    # Print out $t2.
    li $v0, 1           # Load 1 into $v0 for syscall to print int
    add $a0, $t2, $zero # move $t2 to $a0
    syscall             # execute that syscall

    # exit
    li $v0, 10          # Load 10 into $v0 for syscall exit
    syscall             # execute that syscall
