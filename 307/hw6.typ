#import "@preview/lemmify:0.1.5": *

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
  definition: def, theorem, proof, lemma, rules, example
) = default-theorems("thm-group", lang: "en", ..my-styling)
#show: rules
#let (
  exercise, prop, rules
) = new-theorems("thm-group", ("exercise": "Exercise", "prop": "Proposition"))
#show: rules
#show thm-selector("thm-group"): box.with(inset: 0.8em)
#show thm-selector("thm-group", subgroup: "theorem"): it => box(
  it, fill: rgb("#eeffee"))

= Chapter 3

== 3-1

1. $a compose (b compose c) = (a compose b) compose a$
2. $a compose b = b compose a$
3. $e in S$ is a neutral element iff $n dot e = n$

== 3-2

3. $2 + 5 = 7$

#proof[
  $
  2 + 5 &= 5 + 2 \
  &= 5 + (1 + 1) \
  &= (5 + 1) + 1 \
  &= 6 + 1 \
  &= 7 \
  $
]

== 3-5

1. Prove that for all $n in NN$, we have that $1 dot n = n$
#proof[
  $1 dot n = n dot 1 = n$ by definition.
]
2. Prove that for all $n, m, k in NN$, we have that $(n + m) dot k = n dot k + m dot k$
3. Prove that for all $n, m in NN$, we have that $n dot m = m dot n$
4. Prove that for all $n, m, k in NN$, we have that $n dot (m + k) = n dot m + n dot k$
5. Prove that for all $n, m, k in NN$, we have that $(n dot m) dot k = n dot (m dot k)$

== 3-7

The FOIL acronym is limited to sets of parentheses with two summands.  It must
not become a crutch for middle scholl students.

1. Let $a, b, c, d, e in NN$.  Prove that $(a + b)((c + d) + e) = ((((a c + a
   d) + a e) + b c) + b d) + b e$
2. Explain why a mechanical application of "FOIL" fails in part 3-7a
3. State a verbal explanation how to multiply out parenthesis with arbitrarily
   many summands.  (You may ignore the extra parenthesis from the associative
   law.)
