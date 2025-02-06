.data
string: .asciiz "pUlL thE LEvEr KROnk!" # embiggen this
newline: .asciiz "\n" #useful
.text
main:
    la $t0, string # load the string’s address
embiggen:
    lb $t2, 0($t0) # get a byte
    beqz $t2, end # if there’s nothing there, end
lowerBoundCheck:
    # if (character < 'a') goto continue;
    slti $t3, $t2, 'a'
    bnez $t3, continue
upperBoundCheck:
    # if (!(character < ('z' + 1))) goto continue; 
    slti $t3, $t2, 0x7b # 0x7b = 'z' + 1
    beqz $t3, continue

    add $t2, $t2, -0x20 # 0x20 = 'A' - 'a'
    sb $t2, 0($t0) # store the result
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
    # We are done, exit the program
    li $v0, 10
    syscall
