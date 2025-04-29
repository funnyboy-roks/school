#import "@preview/lemmify:0.1.5": *

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
#let hr = line(length: 100%)

#set enum(numbering: "1)")
#let notin = math.class(
  "relation",
  $cancel(in)$,
)

#let V = math.arrow($v$)

#set math.mat(delim: "[")
#set math.vec(delim: "[")

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

= Exam 1

$"comp"_arrow(a) arrow(b) = (arrow(a) dot arrow(b)) / (abs(arrow(a))) $

$"proj"_arrow(a) arrow(b) = ((arrow(a) dot arrow(b)) / (abs(arrow(a)))) arrow(a)/(abs(arrow(a)))$

== Elementary Row Operations

$x$ - scalar $M$ - augmented matrix

- $R_i <-> R_j$ - interchanging row $i$ and $j$ (changes $R_i$ and $R_j$)
- $k R_i$ - multiply $R_i$ by $k$ (changes $R_i$)
- $R_i + k R_j$ - Add $k R_j$ to $R_i$ (changes $R_i$)

EROs produce an equivalent system.  Two linear systems are equivalent if they have the same solution set

$
mat(
  augment: #{-1}, 
  k, y, z;
  k, y, z;
)
$


#def([Row-Echelon Form])[
  A matrix is in row-echelon form if:
  1. All zero rows are at the bottom
  2. All leading indicies are in a column that is to the left of the leading entries below

  #hr

  use row operations to get REF this is called row reduction.
]

#def([Gaussian Elimination])[
  Complete the following to solve linear system

  1. Form the augmented matrix
  2. Row reduce to matrix to REF
  3. Back substitute to get solution set
]

#example()[
  $
   w &-  x &- y &+ 2z &=  1 \
  2w &- 2x &- y &+ 3z &=  3 \
  -w &+  x &- y &     &= -3 \
  $

  $
    mat(
      augment: #{-1}, 
      1,  -1, -1, 2,  1;
      2,  -2, -1, 3,  3;
      -1,  1, -1, 0, -3;
    ) \
    arrow.b.double  \
    R_2 -2R_1, R_3 + R_1 \
    arrow.b.double  \
    mat(
      augment: #{-1}, 
      1, -1, -1,  2,  1;
      0,  0, 1,  -1,  1;
      0,  0, -2,  2, -2;
    ) \
    arrow.b.double  \
    R_3 + 2R_2 \
    arrow.b.double  \
    mat(
      augment: #{-1}, 
      1, -1, -1,  2, 1;
      0,  0, 1,  -1, 1;
      0,  0, 0,   0, 0;
    ) \
    arrow.b.double \
  $

  $
    t = z \
    y - t = 1 ==> y = 1 + t \
  $

  $
    &w - x - y + 2z = 1 \ 
    &==> w - x - (1 + t) + 2 t = 1 \
    &==> w - x = 2 - t \
  $

  $
    "let" s = x \

    w - s = 2 - t \
    ==> w = 2 - t + s \
  $

  $
    arrow.b.double \

    s = { mat(2+s-t;s;1+t;t) mid(|) s, t in RR }
  $
]

#def([Leading Variable])[
  Consider a matrix $m$ in REF.  A variable $x_i$ is a leading variable if its
  coefficient is a leading entry, otherwise $x_i$ is a free variable. 
]

#def([Reduced Row-Echelon Form])[
  A matrix is in RREF if:

  1. It is in REF
  2. Every leading entry is a leading 1
  3. Every column with a leading 1 contains zeros elsewhere
]

#def([Gauss-Jordan Elimination])[
  Complete the following to solve a linear system

  1. Form the augmented matrix
  2. Row reduce the matrix RREF
  3. Solve for leading var in terms of free variables
]

