#let title = [CSC-364 -- Lab 4 Report]
#let student = [Erik Claros Turcios, Hayden Pott,  Patrick McCoy, Javen Wilson]
#set page(
  numbering: "1",
  header: context {
  if counter(page).get().first() > 1 [
    #set text(style: "italic")
    #title
    #h(1fr)
    #student
    #block(line(length: 100%, stroke: 0.5pt), above: 0.6em)
  ]
})

#align(center, {
  text(size: 1.6em, weight: "bold")[#title \ ]
  text(size: 1.2em, weight: "semibold")[#student]
  box(line(length: 100%, stroke: 1pt))
})

== Learning Objectives

The point of this lab was to learn how the dedicated harware for do arithmetic
on floating point numbers works and why it is beneficial to do these operations
via dedicated hardware rather than software.  Another goal in this lab was to
be able to understand how one may use bitwise operations to achive a goal, in
this case, extracting parts of a floating point number and doing operations
with those parts. A higher-level goal for this lap was to give an understanding
of how subroutines work and how they should be structured in a way that is
beneficial to both the programmer and execution speed.

== Major Components

There are two major subroutines in the solution, `mul` and `add`.  There are
also four utility subroutines, `float_to_int`, `int_to_float`, `extract`, and
`combine`.

The utilities are pairs of subroutines that are used for converting between the
floating point and integer interpretations of the bits, where `float_to_int`
effectively behaves as ```asm move $v0, $f0``` if that were an allowed
operation and `int_to_float` works as ```asm move $f0, $a0```.  The other pair,
`extract` and `combine` split a floating point number into its parts and
combines them back, respectively.

A brief pseudocode would be:

#figure[
```
__start:
    read floats
    transfer floats to int registers
    call mul and print output
    call add and print output
    exit

mul(x, y):
    extract parts from x and y
    exp(out) <- add exp(x) and exp(y) and subtract bias
    sign(out) <- xor sign(x) and sign(y)
    temp <- multiply mantissas
    normalise temp
    mantissa(out) <- temp
    combine all parts of out and return

add(x, y):
    extract parts from x and y
    if (x < y)
        swap x and y
        re-extract parts
    exp_diff <- exp(x) - exp(y)
    shift mantissa(y) right by exp_diff
    add mantissa(x) and mantissa(y) into mantissa(x)
    normalise mantissa(x)
    combine all parts of out and return
```
]

#pagebreak()

== MIPS Assembly

#raw(read("lab.s"), lang: "asm")

== Major Obstacles

The biggest obstacle that we faced as a team was actually understanding how the
floating point multiplication needed to occur.  There were parts of the
floating point spec that we just didn't understand, nor how they played into
the operations that we needed to perform. For example, the implied `1` at the
start of the mantissa.  It is unclear how this will play into the
multiplication.

Additionally, we had trouble trying to understand how the exponent should be
used, i.e., "when do we need to handle the bias".  Once we were able to figure
out the multiplication, the addition was actually fairly straightforward.
Perhaps this was because we already had a detailed understanding of how the
operations should be performed on the floating point number.

We didn't have much of an issue with converting between the float registers and
the int registers once we realised that you can't just move between them,
likely because we had a decent understanding of C and the magic of pointer
casting, which is effectively what we ended up doing, by putting the float on
the stack and popping it as an integer.
