#import "@preview/lemmify:0.1.5": *
#import "@preview/problemst:0.1.0": pset

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
  definition: def, theorem, proof, lemma, rules, example
) = default-theorems("thm-group", lang: "en", ..my-styling)
#show: rules
#let (
  exercise, prop, rules
) = new-theorems("thm-group", ("exercise": "Exercise", "prop": "Proposition"), ..my-styling)
#show: rules
#show thm-selector("thm-group"): box.with(inset: 0.8em)
#show thm-selector("thm-group", subgroup: "theorem"): it => box(it, fill: rgb("#eeffee"))

#show: pset.with(
  class: "MATH 307",
  student: "Hayden Pott",
  title: "Homework 8",
  date: datetime(
    year: 2024,
    month: 5,
    day: 20
  ),
)

#set heading(numbering: none)

#set enum(numbering: "(a)")

= 4-21
"Bi-directional *induction*." Let $S subset.eq ZZ$.

1. Prove that if $0 in S$, and $k in S$ implies $k + 1 in S$ and $k - 1 in S$, then $S = ZZ$.

= 4-25

Consider the ring $cal(F)(ZZ, ZZ)$ of functions from $ZZ$ to $ZZ$.  Prove that
the set of functions with nonnegative values $cal(F)^+(ZZ, ZZ) := { f: [forall
x in ZZ: f(x) >= 0] }$

= 4-26

Prove proposition 4.34

#prop(name: [4.34])[
  Let $(R, +, dot)$ be an ordered ring with positive cone $R^+$.  If $x <= y$
  and $u <= v$, then $x + u <= y + v$.
]

= 4-33

Let $R$ be a totally ordered ring and let $x in R$, prove that $x^2 >= 0$.

#proof[
  $x^2 = x dot x^1 = x dot x$

  TODO
]

= 4-49

*Hilbert's Hotel*.  Hilbert's Hotel (named after the mathematician David
Hilbert, who introduced it to illustrate equivalences for countable sets) has
countably many rooms, which are numbered by the natural numbers

1. One evening, every room in Hilbert's Hotel is occupied when a new guest
   arrives.  Explain how _despite the fact that the hotel is fully booked_,
   this guest can be accommodated. _Hint._ Every guest could move from the
   guest's original room to the next room. \
   *ANS*: If every guest shifts one room (i.e., $1 -> 2, 2 -> 3, dots, n -> n +
   1$), then we will have one open room at the beginning (room 1) that the new
   guest can take.
2. One evening, every room in Hilbert's Hotel is occupied when $n$ new guests
   arrive.  Explain how _despite the fact that the hotel is fully booked_, all
   these guest can be accommodated. \
   *ANS*: If every guest shifts $n$ rooms (i.e., $1 -> 1 + n, 2 -> 2 + n, dots,
   m -> m + n$), then we will have $n$ open rooms at the beginning (room 1-n)
   that the new guest can take.
3. One evening, every room in Hilbert's Hotel is occupied when a "Hilbert Bus"
   with countable infinite many new guests arrives.  Explain how _despite the
   fact that the hotel is fully booked_, these countably infinitly many new
   guests can be accomodated.
4. Suppose for a mathematics converntion, countably many buses with countably
   many guests in each one of them arrive at Hilbert's Hotel.  Can all these
   guests be accomodated?  If so, how?  If not, why not? \
   *ANS:* Yes, The set of people in each bus, $G$, is countable, and the set of
   busses, $B$, so the resulting set of people, $G times B$ is countable.  So,
   for the same reason as part (c), we can fit all of these guests.

= 4-51

Another proof that $NN times NN$ is countable.

1. Prove that the function $f: NN times NN -> NN$ defined by $f(m, n) := 2^m 3^n$ is injective
  #proof[
    Let $a, b, c,d in NN: a != c and b != d$ be ABF. SFAC that $f(a,b) =
    f(c,d)$. $
    &==> 2^a 3^b = 2^c 3^d \
    &==> ... \
    &==> a = c or b = d \
    $
    Contradiction.  Thus, $f(a,b) != f(c,d)$ and $f$ is injective.
  ]
2. Use part 4-51a and Theorem 4.62 to prove that $NN times NN$ is countable.

  #theorem(name: [4.62])[
    If $C$ is countable and $S subset.eq C$, then $S$ is countable.
  ]
  
  #proof[
  ]
