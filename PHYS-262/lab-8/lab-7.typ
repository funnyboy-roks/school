#set math.equation(numbering: "(1)")
#[
  #set page(numbering: {})
  #set align(center)
  #show heading: set block(above: 8 * 1.65em, below: 1.65em)

  = Physical Optics
  == Hayden Pott

  Lab Date: 8 May 2025 \
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

The objective of this lab is to measure the wavelengths of a laser beam and the
wavelengths of the mercury light.

== Theory

When a light is shined through a grate, since they are waves, they will cause
the light on the other side of the grate to be cancelled out in some places and
increased in others.

Using $
m lambda = d sin theta
$ where $m$ is an integer, $d$ is the distance between the slits on the grating, and $
sin theta = a/c
$ where $a$ is the distance to the $m$th peak from the centre and $c$ is the
distance from that peak to the slit

== Procedure

=== Procedure A

Shine the laser through a grit and measure the a and the c

=== Procedure B

Setup the mercury lamp and the grating spectrometer.

Taking note of the angle (left and right), find the points at which the light
shines the brightest to get the distinct colours.

== Data

=== Procedure A

#table(
  columns: (auto, auto, auto),
  [Index (m)], [a (m)], [c (m)],
  [-2], [-0.715], [1.918],
  [-1], [-0.342], [1.812],
  [1], [0.35], [1.814],
  [2], [0.76], [1.935],
)

=== Procedure B


#table(
  columns: (auto, auto, auto),
  [Colour], [$theta_L$ (deg)], [$theta_R$ (deg)],
  [Yellow], [19], [20.5],
  [Green], [18.5], [20],
  [Blue Green], [17.5], [16],
  [Violet], [13.5], [15],
  [Deep Violet], [13], [14.5],
)

== Analysis

=== Procedure A

For Procedure A analysis, we just need to plug in the equation from above to
get the lambda and percent error from the expected values:

#table(
  columns: (auto, auto, auto),
  [Index (m)], [$lambda = (d sin(theta))/m$], [% error],
  [-2], [6.212E-07], [1.83%],
  [-1], [6.289E-07], [0.61%],
  [1], [6.431E-07], [1.63%],
  [2], [6.544E-07], [3.42%],
)

=== Procedure B

For procedure B, we can take the average of the two angles and then plug that
into our equation from before:


#table(
  columns: (auto, auto, auto, auto),
  [Colour], [theta_avg], [$lambda = (d sin(theta))/m$ (m)], [% error],
  [Yellow], [19.75], [5.631E-07], [2.39%],
  [Green], [19.25], [5.494E-07], [0.64%],
  [Blue Green], [16.75], [4.803E-07], [2.37%],
  [Violet], [14.25], [4.102E-07], [5.90%],
  [Deep Violet], [13.75], [3.961E-07], [2.91%],
)


== Conclusion

In conclusion, we were able to observe the objective.  We also ended up with
fairly small percent errors, so that is inidicitive that we were in pretty good
shape.

There are always errors present, in this case, the spectrometer could be a
source of error.  The dial is hard to read and the finest adjustments can
through off our values.  We also did not have the crosshairs on ours so we had
to eyeball the centre.
