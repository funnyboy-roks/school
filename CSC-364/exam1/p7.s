# $a0 - in
# $v0 - out
hamming_weight:
    li $v0, 0
loop:
    andi $t0, $a0, 1
    srl $a0, $a0, 1
    add $v0, $v0, $t0
    bnez $t0, loop
    jr $ra
