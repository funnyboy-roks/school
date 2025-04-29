#import "@preview/lemmify:0.1.5": *
#import "@preview/plotst:0.2.0": *
#import "@preview/cetz:0.3.2"
#import "@preview/cetz-plot:0.1.1"

#set table(
  stroke: (x, y) => if y == 0 {
    (bottom: 0.7pt + black)
  } else { 
    (
      bottom: .1pt + black,
      left: if x == 0 { none } else {
        .1pt + black
      }
    )
  },
  fill: (x, y) => if calc.rem(y, 2) == 1 {
    rgb(0, 0, 255, 0x11)
  }
)

#let todo = (content) => text(fill: red, size: 2em)[ TODO: #content ];

#set enum(numbering: "a)")
#let notin = math.class(
  "relation",
  $cancel(in)$,
)

#let my-thm-style(
  thm-type, name, number, body
) = grid(
  columns: (1fr, 3fr),
  column-gutter: 1em,
  stack(spacing: .5em, [#strong(thm-type) #number], emph(name)),
  body
)
#let my-styling = (
  thm-styling: my-thm-style,
  thm-numbering: _ => none
)

#let (
  definition, theorem, proof, lemma, rules, example
) = default-theorems("thm-group", lang: "en", ..my-styling)
#let def(name, c) = definition(name: name)[#c]
#show: rules
#show thm-selector("thm-group"): box.with(inset: 0.8em)
#show thm-selector("thm-group", subgroup: "theorem"): it => box(
  it, fill: rgb("#eeffee"))

#let chart_fn((x_min, x_max), precision: 10, mapper) = {
  let data = range(x_min * precision, x_max * precision).map(x => x / float(precision)).map(x => (x, mapper(x)));

  // Create the axes used for the chart 
  let x_axis = axis(
    min: x_min,
    max: x_max,
    location: "bottom"
  )
  let y_axis = axis(
    min: calc.floor(calc.min(0, calc.min(..data.map(((x,y)) => y)))) - 1,
    max: calc.max(..data.map(((x,y)) => y)) + 1,
    location: "left",
    helper_lines: false
  )
  // TODO: figure out how to centre these axes

  // Combine the axes and the data and feed it to the plot render
  let pl = plot(data: data, axes: (x_axis, y_axis))
  graph_plot(
    pl,
    (100%, 25%),
    rounding: 30%,
    caption: "Graph Plot with caption and rounding",
    markings: "circle",
  )
}

// #chart_fn((-10, 10), x => 10 * calc.cos(x));

#cetz.canvas(
  {
    import cetz.draw: *
    import cetz-plot: *

    plot.plot(
      size: (5,5),
      x-tick-step: 1,
      y-tick-step: 1,

      plot.add(
        domain: (-5,5),
        x => calc.pow(x, 2)
      )
    )
  }
) 

#cetz.canvas({
  import cetz.draw: *
  import cetz-plot: *

  // set-style(axes: (
  //   stroke: blue,
  //   padding: .25,
  //   x: (stroke: red),
  //   y: (stroke: green, tick: (stroke: blue, length: .3))
  // ))
  axes.school-book(
    size: (6, 6),
    axes.axis(
      min: -1, max: 1,
      ticks: (step: 1, minor-step: auto, grid: "both")
    ),
    axes.axis(
      min: -1, max: 1,
      ticks: (step: 1, minor-step: auto, grid: "both")
    )
  )

})

#def("Proportional")[
  $
  prop \
  a prop b <==> a " is proportional to " b \
  ==> a = C dot b
  $
]

#def("Inverse Proportional")[ $ a prop 1/m $ ]

= Chapter 5: Electric Charge

Units

$q$: unit $C$ = Coulomb

1C $->$ very large

- typical = $1 mu "C" = 10^-6 "C"$

Atoms
- electrons ($e^-$) -- negative
- nucleus
  - protons ($p$) -- positive
  - neutrons ($n$) -- zero charge

- $q_p$ = $e$ -- charge of proton
- $q_(e^-)$ = $-e$ -- charge of electron

#def([Elementary Charge])[$
  e = 1.602 dot 10^-19 C 
$]


Any electric charge:
$
q = n e, n in ZZ #h(2em) "Charge is quantised" \
$


#figure(table(
  columns: (auto, auto, auto),
  table.header([Particle], [Symbol], [Charge]),
  [*Electron*], $e^-$, $-e$,
  [*Proton  *], $p$, $+e$,
  [*Neutron *], $n$, $0$,
))

#def([Particle Annihilation])[
  $underbrace(e^+, "anti-electron position") e^- --> gamma gamma$
]

#def([Pair Production])[
  $gamma --> e^+ e^-$
]


