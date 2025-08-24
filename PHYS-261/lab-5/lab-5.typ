#set math.equation(numbering: "(1)")
#[
  #set page(numbering: {})
  #set align(center)
  #show heading: set block(above: 8 * 1.65em, below: 1.65em)

  = Static and Kinetic Friction
  == Hayden Pott

  Lab Date: 8 April 2025 \
  Lab Section: 002 \
  Lab Parters: Mehedi Hasan \
]

#let proc_err(expected, actual) = [#{
  let n = calc.abs((expected - actual) / expected) * 100;
  calc.round(n, digits: 2)
}%];

== Objective

The objective of this lab is to observe the two types of friction; static and
kinematic.

== Theory

There are two types of friction; static and kinematic.

Static friction is that which an object has _before_ it starts to move.  This
friction is needed to be overcome in order for the object to start moving.  The
force from static friction satsfies the inequality $
f_s <= mu_s N
$ where $mu_s$ is the coefficient of static friction for the surfaces and $N$ is
the normal force on the object.

Once an object has started moving, the force from friction uses the kinetic
coefficent of friction: $
f_k = mu_k N
$

Since the force from friction applies in the opposite direction from the force applied on the object along the plane, we can measure the acceleration as $
mu_s = F_"min"/N
$

and the kinetic can be calculated as $
mu_k = (m g - a(M + m))/(M g)
$

== Procedure

Setup the computer to track the photogate and setup the track such that the
cart is on top and the pully is hanging off of the table.

=== Procedure A

Place the wood side of the block on the track, start recording, and then let go
of the block.  Once the weight has finished falling, record the acceleration of
the block from the logger pro software.

Repeat this with a variety of masses on the block and on the weight.

Repeat all these steps for the felt side of the block.

=== Procedure B

Remove the string from the block and the pully from the track.

Place the block on the track and increase the angle of the track ntil the block
starts to slide smoothly.  Once the block has started moving, record the height
of the track, which will be used to calulate the angle later.

Repeat this procedure for the felt block.

== Data

=== Procedure A

For procedure A, we collected the following data for the wood side:

#table(
  columns: (auto, auto, auto, auto),
  [Run], [m (kg)], [M (kg)], [$a_"exp"$ ($m/s^2$)],
  [1], [0.1500], [0.1246], [3.3630],
  [2], [0.1700], [0.1746], [2.6980],
  [3], [0.1900], [0.2246], [2.2220],
  [4], [0.2100], [0.2746], [1.7210],
  [5], [0.2300], [0.3246], [1.4920],
  [6], [0.2500], [0.3746], [1.3570],
)

For the felt side, we collected the following data:

#table(
  columns: (auto, auto, auto, auto),
  [Run], [m (kg)], [M (kg)], [$a_"exp"$ ($m/s^2$)],
  [1], [0.1500], [0.1246], [3.6720],
  [2], [0.1700], [0.1746], [3.1200],
  [3], [0.1900], [0.2246], [2.7300],
  [4], [0.2100], [0.2746], [2.4080],
  [5], [0.2300], [0.3246], [2.2070],
  [6], [0.2500], [0.3746], [2.0260],
)

=== Procedure B

For procedure B, we collected the following data for the wood side:

#table(
  columns: (auto, auto, auto),
  [Run], [H (cm)], [L (cm)],
  [1], [41], [100],
  [2], [42], [100],
  [3], [39], [100],
  [4], [40], [100],
  [5], [44], [100],
  [6], [41], [100],
)

For the felt side:

#table(
  columns: (auto, auto, auto),
  [Run], [H (cm)], [L (cm)],
  [1], [44], [100],
  [2], [42.5], [100],
  [3], [43.2], [100],
  [4], [38.5], [100],
  [5], [37.9], [100],
  [6], [44], [100],
)

== Analysis

=== Procedure A

For the wood data, we can calulate the $M g$ and $m g - a_"exp"(M+m)$ and plot them as $x$ and $y$, like so:

#image("proc-a-wood.png")

Taking the linear fit and getting the standard deviation of the slope, we get
$
mu_k = 0.4451 plus.minus 0.0035
$


If we do the same for the felt, we get:

#image("proc-a-felt.png")

Taking the linear fit and getting the standard deviation of the slope, we get
$
mu_k = 0.297 plus.minus 0.00524
$

=== Procedure B

For each of the data sets collected, we can calcuate the angle between the
table and the ramp, and then calculate the $mu_s$ by taking the tangent of that
angle.

For the wood:

#table(
  columns: (auto, auto, auto, auto),
  [Run], $sin(theta) = H/L$, [$theta$ (deg)], $mu_s = tan(theta)$,
  [1],   [0.41], [24.2048348], [0.44951925],
  [2],   [0.42], [24.83458749], [0.462797625],
  [3],   [0.39], [22.9544994], [0.42353791],
  [4],   [0.4], [23.57817848], [0.43643578],
  [5],   [0.44], [26.10388114], [0.489978944],
  [6],   [0.41], [24.2048348], [0.44951925],
)

Which gives us that $
mu_(s,"wood") = 0.4520 plus.minus 0.0229
$

For the felt:

#table(
  columns: (auto, auto, auto, auto),
  [Run], $sin(theta) = H/L$, [$theta$ (deg)], $mu_s = tan(theta)$,
  [1], [0.44], [26.10388114], [0.489978944],
  [2], [0.425], [25.15066341], [0.46951295],
  [3], [0.432], [25.59455228], [0.47900282],
  [4], [0.385], [22.64374026], [0.417155799],
  [5], [0.379], [22.27175411], [0.409554099],
  [6], [0.44], [26.10388114], [0.489978944],
)

Which gives us that $
mu_(s, "felt") = 0.4592 plus.minus 0.0364
$

== Conclusion

In conclusion, we were able to see the effects of friction and caluclate the
coefficient of friction for both static and kinetic on both a wood and felt
surface.

We were also able to see that $mu_k < mu_s$, which is what we expected to see
from this lab.

Of course, error is always present, in this case, the way in which we measured
in procedure B is an obvious case.  It is really hard to get precise
measurements when holding the track and trying to measure while also making
sure to move slowly enough to not influence the block with forces outisde of
gravity.
