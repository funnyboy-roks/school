#set table(
    stroke: (x, y) => if y == 0 {
      (bottom: 0.7pt + black)
    } else { 
      (bottom: .1pt + black)
    }
)
/* Make the title */
#align(center, {
  text(size: 1.6em, weight: "bold")[CSC-364 -- Exam 1 \ ]
  text(size: 1.2em, weight: "semibold")[Hayden Pott]
  box(line(length: 100%, stroke: 1pt))
})

= Problem 1
Write the MIPS assembly to compute the absolute value of an integer in a
register.

#figure[
  ```asm
  # $a0 - in/out for abs value
  abs:
      bgtz $a0, done
      xori $a0, $a0, -1
      addi $a0, $a0, 1
  done:
      jr $ra
  ```
]

= Problem 2
List and explain the three types of MIPS instructions. Provide an example of
each.

#par(
  hanging-indent: 1em,
  [
    *Immediate* \
    Instructions that use a hard-coded value in its operation \
    Example: ```asm li $t0, -1```
  ]
)

#par(
  hanging-indent: 1em,
  [
    *Register* \
    Instructions that use a value from a register in its operation \
    Example: ```asm add $t0, $t0, $t1```
  ]
)

#par(
  hanging-indent: 1em,
  [
    *Jump* \
    Instructions that use a hard-coded jump address (usually in the form of a
    label) to go to a specific address \
    Example: ```asm j my_label```
  ]
)

= Problem 3
Convert the MIPS instruction ```asm beq $t0, $t1, label``` into its machine
code representation and identify each of the components of the machine code.

#figure[
  #text(math.underbrace(`0001 00`, [$"opcode" 4$]), fill: blue)#text(math.overbrace(`01 000`, [`rs` = `$t0`]), fill: teal)#text(math.underbrace(`0 1001`, [`rt` = `$t1`]), fill: fuchsia)#text(math.overbrace(`0000 0000 0000 0000`, [signed offset to `label`]), fill: olive)
]

= Problem 4
The expression ```asm x & (x - 1)``` determines whether a number is a power of 2.
Implement the algorithm in MIPS, and explain why it works.

#figure[
  ```asm
  # $a0 - in/out
  pow2:
      addi $t0, $a0, -1
      and $a0, $a0, $t0
      jr $ra
  ```
]

This works because a power of two is always represented with a single one:

#figure[
  #table(
    columns: (auto, auto, auto),
    table.header([$N$], [Power], [$(N-1)_2$]),
    $1$,          $2^0$,  `00000000000000000000000000000001`,
    $2$,          $2^1$,  `00000000000000000000000000000010`,
    $4$,          $2^2$,  `00000000000000000000000000000100`,
    $8$,          $2^3$,  `00000000000000000000000000001000`,
    table.cell(colspan: 3)[...],
    $2147483648$, $2^31$, `10000000000000000000000000000000`,
  )
]

When we subtract one from each value, only the bits below the one are set:

#figure[
  #table(
    columns: (auto, auto, auto),
    table.header([$N$], [$N-1$], [$(N-1)_2$]),
    $1$,          $0$,  `00000000000000000000000000000000`,
    $2$,          $1$,  `00000000000000000000000000000001`,
    $4$,          $3$,  `00000000000000000000000000000011`,
    $8$,          $8$,  `00000000000000000000000000000111`,
    table.cell(colspan: 3)[...],
    $2147483648$, $2147483647$, `01111111111111111111111111111111`,
  )
]

And-ing these values together will always result in $0$ since there are never any overlapping bits:

=== Example

$
&"let" n &= 64_10 &= 0010 0000_2 \
&=> n-1 &= 63_10 &= 0001 1111_2 \
&=> n amp (n - 1) &= 0_10 &= 0000 0000_2 \
$

$n amp (n - 1)$ is zero, so $n$ must be a power of two.

=== Example

$
&"let" m &= 42_10 &= 0010 1010_2 \
&=> m-1 &= 41_10 &= 0010 1001_2 \
&=> m amp (m - 1) &= 40_10 &= 0010 1000_2 \
$

