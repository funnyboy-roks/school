#set math.equation(numbering: "(1)")
#[
  #set page(numbering: {})
  #set align(center)
  #show heading: set block(above: 8 * 1.65em, below: 1.65em)

  = Geometrical Optics
  == Hayden Pott

  Lab Date: 1 May 2025 \
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

The objective of this lab is to observe how images are formed through lenses.

== Theory

When a convex lense has light passed through it to form an image on the other
side, we have that $
1/d_o + 1/d_i = 1/f
$

Additionally, we can find the magnificiation factor by using $
M = h_i / h_o = -d_i/d_o
$


== Procedure

=== Procedure A

Using lenses with $f = 10$ cm and $f = 20$ cm, allow the light from a window to
shine through the lense and come out on the wall.  Move the lense until the
image on the wall is a clear image of the window.  Mesure the distance between
the lense and the wall.

=== Procedure B

Using a lense with $f = 10$ cm, setup the optical bench to have the light
source shine through the lense onto the screen.  Placing the screen at various
positions and adjusing the lense so the image is clear, record the position of
the light source, the lense, and the screen.  Additionally, record the height
of the light source and the hight of the image shown on the screen.

For each position of the screen on the bench, measure for both positions of the
lense which generate a clear image.

Repeat these step for the $f = 20$ cm lense.

== Data

=== Procedure A

We measured 10 cm for the $f = 10$ cm lense and 19.4 cm for the $f = 20$ cm
lense.

=== Procedure B

$f = 10$ cm lense
#table(
  columns: (auto, auto, auto, auto, auto, auto),
  [Trial], [Light Source Position (cm)], [Lens position (cm)], [Screen position (cm)], [$h_0$ (cm)], [$h_i$ (cm)],
  [1], [1], [40], [53.9],  [4.5], [-1.5],
  [2], [1], [14], [53.9],  [2], [-6.2],
  [3], [1], [50.1], [63],  [4.5], [-1.15],
  [4], [1], [13.4], [63],  [2], [-8],
  [5], [1], [56.6], [69],  [4.5], [-1],
  [6], [1], [12.9], [69],  [2], [-9.4],
  [7], [1], [68], [80],    [4.5], [-0.8],
  [8], [1], [12.7], [80],  [2], [-11.5],
  [9], [1], [35.4], [50],  [4.5], [-1.9],
  [10], [1], [15.1], [50], [2], [-4.8],
)

$f = 20$ cm lense
#table(
  columns: (auto, auto, auto, auto, auto, auto),
  [Trial], [Light Source Position (cm)], [Lens position (cm)], [Screen position (cm)], [$h_0$ (cm)], [$h_i$ (cm)],
  [1], [1], [72.1], [100], [4.5], [-1.8],
  [2], [1], [27.7], [100], [2], [-5.7],
  [3], [1], [60.3], [90],  [4.5], [-2.2],
  [4], [1], [30.2], [90],  [2], [-4.1],
  [5], [1], [83.7], [110], [4.5], [-1.4],
  [6], [1], [26.3], [110], [2], [-6.5],
  [7], [1], [53.5], [85],  [4.5], [-2.7],
  [8], [1], [32], [85],    [2], [-3.5],
  [9], [1], [66.4], [95],  [4.5], [-1.9],
  [10], [1], [28.9], [95], [2], [-4.7],
)

== Analysis

=== Procedure A

When comparing the values we recorded versus the actual focal length of the
lenses, we get a percent error of 0% and 3% for the 10cm and 20cm lenses
respectively.

=== Procedure B

$f = 10$ cm lense

#table(
  columns: (auto, auto, auto, auto),
  [Trial], [d_0(cm)], [d_i (cm)], [Measured f using EQ. 7-1 (cm)],
  [1], [39], [13.9], [10.24763705],
  [2], [13], [39.9], [9.805293006],
  [3], [49.1], [12.9], [10.21596774],
  [4], [12.4], [49.6], [9.92],
  [5], [55.6], [12.4], [10.13882353],
  [6], [11.9], [56.1], [9.8175],
  [7], [67], [12], [10.17721519],
  [8], [11.7], [67.3], [9.96721519],
  [9], [34.4], [14.6], [10.24979592],
  [10], [14.1], [34.9], [10.04265306],
)

Plotting $1/d_i$ vs $1/d_o$, we get

#image("./proc-b-10cm.png")

Using the inverse of the y-intercept to find the focal length, we get $f_"exp"
= 10.309278$.  When comapared to the focal length found in procedure A, we get
a difference of 3.05%.

Using the height of the image versus the source, we can find the magnification:

#table(
  columns: (auto, auto, auto, auto),
  [Trial], $M = h_i/h_o$, $M = - d_i/d_o$, [% diff],
  [1], [-0.333333333], [-0.356410256], [6.6914%],
  [2], [-3.1], [-3.069230769], [0.9975%],
  [3], [-0.255555556], [-0.262729124], [2.7682%],
  [4], [-4], [-4], [0.0000%],
  [5], [-0.222222222], [-0.223021583], [0.3591%],
  [6], [-4.7], [-4.714285714], [0.3035%],
  [7], [-0.177777778], [-0.179104478], [0.7435%],
  [8], [-5.75], [-5.752136752], [0.0372%],
  [9], [-0.422222222], [-0.424418605], [0.5188%],
  [10], [-2.4], [-2.475177305], [3.0841%],
)


$f = 20$ cm lense

#table(
  columns: (auto, auto, auto, auto),
  [Trial], [d_0(cm)], [d_i (cm)], [Measured f using EQ. 7-1 (cm)],
  [1], [71.1], [27.9], [20.03727273],
  [2], [26.7], [72.3], [19.49909091],
  [3], [59.3], [29.7], [19.7888764],
  [4], [29.2], [59.8], [19.61977528],
  [5], [82.7], [26.3], [19.95422018],
  [6], [25.3], [83.7], [19.42761468],
  [7], [52.5], [31.5], [19.6875],
  [8], [31], [53], [19.55952381],
  [9], [65.4], [28.6], [19.89829787],
  [10], [27.9], [66.1], [19.61904255],
)

Plotting $1/d_i$ vs $1/d_o$, we get

#image("./proc-b-20cm.png")

Using the inverse of the y-intercept to find the focal length, we get $f_"exp"
= 20.16129$.  When comapared to the focal length found in procedure A, we get
a difference of 3.85%.

Using the height of the image versus the source, we can find the magnification:

#table(
  columns: (auto, auto, auto, auto),
  [Trial], $M = h_i/h_o$, $M = - d_i/d_o$, [% diff],
  [1], [-0.4], [-0.392405063], [1.9169%],
  [2], [-2.85], [-2.707865169], [5.1147%],
  [3], [-0.488888889], [-0.50084317], [2.4157%],
  [4], [-2.05], [-2.047945205], [0.1003%],
  [5], [-0.311111111], [-0.318016929], [2.1954%],
  [6], [-3.25], [-3.308300395], [1.7779%],
  [7], [-0.6], [-0.6], [0.0000%],
  [8], [-1.75], [-1.709677419], [2.3310%],
  [9], [-0.422222222], [-0.437308869], [3.5104%],
  [10], [-2.35], [-2.369175627], [0.8127%],
)

== Conclusion

In conclusion, we were able to observe how images are formed through a lense
and measure the focal length of a lense through experimentation.  Many of our
experiments were quite successful, with a very small error (almost all were
less than 3%).

There are many sources of error, but the biggest is that the we are just
estimating what the clearest image is.  There is a nonzero chance that we did
not find the clearest version of the image, just one that looked clear enough.

