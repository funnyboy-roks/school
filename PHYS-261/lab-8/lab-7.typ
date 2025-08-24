#set math.equation(numbering: "(1)")
#[
  #set page(numbering: {})
  #set align(center)
  #show heading: set block(above: 8 * 1.65em, below: 1.65em)

  = Rotational Motion and Mesurements of Inertia
  == Hayden Pott

  Lab Date: 6 May 2025 \
  Lab Section: 002 \
  Lab Parters: Mehedi Hasan, Allison Viator \
]

#let proc_err(expected, actual) = [#{
  let n = calc.abs((expected - actual) / expected) * 100;
  calc.round(n, digits: 2)
}%];

== Objective

The objective of this lab is to observe rotational dynamics and determine the
moment of intertia of a disk.

== Theory

Newton's second law states that $
tau = I alpha
$ or, the net torque is equal to the moment of inertia times the angular
acceleration.

Using a hanging mass to apply a torque on a disk, we have that $
I = m r ^2 (g/a - 1)
$

We also know that the moment of inertia for a cylinder is $
I = 1/2 M R^2
$

== Procedure

Setup the Pasco Rotational Apparatus with a single disk on top.  Setup a pulley
with a mass of 100g hanging from a string attached to the centre of the disk. 

Using the verneir software, measure the acceleration of the disk as the weight falls to the ground.

Repeat this process with two disks for procedure B.

== Data

=== Procedure A

#table(
  columns: (auto, auto),
  [Trial], [Acceleration (m/s)],
  [1], [0.02651],
  [2], [0.02633],
  [3], [0.02688],
  [4], [0.02754],
  [5], [0.02772],
)

=== Procedure B

#table(
  columns: (auto, auto),
  [Trial], [Acceleration (m/s)],
  [1], [0.01397],
  [2], [0.01418],
  [3], [0.01385],
  [4], [0.0136],
  [5], [0.01342],
)

== Analysis

=== Procedure A

The average acceleration recorded was 0.026996.  This gives us an experimental
$I$ of 0.00851327.  When compared to the calculated $I$ of 0.00729922, we get a
16.63% error.

=== Procedure B

The average acceleration recorded was 0.013804.  This gives us an experimental
$I$ of 0.01582378.  When compared to the calculated $I$ of 0.01411719, we get a
12.09% error.

== Conclusion

In summary, we were able to observe the effects of angular dynamics and
calculate the moment of interia through experimentation.

Our percent error was fairly high, but there are many causes such as the
pulleys not being rigid.  We had to hold them as they were measuring the data,
otherwise they would twist and make it impossible for us to measure.
