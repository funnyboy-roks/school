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

= Exam 3

== 8.1-8.2

We wish to test a claim.  The claim may be about the average of a population
($mu$) the proportion of successes ($p$), or about the spread ($sigma$) of a
population.

Language
#def(name: [Null Hypothesis ($H_0$)])[
   stated claim
]

#def(name: [Alternative Hypothesis ($H_1$ or $H_a$)])[
  Something different from the $H_0$

  #example()[
    $H_0$: $mu = 50$ \
    $H_a$: $mu < 50$ or $mu > 50$ or $mu != 50$
  ]

]

Options for conclusions:

1. $H_0$ false and we reject it
2. $H_0$ not false and we fail to reject it
3. Rejecting $H_0$ when it is not false (Type 1 or $alpha$ error)
3. Not rejecting $H_0$ when it is false (Type 2 or $beta$ error)

== Type 2 / $beta$ error

Not rejecting $H_0$ when it is false

AH

$
H_0: mu > mu_0 &:
Phi (z_alpha + (mu_0 - mu')/(sigma / sqrt(n))) \
H_0: mu < mu_0 &:
1- Phi (-z_alpha + (mu_0 - mu')/(sigma / sqrt(n))) \
H_0: mu != mu_0 &:
...
$

$
n = cases(
  [sigma(z_alpha + z_beta)/(mu_0 - mu')]^2 "for one tail ...",
  ...
)
$

== 8.3 -- Hypothesis testing for small samples and unknown distribution type population

Use t-value instead of z-value

$
t = (overline(x)-mu_0)/(s/sqrt(n))
$

use table A.8 to find p-value

== 8.4 -- Hypothesis testin for population proption

$
H_0: p = p_0
$

Test stat:
if $n p_0 >= 10$ and $n (1 - p_0) >= 10$


$
z = (hat(p) - p_0)/sqrt((p_0(1-p_0))/n)
$

Where $hat(p)$ is experimental value

#example[
  #figure(image("example-3-1.png", width: 100%))
]

($p' = hat(p)$)
#figure(image("notes-3-1.png", width: 50%))
#figure(image("notes-3-2.png", width: 50%))


== Chapter 9: 2 sample statistics (difference in values)

variable: $overline(x)-overline(y)$
$
sigma_(overline(x)-overline(y)) = sqrt(sigma_1^2/m + sigma_2^2/n) \
z = ((overline(x) - overline(y)) - (mu_1 - mu_2))/sqrt(sigma_1^2/m + sigma_2^2/n) \

v = ((s_1^2)/m+(s_2^2)/n)^2/((s_1^2/m)^2/(m-1) + (s_2^2/n)^2/(n-1))
$

== 

Test diff in proportions:

test:

$
z = ((hat(p_1) - hat(p_2)) - (p_1 - p_2))/sqrt(hat(p)(1-hat(p)(1/m + 1/n)))
$

$
p_1 - p_2 = (hat(p_1) - hat(p_2)) plus.minus z_(alpha/2) sqrt(
  (hat(p_1)(1-hat(p_1)))/m -_(? "may be" +) (hat(p_2)(1-hat(p_2)))/n)
$

== 10: ANOVA

I: number of sample \
J: number of sampling in each sample \

Mean square of treatments
$
"MSTr" = J/(I-1)[sum (overline(x_i) - overline(x))^2]
$

Mean square of error
$
"MSE" = (sum s^2)/I \
$
$
F = "MSTr"/"MSE" \
V_N = I - 1 \
V_D = I(J - 1) \
$

== Linear Regression Model

$
y = m x + b \
arrow.b \
y = hat(beta_0) + hat(beta_1)x \
hat(beta_1) &= (S_(x y)/S_(x x)) \
&= (sum(x - overline(x)) sum(y - overline(y))/(sum(x - overline(x))^2) \
&= (sum _(x y) - (sum x sum y)/n)/(sum x^2 - ((sum x)^2/n)) \
hat(beta_0) &= y - hat(beta_1) x = (sum y - hat(beta_1) sum x)/n \
$

Deviation of data from line: $
"height of point" - "height of line" &= y_i - hat(y_i) \
&= y_i - (hat(beta_0) + hat(beta_1)x)
$

$
m = hat(beta_1) &= (sum (x_i - overline(x))(y_i - overline(y))) / sum(x_i - overline(x))^2 \
&= S_(x y) / S_(x x) \
S_(x y) &= sum x_i y_i - (sum x_i dot sum y_i)/n \
S_(x x) &= sum x_i^2 - (sum x_i)^2/n \
\
b = hat(beta_0) &= overline(y) - hat(beta_0)overline(x) \
&= (sum y_i - hat(beta_1) sum x_i)/n
$

#example[
  #figure(image("example-3-2.png", width: 100%))
]

How good is our line? i.e., how much of the apparante correlation is attrbuted to a linear relationship?

Ratio of sum of Squares (Error): $
"SSE" = S_(y y) - hat(beta_1) S_(x y) = sum(y_i - hat(y_i))^2 = sum (y_i - (hat(beta_0) + hat(beta_i) x^i)) ^2
$

$
"SST" = S_(y y)
$

use this to estimate variance of our data: $
sigma^2 = s^2 = "SSE"/(n-2)
$

$
r^2 = 1 - "SSE"/"SST"
$

#figure(image("example-3-3.png", width: 50%))

$
t = (hat(beta_1) - beta_1)/(s/sqrt(S_(x x))) \
S_beta_1 = s/sqrt(S_(x x))
$

Confidence interval: $
hat(beta_1) plus.minus t_(alpha / 2, n - 2) dot S_beta_1
$

"The proportion of observed $y$ variation explained by linear model"

In iodine example:
$
"SST" = 377.174 \
"SSE" = 78.920 \
r^2 = 1 - "SSE"/"SST" = 0.791 \
$

Inferences

Conf int for slope ($hat(beta_1)$)

$
T = (hat(Theta) - theta)/sigma_theta \
T = (hat(beta_1) - beta_1)/(s/sqrt(S_(x x)) \
s^2 = sum(y - hat(y))^2/(n-2)
$

== 12.5 -- Coeff of correlation

Tells us how strongly (positively or negatively) two veriables are correlated

Also a measure of covariance

$
r = (sum (x y) - (sum x sum y / n)) / (sqrt(sum x^2 - (sum x)^2/n) sqrt(sum y^2 - (sum y)^2/n))
$

If given a set of data, and r-value, we can test for a correlation using $
t = (r sqrt(n  - 2))/sqrt(1-r^2)
$

== 14.1 -- Testing the "goodness" of fit

$
chi^2 = sum ("observed" - "expected")^2 / "expected"
$

expected: $n dot p$