electric charge:
- Comes in two types: $+$ and $-$
- Quantised: $q = n dot e$
- Is conserved $sum_i q_i =$ constant

== Electric Conductors and Insulators

=== Spherical Conductors

Charge distribution

$e^-$ repel $=>$ largest possible distance $=>$ all on the outer surface in
uniform distribution

#figure(caption: [Fibonacci Sphere from #link("https://www.behance.net/gallery/72081461/Fibonacci-Sphere")[#underline([here])]])[
  #image("./fib-sphere.png", width: 50%)
]

==== Charging Through Contact

#todo("Grab visual from slides")
1. ..
2. ..
3. ..

Induction

#todo[Grab visual from slides]

#example[
  #todo[Obtain from slides]
]

== Electric Current

Flow of electric charge

move $=>$ change of charge ($i = (d q)/(d t)$ or $i = (Delta q)/(Delta t)$)

#def([Electric Current])[
  $
    i &= (d q)/(d t) "or" \
    i &= (Delta q)/(Delta t)
  $
  Unit: $A = C/s$ (amp/ampere)
]

Positive charge moving right $==>$ current to the right \
Negative charge moving right $==>$ current to the left (the typical case)

== Coulomb's Law

#def([Coulomb's Law])[
  $
    F_"el" &= k (q_1 q_2)/r_2 \
    k &= 8.99 dot 10^9 #h(.5em) (N dot m^2)/C^2 \
    k &= 1/(4 pi epsilon_0) \
    epsilon_0 &= 8.85 dot 10^(-12) #h(.5em) C^2/(N dot m^2)
  $
]

There are two forces: one on $q_1$ and the other on $q_2$, denoted as $arrow(F)_(1,2)$
and $arrow(F)_(2,1)$ ($q_2$ on $q_1$ and vice versa)

#todo[get visual from slides]

$
  arrow(F)_(1,2) = -arrow(F)_(2,1)
$

#def([Principle of Superposition])[
  $
    arrow(F)_(1,"net") = sum arrow(F)_(1,n)
  $
]

Charge on sphere shell with other charge on the outside acts as if the charge was in the centre and the sum of the charge ($Q$)

Charge on sphere shell with other charge inside the shell, force is 0

== Electric Fields



$
arrow(F)_"el" &= underbrace(
  1/(4 pi epsilon_0) dot Q/r^2,
  #box(width: 12em)[electric field produced by \ $Q$ at point $P$ (at distance $r$) aka $E$])
  dot q \
$

#def("electric field")[
  $
    E &= arrow(F)_"el" / q
  $
]

$
arrow(E)_#[at $P$] = (arrow(F)_#[on $q_0$ at $P$])/q_0 \
==> #[$E$ does not depend on $q_0$ because it cancels in the ratio]
$

Force is a vector $==>$ el field is a vector


*Rule*:
- $arrow(E)$ has same direction as $arrow(F)$ on pos charge

=== Electric field due to a charged particle

Point charge $q$

Force between $q$ and test charge $q_0$: $
F = q / (4 pi epsilon_0) (q q_0)/(r^2)
$

Definitiion of electric field: $
E = F/q_0
$

#def([Principle of Superposition for Electric Fields])[
  $
    arrow(E) = sum arrow(E)_i
  $
]

Electric field due to a point charge: $
|arrow(E)| = 1/(4 pi epsilon_0) q/(r^2)
$

$z =$ distance between point and dipole centre \
$d =$ distance between poles

#figure(image("./dipole.png", height: 30em))

if $z >> d$: $
arrow(E) approx 1/(2pi epsilon_0) (q d)/(z^3)
$

#def([Electric dipole moment])[
  $arrow(p) = q dot arrow(d)$

  Direction of $arrow(d)$ is vector going up
]

=== Definitions for Continuious Charge Distributions

Total Charge $Q$

Charge Density

- 1 dim: $lambda = Q/L$ $C / m$
- 2 dim: $sigma = Q/A$ $C / m^2$
- 3 dim: $rho = Q/V$ $C / m^3$

Charge Distributions -> Charge Densities $
  arrow(E) = integral d arrow(E)
$

==== Electric field due to a line of charge

The amount of charge $d q$ on a peice $d s$ of wire: $
  d q = lambda d s
$

This charge creates an electric field $d E$ $
  d E = 1/(4 pi epsilon_0) (d q)/r^2 = 1/(4 pi epsilon_0) (lambda d s)/r^2
$

Get the total electric field by integrating over all $d E ->$ integrate over all $d s$

#def([Charged ring at a large distance ($z >> R$)])[
  $
  E = 1/(4 pi epsilon_0) q/z^2
  $
]
