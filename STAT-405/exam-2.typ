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

= Exam 2

== 4.1 - 4.2 Continuous

PDF:
1. Chart of intervals
2. Graph
3. Function
  - To be a PDF:
  1. $f(x) >= 0$
  2. $integral _(-oo) ^oo f(x) #h(2mm) d x = 1$
  - Cumulative distribution function (CDF): $P(X <= x) = integral _(-oo) ^x f(t) d t = F(x)$

  expected value: $E(x) = integral _(-oo) ^oo x dot f(x) d x$ \
  variance: $V(x) = integral _(-oo) ^oo (x-mu)^2 dot f(x) d x$

Special PDFs:
1. Uniform distribution (all possibilities are equally likely) $
     f(x; a, b) = cases(
       1/(b-a) "if" a <= x <= b,
       0 "else"
     )
   $

== 4.3 Normal Distribution

A continuous rv $X$ is said to have a normal distribution with parameters $mu$ and $sigma$ or $mu$ and $sigma^2$, where $-oo < mu < oo$ and $0 < sigma$, if the pdf of $X$ is $
f(x; mu, sigma) = 1/(sigma sqrt(2 pi)) e^(-(x-mu)^2/(2sigma^2)) #h(2em) -oo < x < oo
$

(this is a bell curve)

#figure(image("normal-distribution.jpg", width: 80%))


If $mu = 0$ and $sigma = 1$, we call this "standard normal distribution $
f(x; 0, 1) = 1/sqrt(2pi) e^(-x^2/2) \
p(x <= x <= b) = integral _a ^b f(x) d x
$

To find this we use our given $mu$ and $sigma$ to convert our normal dist to a
standard normal dist using $
z = (x - mu) / sigma
$
and use cumulative standard normal distribution chart provided

"one cool thing":

For large samples, we can use std norm dist to approx. a binomial distribution: $
z = (x + .5 - mu) / sigma
$


== 4.4 Exponential Distribution

$
f(x; lambda) = cases(
  lambda e^(-lambda x) #h(1em) &x >= 0,
  0 &"else",
) \
mu = 1/lambda = sigma
$


norm and exp dist. part of family based on gamma function $
Gamma(alpha) = integral _0 ^oo x^(alpha - 1) e^(-x) d x \
forall n in Z^+:  Gamma(n) = (n - 1)! \
Gamma(1/2) = sqrt(pi) \
$

Gamma distribution

A continous random variable $X$ is said to have a gamme distribution if the pdf of $X$ is $
f(x; alpha, beta) = cases(
  1/(beta^alpha Gamma(a)) x^(alpha -1)e^(-x/beta) #h(1em) &x >= 0,
  0 &"else"
) \
E(x) = alpha beta \
V(x) = alpha beta^2
$

If $beta = 1$ The CDF is "incomplete gamma" \
If $beta != 1$ CDF: $
F(x; alpha, beta) = F(x/beta; alpha)
$

=== Chi-Squared

Let $v$ be a positive integer.  Then a random variable $X$ is
said to have a chi squared distribution with parameter $v$ if the
pdf of $X$ is the gamme density with $alpha = v/2$ and $beta =
2$.  The pdf of a chi-squared rv is thus $
f(x; v) = cases(
  1/(2^(v/2)Gamma(v/2)) x^((v/2)-1)e^(-x/2) #h(1em) &x >= 0,
  0 &"else"
)
$

== 4.5 -- Other continuous distributions

A random variable $X$ is said to have a _Weibull distribution_ with a shape paramenter $alpha$ and scale parameter $beta (alpha > 0, beta > 0)$ if the pdf of $X$ is $
f(x; alpha, beta) = cases(
  a/(beta^alpha) x^(alpha-1) ... "GET FROM LECTURE"
)
$

...

#def(name: [lognormal distribution])[
  A nonnegative rv $X$ is said to have a lognormal distribution oif the rv $Y = ln(X)$ has a normal distribution.  The resulting pdf of a lognormal rv when $ln(X)$ is normally distributed with parameters $mu$ and $sigma$ is $
  f(x; mu, sigma) = cases(
    1/(sigma x sqrt(2pi))e^(-[ln(x)-mu]^2/(2sigma^2)) #h(1em) &x >= 0,
    0 &"else"
  ) \
  E(X) = e^(mu + sigma^2/2) \
  V(X) = e^(2mu + sigma^2)(e^(sigma^2) -1)
  $
]

#def(name: [beta distrubution])[
  A random variable $X$ is said to have a beta distribution with paramaters $alpha, beta$ (both positive) ... GET FROM LECTURE
]

== 5.1 & 5.2 -- Joint Distributive Random Variables

JPDF (Joint PDF):
$p(x, y) = p(X=x "and" Y=y)$

