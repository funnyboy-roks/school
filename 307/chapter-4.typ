#import "@preview/lemmify:0.1.5": *

= Chapter 4

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

== 4.1 -- Arithmetic with Integers

#prop()[
  The relation $tilde$ on $NN times NN$ defined by $(a, b) ~ (c, d)$ iff $a + d
  = b + c$ is an ER.
]

#proof[
  Reflexive: Show $(a, b) tilde (a, b)$. \
  $a + b = b + a = a + b ==> (a, b) tilde (a, b)$ $checkmark$

  Symmetry: Show $(a, b) tilde (c, d) <==> (c, d) tilde (a, b)$ \
  Suppose $
  (a, b) tilde (c, d) &==> a + d = b + c \
  &==> d + a = c + b \
  &==> c + b = d + a \
  &==> (c, d) tilde (a, b) \
  $

  Transitivity: Show that if $(a, b) tilde (c, d) and (c, d) tilde (e, f)$,
  then $(a, b) tilde (e, f)$. \
  Then, $a + d = b + c$ and $ c + f = d + e$ $
  &==> (a + d) + (c + f) = (b + c) + (d + c) \
  &==> (a + f) + (c + d) = (b + e) + (c + d) \
  &==> (a + f) = (b + e) \
  &==> (a, b) tilde (e, f) \
  $.
]

#prop[
  Let $tilde$ be the ER on $NN times NN$ from the previous proposition, and
  $forall (x, y) in NN times NN$, let $[(x, y)]$ denote the equiv. class of
  $(x, y)$ under $tilde$.

  1. $[(a, b)] + [(c, d)] = [(a + c, b + d)]$ is well defined.
  2. $[(a, b)] dot [(c, d)] = [(a c + b d, a d + b c)]$ is well defined.
]

#def(name: $ZZ$)[
  The integers denoted $ZZ$ are defined as the set of equiv. classes $[(a, b)]$
  of $NN times NN$ under the previous relation with $+$/$dot$ as defined.

  $
  0 &= [(1, 1)] \
  1 &= [(2, 1)] \
  2 &= [(3, 1)] \
  &dots.v \
  $
]

#proof(name: [$1 + 2 = 3$ using def])[
  $
  [(2, 1)] + [(3, 1)] = [(2 + 3, 1 + 1)] = [(5, 2)] = 3
  $
]

#proof(name: $3 dot 4 = 12$)[
  $
  [(4, 1)] dot [(5, 1)] = [(20 + 1, 4 + 5)] = [(21, 9)] = 12
  $
]

#prop[
  Prove $0$ is the additive identity example
]

#proof[
  Show $[(a, b)] + 0 = [(a, b)]$

  $
  [(a, b)] + [(1, 1)] = [(a + 1, b + 1)] = [(a, b)]\
  a + (b + 1) = b + a + 1
  $
]

#exercise[
  $+$ on $ZZ$ is associative and commutative

  Let $x = [(a, b)], y = [(c,d)], z = [(e,f)]$

  Show:
  - $(x + y) + z = x + (y + z)$
  - $x + y = y + x$
]

== 4.2 -- Groups and Rings

#def(name: [group])[
  Let $G$ be a set and let $compose: G times G -> G$ be a binary operation on $G$.
  Then, $(G, compose)$ is called a group iff:

  1. $compose$ is associative
  2. $exists$ a neutral element $e in G$ with respect to $compose$ such that $e
  compose a = a compose e = a forall a in G$.
  3. $forall a in G: exists$ an inverse element $tilde(a)$, that is $forall a
  in G: exists tilde(a) in G: a compose tilde(a) = e$

  - A group is commutative iff $compose$ is communtative.  A commutative group
  is also called an Abelian Group
]

#example[
  - $(ZZ, +)$ - Abelian Group
  - $(NN_0, +)$ - Not a group (commutative semigroup)
  - $(P(S), union)$ - Not a group (commutative semigroup)
]

#prop[
  Let $(S, compose)$ be a semigroup with neutral element $e$. Let $a in S$ that
  has an inverse element w.r.t. $compose$.  Then, $a$ has exactly one inverse
  element.

  Proof as exercise
]