$m amp (m - 1)$ is not zero, so $m$ must not be a power of two.

= Problem 5
Write a MIPS assembly routine to find the maximum of three integers.


#figure[
  ```asm
  # $v0 = max($a0, $a1)
  max2:
      ble $a0, $a1, .max2a1
      move $v0, $a0
      jr $ra
  .max2a1:
      move $v0, $a1
      jr $ra
  
  # $v0 = max($a0, $a1, $a2)
  max3:
      jal max2
      move $a0, $v0
      move $a1, $a2
      jal max2
  ```
]

= Problem 6
It is possible to perform a swap using xor and no temporary variable. Write the
corresponding MIPS assembly. Also, write an example demonstrating how this
works.

#figure[
  ```asm
  # $a0, $a1 - registers to swap
  swap:
      xor $a0, $a1, $a0
      xor $a1, $a0, $a1
      xor $a0, $a1, $a0
      jr $ra
  ```
]

=== Example

#let a0 = $ mono(\$ a 0) $;
#let a1 = $ mono(\$ a 1) $;
#let xor = math.op(`^`);

$
"let" a0 &= 42_10 &= 0010 1010_2 && "                    " \
"let" a1 &= 55_10 &= 0011 0111_2 && "                    " \

a0 <- a0 xor a1 &= 29_10 &= 0001 1101_2 && #h(2em) #math.display[```asm xor $a0, $a1, $a0```] \
a1 <- a1 xor a0 &= 42_10 &= 0010 1010_2 && #h(2em) #math.display[```asm xor $a1, $a0, $a1```] \
a0 <- a0 xor a1 &= 55_10 &= 0011 0111_2 && #h(2em) #math.display[```asm xor $a0, $a1, $a0```] \
$

= Problem 7
The Hamming weight, or population count, in a series of bits is a fancy way of
saying the number of non-zero values (literally how many 1s) Write a MIPS
routine to implement Hamming weight of a 32 bit word using an optimized bitwise
approach.

#figure[
  ```asm
  # $a0 - in
  # $v0 - out
  hamming_weight:
      li $v0, 0
  .loop:
      andi $t0, $a0, 1
      add $v0, $v0, $t0
      srl $a0, $a0, 1
      bnez $a0, .loop
      jr $ra
  ```
]

= Problem 8
Gray code is a version of binary (a variant with slightly different rules) in
which subsequent values only vary by one-bit from their predecessor. It's a
niche topic, but can be useful in signal processing and error detection
applications. The equation ```asm x ^ (x >> 1)``` generates the Gray code of `x`.
Implement it in MIPS.

#figure[
  ```asm
  # $a0 - in/out
  grey_code:
      srl $t0, $a0, 1
      xor $a0, $a0, $t0
      jr $ra
  ```
]

= Problem 9
Write a MIPS function to compute the average of two unsigned integers without
overflow.

#figure[
  ```asm
  # $a0, $a1 - in
  # $a0 - out
  avg:
      # Swap if necessary such that $a0 is low and $a1 is high
      blt $a0, $a1, .no_swap
      move $t0, $a0
      move $a0, $a1
      move $a1, $t0
  .no_swap:
      # $a0 = $a0 + ($a1 - $a0) >> 1
      sub $t0, $a1, $a0
      srl $t0, $t0, 1
      add $a0, $a0, $t0
      jr $ra
  ```
]

= Problem 10
Implement ```asm x + ((y - x) & -(y > x))``` in MIPS. What is this calculating?

#figure[
  ```asm
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
  ```
]

This algorithm finds the maximum between two numbers without branching

= Problem 11
Design a method to reverse the bits of a 32-bit integer efficiently. Implement
it in MIPS.

#figure[
  ```asm
  # $a0 - in (mutated)
  # $v0 - out
  rev:
      li $v0, 0
      li $t0, 32
  .loop:
      sll $v0, $v0, 1
      andi $t1, $a0, 1
      or $v0, $v0, $t1
      
      srl $a0, $a0, 1
      addi $t0, $t0, -1

      bnez $t0, .loop
      jr $ra
  ```
]

= Problem 12
Write the MIPS assembly to toggle the trailing `0`s in a binary word. Apply it to
`10101000` and show the result.

