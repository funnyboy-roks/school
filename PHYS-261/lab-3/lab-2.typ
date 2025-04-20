#set math.equation(numbering: "(1)")
#[
  #set page(numbering: {})
  #set align(center)
  #show heading: set block(above: 8 * 1.65em, below: 1.65em)
  // #show heading(level: 1): set text(2em)
  // #show heading(level: 2): set text(weight: "regular", style: "italic")

  = Force Table Lab
  == Hayden Pott

  Lab Date: 1 April 2025 \
  Lab Section: 002 \
  Lab Parters: Mehedi Hasan, Allison Viator \
]

#let proc_err(expected, actual) = [#{
  let n = calc.abs((expected - actual) / expected) * 100;
  calc.round(n, digits: 2)
}%];

== Objective

The objective of this lab is to discover how adding vectors works through
phyiscal and mathematical methods.

== Theory

Force, one of the most fundamental concepts in Physics, is measured as a
vector.  That is to say, force has a magnitude and a direction.  Vectors are used
in many different fields of maths and all over physics.

A vector, $arrow(v)$ consists of components, $angle.l v_1, v_2, ..., v_3
angle.r$.  In Physics, we often use only 2 and 3 dimensional vectors, in which
the components represent $x$, $y$, and $z$ (if 3D).

A force table is a mehtod of adding two vectors by relying on forces.  After
positioning weights at correct angles to represent certain vectors, one may
experimentally position a force in order to attempt to determine the correct
angle and weight to counter-balance the existing weights.  This counter-balance
is referred to as $arrow(E)$.  Once the ideal is found, one may negate the
values in order to find the true resultant vector, $arrow(R)$.

The other way to add vectors is to take the sum of the components: $
arrow(v) + arrow(u) = arrow(R) = angle.l v_1 + u_1, v_2 + u_2 angle.r
$

One can convert from an angle and magnitude to the component form of a vector quite simply: $
arrow(v) = angle.l abs(v)cos theta , abs(v) sin theta angle.r
$

One can convert from component form into angle and magnitude like so: $
  abs(arrow(v)) &= sqrt(v_1^2 + v_2^2) \
  arrow(v)_theta &= tan^(-1)v_1/ v_2
$

== Procedure

Setup the force table by levelling its surface and adding the ring and strings.

Now, there will be 5 pairs vectors to setup and then experimentally find the
equilibrant vector.

== Data

The data collected for this lab are as follows:

#table(
  columns: (auto, auto, auto, auto, auto),
  [Mass (kg)], [Force (N)], [Angle(°)], [x-component], [y-component],
  [0.150], [1.4715], [0], [1.472], [0.000],
  [0.200], [1.962], [90], [0.000], [1.962],
  [Sum of x/y components of A and B], [], [], [1.472], [1.962],
  [Measured E and angle], [], [], [], [],
  [0.25], [2.4525], [232.5], [-1.493], [-1.946],
  [Sum of x/y components of A, B & E], [], [], [-0.021], [0.016],
)

#table(
  columns: (auto, auto, auto, auto, auto),
  [Mass (kg)], [Force (N)], [Angle(°)], [x-component], [y-component],
  [0.150], [1.4715], [30], [1.274], [0.736],
  [0.200], [1.962], [120], [-0.981], [1.699],
  [Sum of x/y components of A and B], [], [], [0.293], [2.435],
  [Measured E and angle], [], [], [], [],
  [0.25], [2.4525], [263], [-0.299], [-2.434],
  [Sum of x/y components of A, B & E], [], [], [-0.006], [0.001],
)

#table(
  columns: (auto, auto, auto, auto, auto),
  [Mass (kg)], [Force (N)], [Angle(°)], [x-component], [y-component],
  [0.150], [1.4715], [-30], [1.274], [-0.736],
  [0.100], [0.981], [90], [0.000], [0.981],
  [Sum of x/y components of A and B], [], [], [1.274], [0.245],
  [Measured E and angle], [], [], [], [],
  [0.13], [1.2753], [190], [-1.256], [-0.221],
  [Sum of x/y components of A, B & E], [], [], [0.018], [0.024],
)

#table(
  columns: (auto, auto, auto, auto, auto),
  [Mass (kg)], [Force (N)], [Angle(°)], [x-component], [y-component],
  [0.100], [0.981], [60], [0.491], [0.850],
  [0.200], [1.962], [200], [-1.844], [-0.671],
  [Sum of x/y components of A and B], [], [], [-1.353], [0.179],
  [Measured E and angle], [], [], [], [],
  [0.14], [1.3734], [350], [1.353], [-0.238],
  [Sum of x/y components of A, B & E], [], [], [-0.001], [-0.060],
)

#table(
  columns: (auto, auto, auto, auto, auto),
  [Mass (kg)], [Force (N)], [Angle(°)], [x-component], [y-component],
  [0.250], [2.4525], [156.5], [-2.249], [0.978],
  [0.170], [1.67], [86.01942781], [-0.116], [1.667],
  [0.220], [2.1582], [356.5], [2.154], [-0.132],
  [Sum of x/y components of A, B, C], [], [], [-0.211], [2.513],
  [Measured E and angle], [], [], [], [],
  [0.25], [2.4525], [270], [0.000], [-2.453],
  [Sum of x/y components of A, B & E], [], [], [-0.211], [0.061],
)

== Analysis

From the provided mass, we can trivially calculate the force, as it is just the
tension over the pulley.  To calculate this, we can just find the force on the
mass by gravity, using $F = m g$.  From this force, we can now have the
magnitude of the true vector.

After we find the $arrow(E)$, we split it into its $x$ and $y$ values.  When we
add the x and y values of all vectors, if we're at equilibrium, we should get
$arrow(0)$.

Using the theoretical magnitude and angle calculated above for each vector, we
can find their components, sum them, and then calculate the $arrow(R)$ vector.
We can also find the angle and magnitude of that vector to get the following
values:

#table(
  columns: (auto, auto, auto, auto, auto, auto),
  $R_x$, $R_y$, $R_theta$, $abs(R)$, [$R_theta$ %error], [$|R|$ %error],
  [1.472], [1.962], [233.130], [2.453], [0.003], [0.000],
  [0.293], [2.435], [263.130], [2.453], [0.000], [0.000],
  [1.274], [0.245], [190.893], [1.298], [0.005], [0.017],
  [-1.353], [0.179], [352.484], [1.365], [0.007], [0.006],
  [-0.211], [2.513], [274.797], [2.522], [0.017], [0.028],
)

== Conclusion

In conclusion, we can confirm that both the force table and the component
addition of vectors result in the same values and those values result in our
idea of adding vectors.  Since percent error between the results
from using the force table versus the addition of component vectors is low, we
can conclude that they achieve basically the same goal.

There are many sources of errors with this lab, but the primary one is likely
imprecision in the force table.  The markings on the top are not particularly
granular and can potentially be a source of error if we misread them or the
angle was not perfectly precise.

The other main source of error is that we just estimated the centre of the
ring, we did not actually do anything to measure it.  This means that the ring
could have been a milimetre off of the centre and we may not have noticed.
