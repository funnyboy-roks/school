
.data
.text

#main func call
__start: 
       # read a
	li $v0, 5         # make a syscall for input
	syscall           # just a syscall
	move $t0, $v0     # move the input into register

        # read b
	li $v0, 5         # making a syscall for input
	syscall           # just a syscall
	move $t1, $v0     # move the input into register
	
	# making result
	li $t2, 0         # Result

#main loop func
loop:
	#inital conditon for while loop
	blez $t1, done    # checking the conditon for the loop
	
	#nested intial condition
	andi $t3, $t1, 1  # doing the and operation for b
	beqz $t3, endif   # checking if b is zero, else jump to the bit shifts
	add $t2, $t2, $t0 # adding items into result
	
# Shifting both A and B
endif:
	#actual shift operations
	sll $t0, $t0, 1   # shift A left
	srl $t1, $t1, 1   # shift B right
	
	# jumps back into the loop until it no longer satisfies
	j loop            # jump back to the beginning of the loop

#This is dedicated to printing out the program and ending it
done:
	#setting up the print statement for result
	li $v0, 1         # make syscall to print integer
	move $a0, $t2     # move the value of result into our print reg
	syscall           # uh syscall?
	
	#making the end call for the program
	li $v0, 10
	syscall
