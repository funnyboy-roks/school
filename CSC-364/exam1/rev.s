# int out = 0;
# do {
#     out <<= 1;
#     out |= n & 1;
#     n >>= 1;
#     count -= 1;
# } while (count);
# return out;

# $a0 - in (mutated)
# $v0 - out
rev:
    li $v0, 0
    li $t0, 32

.loop:
    sll $v0, $v0, 1
    andi $t1, $a0, 1
    or $v0, $v0, $t1
    
    srl $a0, $a0, 1
    addi $t0, $t0, -1

    bnez $t0, .loop
    jr $ra
