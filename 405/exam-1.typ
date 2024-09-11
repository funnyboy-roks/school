#import "@preview/lemmify:0.1.5": *

#let notin = math.class(
  "relation",
  $cancel(in)$,
)

#let choose(n, k) = $mat(n;k)$

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

= Exam 1

== Chapter 1

#def(name: "Population")[The total listing of all possible subjects in an expirament]
#def(name: "Sample")[A small portion (subset) of population]
#def(name: "Variable")[The item / quality / quantity being observed]
#def(name: "Branches of Statistics")[Descriptive vs Inferential] 

We present data:
- chart/list (i.e., spreadsheet)
- graphs
  - Histogram
  - Dot Plot
  - Stem and Leaf
  - Pie
  - Venn diagrams
  - Box and whisker

We are conserned with two things:

1. Centre
  - three methods for getting the centre
    - Mean
      - Sample mean ($overline(x)$)
      - Population mean ($mu$)
    - Median
      - "Middle" value
    - Mode
      - most repeated value
2. Spread
  - Box and whisker plot
    - 5 Score summary
    - Low 25th percentile
    - Median 50th percentile
    - Top 75th percentile
  - Range: $"High" - "Low"$
  - Variance\*
    - Sample: $S^2 = sum(x-overline(x))^2/underbracket(n-1, "deg of freedom") = S_(x x)/(n-1)$
    - $sqrt(S^2) = S$: standard deviation
    - pq: $sigma^2 = sum(x-overline(x))^2/n$

== Chapter 2

Complement = (if $E$ is our dataset) $E'$ or $E^C$ \
Union = $union$ \
Intersection = $sect$ \
Emptyset = $emptyset$ \

Properties of probability

1. $0 <= p(E) <= 1$
2. $sum p(E) = 1$
3. For discrete data: $p(E) = (n E)/(n S)$
4. $p(E') = 1 - p(E)$
5. $p(A union B) = p(A) + p(B) - p(A sect B)$

since $p(E) = (n E)/(n S)$, counting becomes essential:

1. List/chart all possibilities (Venn diagram)
  - Flip 3 coins: sample space is the 8 possibilities: HHH, HHT, HTH, HTT, ...
2. Multi property: if $m$ separate events each with $n_i$ outcomes, then total
  number of possible outcomes is product of $n_i$ (aka: $product ^m n_i$)
3. permutation: $attach(P, bl: n, br: r)$ - number of ways $n$ items may be ordered, taken $r$ at a
  time: $n! / (n - r)!$
4. Order does _not_ matter: combination: $attach(C, bl: n, br: r)
  = choose(n, r) = n!/(r! (n-r)!)$

Conditional Probability

$P(A | B)$: Probability of $A$ occurring given $B$ has occurred.

This has the effect of reducing sample size to the total outcome for $B$.

#example[
  #table(
    columns: (auto, auto, auto),
    inset: 10pt,
    table.header([], $B$, $B'$),
    $A$, $2$, $6$,
    $A'$, $1$, $9$,
  )

  Prob Good:
  $P(B) = (n B)/(n S) = 3/18 = 1/6$ \
  Prob good given from $A$:
  $P(B | A) = (n B)/(n S) = 2/8 = 1/4$

  $
    P(B | A) = P(B sect A) / P(A)
  $

  $
  P(B sect A) &= P(B | A) dot P(A) \
  P(B union A) &= P(B) + P(A)  P(B sect A)
  $
]

If two events, $A$ and $B$ are independent, $P(A sect B) = P(A) dot P(B)$
