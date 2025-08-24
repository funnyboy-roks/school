#set math.equation(numbering: "(1)")
#[
  #set page(numbering: {})
  #set align(center)
  #show heading: set block(above: 8 * 1.65em, below: 1.65em)

  = Conservation of Momentum
  == Hayden Pott

  Lab Date: 29 April 2025 \
  Lab Section: 002 \
  Lab Parters: Mehedi Hasan, Allison Viator \
]

#let proc_err(expected, actual) = [#{
  let n = calc.abs((expected - actual) / expected) * 100;
  calc.round(n, digits: 2)
}%];

== Objective

The objective of this lab is to observe the law of conservation of momentum in
a system with two carts.

== Theory

The law of conservation of momentum states that momentum is conserved if we can
neglect external forces: $
m_1 arrow(v)_1 + m_2 arrow(v)_2 = m_1 arrow(v)'_1 + m_2 arrow(v)'_2
$

If energy is _not_ conserved, then the collision is inelastic.

If the collision is elastic, the energy in the system should also be conserved:
$
1/2 m_1 v'_1^2 + 1/2 m_2 v'_2^2 = 1/2 m_1 v_1^2 + 1/2 m_2 v_2^2
$

== Procedure

After connecting two carts to the computer and levelling the track, set the
carts on the track.

=== Procedure A

Place the carts on the track with the magnets facing eachother.  Push Cart 1
and record it pushing Cart 2.

=== Procedure B

After adding 200 g to Cart 1, place the carts in the same was as procedure A
and push cart 1.

=== Procedure C

Move the weight to Cart 2, and repeat procedure A again.

=== Procedure D

Remove the weights and repeat Procedure A, but using the Velcro end this time.

=== Procedure E

Add the weight back to cart 1 and repeat procedure D

=== Procedure F

Move the weight to cart 2 and repeat procedure E

== Data

=== Procedure A

$m_1 = 0.29788$ kg \
$m_2 = 0.29502$ kg

#table(
  columns: (auto, auto, auto, auto, auto),
  [Trial], [$v_1$  (m/s)], [$v_2$  (m/s)], [$v'_1$  (m/s)], [$v'_2$  (m/s)],
  [1], [0.298], [0], [9.36E-04], [0.295],
  [2], [0.306], [8.51E-05], [0.296], [0.003],
  [3], [0.274], [0], [4.54E-05], [0.264],
)

#image("./proc-a.png")


=== Procedure B
$m_1 = 0.49788$ kg \
$m_2 = 0.29502$ kg

#table(
  columns: (auto, auto, auto, auto, auto),
  [Trial], [$v_1$  (m/s)], [$v_2$  (m/s)], [$v'_1$  (m/s)], [$v'_2$  (m/s)],
  [1], [0.281], [0], [6.60E-02], [0.345],
  [2], [2.62E-01], [7.74E-05], [0.061], [0.334],
  [3], [0.356], [7.78E-04], [8.80E-02], [0.441],
)

#image("./proc-b.png")

=== Procedure C
$m_1 = 0.29788$ kg \
$m_2 = 0.49502$ kg

#table(
  columns: (auto, auto, auto, auto, auto),
  [Trial], [$v_1$  (m/s)], [$v_2$  (m/s)], [$v'_1$  (m/s)], [$v'_2$  (m/s)],
  [1], [0.303], [0], [-0.072], [0.219],
  [2], [0.238], [0], [-0.044], [0.181],
  [3], [0.318], [0.0001702], [-0.064], [0.245],
)
#image("./proc-c.png")
=== Procedure D
$m_1 = 0.29788$ kg \
$m_2 = 0.29502$ kg

#table(
  columns: (auto, auto, auto, auto, auto),
  [Trial], [$v_1$  (m/s)], [$v_2$  (m/s)], [$v'_1$  (m/s)], [$v'_2$  (m/s)],
  [1], [0.45], [0], [0.21], [0.21],
  [2], [0.312], [0], [0.14], [0.14],
  [3], [0.382], [0], [0.178], [0.178],
)
#image("./proc-d.png")
=== Procedure E
$m_1 = 0.49788$ kg \
$m_2 = 0.29502$ kg

