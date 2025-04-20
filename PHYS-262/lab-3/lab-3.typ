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
#let uF = [µF];

== Objective

The objective  of this lab is to measure the $tau$ time constant in an RC
circuit by studying the characteristics of the capacitor charging curve.

== Theory

The voltage across the capacitor in the circuit can be measured as $
V_C(t) = Q(t)/C
$ and for a resistor, we have $
V_R(t) = i(t)R
$

We can use Kirchoff's law, we can calculate the voltage across the capacitor
while charging to be $
V_C(T) = V_0(1-e^(-t/tau))
$

By setting $V_C = 0.5 V_0$, we can solve for $t_(1/2)$ to get $
t_(1/2) = tau ln(2)
$

== Procedure

After setting up Vernier Pro to collect the correct data, one must setup a
simple DC circuit that consists of the power supply, 100 #ohm reistor and, 330
#uF capacitor.

Disconnect the power supply and start recording in Logger Pro.  After Logger
Pro has been recording for about 1 second, reconnect the power supply to the
circuit.  Ensure that the charge curve is smooth and repeat this step 3 more
times, saving the data as you go. 

== Data

The collected data with logger pro, along with the inverse exponential fit is
shown below.

#image("./data.png")

From the values recorded, we extracted the following table:

#table(
  columns: (auto, auto, auto),
  [Trial], $t_"switch"$, $t_"cross"$,
  [1], [1.767], [1.793],
  [2], [2.17], [2.196],
  [3], [2.181], [2.206],
  [4], [1.659], [1.684],
)

== Analysis

Using the first method for calculating $tau$ frim $t_(1/2)$

Using the $t_"switch"$ and $t_"cross"$ found above, we can calculate $t_(1/2)$:

#table(
  columns: (auto, auto, auto),
  [Trial], $t_(1/2)=t_"cross"-t_"switch"$, $tau=t_(1/2) / ln(2)$,
  [1], [0.026], [0.037510071],
  [2], [0.026], [0.037510071],
  [3], [0.025], [0.036067376],
  [4], [0.025], [0.036067376],
)

This calculation results in $
tau_A = 0.036788724 plus.minus 0.00083294
$

The second method of caclucating $tau$ is to use the curve fit from Logger Pro.
The values obtained from that are listed in the table below:

#table(
  columns: (auto, auto, auto),
  [Trial], $C$, $tau = 1/C$,
  [1], [26.64], [0.037538],
  [2], [26.89], [0.037189],
  [3], [26.69], [0.037467],
  [4], [26.76], [0.037369],
)

This calculation results in $
tau_B = 0.037391 plus.minus 0.000151
$

We can then calculate the theoretical $tau$ using the equations discussed above
to get 0.033.

Using this theoretical value, we can find the percent error for method A and
method B, which are 11% and 13.3% respectively.

== Conclusion

As with any experiment, there are many potential sources of error.  The
equipment is a big one in this lab, as it has been used and abused over many
years.  The power supplies are very tempermental and change values with the
slightest breath.

Another large factor would be the unreliability of the resistors and capacitors
that we used.  This, we believe, is the main cause for the high percent errors
found in this lab.  Speaking with the TAs, we concluded that the resistors and
capacitors might not be the exact values that they are rated for and that would
be a cause of such a high percent error that we have.
