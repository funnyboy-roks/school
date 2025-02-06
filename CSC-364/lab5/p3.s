.data
string: .asciiz "If I had a nickel for every time I was doomed by a sock puppet, I'd have two nickels - which isn't a lot, but it's weird that it happened twice." # embiggen this
newline: .asciiz "\n" #useful
dout: .asciiz "d: "
oout: .asciiz "\no: "
gout: .asciiz "\ng: "
sout: .asciiz "\ns: "
.text
main:
    la $t0, string # load the string’s address
    # Initialise counters
    li $t4, 0
    li $t5, 0
    li $t6, 0
    li $t7, 0
embiggen:
    lb $t2, 0($t0) # get a byte
    beqz $t2, end # if there’s nothing there, end
lowerBoundCheck:
    # if (character < 'a') goto continue;
    slti $t3, $t2, 'a'
    bnez $t3, lower
upperBoundCheck:
    # if (!(character < ('z' + 1))) goto continue; 
    slti $t3, $t2, 0x7b # 0x7b = 'z' + 1
    beqz $t3, lower

    addi $t2, $t2, -0x20 # 0x20 = 'A' - 'a'
lower:
    
# if we have 'd', then inc $t4
    addi $t8, $t2, -68
    bnez $t8, after_d
    addi $t4, $t4, 1
after_d :
# if we have 'o', then inc $t5
    addi $t8, $t2, -79
    bnez $t8, after_o
    addi $t5, $t5, 1
after_o :
# if we have 'g', then inc $t6
    addi $t8, $t2, -71
    bnez $t8, after_g
    addi $t6, $t6, 1
after_g :
# if we have 's', then inc $t7
    addi $t8, $t2, -83
    bnez $t8, continue
    addi $t7, $t7, 1

continue:
    # Continue the iteration
    addi $t0, $t0, 1 # Increment the address
    j embiggen
end:
    li $v0, 4 # Print the string
    la $a0, string
    syscall

    li $v0, 4 # A nice newline
    la $a0, newline
    syscall

    # print message for d
    li $v0, 4
    la $a0, dout
    syscall

    # print count of d
    li $v0, 1
    move $a0, $t4
    syscall

    # print message for o
    li $v0, 4
    la $a0, oout
    syscall

    # print count of o
    li $v0, 1
    move $a0, $t5
    syscall

    # print message for g
    li $v0, 4
    la $a0, gout
    syscall

    # print count of g
    li $v0, 1
    move $a0, $t6
    syscall

    # print message for s
    li $v0, 4
    la $a0, sout
    syscall

    # print count of s
    li $v0, 1
    move $a0, $t7
    syscall


    # We are done, exit the program
    li $v0, 10
    syscall


