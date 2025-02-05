extract_float:
    addi $sp, $sp, -4
    swc1 $f0, 0($sp)
    lw $t0, 0($sp)
    addi $sp, $sp 4

    srl $a0, $t0, 0x80000000

    srl $a1, $t0, 23
    andi $a1, 0xff

    andi $a2, $t0, 0x007fffff
    
    jr $ra

