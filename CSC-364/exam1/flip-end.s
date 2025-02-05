# if (n == 0) return -1;
# int mask = 0;
# do  {
#     mask <<= 1;
#     mask |= 1;
# } while (!(n & mask));
# printf("msk = %032b\n", mask);
# return n | mask;

# $a0 - in/out
flip_end:
    bnez $a0, .continue
    li $a0, -1
    jr $ra
.continue:
    li $t0, 0
.loop:
    sll $t0, $t0, 1
    ori $t0, $t0, 1
    and $t1, $a0, $t0
    beqz $t1, .loop
    or $a0, $a0, $t0
    jr $ra
