# int i = 16;
# do {
#     i -= 1;
#     int high = n >> (31 - i) & 1;
#     int low = n >> i & 1;
#     if (high != low) return 0;
#
#     printf("low = %032b  high = %032b\n", low, high);
# } while (i);
# return 1;

# $a0 - in
# $v0 - out
palendrome:
    li $t2, 16
    li $v0, 0
.loop:
    addi $t2, $t2, -1

    # int high = n >> (31 - i) & 1;
    addi $t0, $t2, -31
    srlv $t0, $a0, $t0
    andi $t0, 1

    # int low = n >> i & 1;
    srlv $t1, $a0, $t2
    andi $t1, 1

    bne $t0, $t1, .return
    bnez $t2, .loop
    li $v0, 1
.return:
    jr $ra