#def(name: [Ring])[
  Let $R$ be a set and let $+: R times R -> R$ and $dot: R times R -> R$ be binary
  operations on $R$.  Then, the triple $(R, +, dot)$ is called a ring iff:

  1. $+$ is associative
  2. $+$ is commutative
  3. $exists$ a neutral element $0$ for $+$
  4. $forall x in R exists$ an additive inverse $-x: x + (-x) = 0$
  5. $dot$ is associative
  6. $dot$ is distributive over $+$

  - A commutative ring is a ring where $dot$ is also commutative.
  - A ring with unity has a neutral element $1$ for $dot$
  - For a ring with unity, an element $b$ is called the multiplicative inverse
  of $a$ if $a b = b a = 1$
]

#example[
  $(ZZ, +, dot)$ is a commutative ring with unity
]

#def[
  Let $(R, +, dot)$ be a ring, we define subtraction for $(x, y) in R times R$.
  as $x - y = x + (-y)$
]

#prop[
  Let $(R, +, dot$ be a ring with $a, b, c in R: a + c = b + c$.  Then, $a = b$.
]

#proof[
  $
  a &= a + 0 \
  &= a + (c + (-c)) \
  &= a + (c - c)            \
  &= (a + c) - c            \
  &= (b + c) - c            \
  &= b + (c - c)            \
  &= b
  $
]

#prop[
  Let $(R, +, dot)$ be a ring with $x in R$.  Then $0 dot x = x dot 0 = 0$.
]

#proof[
  $0 = x - x$ \
  $0 dot x = (x - x) dot x = x x - x x = x x + (-x x) = 0$

  $
  0 dot x &= 0 dot x + 0               \
  &= 0 dot x + (0 dot x + (- 0 dot x)) \
  &= (0 dot x + 0 dot x) - 0 dot x     \
  &= x dot (0 + 0) - 0 dot x           \
  &= x dot 0 - 0 dot x                 \
  &= 0 dot x - x dot 0                 \
  &= 0
  $
]

#prop[
  Let $(R, +, dot)$ be a ring with $x, y in R$.  Then $(-x)(-y) = x y$
]

== 4.4 -- Ordered Rings

#lemma[
  Let $(R, +, dot)$ be a ring with $x, y in R$, then $y - x = -(x-y)$
]

#proof[
  $
  y - x &= y + (-x) \
  &= -x + y \
  &= -(1 dot x) + y \
  &= (-1) dot x + 1 dot y \
  &= (-1) dot x + (-1) dot (-y) \
  &= (-1) (x + (-y)) \
  &= -(x - y) \
  $
]

#def(name: [Ordered Ring])[
  A ring $(R, +, dot)$ is called an ordered ring iff $exists R^+ subset.eq R:$

  1. $forall x, y in R^+$, we have $x + y in R^+$ and $x y in R^+$.
  2. $0 in R^+$
  3. $forall x in R without {0}$, at most one of $x, -x$ is in $R^+$.

  - The subset $R^+$ is called the positive cone of an ordered ring
  - The elements of $R^+$ are called nonnegative, the nonzero elements of $R^+$
    are called positive and the elements $x in R without {0}: -x in R^+$ ($R without
    R^+$) are called negative.
]

#example[
  Let $ZZ^+ = NN_0$ to make $ZZ$ an orderd ring
]

#def[
  Let $(R, +, dot)$ be an ordered ring with positive cone $R^+$.  For $x, y in
  R$, we define $x <= y$ iff $y - x in R^+$.  If $x <= y and x != y$, we say $x
  < y$.
]

#theorem[
  Let $(R, +, dot)$ be an ordered ring with positive cone $R^+$.  Then, $<=$ is
  an order relation.

  Proof as exercise
]

#lemma[
  Let $(R, +, dot)$ be an ordered ring with positive cone $R^+$.  Then, $x in
  R^+$ iff $x >= 0$.
]

#proof[
  $x in R^+ <==> x - 0 in R^+ <==> x >= 0$
]

#theorem[
  Let $(R, +, dot)$ be an ordered ring with positive cone $R^+$.  The order
  relation $<=$ is a total order iff $forall x in R without {0}$ we have
  either $x in R^+$ or $-x in R^+$.
]