#figure[
  ```asm
  # $a0 - in/out
  flip_end:
      bnez $a0, .continue
      li $a0, -1
      jr $ra
  .continue:
      li $t0, 0
  .loop:
      sll $t0, $t0, 1
      ori $t0, $t0, 1
      and $t1, $a0, $t0
      beqz $t1, .loop
      or $a0, $a0, $t0
      jr $ra

  .globl __start
  __start:
      li $a0, 0xa8
      jal flip_end

      li $v0, 1
      syscall

      li $v0, 10
      syscall
  ```
]

Calling `flip_end` with the value $N = 1010 1000_2 = "a8"_16 = 168_10$ results
in the value $1010 1111_2 = "af"_16 = 175_10$.  This is done by creating a
mask, $m$, for by shifting in one from the right ($m_(n+1) = 2m_n + 1$) until
$N \& m != 0$.  Once this condition is true, we know that our mask touches the
bottom-most $1$ in $N$.  In this example, $m = 0000 1111_2 = "0f"_16 = 15_10$
We can then OR $N$ and our mask to get the desired result: $N | m = 1010 1111_2
= "af"_16 = 175_10$

= Problem 13
Using bitwise operations, implement a function that checks if a 32-bit word is
a palindrome.

#figure[
  ```asm
  # $a0 - in
  # $v0 - out
  palendrome:
      li $t2, 16
      li $v0, 0
  .loop:
      addi $t2, $t2, -1
  
      # int high = n >> (31 - i) & 1;
      addi $t0, $t2, -31
      srlv $t0, $a0, $t0
      andi $t0, 1
  
      # int low = n >> i & 1;
      srlv $t1, $a0, $t2
      andi $t1, 1
  
      bne $t0, $t1, .return
      bnez $t2, .loop
      li $v0, 1
  .return:
      jr $ra
  ```
]

= Problem 14
Write a MIPS function to determine the longest string of consecutive 1-bits in
a binary word.

```asm
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

# Remove the bottom zeroes, then the bottom string of ones, return count of
# ones throught $v0
# $a0 - in (mutated)
# $v0 - out
current:
    li $v0, 0
    bnez $a0, .zeros
    jr $ra
.zeros:
    andi $t1, $a0, 1
    xori $t1, $t1, 1
    srlv $a0, $a0, $t1
    andi $t1, $a0, 1
    beqz $t1, .zeros

.ones:
    andi $t1, $a0, 1
    add $v0, $v0, $t1
    srlv $a0, $a0, $t1
    bnez $t1, .ones

    jr $ra

# Get longest substring of zeros in $a0
# $a0 - in
# $v0 - out
longest:
    move $s7, $ra

    move $s0, $a0
    li $s1, 0 # max

.loop:
    move $a0, $s0
    jal current
    move $s0, $a0

    beqz $v0, .done

    move $a0, $s1
    move $a1, $v0
    jal max
    move $s1, $a0
    j .loop

.done:
    move $v0, $s1
    move $ra, $s7
    jr $ra
```

= Problem 15
Explain the IEEE 754 floating-point format. Write a program to extract the
sign, exponent, and mantissa from a 32-bit floating-point number.

#figure[
  #text(math.underbrace(`0`, [sign]), fill: blue)#text(math.overbrace(`10000000`, [exponent]), fill: fuchsia)#text(math.underbrace(`10010010000111111011011`, [mantissa]), fill: teal)
]

#figure[
  ```asm
  # $f0 (in)  - float from which to extract
  # $a0 (out) - sign of float
  # $a1 (out) - exponent of float
  # $a2 (out) - mantissa of float
  extract_float:
      # Push float onto stack and then pop as int
      addi $sp, $sp, -4
      swc1 $f0, 0($sp)
      lw $t0, 0($sp)
      addi $sp, $sp 4
  
      # extract sign
      srl $a0, $t0, 31
  
      # extract exponent
      srl $a1, $t0, 23
      andi $a1, 0xff
  
      #extract mantissa
      andi $a2, $t0, 0x007fffff
    
      jr $ra
  ```
]

