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

= Gauss' Law

$
epsilon_0 Phi = q_"enclosed"
$

$
epsilon_0 integral.cont arrow(E) dot dif arrow(A) = q_"enclosed"
$

== Exernal Electric Field

Isolated Conductor

$-->$ Excess charge moves to the surface

Gauss' law: cylinder through surface
Total area:
- inner endcap $-> E = 0 -> Phi = 0$
- "barrel" $-> "symmetry" -> arrow(E) perp "surface area" -> arrow(E) perp arrow(A) -> Phi = 0$
- outer endcap $-> arrow(E) parallel arrow(A)
  -> Phi = integral.cont arrow(E) dot dif arrow(A)
  = integral E dot dif A -> phi
  = E integral dif A
  = E dot A$


$
epsilon_0 E dot A = q_"enclosed" \
sigma = q/A
--> E = sigma/epsilon_0
$

= Chapter 24: Electric Potential

Electric Potential Energy $U$: $
U = -W
$

Electric Potential $V$: $
  V = (-W_oo)/q_0 = U/q_0
$

Absolute vlues of $U$ are irrelevant $->$ only changes $Delta U$ matter
$-> Delta U = -Delta W$

$U_"gravity" = m g h -> Delta U_"gravity" = m g Delta h$

Absolute Values $->$ use convention: $U$ of two charges $-> 0$ as
$r -> oo => u = 0$

Compute $U$ at any other value of
$r -> U(r) = Delta U = underbrace(U(r) - U(r = oo), -W_oo)$
$
U(r) = -W_oo = - integral _oo ^r underbrace(arrow(F), q arrow(E)) dif r \
V(r) = U(r)/q_0
$

Units:
$
U -> J = "Joules" \
V = U/q_0 -> J/C -> V = "Volt"
$



#figure(
  caption: [Topographical map to draw electric field using Equipotential lines],
  image("equi-potential.png")
)

moving along an equipotential surface does 0 work.

#todo[get graphic from slide]

$
Delta V = (-W)/q \
W = -q dot Delta V = -q (V_f - V_i)
$

Electric field lines and equipotential surfaces are always perpendicular

$
1 "J" = 1 "C" dot 1 "V"
$

Now: elementary charge $e/(Delta V) -> $ unit of energy

Define new unit of energy:
$ 1 "eV" = "Electron Volt" $
The amount of energy an electron gains when moving through a potential
difference of 1 volt

#todo[Get example from slides]

Potential from field:

$
W = - Delta U = -q dot Delta V \
"Force" arrow(F) = q_0 arrow(E) \
Delta V = V_f - V_i = - integral _i ^f arrow(E) dif arrow(s) \

V = -abs(arrow(E)) Delta x
$


#line(length: 100%)

Recap:
$
underbrace(Delta W, #[Work]) = -underbrace(Delta U, #[Potential \ Energy]) = -q Delta V \
Delta V = (Delta U)/q = (-Delta W)/q
= - integral _i ^f arrow(E) dif arrow(s)
$

Potential due to point charge:
$
V = 1/(4 pi epsilon_0) q/r
$

$
arrow(E) = - nabla V
$

== Capacitance

$
q = underbrace(C, "capacitance") dot V \
==> C = q / V
$

Unit = $C/V = "Couloumb"/"Volt" = "Farad"$

Typical $approx 1 mu F$

Common Range: $1 underbrace(p F, 10^(-12)) - 10,000 mu F$


==== Parallel plat capacitor

$
C = epsilon_0 A/d
$

== Current, Resistance, Circuits

Capacitors:
- In parallel: $ C_eq = sum _i C_i $
- In series: $ 1/C_eq = sum _i 1/C_i $

== Chapter 26: Current and Resistance

=== Resistance

$R = V / i$ (or $V = i R$)

unit = $(1 V)/(1 A) = 1 Omega = "Ohm"$

Ohm's law: Resistance is fixed for "ohmic" devices

=== Power

$"Power" = "Energy"/"Time"$

$
P = (d U)/(d t) \
=> P_"el" = i V
$

unit = $(1 J)/(1 s) = 1 W = "watt"$

== Circuits

electromotive force $epsilon = Delta V = V = "same as voltage"$

single-loop circuits:

#def([Loop Rule])[
  The algebraic sum of the changes in potential encountered in a complete
  traversal of any loop of a circuit must be zero.
]

#todo[graphic from slides]
