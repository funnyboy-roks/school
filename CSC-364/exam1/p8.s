# $a0 - in/out
grey_code:
    srl $t0, $a0, 1
    xor $a0, $a0, $t0
    jr $ra
