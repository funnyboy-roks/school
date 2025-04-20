#set math.equation(numbering: "(1)")
#[
  #set page(numbering: {})
  #set align(center)
  #show heading: set block(above: 8 * 1.65em, below: 1.65em)

  = Newton's Second Law
  == Hayden Pott

  Lab Date: 8 April 2025 \
  Lab Section: 002 \
  Lab Parters: Mehedi Hasan, Allison Viator \
]

#let proc_err(expected, actual) = [#{
  let n = calc.abs((expected - actual) / expected) * 100;
  calc.round(n, digits: 2)
}%];

== Objective

The objective of this lab is to study Newton's second law of motion and see it in action.

== Theory

Newton's second law of motion states that the net force acting on an object is
the product of its mass and its acceleration: $
arrow(F)_"net" = m arrow(a)
$

Using this law, we can calculate the acceleration of a cart with mass $M$ on a
track pulled by a mass $m$ hanging from a pulley using the following equation: $
a = (m g)/(M + m)
$

== Procedure

After setting up the software for measuring the position, level the track and
set the cart on it.

=== Procedure A

Grab the cart with the hook and record you moving the cart back and forth
across the track using the Vernier software.

=== Procedure B

Connect the string to the cart and route it along the pulley.  Being sure to
hold the cart, add the mass hanger.

Start recording, wait a couple of seconds, then let the cart go.

Increasing the mass by 10 g between, repeat these steps until you reach 90 g.

== Data

=== Procedure A

#image("./proc-a.png")

=== Procedure B

#table(
  columns: (auto, auto, auto),
  [Data Set Number], [Hanging Mass (kg)], [Acceleration of cart ($m/s^2$)],
  [1], [0.020], [0.343],
  [2], [0.030], [0.521],
  [3], [0.040], [0.686],
  [4], [0.050], [0.845],
  [5], [0.060], [0.994],
  [6], [0.070], [1.141],
  [7], [0.080], [1.294],
  [8], [0.090], [1.429],
)

== Analysis

=== Procedure A

Looking at the data captured in Procedure A, we performed a line fit on the
force vs acceleration graph.  This line fit resulted in slope of about 0.5291,
giving a percent error of #proc_err(.501, .5291).

=== Procedure B

With the data collected in procedure B, we can calculate the force on the cart
using the hanging mass in $F = m g$.  From that, we can calculate the
experimental mass of the cart using $M_"exp" = F/a$.

We can also calculate the acceleration using equation 4.2

This gives us the following results:

#table(
  columns: (auto, auto, auto, auto, auto, auto),
  [Data set No.], [Force on cart F (N)], [Mexp from F/a (kg)], [% error for mass], [acceleration from eq 4-2], [% error for acceleration],
  [1], [0.188], [0.548], [9.40%], [0.376], [8.82%],
  [2], [0.274], [0.525], [4.97%], [0.553], [5.90%],
  [3], [0.364], [0.530], [5.91%], [0.724], [5.32%],
  [4], [0.441], [0.521], [4.17%], [0.889], [4.98%],
  [5], [0.517], [0.520], [3.82%], [1.048], [5.16%],
  [6], [0.592], [0.518], [3.56%], [1.201], [5.03%],
  [7], [0.662], [0.511], [2.11%], [1.349], [4.11%],
  [8], [0.735], [0.514], [2.66%], [1.492], [4.25%],
)

From this data, we can plot a chart of force vs acceleration and perfom a linear fit:

#image("./proc-b.png")

The linear fit gives us a mass of $0.503$ kg, giving an error of #proc_err(0.501, 0.503).

== Conclusion

In conclusion, the lab allowed us the analyse the physical effects of Newton's
second law and work backwards to find the mass from other aspects of the force.

There are of course many opportunities for error, though they seem to be fairly
minimised as the errors for most readings in the lab are very low.  The biggest
source of error is human error.  If the track was not perfectly levelled (or
got bumped after being levelled), the measurements would be off.

Another souce of error is that we assume that we are in a perfect world, with
no friction or any other forces acting on the cart.  While these forces are
minimial, they do still have some effect on the cart and influence our
readings.  These external forces may lead to our readings being slightly off
which could compound to make larger errors.

