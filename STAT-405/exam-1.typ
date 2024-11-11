#import "@preview/lemmify:0.1.5": *

#let notin = math.class(
  "relation",
  $cancel(in)$,
)

#let choose(top, bottom) = $mat(top; bottom)$

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

#let frame(stroke) = (x, y) => (
  right: if x == 0 { stroke } else { none },
  bottom: if y == 0 { stroke } else { none },
);
#set table(
  stroke: frame(1pt + rgb("666675"))
)

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
    - Population: $sigma^2 = sum(x-overline(x))^2/n$

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

== Chapter 3

Random Variables

2 types: 

1. Discrete
2. Continuious

Random variable values have their onw probabilities

We asseble (distribute) these probabilities in P.D.F. (Probability Distribution
Function/Probability Density Function), where: $
x: "Variable" \
P(X): "PDF"
$

PDFs are represented:
- Charts
- Graphs
- Function

#example[
  Flip 3 coins (\#heads = x) \
  $
  0 &=> "TTT" &=> 1/8 \
  1 &=> "HTT", "THT", "TTH" &=> 3/8 \
  2 &=> "HHT", "HTH", "THH" &=> 3/8 \
  3 &=> "HHH" &=> 1/8 \
  $

  OR:

  #table(
    columns: 5,
    table.header($x$, $0$, $1$, $2$, $3$),
    $P(x)$, $1/8$, $3/8$, $3/8$, $1/8$
  )
]

#example[
  Six boxes of components are ready to be shipped by a certain supplier.  The number of defective components in each box is as follows:

  #table(
    columns: 7,
    table.header([Box], $1$, $2$, $3$, $4$, $5$, $6$),
    [Number of defectives], $0$, $2$, $0$, $1$, $2$, $0$
  )

  PDF: #table(
    columns: 4,
    table.header($x$, $0$, $1$, $2$),
    $P(x)$, $3/6$, $1/6$, $3/6$
  )


  $P(0) = 3/6 = 1/2$

  Cumulative distribution function: if $f(x)$ is PDF $P(x: X)$

  CDF: #table(
    columns: 4,
    table.header($x$, $0$, $1$, $2$),
    $C(x)$, $3/6$, $4/6$, $6/6$
  )

  CDF: $F(X) = p(x <= X)$
]

#example[
  #table(
    columns: 6,
    table.header($x$, $1$, $2$, $4$, $8$, $16$),
    $P(x)$, $0.05$, $0.1$, $0.35$, $0.4$, $0.1$
  )

  $P(2 <= x <= 4) = 0.1 + 0.35 = 0.45$
]

For Discrete random vars:

Expected value (centre) $mu = sum (x dot p(X)) = E(x)$ (weighted avg)

Spread: Standard Deviation: $sigma = sqrt(V(x))$ $
V(x) = sum (x - mu)^2 dot P((x) = E[(x-mu)^2]
$

(Refer to lecture video for example)

Alternative method (potentially faster): $
V(x) = E(x^2) - [E(x)]^2
$

Algebra of expected values: $
E(a x + b) &= E(a x) + E(b) = a E(x) + E(b) = a mu + b \
V(a x + b) &= V(a x) + V(b) = a^2 V(x) + 0 \
$

#example[
  if $E(x) = -5$ and $V(x) = 5$, what is $E[(4+2x)^2]$?

  $
  E(16 + 16x + 4x^2) &= E(16) + 16 E(x) + 4 E(x^2) \
  &= 16 + 16(-5) + 4(E(x^2))
  $
  if $
  V(x) &= E(x^2) - [E(x)]^2 \
  5 &= E(x^2) -[-5]^2 \
  5 &= E(x^2) - 25 \
  30 &= E(x^2)
  $
  $==>$
  $
  E(16 + 16x + 4x^2) &= E(16) + 16 E(x) + 4 E(x^2) \
  &= 16 + 16(-5) + 4(E(x^2)) \
  &= 16 + 16(-5) + 4(30)
  $

  #line(length: 100%, stroke: 0.5pt + rgb("666675"))

  $
  V(2 + 5 x) = a^2 V(x) = 5^2(5) = 125
  $

]

=== Chapter 3.4

Binomial PDF (Bernoulli)

1. The expirment consistes of a sequence of $n$ smaller experiments called
   _trials_ where $n$ is fixed in advance of the experiment
2. Each triel can result in one of the same two possible outcomes (dichotomous
   trials), which we generically denote by success ($S$) and failure ($F$).
