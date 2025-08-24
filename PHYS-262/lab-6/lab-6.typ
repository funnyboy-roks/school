#set math.equation(numbering: "(1)")
#[
  #set page(numbering: {})
  #set align(center)
  #show heading: set block(above: 8 * 1.65em, below: 1.65em)

  = Induction and Faraday's Law
  == Hayden Pott

  Lab Date: 24 April 2025 \
  Lab Section: 004 \
  Lab Parter: Erik Claros \
]

#let proc_err(expected, actual) = [#{
  let n = calc.abs((expected - actual) / expected) * 100;
  calc.round(n, digits: 2)
}%];

#let ohm = [Ω];
#let uF = [µF];

== Objective

The objective of this lab is to observe and investigate Faraday's Law of
Induction.

== Theory

Faraday's Law of Induction states that the electromotive force (_emf_) induced
in a coil placed inside of a changing magnetic field is proportional to $d Phi
/ d t$.

The flux of a magnetic field can be found as $
Phi = B A cos(theta)
$
where $B$ is the magnetic field at the coil, $A$ is the area of the coil, and
$theta$ is the direction of the field relative to the surface vector.

== Procedure

=== Procedure A

Setup a coil connected to the Vernier voltage difference probe.  Start
recording data and slowly bring the north end of a bar magnet towards the
centre of the coil.  Repeat this a few times, increasing in speed each time.
Save the run and perform the same operation, this time with the south end of
the magnet.

=== Procedure B

Using the same setup from the previous procedure, place a large coil, connected
to a sine wave generator around the smaller coil.  Set the sine wave generator
to 60 Hz and record what happens on the smaller coil.  Repeat this step with
the inner coil at various angles, measuring the results each time.

== Data

=== Procedure A

#image("./proc-a-graph.png")
(Red: North end, Blue: South end)

=== Procedure B

#image("./proc-b-graph.png")

== Analysis

=== Procedure A

It is very clear that the faster we move the magnet towards the coil, the
faster the voltage changes.  It is also clear that the direction in which the
voltage changes depends on which pole of the magnet we use; north makes the
voltage increase as we approach, while south makes it decrease.

=== Procedure B

Using the data we collected while the coil was at 0°, we can perform a sine fit
and get $"emf" = 0.178$.  Using $
abs("emf") = (pi mu_0 N N_p A f i_"max")/R
$
we can solve for the theoretical emf of 0.191664, which gives us a error of #proc_err(0.191664, 0.178)

== Conclusion

In conclusion, we see the effects of Faraday's law of induction.  There are
many sources of error in this experiment, such as interference from other
sources of electricity in the room.  There is also a large degree of human
error, especially in procedure A, where we did not do a great job at moving at
a cosntant rate and definitely did not increase speed consistently.
