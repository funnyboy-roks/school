.data
sum:  .asciiz "\nSum:     "
prod: .asciiz "Product: "
.text
.globl __start
__start:
    # read float 1
    li $v0, 6
    syscall

    # Convert float to int and put it in s0
    jal float_to_int
    move $s0, $v0

    # read float 2
    li $v0, 6
    syscall

    # Convert float to int and put it in s1
    jal float_to_int
    move $s1, $v0

    # Print "Prod:" message
    la $a0, prod
    li $v0, 4
    syscall

    # move saved vars to args and call `mul`
    move $a0, $s0
    move $a1, $s1
    jal mul

    # Convert the int to a float
    move $a0, $v0
    jal int_to_float

    # print our float
    li $v0, 2
    syscall

    # print "Sum:" message
    la $a0, sum
    li $v0, 4
    syscall

    # move saved vars to args and call `add`
    move $a0, $s0
    move $a1, $s1
    jal add

    # Convert the int to a float
    move $a0, $v0
    jal int_to_float

    # print our float
    li $v0, 2
    syscall
    
    # exit
    li $v0, 10
    syscall

# Take a float in $f0 and move it to $v0. (effectively `move $v0, $f0` if types didn't exist)
# $f0 - float in
# $v0 - int out
float_to_int:
    addi $sp, $sp, -4 # push 0
    swc1 $f0, 0($sp)  # *sp = f0
    lw $v0, 0($sp)    # s0 = *sp
    addi $sp, $sp, 4  # pop
    jr $ra

# Take a float in $a0 and move it to $f12. (effectively `move $f12, $a0` if types didn't exist)
# $a0 - int in
# $f12 - float out
int_to_float:
    addi $sp, $sp, -4 # push 0
    sw $a0, 0($sp)    # *sp = a0
    lwc1 $f12, 0($sp) # f12 = *sp
    addi $sp, $sp, 4  # pop
    jr $ra

# Extract the important parts from the float
# $a0 - float in
# $a0 - sign out
# $a1 - exponent out
# $a2 - mantissa out
extract:
    # extract mantissa
    andi $a2, $a0, 0x007fffff # a2 = a0 & 0x007fffff
    ori $a2, $a2, 0x00800000  # a2 |= (1 << 23)

    # extract exponent
    srl $a1, $a0, 23    # a1 = a0 >> 23
    andi $a1, $a1, 0xff # a1 &= 0xff

    # extract sign
    srl $a0, $a0, 31 # a0 >>= 31

    jr $ra

# Combine the parts of a float into a float
# $a0 - sign in
# $a1 - exponent in
# $a2 - mantissa in
# $v0 - float out
# $t0 - modified
combine:
    # add sign
    sll $v0, $a0, 31    # v0 = sign << 31

    # add exponent
    andi $t0, $a1, 0xff # t0 = exp & 0xff
    sll $t0, $t0, 23    # t0 <<= 23
    or $v0, $v0, $t0    # v0 |= t0

    # add mantissa
    andi $t0, $a2, 0x007fffff # t0 = mantissa & 0x007fffff
    or $v0, $v0, $t0          # v0 |= t0

    jr $ra

