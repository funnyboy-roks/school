# x + ((y - x) & -(y > x))
# x + ((y - x) & -(x < y))

# x, y

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