#table(
  columns: (auto, auto, auto, auto, auto),
  [Trial], [$v_1$  (m/s)], [$v_2$  (m/s)], [$v'_1$  (m/s)], [$v'_2$  (m/s)],
  [1], [0.305], [0], [0.174], [0.175],
  [2], [0.32], [0], [0.187], [0.186],
  [3], [0.482], [0], [0.292], [0.292],
)
#image("./proc-e.png")
=== Procedure F
$m_1 = 0.29788$ kg \
$m_2 = 0.49502$ kg

#table(
  columns: (auto, auto, auto, auto, auto),
  [Trial], [$v_1$  (m/s)], [$v_2$  (m/s)], [$v'_1$  (m/s)], [$v'_2$  (m/s)],
  [1], [-0.379], [0], [-0.141], [-0.141],
  [2], [-0.421], [-0.0002128], [-0.152], [-0.151],
  [3], [-0.553], [0], [-0.202], [-0.202],
)
#image("./proc-f.png")

== Analysis

To analyse the data collected, we can find the momentum before the collision
and after the collision and compare them.  The momentum should be fairly close
to the same before and after.

We can do a similar thing with energies.  Calculate the energy before the
collision and after the collision.  In elastic collisions, they should be very
close, but in inelastic, they should diverge very quickly. 

=== Procedure A

#table(
  columns: (auto, auto, auto, auto, auto, auto, auto, auto),
  [Trial], [$P_1$ (kg m/s)], [$P_2$ (kg m/s)], [$P_"net"$ (kg m/s)], [$P'_1$ (kg m/s)], [$P'_2$ (kg m/s)], [$P'_"net"$ (kg m/s)], [$P_"net"$ % diff],
  [1], [0.08876824], [0], [0.08876824], [2.79E-04], [0.0870309], [8.73E-02], [1.64%],
  [2], [0.09115128], [2.51E-05], [9.11E-02], [0.08817248], [0.00088506], [0.08905754], [2.27%],
  [3], [0.08161912], [0], [0.08161912], [1.35E-05], [0.07788528], [7.79E-02], [4.56%],
)

#table(
  columns: (auto, auto, auto, auto, auto, auto, auto, auto),
  [Trial], [$1/2 m_1 v_1^2$ (j)], [$1/2 m_2 v_2^2$ (J)], [$E_"net"$], [$1/2 m_1 v'_1^2$], [$1/2 m_2 v'_2^2$], [$E'_"net"$], [$E_"net"$ % diff],
  [1], [0.01322646776], [0], [0.01322646776], [1.30E-07], [0.01283705775], [1.28E-02], [2.94%],
  [2], [0.01394614584], [1.26E-05], [1.40E-02], [0.01304952704], [0.00000132759], [0.01305085463], [6.50%],
  [3], [0.01118181944], [0], [0.01118181944], [3.07E-10], [0.01028085696], [1.03E-02], [8.06%],
)
=== Procedure B

#table(
  columns: (auto, auto, auto, auto, auto, auto, auto, auto),
  [Trial], [$P_1$ (kg m/s)], [$P_2$ (kg m/s)], [$P_"net"$ (kg m/s)], [$P'_1$ (kg m/s)], [$P'_2$ (kg m/s)], [$P'_"net"$ (kg m/s)], [$P_"net"$ % diff],
  [1], [0.13990428], [0], [0.13990428], [3.29E-02], [0.1017819], [1.35E-01], [3.76%],
  [2], [1.30E-01], [2.28E-05], [1.30E-01], [3.04E-02], [0.09853668], [1.29E-01], [1.20%],
  [3], [0.17724528], [2.30E-04], [1.77E-01], [4.38E-02], [0.13010382], [1.74E-01], [2.00%],
)