# Multply two floats stored in $a0 and $a1
# $a0, $a1 - float in
# $v0 - float out
# $a0..=$a2, $t0..=$t5, $t8 - modified
mul:
    # save the saved registers (to the stack)
    addi $sp, $sp, -8 # (push 0) * 2
    sw $s0, 4($sp)    # *(sp + 4) = s0
    sw $s1, 0($sp)    # *sp = s1

    # put our operands in saved registers so they're preserved
    move $s0, $a0
    move $s1, $a1

    # extract from the float into $a0, $a1, and $a2
    move $t8, $ra
    jal extract
    move $ra, $t8
    move $t0, $a0 # t0 <- sign    (s0)
    move $t1, $a1 # t1 <- exponent(s0)
    move $t2, $a2 # t2 <- mantissa(s0)

    # move op 2 to a0
    move $a0, $s1

    # extract from the float into $a0, $a1, and $a2
    move $t8, $ra
    jal extract
    move $ra, $t8
    move $t3, $a0 # t3 <- sign    (s1)
    move $t4, $a1 # t4 <- exponent(s1)
    move $t5, $a2 # t5 <- mantissa(s1)

    # xor sign bit
    xor $t0, $t0, $t3 # t0 ^= t3

    # add exponents - bias
    add $t1, $t1, $t4   # t1 += t4
    addi $t1, $t1, -127 # t1 -= 127

    # $t3 and $t4 are now free to use since we don't need the sign or exponent anymore.

    # multiply mantissas and put top 32 in $t3 and bottom 32 in $t4
    mult $t2, $t5
    mfhi $t3
    mflo $t4

    # Shift t3:t4 right by 23 bits (and put it into t3)
    sll $t3, $t3, 9  # t3 <<= 9
    srl $t4, $t4, 23 # t4 >>= 23
    or $t3, $t3, $t4 # t3 |= t4

    # Normalise float if necessary
    srl $t4, $t3, 24 # t4 = t3 >> 24
    andi $t4, $t3, 1 # t4 &= 1
    srlv $t3, $t3, $t4  # t3 >>= t4 // shift number
    add $t1, $t1, $t4 # t1 += t4  // increment exponent

    # move sign, exponent, and mantissa into correct registers and then call `combine`
    move $a0, $t0
    move $a1, $t1
    move $a2, $t3
    move $t8, $ra
    jal combine
    move $ra, $t8

    # restore saved registers (from the stack)
    lw $s0, 4($sp)   # s0 = *(sp + 4)
    lw $s1, 0($sp)   # s1 = *sp
    addi $sp, $sp, 8 # pop * 2
    jr $ra

add:
    # save the saved registers (to the stack)
    addi $sp, $sp, -8 # (push 0) * 2
    sw $s0, 4($sp)    # *(sp + 4) = s0
    sw $s1, 0($sp)    # *sp = s1

    # put our operands in saved registers so they're preserved
    move $s0, $a0
    move $s1, $a1

.try_again:
    # extract from the float into $a0, $a1, and $a2
    move $a0, $s0
    move $t8, $ra
    jal extract
    move $ra, $t8
    move $t0, $a0 # t0 <- sign    (s0)
    move $t1, $a1 # t1 <- exponent(s0)
    move $t2, $a2 # t2 <- mantissa(s0)

    # extract from the float into $a0, $a1, and $a2
    move $a0, $s1
    move $t8, $ra
    jal extract
    move $ra, $t8
    move $t3, $a0 # t3 <- sign    (s1)
    move $t4, $a1 # t4 <- exponent(s1)
    move $t5, $a2 # t5 <- mantissa(s1)

    # if x < y, swap and extract again
    bge $t1, $t4, .continue
    move $t0, $s0 # swap $s0 and $s1 using $t0 (could do xor swap, but no real reason to bother)
    move $s0, $s1
    move $s1, $t0
    j .try_again

.continue:

    # shift mantissa by difference in exponents
    sub $t6, $t1, $t4  # t6 = exponent(x) - exponent(y)
    srlv $t5, $t5, $t6 # t5 >>= t6

    # add mantissas
    add $t2, $t2, $t5 # t2 += t5

    # normalise mantissa
    srl $t6, $t2, 24 # t6 = t2 >> 24
    andi $t6, $t6, 1 # t6 &= 1
    srlv $t2, $t2, $t6    # t2 >>= t6
    add $t1, $t1, $t6    # t1 += t6

    # move sign, exponent, and mantissa into correct registers and then call `combine`
    move $a0, $t0
    move $a1, $t1
    move $a2, $t2
    move $t8, $ra
    jal combine
    move $ra, $t8

    # restore saved registers (from the stack)
    lw $s0, 4($sp)   # s0 = *(sp + 4)
    lw $s1, 0($sp)   # s1 = *sp
    addi $sp, $sp, 8 # pop * 2
    jr $ra
