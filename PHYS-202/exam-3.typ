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

= Magnetism

There are no magnetic monopoles

$
arrow(F)_B = q arrow(v) times arrow(B)
$

$
B = F_B/(v dot abs(q))
$

$
underbrace(V, "measure") = underbrace(V_d, "known") B underbrace(d, "measure")
$

== A circulating charged particle

Circular motion: $
F = m v^2/r
$

Magnetic force: $
F = abs(q) v B
$

$
==> m v^2/r = abs(q) v B \
==> m v/r = abs(q) B \
==> r = (m v)/(abs(q) B)
$

$q$ with $arrow(v)$ through $arrow(B)$ with $m$, $arrow(v) perp B$, then #math.arrow.t


Magnetic force on current carrying wire: $
arrow(F)_B = i underbrace(arrow(L), #[length with \ direction of current]) times arrow(B)
$

= Magnetic Fields Due to Current

$
dif B = (mu_0)/(4pi) (i dif s sin theta)/r^2
$

#def([Biot-Savart Law])[
$
dif arrow(B) = (mu_0)/(4pi) (i dif arrow(s) times hat(r))/r^2 \
mu_0 = 4 pi dot 10^(-7)
$
]

Magentic field due to a current in a long(inf) straight wire

$
B = (mu_0 i)/(2 pi R)
$

#pagebreak()

== Recap

Gauss Law: $
epsilon_0 integral.cont arrow(E) dot dif arrow(A) = ???
$

No magnetic monopoles: $
integral.cont arrow(B) dot dif arrow(A) = 0 \
$

$
arrow(F)_B = q arrow(v) times arrow(B) = i arrow(L) times arrow(B)
$

$
integral.cont arrow(B) dot dif arrow(s) = mu_0 i_"enclosed"
$

#line(length: 100%)

Magnetic flux through area $A$ $
Phi_B = integral arrow(B) dot dif arrow(A)
$

#def([Electromagnetic Field])[
  An emf is induced in the loop at the left in Figs 30-1 and 30-2 when the
  number of magnetic field lines that pass through the loop is changing.

  #todo("Get figs 30-{1,2} from slides");
]

#def([Faraday's Law of Induction])[
  Magnetic Flux: $
  Phi_B = integral arrow(B) dot dif arrow(A)
  $

  Special Case: $
  Phi_B = abs(arrow(B)) abs(arrow(A))
  $ ($arrow(B) parallel arrow(A) <==> arrow(B) perp$ area $A$)

  $
  underbrace(cal(E), #[Induced EMF \ (Voltage)]) = - N (dif Phi_B) / (dif t)
  $

]

The induced EMF depends on:
1. Change of magnitude of $arrow(B)$
2. Change of magnitude of $arrow(A)$
3. Change angle between $arrow(B)$ and $arrow(A)$ \
   Because $Phi_B = integral arrow(B) dot dif arrow(A) = abs(arrow(B)) abs(arrow(A)) cos theta$

#def([Faraday's Law Cont])[
  A changing magnetic field produces an electric field
  $
    integral.cont arrow(E) dot dif arrow(s) = - (dif Phi_B)/(dif t) = cal(E)
  $ (another Maxwell eqn)
]

#def([Maxwell's Equations])[
  Gauss' law for electricity: $
  integral.cont arrow(E) dot dif arrow(A) = q_"enc" / epsilon_0
  $

  Gauss' law for magnetism: $
  integral.cont arrow(B) dot dif arrow(A) = 0
  $

  Faraday's Law: $
    integral.cont arrow(E) dot dif arrow(s) = - (dif Phi_B)/(dif t) = cal(E)
  $

  Ampere-Maxwell Law: $
  integral.cont arrow(B) dot dif arrow(s) = mu_0 epsilon_0 (dif Phi_E)/(dif t) + mu_0 i_"enc"
  $
]
