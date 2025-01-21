.text

__start:
    # read a
	li $v0, 5               # 5 for syscall read int
	syscall                 # make syscall
	move $t0, $v0           # move result into $t0

    # read b
	li $v0, 5               # 5 for syscall read int
	syscall                 # make syscall
	move $t1, $v0           # move result into $t1

	li $t2, -1              # result
	beqz $t2, exit          # if t2 == 0, then exit
	
	li $t2, 0               # $t2 = quotient = 0
	move $t3, $t0           # $t3 = remainder = $t0
	
outer_while:
	blt $t3, $t1 end_outer  # if remainder < $t1, then exit the loop
	
	move $s0, $t1           # $s0 = tempDivisor = $t1
	li $s1, 1               # $s1 = multiple = 1
	
inner_while:
	sll $s2, $s0, 1         # x = tempDivisor << 1
	bgt $s2, $t3, end_inner # if x > remainder, then exit inner
	
	sll $s0, $s0, 1         # $s0 <<= 1
	sll $s1, $s1, 1         # $s1 <<= 1
	
	j inner_while
end_inner:
	sub $t3, $t3, $s0       # $t3 -= $s0 aka remainder -= tempDivisor
	add $t2, $t2, $s1       # $t2 -= $s1 aka quotient += multiple
	
	j outer_while
end_outer:
exit:
	li $v0, 1               # 1 for print int
	move $a0, $t2           # want to print $t2
	syscall                 # make syscall
	
	li $v0, 11              # 11 for print char
	li $a0, '\n'            # want to print '\n'
	syscall                 # make syscall
	
	li $v0, 10              # 10 for exit
	syscall                 # make syscall
