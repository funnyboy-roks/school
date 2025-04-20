#set math.equation(numbering: "(1)")
#[
  #set page(numbering: {})
  #set align(center)
  #show heading: set block(above: 8 * 1.65em, below: 1.65em)
  // #show heading(level: 1): set text(2em)
  // #show heading(level: 2): set text(weight: "regular", style: "italic")

  = Ohm's Law Lab
  == Hayden Pott

  Lab Date: 27 March 2025 \
  Lab Section: 004 \
  Lab Parter: Erik Claros \
]

#let proc_err(expected, actual) = [#{
  let n = calc.abs((expected - actual) / expected) * 100;
  calc.round(n, digits: 2)
}%];

#let ohm = [Ω];

== Objective

The objective of this lab is to identify the relationship between current and
voltage in circuites with resisters in series vs parallel.

== Theory

Voltage across a resister can be calculated using Ohm's law: $
V = i R
$
where $V$ is the voltage, $i$ is the current through the resistor, and $R$ is
the resistance of the resistor.

When resistors are used in series, the total resistance can be calculated by computing the sum of the resistances: $
R_"total" = sum R_i
$

When resistors are used in parallel, the total resistance can be calucated by computing the inverse of the sum of the resistances: $
1/R_"total" = sum 1/R_i ==> R_"total" = (sum 1/R_i)^(-1)
$

== Procedure

For this lab, a multimeter, DC power supply, and RLC board are necessary.

=== Procedure A

Create a circuit that connects from the power supply to the ammeter, through a
33 #ohm resistor, then back to the power supply.

Increase the current to the circuit to have a nonzero value.  Then, increase
the voltage from 0.5 V to 4 V in 0.5 V steps, collecting data with each step.

=== Procedure B

==== Part 1

Create a circuit similar to that of procedure A, but with both the 33
#ohm and 100 #ohm resistors wired in series.

Perform the same measurement as in Procedure A, but up to 5 V.

==== Part 2

Remove the ammeter from the circuit above, placing a direct connection in its
path.  Now, add the voltmeter across the 100 #ohm resistor.  Record the voltage
reading.  Repeat this for the 33 #ohm resistor.

=== Procedure C

==== Part 1

Create a circuit similar to that of Procedure B Part 1, but with the 33 #ohm and 100
#ohm resistors in parallel instead of series.

Perform the same measurements as in Procedure B Part 1.

==== Part 2

Now, move the ammeter to be in series with the 100 #ohm resistor, after the
connection between the power supply and the 33 #ohm resistor.

Record the current and the current voltage.

Repeat this for the 33 #ohm resisitor.

== Data

=== Procedure A

#table(
  columns: (auto, auto),
  [Measured V Across the resistor], [Measured i through the resistor (A)],
  [0.5],                            [0.014],
  [1],                              [0.03],
  [1.5],                            [0.044],
  [2],                              [0.059],
  [2.5],                            [0.072],
  [3],                              [0.087],
  [3.5],                            [0.102],
  [4],                              [0.117],
)<proc-a-data>

=== Procedure B

==== Part 1

#table(
  columns: (auto, auto),
  [Measured V Across the resistor ], [Measured i through the resistor (A)],
  [0.5], [0.004],
  [1], [0.007],
  [1.5], [0.011],
  [2], [0.015],
  [2.5], [0.018],
  [3], [0.022],
  [3.5], [0.026],
  [4], [0.03],
  [4.5], [0.033],
  [5], [0.038],
)<proc-b-p1-data>

==== Part 2

#table(
  columns: (auto, auto),
  [Measured V across resistor], [I from ammeter (A)],
  [3.75], [0.038],
  [1.254], [0.038],
)<proc-b-p2-data>

=== Procedure C

==== Part 1

#table(
  columns: (auto, auto),
  [Measured V Across the resistor ], [Measured i through the resistor (A)],
  [0.5], [0.018],
  [1], [0.04],
  [1.5], [0.059],
  [2], [0.078],
  [2.5], [0.097],
  [3], [0.119],
)<proc-c-p1-data>

==== Part 2

#table(
  columns: (auto, auto),
  [I through resistor (A)], [V supply (V)],
  [0.03], [3],
  [0.089], [3],
)<proc-c-p1-data>

== Analysis

=== Procedure A

When we plot volts vs amps, we get the following graph:

#image("./proc-a-anal.png")

The linear regression provides a slope of 34.331.  When compared to the
theoretical resistance of the resistor, 33 #ohm, we get a #proc_err(33,
34.331) error.

=== Procedure B

==== Part 1

When we plot volts vs amps, we get the following graph:

#image("./proc-b-p1-anal.png")

The linear regression provides a slope of 132.888.  The theoretical resistance
of these resistors is 133 #ohm, calculated by taking the sum of the two
resistors.  This gives us an error of #proc_err(133, 132.888).

==== Part 2

Using Ohm's law, we can calculate the current for each resistor by dividing by
the resistance.

This gives us 0.0375 A for the 33 #ohm resistor and 0.038 A for the 100 #ohm
resistor.  These two values have a 1.32% difference.

=== Procedure C

==== Part 1

When we plot volts vs amps, we get the following graph:

#image("./proc-c-p1-anal.png")

The linear regression provides a slope of 25.486.  The theoretical resistance
of these resistors is 24.812 #ohm, calculated by taking inverse of the sum of
the inverses two resistors.  This gives us an error of #proc_err(24.812, 25.486).

==== Part 2

Using Ohm's law, we can calculate the voltage.  

This gives us 3 V for the 33 #ohm resistor and 2.937 V for the 100 #ohm
resistor.  These two values have a 2.12% difference.

== Conclusion

The goal of the lab was definitely reached.  We were able to measure the
resistance of the resistors individually, in series, and in parallel. 

Errors definitely creeped in through the process, though with our percent error
being low for most of the results, it clearly was not enough to cause major problems.

I think the main source of error in this lab would come from the power supply.
The knobs on the power supply are not consistent and getting the correct
voltage and amperage is quite a struggle.  While this is not too problematic as
long as it's noticed, sometimes the power supplied will vary without our
interaction and there is a nonzero chance that we failed to notice when this
occurred.