#example()[
  Use GJE to solve the system

  $
  mat(
    augment: #{-1},
    1, 4, 0, 5, 0;
    0, 3, 6, -3, -12;
    4, 16, 0, 20, 0;
    0, 1, 2, -1, -4;
  )
  $

  $
    R_3 -4 R_4 \
    1/3 R_2 \
    arrow.b.double
  $

  $
  mat(
    augment: #{-1},
    1, 4, 0, 5, 0;
    0, 1, 2, -1, -4;
    0, 0, 0, 0, 0;
    0, 1, 2, -1, -4;
  )
  $

  $
    R_4 - R_2 \
    arrow.b.double
  $

  $
  mat(
    augment: #{-1},
    1, 4, 0, 5, 0;
    0, 1, 2, -1, -4;
    0, 0, 0, 0, 0;
    0, 0, 0, 0, 0;
  )
  $

  $
    R_1 - 4R_2 \
    arrow.b.double
  $

  $
  mat(
    augment: #{-1},
    1, 0, -8, 9, 16;
    0, 1, 2, -1, -4;
    0, 0, 0, 0, 0;
    0, 0, 0, 0, 0;
  )
  $
  (RREF)

  $
  x_1 - 8s + 9t = 16 ==> x_1 = 16 + 8s - 9t \
  x_2 + 2s - t = -4 ==> x_2 = t - 2s - 4 \

  arrow.b.double
  $

  $
  S = { mat(16 + 8s - 4t; t - 2s - 4; s; t) mid(|) s, t in RR }
  $

]

#def([Rank])[
  The rank of a matrix $A$ is the number of nonzero rows in any REF, denoted
  $"rank"(A)$
]

#theorem[
  Let $A$ be a coefficient matrix of a linear system in $n$ variables.

  If $v$ is the number of free variables, then $
  v = n - "rank"(A)
  $
]

#def([Homogeneous])[
  A linear system is homogeneous if each constant is 0.

  $
  2x &+ 3y &+ 2z &= 0 \
   x &-  y &     &= 0 \
  4x &+  y &-  z &= 0 \
  $

]

#theorem[
  Every homogeneous system is consistent.

  If such a system has fewer equations than variables, then it has infinitely
  many solutions.
]

$
  x underbrace(vec(2,  1,  4), u_1)
+ y underbrace(vec(4, -2,  8), u_2)
+ z underbrace(vec(1,  2, -3), u_3)
=   underbrace(vec(1,  2,  1), v)
$

#theorem[
  A linear system $[A mid(|) arrow(b)]$ is consistent iff $arrow(b)$ is a
  linear combination of the columns of $A$.
]

== Spanning Sets

$
  2x &+ 4y &+  z = 1 \
   x &- 2y &+ 2z = 2 \
  4x &+ 8y &- 3z = 1 \
$

$
  x vec(2,  1,  4)
+ y vec(4, -2,  8)
+ z vec(1,  2, -3)
=   vec(1,  2,  1)
$

#example()[
  $
    arrow(v) = <1, 0, 2>
  $

  Is $arrow(v)$ a linear combination of $arrow(u)_1$, $arrow(u)_2$, $arrow(u)_3$?

  $arrow(u)_1, arrow(u)_2, arrow(u)_3 = ...$

  $
    mat(
      augment: #{-1},
      1, 4, -3, 1;
      0, 1,  2, 0;
      2, 8, -6, 2;
    ) \
    R_3 - 2 R_1 \
    arrow.b.double \
    mat(
      augment: #{-1},
      1, 4, -3, 1;
      0, 1,  2, 0;
      0, 0,  0, 0;
    )
  $

  $
    &C_3 = t \
    &C_2 + 2t = 0 \
    &==> C_2 = -2t \
    &==> C_1 - 11t = 1 \
    &==> C_1 = 11t + 1 \
  &==> arrow(v) = (1 + 11t)arrow(u)_1 - 2t arrow(u)_2 + t arrow(u)_3, t in RR
  $
]

#example[
  Is $arrow(v)$ a linear combination of $arrow(u)_1$, $arrow(u)_2$, $arrow(u)_3$?

  $
    mat(
      augment: #{-1},
       1,  3, -1,  2;
      -2, -6,  2,  4;
       5,  0,  1,  4;
    ) \
    arrow.b.double \
    (R_2 + 2R_1, R_3 - 5R_1) \
    arrow.b.double \
    mat(
      augment: #{-1},
       1,   3, -1,  2;
       0,   0,  0,  8;
       0, -15, 6, -6;
    ) \
  $

  Inconsistent system
]

#def([The span of a vector])[
  The span of $S = { arrow(v)_1, arrow(v)_2, arrow(v)_3, ..., arrow(v)_n }$
  is the set of all linear combinations of these vectors

  Notation:
  $
    "span"(S) \
    "span"(arrow(v)_1, arrow(v)_2, arrow(v)_3, ..., arrow(v)_n)
  $

  if $"span"(S) = RR^n$, then $S$ is a spanning set for $RR^n$
]