3. The trials are independent, so that the outcome on any particular trial does
   not influence the outcome on any other trial
4. The probability of success $P(S)$ is constant from trial to trial; we denote
   this probability by $p$

Bernoulli (Binomial) Distribution: $
b(x; n, p) = choose(n, x) p^x (1 - p)^(n-x)
$

#example(name: [(Based on the 3 coins)])[
  $
  b(x; 3, 1/2) &= 3!/(x!(3-x)!) (1/2)^x (1-1/2)^(3-x) \
  b(0; 3, 1/2) &= 3!/(0!(3)!) (1/2)^0 (1-1/2)^(3) = 1/8 \
  $
]

#example(name: [Gas pump oil problem from HW])[
  (1/8 cars need oil, 4 cars pass)

  $n = 4$ \
  success: need oil \
  $P = 1/8$

  $P(x = 1) = b(1; 4, 1/8) &= choose(1, 4) (1/8)^1 (7/8)^3 \
  &= 4!/(1!3!) (1/8) (7/3)^3 \
  &= 0.335$
]

for binomial distribution:

$E(x) = n p$ \
$V(x) = n p (1 - p)$

=== 3.5 & 3.6 Other Discrete Distributions

#def(name: [Hypergeometric])[
  Probability of a specific number of successes in our set of
  trials

  1. The population or set to be sampled consists of $N$ individuals, objects,
     or elements (a _finite_ population).
  2. Each individual can be characterised as a success ($S$) or failure ($F$),
     and there are $M$ success in the population.
  3. A sample of $n$ individuals is selected without replacement in such a way
     that each subset of size $n$ is equally likely to be chosen.

  If $X$ is the number of $S$s in a completely random sampel of size $n$ drawn
  from a population consisting of $M$ $S$s and $(N - M)$ $F$s, then the
  probability distribution of $X$, called the hypergeometric distribution, is
  given by: $
  P(X = x) = h(x; n, M, N) = (choose(M, x)choose(N - M ,n - x))/choose(N, n)
  $ for $x$, an integer satisfying $max(0, n - N + M) <= x <= min(n, M)$

  *_(Example in lecture)_*

  $
  E(x) &= n (M/N) \
  V(x) &= n (M/N)(1-M/N)
  $
]

Binomial and hypergeometric: $x$ is the number of sucesses in a given number of
trials

#def(name: [Negative Binomial])[
  $x$ is the number of trails before number of desired successes is obtained.

  The negative binomail rv and distribution are based on an experiment stasfying the following conditions:

  1. The experiment consists of a sequence of independent trials
  2. Each triel can result in either success ($S$) or fail ($F$)
  3. The probability of success is constant from trial to trial, so $P(S)$
  ... *_(Need to get rest from lecture)_*

  $
  "nb"(x; r, p) = ...
  $

  *_(Example in lecture)_*

  $
  E(x) = r(1-p)/p \
  V(x) = r(1-p)/p^2 \
  $
]

#def(name: [Poisson Probability Dristibution])[
  1. The experiment consists of counting the number of times an event, $x$
     occurs in a given interval.  The interval can be an interval of time,
     area, or volume.
  2. The probability of the event occurring is the same for each interval
  3. The number of occurrences in one interval is independent to the number of
  occurrences in other intervals

  $
  p(x; mu) &= (e^(-mu) mu^x)/x! \
  E(x) &= mu \
  V(x) &= mu \
  $

  If $n > 50$ and $n p < 5$, then we can estimate a Binomial with a Poisson.
]

#example[
  Let $X$ denote the number of traps in a particular type of metal, and suppose
  it has a Possion distribution with $mu = 2$.  The probability that there are
  example three traps is:

  $
  P(x = 3) = p(3; 2) = (e^(-2)2^3) / 3! = 0.18045
  $
]

*_(Another example in lecture)_*

== Exam

Presenting data:
- histogram
- box/whisker

Centre
- Mean
  - Trimmed (remove outliers)
- Median
- Mode

Spread
- Range
- Variance $->$ Std dev

Venn diagrams for visualisation

union, intersection, complement

Conditional probability: $P(A | B) = P(A sect B)/P(B)$

counting:
- multiplcation
- permutation (w/ order)
- combination (w/o order) -- choose function

$E(x) = sum x dot p(x)$ \
$V(x) = sum (x - mu)^2 dot p(x)$

-> $E(a x + b) = a E(x) + b$ \
-> $V(a x + b) = a^2 V(x) + 0$ \

Distribtions:

1. Binomial
2. Hypergeometric 
3. Poisson

