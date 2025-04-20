#set math.equation(numbering: "(1)")
#[
  #set page(numbering: {})
  #set align(center)
  #show heading: set block(above: 8 * 1.65em, below: 1.65em)
  // #show heading(level: 1): set text(2em)
  // #show heading(level: 2): set text(weight: "regular", style: "italic")

  = Motion Sensor Lab
  == Hayden Pott

  Lab Date: 25 March 2025 \
  Lab Section: 002 \
  Lab Parters: Mehedi Hasan, Allison Viator \
]

#let proc_err(expected, actual) = [#{
  let n = calc.abs((expected - actual) / expected) * 100;
  calc.round(n, digits: 2)
}%];

== Objective

The objective of this lab is to observe the connection betwen position,
velocity, and acceleration of a moving object by observing the motion of a cart
along a track.

== Theory

Kinematics allow us to relate the position of an object to its velocity and
acceleration.  The velocity of an object can be found by taking the derivative
of its position: $ v(t) = x'(t) $

If we don't have a function to define the $x$ at any point in time, we may
calculate the average velocity of an object by observing its change in $x$ over
time: $ v(t) = (Delta x) / (Delta y) $

We can apply a similar concept to get the acceleration from the velocity of an object:
$ a(t) = v'(t) $ or for an average acceleration: $ a(t) = (Delta v) / (Delta t) $

We can calculate the position of an object if we know its acceleration $a$,
initial velocity $v_0$, and initial position $x_0$: $
x(t) = 1/2 a t^2 + v_0 t + x_0
$

== Procedure

Data for this lab will be collected through the Vernier Graphical Analysis
software and the Go-Direct sensor cart.

Before any parts of the lab are completed, the car must be connected to the
computer in order for data to be properly recorded.

=== Part A

Start recording in the Vernier software and move the cart back and forth by
hand.  Observe how the lines compare.

=== Part B

Set the cart on a level track.  Start recording data, and then push the cart to
the other side of the track and measure the position/velocity/acceleration.

After data is collected in Vernier, record the slope of the position graph, the
average of the velocity, the slope of the velocity curve, and the average of
the acceleration curve.

=== Part C

Set the cart facing down at the top of an angled track.  Release the cart and
measure the position/velocity/acceleration as it falls.

After the data is collected in Vernier, record the coefficient of the x-curve
fit, the slope of the velocity curve, and the average of the acceleration.

=== Part D

Set the cart facing up at the bottom of an angled track.  Push the cart up the
track measure the position/velocity/acceleration as it falls.

After the data is collected in Vernier, record the coefficient of the x-curve
fit, the slope of the velocity curve, and the average of the acceleration.

== Data

After performing the procedures for this lab, we recorded the following data:

=== Part A

#image("proc-a.png")

=== Part B

#image("proc-b.png")

#table(
  columns: (auto, auto, auto),
  [Velocity], [Slope of x-curve (m/s)], [0.6897],
  [], [Average of v-curve (m/s)], [0.689],
                  
  [Acceleration], [Slope of v-curve (m/s^2)], [-0.0235],
  [], [Average of a-curve (m/s^2)], [-0.024],
)

=== Part C

#image("proc-c.png")

#table(
  columns: (auto, auto),
  [Coefficient of x-curve fit ($m/s^2$)], [0.4064],
  [Slope of v-curve ($m/s^2$)], [0.8141],
  [Average of a-curve ($m/s^2$)], [0.813],
)

=== Part D

#image("proc-d.png")

#table(
  columns: (auto, auto),
  [Coefficient of x-curve fit ($m/s^2$)], [-0.4241],
  [Slope of v-curve ($m/s^2$)], [-0.8412],
  [Average of a-curve ($m/s^2$)], [-0.84],
)

== Analysis

=== Part B

The slope of the line is almost exactly the same as the average of
the velocity curve as can be seen in the data of $0.6897$ of the position slope
versus the $0.689$ of the average velocity.  The measured velocity had a
standard deviation of $0.006$, which is quite low.

The percent difference between the position slope and the average velocity was just $0.102 %$.

=== Part C

The position of the car is clearly quadric in nature as you can see it
increases more quickly over time.  Looking at the coefficient provided by the
curve fit ont he position, we get 0.4064.  Since equation 5 has the $1/2$ at
the beginning, we must multiply this value by two to get the estimated
acceleration of 0.8128.  Taking the slope of the velocity graph gives us
0.8141, and the average of the acceleration graph gives us 0.813. When we
average these numbers, we get 0.8133.

We can calculate the theoretical acceleration using Pythogras, which gives us a
vertical acceleration of 0.8608.

=== Part D

The position of the car is clearly quadratic in nature with how it starts off
quick, then slows, then reverses direction, then accelerates.  The coefficient
of a curve fit is -0.4241, which we also need to multiply by two, giving us
-0.8482.  The slope of the velocity curve is -0.8412, and the average of the
acceleration curve is -0.84.  The average of these values comes out to be
-0.8431.

We can calculate the theoretical acceleration using Pythogras, which gives us a
vertical acceleration of -0.8608.

== Conclusion

In conclusion, we find that the position, velocity, and acceleration of an
object behaves exactly as we would expect.  When the object is on an incline,
gravity is pulling it down the ramp at a certain acceleration which can
calculate pretty simply.

There are many potential causes for error in this lab, but the biggest is that
we are not taking into account things like air resistance and friction of the
wheels.  Both of these items will cause additional acclerations on the object
that are not taken into account in our calculations and are one of the reasons
that we end up with the percent error that we did.