#table(
  columns: (auto, auto, auto, auto, auto, auto, auto, auto),
  [Trial], [$1/2 m_1 v_1^2$ (j)], [$1/2 m_2 v_2^2$ (J)], [$E_"net"$], [$1/2 m_1 v'_1^2$], [$1/2 m_2 v'_2^2$], [$E'_"net"$], [$E_"net"$ % diff],
  [1], [0.01965655134], [0], [0.01965655134], [1.08E-03], [0.01755737775], [1.86E-02], [5.16%],
  [2], [1.71E-02], [8.83E-10], [1.71E-02], [9.26E-04], [0.01645562556], [1.74E-02], [1.72%],
  [3], [0.03154965984], [8.93E-08], [3.15E-02], [1.93E-03], [0.02868789231], [3.06E-02], [2.96%],
)

=== Procedure C

#table(
  columns: (auto, auto, auto, auto, auto, auto, auto, auto),
  [Trial], [$P_1$ (kg m/s)], [$P_2$ (kg m/s)], [$P_"net"$ (kg m/s)], [$P'_1$ (kg m/s)], [$P'_2$ (kg m/s)], [$P'_"net"$ (kg m/s)], [$P_"net"$ % diff],
  [1], [0.09025764], [0], [0.09025764], [-2.14E-02], [0.10840938], [8.70E-02], [3.65%],
  [2], [7.09E-02], [0.00E+00], [7.09E-02], [-1.31E-02], [0.08959862], [7.65E-02], [7.89%],
  [3], [0.09472584], [8.43E-05], [9.48E-02], [-1.91E-02], [0.1212799], [1.02E-01], [7.81%],
)

#table(
  columns: (auto, auto, auto, auto, auto, auto, auto, auto),
  [Trial], [$1/2 m_1 v_1^2$ (j)], [$1/2 m_2 v_2^2$ (J)], [$E_"net"$], [$1/2 m_1 v'_1^2$], [$1/2 m_2 v'_2^2$], [$E'_"net"$], [$E_"net"$ % diff],
  [1], [0.04512882], [0], [0.04512882], [-1.07E-02], [0.05420469], [4.35E-02], [3.65%],
  [2], [3.54E-02], [0.00E+00], [3.54E-02], [-6.55E-03], [0.04479931], [3.82E-02], [7.89%],
  [3], [0.04736292], [4.21E-05], [4.74E-02], [-9.53E-03], [0.06063995], [5.11E-02], [7.81%],
)
=== Procedure D

#table(
  columns: (auto, auto, auto, auto, auto, auto, auto, auto),
  [Trial], [$P_1$ (kg m/s)], [$P_2$ (kg m/s)], [$P_"net"$ (kg m/s)], [$P'_1$ (kg m/s)], [$P'_2$ (kg m/s)], [$P'_"net"$ (kg m/s)], [$P_"net"$ % diff],
  [1], [0.132759], [0], [0.132759], [6.20E-02], [0.0625548], [1.25E-01], [6.21%],
  [2], [9.20E-02], [0.00E+00], [9.20E-02], [4.13E-02], [0.0417032], [8.30E-02], [9.82%],
  [3], [0.11269764], [0.00E+00], [1.13E-01], [5.25E-02], [0.05302264], [1.06E-01], [6.35%],
)

#table(
  columns: (auto, auto, auto, auto, auto, auto, auto, auto),
  [Trial], [$1/2 m_1 v_1^2$ (j)], [$1/2 m_2 v_2^2$ (J)], [$E_"net"$], [$1/2 m_1 v'_1^2$], [$1/2 m_2 v'_2^2$], [$E'_"net"$], [$E_"net"$ % diff],
  [1], [0.029870775], [0], [0.029870775], [6.51E-03], [0.006568254], [1.31E-02], [56.23%],
  [2], [1.44E-02], [0.00E+00], [1.44E-02], [2.89E-03], [0.002919224], [5.81E-03], [59.54%],
  [3], [0.02152524924], [0.00E+00], [2.15E-02], [4.67E-03], [0.00471901496], [9.39E-03], [56.36%],
)

