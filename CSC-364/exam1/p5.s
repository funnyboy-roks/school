# $v0 = max($a0, $a1)
max2:
    ble $a0, $a1, .max2a1
    move $v0, $a0
    jr $ra
.max2a1:
    move $v0, $a1
    jr $ra

# $a0, $a1, $a2 - in
# $v0 - out
max3:
    jal max2
    move $a0, $v0
    move $a1, $a2
    jal max2
