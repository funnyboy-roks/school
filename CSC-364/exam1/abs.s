# $a0 - in/out for abs value
abs:
    bgtz $a0, done
    li $t0, -1
    mult $a0, $t0
    mflo $a0
done:
    jr $ra

.macro do_abs n
    li $a0, \n
    bal abs
    li $v0, 1
    syscall
    li $v0, 11
    li $a0, '\n'
    syscall
.endm

.globl __start
__start:
    do_abs -10
    do_abs 10
    do_abs -1
    do_abs 1
    do_abs 0
    do_abs -10000
    do_abs 10000

    li $v0, 10
    syscall
