#set math.equation(numbering: "(1)")
#[
  #set page(numbering: {})
  #set align(center)
  #show heading: set block(above: 8 * 1.65em, below: 1.65em)

  = Energy Conservation
  == Hayden Pott

  Lab Date: 22 April 2025 \
  Lab Section: 002 \
  Lab Parters: Mehedi Hasan, Allison Viator \
]

#let proc_err(expected, actual) = [#{
  let n = calc.abs((expected - actual) / expected) * 100;
  calc.round(n, digits: 2)
}%];

== Objective

THe purpose of this lab is to measure potential and kinetic energy as a cart
rolls down a track and observe the conservation of energy in this operation.

== Theory

Conservation of energy states that the energy an object in a closed system has
before an event should equal the energy that it has after.

We can calculate the potential energy of an object due to gravity using $
"PE" = m g h
$ and the kinetic energy an object has using $
"KE" = 1/2 m v^2
$

== Procedure

=== Procedure A

After setting up the computer to track the cart's position and velocity, move
the cart to the top of the ramp.  Start recording data and release the cart.

=== Procedure B

Setup the cart in the same way as before, but instead of rolling it up before
releasing, start recording and then push the cart up the track.

== Data

=== Procedure A

We found that $H = 0.08546$ m, $L = 1$ m, and mass $= 0.29966$ kg.  We exported
the data collected into an Excel spreadsheet so we can perform analysis on it.

#image("./proc-a-data.png")

=== Procedure B

We found that $H = 0.08546$ m, $L = 1$ m, and mass $= 0.29966$ kg.  We exported
the data collected into an Excel spreadsheet so we can perform analysis on it.

#image("./proc-b-data.png")

== Analysis

=== Procedure A

Using the $H$ and $L$ found in the data, along with the individual $x$ values,
we can calculate the $h$ at any given point of time using $h = x H / L$.  Using
that $h$, we can calculate the potential energy using $"PE" = m g h$.  We can
also calculate the kinetic energy using $"KE" = 1/2 m v^2$.  Taking the sum of the PE
and KE gives us the total energy.

$
E_"initial" &= 0.253641043 \
E_"final" &= 0.252751482 \
%"difference" &= 0.35%
$

Graphing this, we get

#image("./proc-a.png")

which shows that the total energy is consistent.

=== Procedure B

Using the $H$ and $L$ found in the data, along with the individual $x$ values,
we can calculate the $h$ at any given point of time using $h = x H / L$.  Using
that $h$, we can calculate the potential energy using $"PE" = m g h$.  We can
also calculate the kinetic energy using $"KE" = 1/2 m v^2$.  Taking the sum of the PE
and KE gives us the total energy.

$
E_"initial" &= 0.191184932 \
E_"final" &= 0.176558423 \
%"difference" &= 7.65%
$

Graphing this, we get

#image("./proc-b.png")

which shows that the total energy is consistent.

== Conclusion

In conclusion, the lab showed that the total energy in the system remained
consistent even when the Kinetic and Potential energies varied.

As with any lab, there is a chance for error, especially human-error.  With
procedure A, we got a pretty low percent change, which either means that we did
quite well with measurements or any issues led to closer results.  There is
always the possiblity that us releasing the cart could have exerted some
external force or something.

Another bit source of error is the fact that we're not in an ideal world.  This
lab kind of assumes that there will be no external loss of energy (via things
like friction), so an error is unavoidable as those do exist in this world.

