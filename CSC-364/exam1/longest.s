# $a0, $a1 - in
# $a0 - out
max:
    slt $t0, $a0, $a1
    xori $t0, $t0, -1
    addi $t0, $t0, 1

    sub $a1, $a1, $a0
    and $a1, $a1, $t0

    add $a0, $a0, $a1
    jr $ra

# Remove the bottom zeroes, then the bottom string of ones, return count of
# ones throught $v0
# $a0 - in (mutated)
# $v0 - out
current:
    li $v0, 0
    bnez $a0, .zeros
    jr $ra
.zeros:
    andi $t1, $a0, 1
    xori $t1, $t1, 1
    srlv $a0, $a0, $t1
    andi $t1, $a0, 1
    beqz $t1, .zeros

.ones:
    andi $t1, $a0, 1
    add $v0, $v0, $t1
    srlv $a0, $a0, $t1
    bnez $t1, .ones

    jr $ra

# Get longest substring of zeros in $a0
# $a0 - in
# $v0 - out
longest:
    move $s7, $ra

    move $s0, $a0
    li $s1, 0 # max

.loop:
    move $a0, $s0
    jal current
    move $s0, $a0

    beqz $v0, .done

    move $a0, $s1
    move $a1, $v0
    jal max
    move $s1, $a0
    j .loop

.done:
    move $v0, $s1
    move $ra, $s7
    jr $ra
