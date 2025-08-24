#set math.equation(numbering: "(1)")
#[
  #set page(numbering: {})
  #set align(center)
  #show heading: set block(above: 8 * 1.65em, below: 1.65em)
  // #show heading(level: 1): set text(2em)
  // #show heading(level: 2): set text(weight: "regular", style: "italic")

  = Magnetic Field of a Solenoid
  == Hayden Pott

  Lab Date: 17 April 2025 \
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

The objective of this lab is to study the electromagnetic force applied on a
magnet from a current through a wire.

== Theory

When a current is running through a wire in a magnet field, it generates a
force pushing away from the magnetic field.

The force from this magnetic field can be calcuated using the following equation: $
F_B = i L B sin theta
$
Or in the case that $theta = 90 deg$, we can simplify this to $
F_B = i L B
$

After accounting for gravity, we can measure the magnetic field strength of a magnet using $
B = (m_"scale" g)/(i L)
$

== Procedure

For this lab, setup a wire loop to run through a magnet block on a scale. After
taring the scale, turn the power supply on and set it to 0.25 A.  Record the
mass on the scale.  Increase the amperage to 2 A in increments of 0.25 A,
measuring the change in weight each time.  Repeat this for -2 A to -0.25 A.
Repeat this step for each of the wire loops.

== Data


For Wire 37 of length 0.022 m
#table(
  columns: (auto, auto, auto),
  [Trial], [Current i (A)], [Mass reported by the scale (g)],
  [1], [0.25], [0.030],
  [2], [0.50], [0.060],
  [3], [0.75], [0.100],
  [4], [1.00], [0.130],
  [5], [1.25], [0.160],
  [6], [1.50], [0.210],
  [7], [1.75], [0.240],
  [8], [2.00], [0.270],
  [9], [-2.00], [-0.260],
  [10], [-1.75], [-0.230],
  [11], [-1.50], [-0.190],
  [12], [-1.25], [-0.160],
  [13], [-1.00], [-0.130],
  [14], [-0.75], [-0.100],
  [15], [-0.50], [-0.060],
  [16], [-0.25], [-0.030],
)

For Wire 38 of length 0.042 m
#table(
  columns: (auto, auto, auto),
  [Trial], [Current i (A)], [Mass reported by the scale (g)],
  [1], [0.25], [0.060],
  [2], [0.50], [0.120],
  [3], [0.75], [0.180],
  [4], [1.00], [0.240],
  [5], [1.25], [0.300],
  [6], [1.50], [0.370],
  [7], [1.75], [0.430],
  [8], [2.00], [0.480],
  [9], [-2.00], [-0.510],
  [10], [-1.75], [-0.450],
  [11], [-1.50], [-0.390],
  [12], [-1.25], [-0.330],
  [13], [-1.00], [-0.260],
  [14], [-0.75], [-0.180],
  [15], [-0.50], [-0.120],
  [16], [-0.25], [-0.060],
)

For Wire 42 of length 0.084 m
#table(
  columns: (auto, auto, auto),
  [Trial], [Current i (A)], [Mass reported by the scale (g)],
  [1], [0.25], [0.110],
  [2], [0.50], [0.240],
  [3], [0.75], [0.360],
  [4], [1.00], [0.480],
  [5], [1.25], [0.600],
  [6], [1.50], [0.700],
  [7], [1.75], [0.810],
  [8], [2.00], [0.940],
  [9], [-2.00], [-0.970],
  [10], [-1.75], [-0.840],
  [11], [-1.50], [-0.710],
  [12], [-1.25], [-0.600],
  [13], [-1.00], [-0.480],
  [14], [-0.75], [-0.360],
  [15], [-0.50], [-0.230],
  [16], [-0.25], [-0.110],
)

== Analysis

After collecting the data for each of the wires, we can find the force by
multiplying the mass by $g$ and $i L$ by multiplying the current and the length.

After recording this, we plot $F_B$ vs $i L$, which gives us the field strength
by the slope.

Wire 37:
#table(
  columns: (auto, auto, auto),
  [Trial], [$F_B = m_"scale" g$ (N)], [$i L$ (Am)],
  [1], [0.000294], [0.0055],
  [2], [0.000588], [0.011],
  [3], [0.00098], [0.0165],
  [4], [0.001274], [0.022],
  [5], [0.001568], [0.0275],
  [6], [0.002058], [0.033],
  [7], [0.002352], [0.0385],
  [8], [0.002646], [0.044],
  [9], [-0.002548], [-0.044],
  [10], [-0.002254], [-0.0385],
  [11], [-0.001862], [-0.033],
  [12], [-0.001568], [-0.0275],
  [13], [-0.001274], [-0.022],
  [14], [-0.00098], [-0.0165],
  [15], [-0.000588], [-0.011],
  [16], [-0.000294], [-0.0055],
)

#image("./wire-37.png")

Slope = $0.0588 plus.minus 0.0005$

Wire 38:
#table(
  columns: (auto, auto, auto),
  [Trial], [$F_B = m_"scale" g$ (N)], [$i L$ (Am)],
  [1], [0.000588], [0.0105],
  [2], [0.001176], [0.021],
  [3], [0.001764], [0.0315],
  [4], [0.002352], [0.042],
  [5], [0.00294], [0.0525],
  [6], [0.003626], [0.063],
  [7], [0.004214], [0.0735],
  [8], [0.004704], [0.084],
  [9], [-0.004998], [-0.084],
  [10], [-0.00441], [-0.0735],
  [11], [-0.003822], [-0.063],
  [12], [-0.003234], [-0.0525],
  [13], [-0.002548], [-0.042],
  [14], [-0.001764], [-0.0315],
  [15], [-0.001176], [-0.021],
  [16], [-0.000588], [-0.0105],
)

#image("./wire-38.png")

Slope = $0.0583 plus.minus 0.0004$

Wire 42:
#table(
  columns: (auto, auto, auto),
  [Trial], [$F_B = m_"scale" g$ (N)], [$i L$ (Am)],
  [1], [0.001078], [0.021],
  [2], [0.002352], [0.042],
  [3], [0.003528], [0.063],
  [4], [0.004704], [0.084],
  [5], [0.00588], [0.105],
  [6], [0.00686], [0.126],
  [7], [0.007938], [0.147],
  [8], [0.009212], [0.168],
  [9], [-0.009506], [-0.168],
  [10], [-0.008232], [-0.147],
  [11], [-0.006958], [-0.126],
  [12], [-0.00588], [-0.105],
  [13], [-0.004704], [-0.084],
  [14], [-0.003528], [-0.063],
  [15], [-0.002254], [-0.042],
  [16], [-0.001078], [-0.021],
)

#image("./wire-42.png")

Slope = $0.0554 plus.minus 0.0002$

== Conclusion

In conclusion, we got fairly precise data as can see with the standard
deviation of each slope being less than $0.0005$.  We can also see that the
slopes for each wire are pretty close to each other, which is a good sign that
our readings and calculations are good.

In terms of error, there are of couse many sources.  The primary one is the
power supply is a very tempermental beast.  Sometimes it is hard to set the
amps/volts to be correct and it will just ocassionally change without any human
input.  Another issue could arrise from the scale.  It is very sensitive to any
amount of movement, leading to bumping the table changing measrurement.  If the
table was bumped when we recorded our value, it is not impossible that the
measurement was wrong.