1. $p(x, y) >= 0$
2. $
sum _x sum _y p(x, y) = 1 "or" integral.double _R f(x, y) d A = 1
$

[TWO EXAMPLES IN LECTURE]

#def()[

  The marginal probablity mass function of X, denoted by $p_x(x)$ is given by $
  p_x (x) = sum _(y: p(x, y) >= 0) p(x, y) "For each possible value x" \
  p_y (y) = sum _(x: p(x, y) >= 0) p(x, y) "For each possible value y"
  $
]

[ NOTES FOR MARGINAL PROBABILITY .. LECTURE ]

#def()[


  Two random variabels $X$ and $Y$ are said to be independent if for every pair of $x$ and $y$ values, $
    p(x, y) = p_x(x) dot p_y(y) \
  $

]

Expected values for JPDF
$
E(h(x, y)) &= sum sum h(x, y) dot p(x, y) \
           &"or" \
           &= integral.double h(x, y) dot p(x, y) d A
$

[ I missed a lot, too distracted ]

== Coveriance of dist for x and y

$
mu_x = sum x dot p_x (x) \
mu_y = sum y dot p_y (y) \
"cov"(x, y) = E(x - mu_y)(y-mu_y) = sum _x sum _y (x - mu_x) (y-mu_y)p(x, y)
$

Correlation coefficient: $
rho = "cov"(x, y)/(sigma_x sigma_y) \
-1 <= rho <= 1
$

#example()[
  Anti-UGA Example:  Suppose $X$ is the avg yards/carry that a UGA fullback
  gains, and $Y$ is his grade on an astrophysics test.  Here's the joint pmf
  $f(x, y)$
]

== 5.4 Distribution of sample mean; not $x$ but $overline(x)$

#def()[
  Let $X_1, X_2, ..., X_n$ be a random sample from distribution with mean value
  $mu$ and std dev $sigma$.  or $n >= 30$, then 

  1. $E(overline(X)) = mu_overline(x) = mu$
  2. $V(overline(x)) = sigma^2_overline(x) = sigma^2/n "and" sigma _overline(x)
     = sigma/sqrt(n)$

  In addition, with $T_sigma = X_1 + ... + X_n$, $E(T_sigma) = n mu$,
  $V(T_sigma) = n sigma^2$, and $sigma_T_0 = sqrt(n) sigma$
]

#def(name: [Central limit theorem])[
  If a population has a normal dist or we take $n >= 30$ samples, then the
  distribution of sample means ($overline(x)$) will be approx. normal with
  $mu_x = mu$ and $sigma_x = sigma/sqrt(n)$

  We can then use $z = (x-mu)/sigma = (overline(x)-mu_x)/sigma_overline(x) =
  (overline(x)-mu)/(sigma/sqrt(n))$
]

== 7.1-7.3 -- Projecting onto our population based on sampling

(the pop mean $mu$ or pop propotions $rho$)

$
z = (x - mu) / sigma
$

[Get picture from notes]

$
plus.minus z_(alpha/2) &= (x - mu)/sigma \
plus.minus z_(alpha/2)(sigma) &= x - mu \
mu &= x plus.minus z_(alpha/2)(sigma)
$

If pop is normal and we know $sigma$ (stddev for pop) (or $n$ is large), then
$x = overline(x) , sigma_x = sigma/sqrt(n)$

$
mu = overline(x) plus.minus z_(alpha/2)[sigma/sqrt(n)]
$

if pop is normal (n) we know $S$
$x = overline(x) , sigma_overline(x) = S/sqrt(n)$

$
mu = overline(x) plus.minus z_(alpha/2)[S/sqrt(n)]
$

if population is not known normal ($n < 30$) \
Use "T-Score" insted of Z-Score with $n - 1$ degress of freedom $
T = (overline(x) - mu)/(s/sqrt(n))
$

==

Conf int for proportion

$
E(x) = n p \
sigma = sqrt(n p(1-p))
$

given sample proportion $hat(p)$, $n$, and $z_(alpha/2)$

$
p = hat(p) plus.minus Z_(alpha/2) sqrt((hat(p)(1-hat(p)))/n)
$

==

Small $n$, nothing known about pop

$
mu = overline(x) plus.minus t_(alpha/2,underbracket(v, "degrees of freedom")) [s/sqrt(n)]
$

== 7.4 -- Projecting onto $sigma$

Either
1. Pop is normal
2. sample size is large

Random Variable: $
(sum (x - overline(x))^2) / sigma^2 = ((n-1)S^2)/sigma^2
$

This Chi-Squared ($chi^2$) distribution with $v = n - 1$ degrees of freedom


A $100(1-alpha)$% confidence interval for the variance $sigma^2$ of a normal pop has lowe rlimit $
((n-1)s^2) / (chi^2) [...]
$ and a lower limit $
((n-1)s^2) / (chi^2) [...]
$
