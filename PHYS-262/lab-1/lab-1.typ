#set math.equation(numbering: "(1)")
#[
  #set page(numbering: {})
  #set align(center)
  #show heading: set block(above: 8 * 1.65em, below: 1.65em)
  // #show heading(level: 1): set text(2em)
  // #show heading(level: 2): set text(weight: "regular", style: "italic")

  = Waves on a string lab
  == Hayden Pott

  Lab Date: 20 March 2025 \
  Lab Section: 004 \
  Lab Parter: Erik Claros \
]

#let proc_err(expected, actual) = calc.round(calc.abs((expected - actual) / expected) * 100, digits: 2);

== Objective

The objective of this lab is to use harmonics of a string to determine its
linear mass density through expirmentation.

== Theory

The theoretical linear mass density of a string can be calcualted with the
following equation.

$
mu = m/l
$ <lmd>

Assuming we have the freqency, $f$, the length of the stretched string, $L$,
the linear mass density, $mu$, and the number of anti-nodes, $n$, we can
calcualte the tension, $T$ of the string using the following equation.

$
T = 4 L^2 f^2 mu 1/n^2
$ <tension>

This equation can be re-arranged as necessary in order to solve for other
aspects of the equation as needed.

== Procedure

For this lab, we setup a string connected to a string vibrator one one end,
laid over a pulley and then attached to an object of varying mass.  To the
string vibrator, we attached a frequency generator such that we may chang the
frequency at which the string is vibrated.

To this string, we attached a variety of masses and vibrated the strings at a
variety of rates in order to collect the necessary data.

For procedure A, we calculated the theoretical linear mass density of the
string using @lmd.  For procedure B, we set the frequency to a constant rate of
60 Hz and modified the mass hanging from the pulley in order to control the
tension of the string.  For procedure C, we did the opposite; we fixed the
mass at 50g and modified the frequency at which the string was vibrated to
find the correct number of anti-nodes.

== Data

#let m = .00084
#let l = 1.43
#let L = 1.12
#let muA = calc.round(m/l, digits: 6)
For procedure A, we determined that our string had a length of #l m and a mass of #m kg.

#figure(
  caption: "Recorded data from procedure B",
  table(
    columns: (auto, auto, auto, auto, auto),
    [n], [Theoretical tension (N)], [Hanging mass using theoretical tension (kg)], [Hanging mass used in the setup (kg)], [Applied tension (N)],
    [1], [10.61064503],         [1.081615192],                            [1.15],                           [11.2815],
    [2], [2.652661259],         [0.270403798],                            [0.27],                           [2.6487],
    [3], [1.178960559],         [0.120179466],                            [0.12],                           [1.1772],
    [4], [0.663165315],         [0.06760095],                             [0.07],                           [0.6867],
    [5], [0.424425801],         [0.043264608],                            [0.04371],                        [0.4287951],
  )
)<proc-b-data>

#figure(
  caption: "Recorded data from procedure C",
  table(
    columns: (auto, auto, auto),
    [n], [Theoretical Frequency (Hz)], [Experimental Frequency (Hz)],
    [1], [42.7636474 ],              [42.8],
    [2], [85.52729479],              [85.5],
    [3], [128.2909422],              [128],
    [4], [171.0545896],              [170],
    [5], [213.818237 ],              [213],
    [6], [256.5818844],              [256.5],
  )
)<proc-c-data>

== Analysis

=== Procedure A

Using @lmd, we can calcualte the linear mass density at #muA kg/m

=== Procedure B

If we plot the tension vs $1/(n^2)$, the following chart will be obtained:

#figure(
  image("./proc-b-analysis.png")
)

#let b_slope = 11.329
#let muB = calc.round(b_slope/(4*L*L*60*60), digits: 6)

The slope of the linear fit, #b_slope, can be plugged into @tension to solve
for the linear mass density of the string, in this case, $mu = #muB$ kg/m.  When
compared to our theoretical value obtained in proc A of #muA kg/m, this gives
us a error of #proc_err(muA, muB)%.

=== Procedure C

If we plot the frequency vs number of anti-nodes, we get the following chart:

#figure(
  image("./proc-c-analysis.png")
)

#let c_slope = 42.657
#let muC = calc.round((9.8*0.55)/(4*L*L*calc.pow(c_slope, 2)), digits: 6)

The slope of the linear fit, #c_slope, can be plugged into @tension to find the
linear mass density of the string, in this case, $mu_C = #muC$ kg/m.  When
compared to our theoretical value obtained in procedure A of #muA kg/m, this
gives an error fo #proc_err(muA, muC)%.

== Conclusion

With the lab completion, we can conclude that the lab did reach the desired
goals.  We were able to calculate the linear mass density of a string using the
harmonics of the string both by modifying the tension on the string and the
frequency at which it vibrated.

As with any real-world measurements, there are many sources of error here.
Perhaps the largest is that we used no concrete way of determining whether the
wave was a proper standing wave.  Since we were just eyeball-ing it, there is
always a chance that the wave is just slighly incorrect and that would through
our measurements off.