=== Procedure E

#table(
  columns: (auto, auto, auto, auto, auto, auto, auto, auto),
  [Trial], [$P_1$ (kg m/s)], [$P_2$ (kg m/s)], [$P_"net"$ (kg m/s)], [$P'_1$ (kg m/s)], [$P'_2$ (kg m/s)], [$P'_"net"$ (kg m/s)], [$P_"net"$ % diff],
  [1], [0.1509811], [0], [0.1509811], [8.61E-02], [0.052129], [1.38E-01], [8.42%],
  [2], [1.58E-01], [0.00E+00], [1.58E-01], [9.26E-02], [0.05540568], [1.48E-01], [6.59%],
  [3], [0.23859964], [0.00E+00], [2.39E-01], [1.45E-01], [0.08698096], [2.32E-01], [2.96%],
)

#table(
  columns: (auto, auto, auto, auto, auto, auto, auto, auto),
  [Trial], [$1/2 m_1 v_1^2$ (j)], [$1/2 m_2 v_2^2$ (J)], [$E_"net"$], [$1/2 m_1 v'_1^2$], [$1/2 m_2 v'_2^2$], [$E'_"net"$], [$E_"net"$ % diff],
  [1], [0.02302461775], [0], [0.02302461775], [7.49E-03], [0.0045612875], [1.21E-02], [47.64%],
  [2], [2.53E-02], [0.00E+00], [2.53E-02], [8.66E-03], [0.00515272824], [1.38E-02], [45.52%],
  [3], [0.05750251324], [0.00E+00], [5.75E-02], [2.11E-02], [0.01269922016], [3.38E-02], [41.21%],
)

=== Procedure F

#table(
  columns: (auto, auto, auto, auto, auto, auto, auto, auto),
  [Trial], [$P_1$ (kg m/s)], [$P_2$ (kg m/s)], [$P_"net"$ (kg m/s)], [$P'_1$ (kg m/s)], [$P'_2$ (kg m/s)], [$P'_"net"$ (kg m/s)], [$P_"net"$ % diff],
  [1], [-0.11289652], [0], [-0.11289652], [-4.20E-02], [-0.06979782], [-1.12E-01], [0.97%],
  [2], [-1.25E-01], [-1.05E-04], [-1.26E-01], [-4.53E-02], [-0.07474802], [-1.20E-01], [4.37%],
  [3], [-0.16472764], [0.00E+00], [-1.65E-01], [-6.02E-02], [-0.09999404], [-1.60E-01], [2.77%],
)

#table(
  columns: (auto, auto, auto, auto, auto, auto, auto, auto),
  [Trial], [$1/2 m_1 v_1^2$ (j)], [$1/2 m_2 v_2^2$ (J)], [$E_"net"$], [$1/2 m_1 v'_1^2$], [$1/2 m_2 v'_2^2$], [$E'_"net"$], [$E_"net"$ % diff],
  [1], [0.02139389054], [0], [0.02139389054], [2.96E-03], [0.00492074631], [7.88E-03], [63.16%],
  [2], [2.64E-02], [1.12E-08], [2.64E-02], [3.44E-03], [0.00564347551], [9.08E-03], [65.59%],
  [3], [0.04554719246], [0.00E+00], [4.55E-02], [6.08E-03], [0.01009939804], [1.62E-02], [64.48%],
)

== Conclusion

As we can see, the difference between the momentum before and after the
collision were fairly close to 0%, sometimes getting as low as less than 1%.
We can also see that the energy behaved similarly to how we expected, remaining
very similar in elastic collisions, but having a very large difference in the
inelastic collisions.

Of course, error must exist as this is the real world.  Most notable of which
is the fact that we don't account for external forces, such as friction.
Friction does cause the carts to lose energy and and momentum as the cart
slows, but we ignore that for sake of simplicity.  While friction does not
contribute _much_ to the carts, it is enough to skew our numbers.