#def([Standard basis vectors])[
  $hat(i)$, $hat(j)$, $hat(k)$, etc

  For $RR^n$: $
    arrow(e)_1, arrow(e)_2, arrow(e)_3, ..., arrow(e)_n
  $
]

$
  arrow(v) in RR^3 \
  arrow(v) = angle.l v_1, v_2, v_3 angle.r
    = vec(v_1, v_2, v_3)
    = v_1 vec(1, 0, 0) + v_2 vec(0, 1, 0) + v_3 vec(0, 0, 1)
    = v_1 arrow(e)_1 + v_2 arrow(e)_2 + v_3 arrow(e)_3 \
  ==> "span"(arrow(e)_1, arrow(e)_2, arrow(e)_3) = RR^3
$

#example[
  Find the span of

  $
  arrow(v_1) = vec(2, 0, 4), 
  arrow(v_2) = vec(-1, 2, -3) \
  $

  Solution:
  $
  arrow(u) = s arrow(v)_1 + t arrow(v)_2
  $

  $
  "span"(arrow(v)_1, arrow(v)_2) = underbrace(P, "plane") \
  (0, 0, 0), (2, 0, 4), (-1, 2, -3) in P
  $
]

#def([linearly dependent])[
  A set of vectors $arrow(v)_1, arrow(v)_2, arrow(v)_3, arrow(v)_k$ is linearly
  dependent if there are scalars, $c_1, c_2, c_3, ..., c_k$ not all $0$ such that $
    c_1 arrow(v)_1 + c_2 arrow(v)_2 + c_3 arrow(v)_3 + ... + c_k arrow(v)_k = arrow(0)
  $

  otherwise, the set is linearly independent
]

#theorem[
  A set of vectors $arrow(v)_1, arrow(v)_2, arrow(v)_3, arrow(v)_n$ is linearly
  dependent iff at least one of the vectors is a linear combination of the
  others

  (me): $"linearly dependent"(S) <=> exists arrow(v) in S : "comb"(arrow(v), S without { arrow(v) })$

  #proof[
    $(==>)$ there are scalars $c_1, c_2, c_3, ..., c_k$ not all $0$, such that $
      c_1 arrow(v)_1 + c_2 arrow(v)_2 + c_3 arrow(v)_3 + ... + c_k arrow(v)_k = arrow(0)
    $

    Suppose $c_1 != 0$, $
      c_1 arrow(v)_1 = -c_2 arrow(v)_2 - ... - c_k arrow(v)_k \
      ==> arrow(v)_1 = -(c_2/c_1) arrow(v)_2 - ... - (c_k/c_1) arrow(v)_k 
    $

    $(<==)$ Suppose $arrow(v)_1$ is a linear combination of the others.

    Then, there are scalars $c_2, c_3, ..., c_k$, such that $
    arrow(v)_1 = C_2 arrow(v)_2 + C_3 arrow(v)_3 + ... + C_k arrow(v)_k \
    ==> arrow(v)_1 - C_2 arrow(v)_2 - C_3 arrow(v)_3 - ... - C_k arrow(v)_k = arrow(0) 
    $
  ]
]

if $S subset.eq RR^n$ and $arrow(0) in S$, then $S$ is linearly dependent

#theorem[
  let $S = { arrow(v)_1, arrow(v)_2, arrow(v)_3, ..., arrow(v)_k } in RR^n$

  let $A = { arrow(v)_1, arrow(v)_2, arrow(v)_3, ..., arrow(v)_k } $ Then, 
  $S$ is linearly independent iff $[A mid(|) arrow(0)]$ has a nonzero solution.
]


#theorem[
  If the system $[A mid(|) arrow(0)]$ has $n$ equations and $k$ variables with
  $n < k$, then the system has infinitely many solutions.
]

#theorem[
  let $S = { arrow(v)_1, arrow(v)_2, arrow(v)_3, ..., arrow(v)_k } in RR^n$

  If $n < k$, then $S$ is linearly dependent.
]

#theorem[
  Let $A = vec(arrow(v)_1, arrow(v)_2, dots.v, arrow(v)_k)$

  Then, $S = { arrow(v)_1, arrow(v)_2, dots.v, arrow(v)_k }$ is linearly
  dependent iff $"rank"(A) < k$
]
